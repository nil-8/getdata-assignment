The data obtained from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

is processed as followed:
- unzipped
- merge of "./UCI HAR Dataset/test/X_test.txt" and "./UCI HAR Dataset/train/X_train.txt", with column names obtained from "./UCI HAR Dataset/features.txt"
- subjects obtained from "./UCI HAR Dataset/test/subject_test.txt" and "./UCI HAR Dataset/train/subject_train.txt"
- activities obtained from "./UCI HAR Dataset/test/y_test.txt" and "./UCI HAR Dataset/train/y_train.txt"
- only the features are selected that have "main()" or "std()" in their name
- the data is split by subject and activity name resulting in data frames for each combination (such as 14.WALKING)
- for every such resulting dataframe, the column means are computed
- the data is saved in "tidy_data.txt", column names (subject and activity) in "column_names.txt" and row names (features) in "row_names.txt". 
- the units of the data are unchanged, all with values within [-1,1]
