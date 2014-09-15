folder <- getwd()
dataFileName <- "UCI HAR Dataset.zip"
dataFile <- paste(folder,dataFileName,sep="/")
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = dataUrl,destfile = dataFile)
unzip(dataFile,exdir=folder)
