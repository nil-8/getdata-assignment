# obtain zipfile and unzip
#file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#dest_file <- "dataset.zip"
#download.file(file_url, dest_file, method="curl")
#unzip(dest_file)

feature_names <- read.table("UCI HAR Dataset/features.txt")
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = feature_names[,2])
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = feature_names[,2])
data_full <- rbind(data_test, data_train)

# make selection of mean() and std()
mean_indices <- grep("mean()", feature_names[,2], fixed = TRUE)
std_indices <- grep("std()", feature_names[,2], fixed = TRUE)
selected_indices <- sort(c(mean_indices, std_indices))
data_selection <- data_full[,selected_indices]

# read activities
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activities_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
activities_full <- rbind(activities_test, activities_train)
activity_descriptions <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)[,2]
activities <- data.frame(factor(activities_full[,1], labels=activity_descriptions))
colnames(activities)[1] <- "activity"

# read subjects
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjects <- rbind(subjects_test, subjects_train)
colnames(subjects) <- "subject"
subject_numbers <- seq(min(subjects),max(subjects))

data_selection <- cbind(subjects, activities, data_selection)

split_data <- split(data_selection, list(data_selection$subject, data_selection$activity))

split_data_summarized <- sapply(split_data, function(x) colMeans(x[,seq(3, ncol(x))]))

write.table(split_data_summarized, file ="tidy_dataset.txt", row.name=FALSE, col.name=FALSE)

write.table(colnames(split_data_summarized), file = "column_names.txt",row.name=FALSE, col.name=FALSE)

write.table(rownames(split_data_summarized), file="row_names.txt", row.name=FALSE, col.name =FALSE)