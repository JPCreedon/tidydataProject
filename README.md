## Getting and Cleaning Data Course Project

#### Introduction

This repository contains the required files for the course project Getting and Cleaning Dataon Coursera y John Hopkings University

Original Data Citation
>Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Refer to the [Codebook](https://github.com/idogit/tidydataProject/blob/master/CodeBook.md)

#### run_analysis.R

While The run_analysis.R has been commented, hereby is a description of it as required by Coursera instructions

The UCI HAR Dataset is considered to be in the current working directory (per coursera instructions) in the UCI HAR Dataset (as the default unzip folder).
>This repository exposed a download_data.R script that will download and unzip the data in the current working directory, resulting in a UCI HAR Dataset folder
Adjust the folder variable at the top of the run_analysis.R script if the data is not in this default UCI HAR Dataset repository. For example if all the data are in the current working directory, you can update the script as:
```r
folder <- '.'
```

Then all required steps have been performed in order

###### Step 1: Merges the training and the test sets to create one data set

###### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

###### Step 3: Uses descriptive activity names to name the activities in the data set

###### Step 4: Appropriately labels the data set with descriptive variable names

###### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


As suggested by David Hood, Community TA for the course, in the following [thread](https://class.coursera.org/getdata-007/forum/thread?thread_id=49): you can use the following R code to load and view the tidyset.txt file produced by the script:
```r
data <- read.table('tidyset.txt', header = TRUE)
View(data)
```
