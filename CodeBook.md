# Getting and Cleaning Data - Course Project  
## Code Book

#### run_analysis.R does the following  
1. Checks and creates "data" directory if it does not exist 
2. Downloads zip file containing data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
3. Unzips the files into the "data" directory.  
4. Reads training and the test data sets and then merges it to create one data set.  
5. Extracts only mean and standard deviation measurements for each entry.  
6. Extract descriptive activity names from the activity labels file and use this to name the activities in the data set.  
7. Labels the data set with descriptive variable names and export cleaned data as clean_merged_data.txt into the working data directory.  
8. Create a second independent data set from merged clean file with averages of each variable for every activitiy performed by the volunteer. Export the data set as data_set_with_the_averages.txt into the working data directory.  
