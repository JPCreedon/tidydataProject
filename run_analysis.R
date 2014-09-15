#folder relative to the working directory of the script
#folder <- "UCI HAR Dataset"
##
#Coursera Instructions ask for 
#the script to run with the currentworking directory
folder <- "."

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

#read the test files
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
#See STEP 1: sets columns are in order: 1-subject,2-activity,3-features-1,...i+2-features(i)...
#sets has 2 column before the feature columns
sets <- sets[,c(1,2,featuresColumns+2)]

##
##STEP 3
##Uses descriptive activity names to name the activities in the data set
##
#we read activity from the activities_labels.txt file and 
#use the fact that row index are the correct value
activities <- read.table(
  paste(folder,"activity_labels.txt",sep="/"),
  stringsAsFactors = FALSE
)
#Sets Column number TWO is the activity column, replace its value with
#the label of the value which is
#the 2nd column in the activities dataframe we have just read
sets[,2] = activities[sets[,2],2]

##
##STEP 4
##Appropriately labels the data set with descriptive variable names.
##
#we use the original feature names of the original datasets 
#as found in the features file
colnames(sets) <- c("subject","activity",features[featuresColumns,2])

#let's have a look at our beloved data set !
str(sets)

#oh well let subject and activy be factors
sets[,1] <- as.factor(x=sets[,1])
sets[,2] <- as.factor(x=sets[,2])

#and check factor with str
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