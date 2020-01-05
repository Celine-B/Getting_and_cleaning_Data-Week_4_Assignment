# Getting_and_cleaning_Data-Week_4_Assignment
Assigment for week 4 of Getting and cleaning data

## This repository contains the files for the week 4 assignment of the Getting and Cleaning Data Coursera course:
* 'README.md': explains the files contained in the directory and how the script work.
* 'run_analysis.R': script used to perform the analysis and obtain the tidy data set 
* 'tidydataset.txt': tidy data set 
* 'Codebook.md': code book that describes the variables, the data, and any transformations/work performed to clean up the data. 

## Original dataset
Dataset and assignment instructions downloadable here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset 'Human Activity Recognition Using Smartphones Dataset Version 1.0' contains data collected from experiments performed with the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial (X, Y and Z) linear acceleration and angular velocity were captured. 
Data were labelled manually. 
The obtained dataset has been randomly partitioned into two sets: training data (70% volunteers) and test data (30% volunteers). 


## Code explanation
The R script called run_analysis.R:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Tidy dataset
The 'tidydataset.txt' (new generated dataset) contains variables calculated based on the mean [mean()] and standard deviation [std() ]. 
Each row of the dataset is an average of each activity type (6: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) for all (30) subjects.
