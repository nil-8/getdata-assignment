# Coursera Getting and Cleaning Data Course Project

## Description of data processing script

The script run_analysis.R performs the following steps for the data from
[the UCI website on Human Activity Recognition Using Smartphones](
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### 1. Merges the training and the test sets to create one data set.

It assumes that all data is available in "./UCI HAR Dataset". If necessary, the first lines can be commented out to also perform the necessary download and unzip of the data. It reads the training and test data using 'read.table' commands and merges the data using rbind into a data frame data_full

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Using a grep command the indices for columns with "mean()" and "std()" are extracted. These columns are recombined in a a data frame called data_selected

### 3. Uses descriptive activity names to name the activities in the data set
The activity names are read from the files "y\_test.txt" and "y\_train.txt", with some hacking, into the "activities" data frame

### 4. Appropriately labels the data set with descriptive variable names. 
The variable names are taken over from the file "features.txt", and are in fact already incorporated from step 1.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is achieved using a split and a subsequent sapply command. The raw data is written to "tidy\_dataset.txt", the row names to "row\_names.txt" and the column names to "column\_names.txt"
