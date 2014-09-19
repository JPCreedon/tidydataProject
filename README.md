## Getting and Cleaning Data Course Project

#### Introduction

This repository contains the required files for the course project Getting and Cleaning Dataon Coursera by Johns Hopkings University

Original Data Citation
>Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Refer to the [Codebook](https://github.com/idogit/tidydataProject/blob/master/CodeBook.md) about the produced tidy data set

#### run_analysis.R

While The run_analysis.R has been commented, hereby is a description of it as required by Coursera instructions

The UCI HAR Dataset is considered to be in the current working directory (per coursera instructions) in the UCI HAR Dataset folder (as the default unzip folder).
>This repository exposed a download_data.R script that will download and unzip the data in the current working directory, resulting in a UCI HAR Dataset folder
Adjust the folder variable at the top of the run_analysis.R script if the data is not in this default UCI HAR Dataset repository. For example if all the data are in the current working directory, you can update the script as:
```r
folder <- '.'
```

Then all required steps have been performed in order

###### Step 1: Merges the training and the test sets to create one data set

train/subject_train.txt, train/y_train.txt, train/X_train.txt are read in respective variables which are then cbind to merge columns in the same order
```r
train_set <- cbind(train_subject,train_activity,train_feature)
```
The same process/operations are repeated for test/*_test.txt file
```r
test_set <- cbind(test_subject,test_activity,test_feature)
```
The 2 "cbinded"" variables obtained from train and subject files are then rbind to combine/merge the rows to obtain a merged set
```r
sets <- rbind(train_set,test_set)
```
###### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

The features.txt file is read and the relevant feature indexes are searched using a regular expression to match "-mean()" and "-std()".
```r
featuresColumns <- grep("-(mean|std)\\(\\)",features[,2])
```
> Note: Angle features in the original dataset, while a difference with a mean and standard deviation, were not considered a mean or a standard deviation to be selected as a variable per coursera instructions since they are a angle(~difference) and not a mean or sd per se.

The found indexes of relevant features are used to subset the columns of the merged set from Step 1 
```r
sets <- sets[,c(1,2,featuresColumns+2)]
```
> Mind the "featuresColumns+2": columns are in this order: 1-subject,2-activity,3-feature(1),4-feature(2)...i+2-feature(i)... while featureColumns vector is [feature(1)...feature(66)]

###### Step 3: Uses descriptive activity names to name the activities in the data set

The activity_labels.txt is read to get the labels.

The activity column values (2nd column) are then replaced with the labels (2nd column also of the activities dataframe) 
```r
sets[,2] = activities[sets[,2],2]
```
###### Step 4: Appropriately labels the data set with descriptive variable names

At step 2, a "features" dataframe variable has been created to hold all feature labels and a "featureColumns" vector variable with the relevant selected columns index, hence the relevant feature labels are directly obtained from those 2 variables and the column are directly named with descriptive labels:
```r
colnames(sets) <- c("subject","activity",features[featuresColumns,2])
```
> Why is it descriptive to use the feature label as-is? The same label of the feature as found in the 'features.txt' file of original dataset ,is deem to be descriptive with the belief/hope to make it easier to cross reference the original dataset and specificaly the 'features_info.txt' file that describe the original feature selection

###### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Use dplyr package to create a data table, which is group by subject and activity and summarize_each remaining columns with mean.

A tidyset.txt file is created with write.table:
```r
write.table(tidyset,"tidyset.txt",row.names =FALSE)
```

As suggested by David Hood, Community TA for the course, in the following [thread](https://class.coursera.org/getdata-007/forum/thread?thread_id=49): you can use the following R code to load and view the tidyset.txt file produced by the script:
```r
data <- read.table('tidyset.txt', header = TRUE)
View(data)
```
Refer to the [Codebook](https://github.com/idogit/tidydataProject/blob/master/CodeBook.md) about the produced tidy data set int eh tidyset.txt file