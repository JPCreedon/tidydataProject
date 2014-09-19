## Codebook

This is the Codebook for the required tidy dataset

#### Original Data Citation
Publication [1]:
> [1]Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#### Experimental design and background: 
For convenience and readability , hereby a relevant citation from the original authors about the experimental design
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

#### Raw data
A full description is available at the site where the data was obtained: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

For convenience and readability , hereby a relevant citation from the original authors about the raw data:
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain
>Features are normalized and bounded within [-1,1]

#### Processed data:
All data are unitless since features have been normalized in the original raw data

* Subjects have been converted to a factor ("1"-to-"30"")

* Activities have been transformed with their related label found in the 'activity_labels.txt' file of the original dataset and coded as a factor ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") 

* For all original features that were a mean and a standard deviation, the mean across subject and activity has been calculated and stored in a variable named with the same label of the feature as found in the 'features.txt' file of original dataset , with the belief/hope to make it easier to cross reference the original dataset and specificaly the 'features_info.txt' file that describe the original feature selection

> Note: Angle features in the original dataset, while a difference with a mean and standard deviation, were not considered a mean or a standard deviation to be selected as a variable per coursera instructions since they are a angle(~difference) and not a mean or sd per se.

* Dimensions: 180 rows (6 subjects * 30 activities) with 68 variables (66 selected mean and sd features, plus subject and activity variables)

| Variable | Details
| -------- |---------
|"subject" | The id of the test subject as a factor 
|"activity" | The activity label performed as a factor (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
|"tBodyAcc-mean()-X" | Normalized range [-1,1] 
|"tBodyAcc-mean()-Y" | Normalized range [-1,1] 
|"tBodyAcc-mean()-Z" | Normalized range [-1,1] 
|"tBodyAcc-std()-X" | Normalized range [-1,1] 
|"tBodyAcc-std()-Y" | Normalized range [-1,1] 
|"tBodyAcc-std()-Z" | Normalized range [-1,1] 
|"tGravityAcc-mean()-X" | Normalized range [-1,1] 
|"tGravityAcc-mean()-Y" | Normalized range [-1,1] 
|"tGravityAcc-mean()-Z" | Normalized range [-1,1] 
|"tGravityAcc-std()-X" | Normalized range [-1,1] 
|"tGravityAcc-std()-Y" | Normalized range [-1,1] 
|"tGravityAcc-std()-Z" | Normalized range [-1,1] 
|"tBodyAccJerk-mean()-X" | Normalized range [-1,1] 
|"tBodyAccJerk-mean()-Y" | Normalized range [-1,1] 
|"tBodyAccJerk-mean()-Z" | Normalized range [-1,1] 
|"tBodyAccJerk-std()-X" | Normalized range [-1,1] 
|"tBodyAccJerk-std()-Y" | Normalized range [-1,1] 
|"tBodyAccJerk-std()-Z" | Normalized range [-1,1] 
|"tBodyGyro-mean()-X" | Normalized range [-1,1] 
|"tBodyGyro-mean()-Y" | Normalized range [-1,1] 
|"tBodyGyro-mean()-Z" | Normalized range [-1,1] 
|"tBodyGyro-std()-X" | Normalized range [-1,1] 
|"tBodyGyro-std()-Y" | Normalized range [-1,1] 
|"tBodyGyro-std()-Z" | Normalized range [-1,1] 
|"tBodyGyroJerk-mean()-X" | Normalized range [-1,1] 
|"tBodyGyroJerk-mean()-Y" | Normalized range [-1,1] 
|"tBodyGyroJerk-mean()-Z" | Normalized range [-1,1] 
|"tBodyGyroJerk-std()-X" | Normalized range [-1,1] 
|"tBodyGyroJerk-std()-Y" | Normalized range [-1,1] 
|"tBodyGyroJerk-std()-Z" | Normalized range [-1,1] 
|"tBodyAccMag-mean()" | Normalized range [-1,1] 
|"tBodyAccMag-std()" | Normalized range [-1,1] 
|"tGravityAccMag-mean()" | Normalized range [-1,1] 
|"tGravityAccMag-std()" | Normalized range [-1,1] 
|"tBodyAccJerkMag-mean()" | Normalized range [-1,1] 
|"tBodyAccJerkMag-std()" | Normalized range [-1,1] 
|"tBodyGyroMag-mean()" | Normalized range [-1,1] 
|"tBodyGyroMag-std()" | Normalized range [-1,1] 
|"tBodyGyroJerkMag-mean()" | Normalized range [-1,1] 
|"tBodyGyroJerkMag-std()" | Normalized range [-1,1] 
|"fBodyAcc-mean()-X" | Normalized range [-1,1] 
|"fBodyAcc-mean()-Y" | Normalized range [-1,1] 
|"fBodyAcc-mean()-Z" | Normalized range [-1,1] 
|"fBodyAcc-std()-X" | Normalized range [-1,1] 
|"fBodyAcc-std()-Y" | Normalized range [-1,1] 
|"fBodyAcc-std()-Z" | Normalized range [-1,1] 
|"fBodyAccJerk-mean()-X" | Normalized range [-1,1] 
|"fBodyAccJerk-mean()-Y" | Normalized range [-1,1] 
|"fBodyAccJerk-mean()-Z" | Normalized range [-1,1] 
|"fBodyAccJerk-std()-X" | Normalized range [-1,1] 
|"fBodyAccJerk-std()-Y" | Normalized range [-1,1] 
|"fBodyAccJerk-std()-Z" | Normalized range [-1,1] 
|"fBodyGyro-mean()-X" | Normalized range [-1,1] 
|"fBodyGyro-mean()-Y" | Normalized range [-1,1] 
|"fBodyGyro-mean()-Z" | Normalized range [-1,1] 
|"fBodyGyro-std()-X" | Normalized range [-1,1] 
|"fBodyGyro-std()-Y" | Normalized range [-1,1] 
|"fBodyGyro-std()-Z" | Normalized range [-1,1] 
|"fBodyAccMag-mean()" | Normalized range [-1,1] 
|"fBodyAccMag-std()" | Normalized range [-1,1] 
|"fBodyBodyAccJerkMag-mean()" | Normalized range [-1,1] 
|"fBodyBodyAccJerkMag-std()" | Normalized range [-1,1] 
|"fBodyBodyGyroMag-mean()" | Normalized range [-1,1] 
|"fBodyBodyGyroMag-std()" | Normalized range [-1,1] 
|"fBodyBodyGyroJerkMag-mean()" | Normalized range [-1,1] 
|"fBodyBodyGyroJerkMag-std()" | Normalized range [-1,1] 