### this script downloads and processes the data files for the Week 4 Program Project.

# let's download the dataset
source <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest   <- "UCI HAR dataset.zip"
download.file(source,dest)


# NOTE: this script is organized to where after the above .zip file download
# has completed, you need to pause using this script and  unzip the downloaded 
# .zip file using an appropriate program to perform the unzip.
# After the unzip has completed, you are to return to his script and continue from here.


# these are the packages we prefer:
library(data.table)
library(dplyr)


### The Exploration -- an ad hoc journey.
### as with all data analytics we begin by exploring the raw data to become
### comfortable with what the raw input looks like.

# let's start with the training data
SubjectsSrc <- "./UCI HAR Dataset/train/subject_train.txt"
ActivitySrc <- "./UCI HAR Dataset/train/y_train.txt"
MeasuresSrc <- "./UCI HAR Dataset/train/X_train.txt"

Subject  <- fread(SubjectsSrc,sep = " ",header = FALSE,col.names = "Subject",data.table = TRUE)
Activity <- fread(ActivitySrc,sep = " ",header = FALSE,col.names = "Activity",data.table = TRUE)
Measures <- fread(MeasuresSrc,sep = " ",header = FALSE,data.table = TRUE)

# explore the data.  as a start...
str(Subject)
str(Activity)
str(Measures)

# for tidy organization and to separate the train set from the test set we add 
# a column demarking this table as the training data.
Group <- rep("Train",nrow(Subject))
names(Group) <- "Group"

# we can now build the finished training dataset.
TrainData <- data.table(Group,Subject,Activity,Measures)




# now we repeat the process for the test data.
SubjectsSrc <- "./UCI HAR Dataset/test/subject_test.txt"
ActivitySrc <- "./UCI HAR Dataset/test/y_test.txt"
MeasuresSrc <- "./UCI HAR Dataset/test/X_test.txt"

Subject  <- fread(SubjectsSrc,sep = " ",header = FALSE,col.names = "Subject",data.table = TRUE)
Activity <- fread(ActivitySrc,sep = " ",header = FALSE,col.names = "Activity",data.table = TRUE)
Measures <- fread(MeasuresSrc,sep = " ",header = FALSE,data.table = TRUE)

# explore the data.  as a start...
str(Subject)
str(Activity)
str(Measures)

# for tidy organization and to separate the train set from the test set we add 
# a column demarking this table as the test data.
Group <- rep("Test",nrow(Subject))
names(Group) <- "Group"

# we can now build the finished test dataset.
TestData <- data.table(Group,Subject,Activity,Measures)


# at this point, we can move forward to satisfy the Week 4 Project criteria.




# "1. Merges the training and the test sets to create one data set."
TidyMaster <- rbind(TrainData,TestData)

# this would be a good place to check if we have what we think we have.
unique(TidyMaster$Subject)   # we have 30 volunteers
unique(TidyMaster$Group)     # in 2 groups (training vs test)
unique(TidyMaster$Activity)  # measuring 6 separate activities


# the author maintains that, at this point, 'TidyMaster' is tidy and holds all
# measurements, both from the training data as well as the test data.




# "2. Extracts only the measurements on the mean and standard deviation for 
#     each measurement."

# OK. looks like 'features.txt' holds the indices of the mean and std
# measurements. let's load 'features.txt' and grep those entries for
# mean and standard deviation of each measurement.
FeatureSrc <- "./UCI HAR Dataset/features.txt"
Features   <- fread(FeatureSrc,sep = " ",header = FALSE,data.table = TRUE)

# item 2 is a bit ambiguous. I interpret statement 2 as requesting only those 
# measurements that have both a mean and a standard deviation; some have a mean 
# but no associated standard deviation: these are excluded.

# 'value = FALSE' gives us the matching indices we will use to isolate the 
# columns to meet the extract criteria.
meansIdx <- grep("*mean\\(\\)*", Features$V2, value = FALSE)
stdIdx   <- grep("*std\\(\\)*",  Features$V2, value = FALSE)

# since we've already prepended columns with group, volunteer, and activity 
# on our 'TidyMaster' table, we must bias the Idx values to account for these 
# 3 added columns.
meansIdx <- meansIdx + 3
stdIdx   <- stdIdx + 3


# now we extract just the mean and standard deviation columns for each measurement.
TidyMaster <- TidyMaster[ ,c(1L:3L,meansIdx,stdIdx), with = FALSE]





# "3. Uses descriptive activity names to name the activities in the data set."

ActivitySrc <- "./UCI HAR Dataset/activity_labels.txt"
Activities <- fread(ActivitySrc,sep = " ",header = FALSE,data.table = TRUE)

# in order to satisfy the replace() function's preference for replacement of
# common types, we need to exchange the Activity integers with their character
# equivalents.
TidyMaster$Activity <- as.character(TidyMaster$Activity)
for(i in 1:nrow(Activities))
	TidyMaster$Activity <- replace(TidyMaster$Activity, TidyMaster$Activity == i, Activities[i,2])





# "4. Appropriately labels the data set with descriptive variable names."

# let's replace our index vectors with their names equivalent.
meansIdx <- grep("*mean\\(\\)*", Features$V2, value = TRUE)
stdIdx   <- grep("*std\\(\\)*",  Features$V2, value = TRUE)

# we now have meaningful columns names as our headers.
colnames(TidyMaster) <- c("Group","Subject","Activity",meansIdx,stdIdx)





# "5. From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject."

# we start by subsetting the Master table by keeping only those elements needed
# to build this tidy dataset. [looks like 'Group' is not needed]
TidySummary <- TidyMaster[, 2:36, with = FALSE]

# I'm going to want the associated column names for the means
names <- names(TidySummary[,3:35])

# item 5 calls for the mean() by volunteer and their activities.
TidySummary <- TidySummary %>% 
	group_by(Subject,Activity) %>% 
	summarise(across(all_of(names), mean)) 



# finally, we save both TidyMaster and TidySummary to our working directory.
TidyMaster$Activity <- unlist(TidyMaster$Activity)
write.table(TidyMaster,"TidyMaster.txt", row.names = FALSE)
TidySummary$Activity <- unlist(TidySummary$Activity)
write.table(TidySummary, "TidySummary.txt", row.names = FALSE)
