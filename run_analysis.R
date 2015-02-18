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

## Unzip data
unzip("./data/getdata_projectfiles_UCI_HAR_Dataset.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = "./data", unzip = "internal",
      setTimes = FALSE)

## 1. Merges the training and the test sets to create one data set.
temp1 <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
temp2 <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
X <- rbind(temp1, temp2)

temp1 <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
temp2 <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
S <- rbind(temp1, temp2)

temp1 <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
temp2 <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
Y <- rbind(temp1, temp2)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./data/UCI HAR Dataset/features.txt")
required_features_indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, required_features_indices]
names(X) <- features[required_features_indices, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

## 4. Appropriately labels the data set with descriptive variable names. 
names(S) <- "volunteer"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "./data/clean_merged_data.txt")

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uniqueVolunteers = unique(S)[,1]
numVolunteers = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numVolunteers*numActivities), ]
row = 1
for (s in 1:numVolunteers) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueVolunteers[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$volunteer==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
