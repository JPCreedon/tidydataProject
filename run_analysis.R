#folder relative to the working directory of the script
folder <- "UCI HAR Dataset"

##
##STEP 1
##Merges the training and the test sets to create one data set.
##

#read the train files
train_feature <-  read.table ( paste(folder,"train/X_train.txt",sep="/") )
train_activity <-  read.table ( paste(folder,"train/y_train.txt",sep="/") )
train_subject <-  read.table ( paste(folder,"train/subject_train.txt",sep="/") )
#combine columns
train_set <- cbind(train_subject,train_activity,train_feature)
#let's clean up a bit
rm( "train_feature","train_activity","train_subject")

#read the trest files
test_feature <-  read.table ( paste(folder,"test/X_test.txt",sep="/") )
test_activity <-  read.table ( paste(folder,"test/y_test.txt",sep="/") )
test_subject <-  read.table ( paste(folder,"test/subject_test.txt",sep="/") )
#combine columns
test_set <- cbind(test_subject,test_activity,test_feature)
#let's clean up a bit
rm( "test_feature","test_activity","test_subject" )

#combine rows for train and test set
sets <- rbind(train_set,test_set)

#let's clean up a bit
rm( "train_set","test_set" )
##
##END STEP 1
##

##
##STEP 2
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##

#read the feature file
features <- read.table(
  paste(folder,"features.txt",sep="/"),
  stringsAsFactors=FALSE
)

#search feature index which are mean or std
featuresColumns <- grep("-(mean|std)\\(\\)",features[,2])

#select only the need column
#sets has 2 column before the feature columns
sets <- sets[,c(1,2,featuresColumns+2)]

##
##STEP 3
##Uses descriptive activity names to name the activities in the data set
##
activities <- read.table(
  paste(folder,"activity_labels.txt",sep="/"),
  stringsAsFactors = FALSE
)
sets[,2] = activities[sets[,2],2]

##
##STEP 4
##Appropriately labels the data set with descriptive variable names.
##
colnames(sets) <- c("subject","activity",features[featuresColumns,2])

#let's have a look at our beloved data set !
str(sets)
#and clean up
rm("features","featuresColumns","activities")
##
##STEP 5
##tidy data set with the average of each variable for each activity and each subject.
##

#use dplyr
library(dplyr)
#create a table
tidyset <- tbl_df(sets)
#groupby subject and activity
tidyset <- group_by(tidyset,subject,activity)
#summarise for mean
tidyset <- summarise_each(tidyset,"mean")

#enjoy
write.table(tidyset,"tidyset.txt",row.names =FALSE)

##
##THE END
## That's all folks
##