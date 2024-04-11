---
title:  "README"
author: "Randy Merritt"
date:   "Apr 10, 2024"
output: html_document
---


![Coursera](https://img.shields.io/badge/Coursera-%230056D2.svg?style=for-the-badge&logo=Coursera&logoColor=white)



#### Getting and Cleaning Data Course Project

This project analyzes data collected from the accelerometers of the Samsung 
Galaxy S smartphone.  These measurements were collected from experiments originally 
performed by the _Human Activity Recognition Using Smartphone_ project. This project 
is to reduce the variables of the original full raw dataset and to reorganize the 
reduced data in a tidy data form for summary analysis.  

A link to the  _Human Activity Recognition Using Smartphone_ project can be found at:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The raw data collected by the _Human Activity Recognition Using Smartphone_ project 
that begins the analysis performed by this project can be downloaded from:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



#### Getting and Cleaning Data Course Project Information

The Getting and Cleaning Data Course Project seeks to clean and make tidy the 
raw data from _Human Activity Recognition Using Smartphone_ data to create a 
set of averages for each volunteer and for each activity each volunteer preformed.  


#### Goals of the Getting and Cleaning Data Course Project

1. Merge the raw training and test data to create one dataset.

2. Extract only the measurements on the mean and standard deviation for each measurement.

3. Use descriptive activity names to name the activities in the data set.

4. Appropriately label the data set with descriptive variable (column) names. 

5. From the dataset of step 4, create a second, independent tidy dataset with the 
   average of each variable for each activity and each subject.



#### What You Should Find In This Distribution

The files included in this distribution are:

* 'README.md': this readme that is in markdown format.

* 'Codebook.md': a codebook in markdown format.

* 'TidySummary': a tidy data table in text format created from step 5 above.

* 'run-analysis.R': a fully-commented R script that processes the original 
  Human Activity raw data to produce the final tidy dataset of step 5. 

