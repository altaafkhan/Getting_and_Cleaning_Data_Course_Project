## Script for course project associated with Getting and Cleaning Data offered by John Hopkins University - Bloomberg School of Public Health

## create a working data directory if it does not already exists
if (!file.exists("data")) {
   dir.create("data")
}

## Dowload data set and save it to working data directory
## Source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/getdata_projectfiles_UCI_HAR_Dataset.zip")
dateDownloaded <- date()

## 1. Merges the training and the test sets to create one data set.


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 


## 3. Uses descriptive activity names to name the activities in the data set


## 4. Appropriately labels the data set with descriptive variable names. 


## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

