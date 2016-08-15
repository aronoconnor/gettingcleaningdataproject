## READ ME: Getting and Cleaning Data Peer Graded Programming Assignment
## Aron O'Connor
## Aug. 14, 2016

### Background

The data used in this exercise comes from work done by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto
at Università degli Studi di Genova.  Below is a description of the data set provided by the original curators of the data:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding 
windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low 
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain."

### Description of the Data
I combined and manipulated the original data sets in order to form two sets if tidy data that are hopfully easier to work with. The first data 
set "combined_smartphone_data.txt" includes all the data features that include mean and standard deviation values as well as variables for the 
activity performed, the test subject, and whether the data was part of the 'test' or the 'train' data set.  The second data set 
"average_smartphone_data.txt" includes the average of each variable for each activity and each subject.


### Everything below this point is the source R code for creating the 'combined_smartphone_data.txt' and 'average_smartphone_data.txt' files:


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

write.table(acceleration_mean_std,file="combined_smartphone_data.txt")

##  Create a second data set with the average of each variable for each activity and each subject.
acceleration_avg <- aggregate(acceleration_mean_std[,1] ~ subject + activity,
               data=acceleration_mean_std,FUN="mean")
for (i in 2:79){
        a <- aggregate(acceleration_mean_std[,i] ~ subject + activity,
                  data=acceleration_mean_std,FUN="mean")
        acceleration_avg <- cbind(acceleration_avg,a[,3])
}
names(acceleration_avg) <- c("subject","activity",names(acceleration_mean_std[1:79]))

write.table(acceleration_avg,file="average_smartphone_data.txt")

