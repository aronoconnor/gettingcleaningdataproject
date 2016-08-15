## Getting and Cleaning Data Peer Graded Programming Assignment
## Aron O'Connor
## Aug. 14, 2016

## This script takes data collected from accelerometers in the Samsung Galaxy S smartphone and
## performs a series of analytical tasks.

## Download the accelerometer data from the interwebs and save in a folder created in the working
## directory called 'data'.  Unzip the file once it is downloaded.
if(!file.exists("./data")){dir.create("./data")}
setwd("./data")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.
              zip",destfile="accel.zip",mode='wb')
unzip("accel.zip")

## Extract and format the relevant data files from the unzipped folder
features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
testData <- read.table("./UCI HAR Dataset/test/x_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names=c("label"))
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subject"))
trainData <- read.table("./UCI HAR Dataset/train/x_train.txt")
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names=c("label"))
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subject"))
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("number","activity"))


## Assign the features character vector as the names of variables in each data set
colnames(testData) <- features
colnames(trainData) <- features
testData <- cbind(testData,testLabels,testSubject)
trainData <- cbind(trainData,trainLabels,trainSubject)

## Add the label data to both test and train data sets and merge with the activity labels to make
## them readable instead of integers from 1 to 6.
testMerged <- merge(testData,activityLabels,by.x="label",by.y="number",all.x=TRUE)
trainMerged <- merge(trainData,activityLabels,by.x="label",by.y="number",all.x=TRUE)

## Add variable to indicate if the data is from the test set or train set and then merge the 
## training and the test sets together to create one data set.
indicator <- replicate(2947,"test")
testMerged <- cbind(testMerged,indicator)
indicator <- replicate(7352,"train")
trainMerged <- cbind(trainMerged,indicator)
accelerationData <- rbind(testMerged,trainMerged)

## Extract only the measurements on the mean and standard deviation for each measurement.
meanStd_values <- grep("mean|std",names(accelerationData))
acceleration_subset <- c(meanStd_values,563,564,565)
acceleration_mean_std <- accelerationData[,acceleration_subset]

## Appropriately label the data set with descriptive variable names.
names(acceleration_mean_std) <- gsub("^t","time_",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("indicator","test/train",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("^f","frequency_",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("[Gg]yro","_gyroscope",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("BodyBody|Body_","Body_",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("[Aa]cc|ACC","_accelerometer",names(acceleration_mean_std))
names(acceleration_mean_std) <- tolower(names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("jerk","_jerk",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("meanfreq","meanfrequency",names(acceleration_mean_std))
names(acceleration_mean_std) <- gsub("mag","_magnitude",names(acceleration_mean_std))

write.table(acceleration_mean_std,file="combined_smartphone_data.txt", row.names=FALSE)

##  Create a second data set with the average of each variable for each activity and each subject.
acceleration_avg <- aggregate(acceleration_mean_std[,1] ~ subject + activity,
               data=acceleration_mean_std,FUN="mean")
for (i in 2:79){
        a <- aggregate(acceleration_mean_std[,i] ~ subject + activity,
                  data=acceleration_mean_std,FUN="mean")
        acceleration_avg <- cbind(acceleration_avg,a[,3])
}
names(acceleration_avg) <- c("subject","activity",names(acceleration_mean_std[1:79]))

write.table(acceleration_avg,file="average_smartphone_data.txt", row.names=FALSE)
