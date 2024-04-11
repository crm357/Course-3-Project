---
title:  "Codebook"
author: "Randy Merritt"
date:   "Apr 10, 2024"
output:  html_document
---
  


#### The Feature Set of the Raw Data

The feature set of the raw data from the _Human Activity Recognition Using Smartphone_ 
project comprises accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



#### The Feature Set of TidySummary

The dataset 'TidySummary' comprises a reduced set of variables from the _Human Activity Recognition Using Smartphone_ dataset.  The reduction is in the form of including only the averages of the variables culled from the original dataset.  TidySummary is also organized into tidy form in the sense of Wickam, et.al.  

TidySummary comprises the following general organization:

* 180 observations of 35 variables.
* 35 variables subdivided by:  
	+ 2 columns of qualifiers allowing for grouped statistical analysis.  
	+ 33 columns comprised of the mean of associated measurements.  



#### The Variable Set of TidySummary (in order of occurrence in TidySummary)

1. Subject
   + 30 volunteers, referred to in the assignment as 'Subjects'

2. Activity
   + WALKING
   + WALKING_UPSTAIRS
   + WALKING_DOWNSTAIRS
   + SITTING
   + STANDING
   + LAYING
  
3. tBodyAcc-mean()-X  
4. tBodyAcc-mean()-Y  
5. tBodyAcc-mean()-Z  
6. tGravityAcc-mean()-X  
7. tGravityAcc-mean()-Y  
8. tGravityAcc-mean()-Z  
9. tBodyAccJerk-mean()-X  
10. tBodyAccJerk-mean()-Y  
11. tBodyAccJerk-mean()-Z  
12. tBodyGyro-mean()-X  
13. tBodyGyro-mean()-Y  
14. tBodyGyro-mean()-Z  
15. tBodyGyroJerk-mean()-X  
16. tBodyGyroJerk-mean()-Y  
17. tBodyGyroJerk-mean()-Z  
18. tBodyAccMag-mean()  
19. tGravityAccMag-mean()  
20. tBodyAccJerkMag-mean()  
21. tBodyGyroMag-mean()  
22. tBodyGyroJerkMag-mean()  
23. fBodyAcc-mean()-X  
24. fBodyAcc-mean()-Y  
25. fBodyAcc-mean()-Z  
26. fBodyAccJerk-mean()-X  
27. fBodyAccJerk-mean()-Y  
28. fBodyAccJerk-mean()-Z  
29. fBodyGyro-mean()-X   
30. fBodyGyro-mean()-Y  
31. fBodyGyro-mean()-Z  
32. fBodyAccMag-mean()  
33. fBodyBodyAccJerkMag-mean()  
34. fBodyBodyGyroMag-mean()  
35. fBodyBodyGyroJerkMag-mean()

  
#### Creating Tidy Master from the Raw Data

The recipe for creating TidyMaster from the original raw data is the fully commented R script 'run_analysis.R'. This script requires no input parameters but the reader is advised to read the commentary as the script is executed.  The commentary is designed to explain why things are done the way they are done.  The R statements themselves describe how the commentary is accomplished.
