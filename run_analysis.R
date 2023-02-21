library(dplyr)
# Part 0: Reading datasets from unzipped UCI HAR Dataset file
#setwd()
rm(list = ls())

## Read features.txt and activity_labels.txt
## In the following line, navigate from your current working directory to UCI HAR Dataset, and the rest of the code should work.
setwd("../UCI HAR Dataset")

activities_labels <- read.table("activity_labels.txt", col.names = c("activity_index", "activity"))
features <- read.table("features.txt", col.names = c("function_index","functions"))

## Read 3 files each from test and train
setwd("test")
subject_test <- read_table("subject_test.txt", col_names <- "subject_index")
X_test <- read_table("X_test.txt", col_names <- features$functions)
y_test <- read_table("y_test.txt", col_names <- "activity_index")

setwd("../train")
subject_train <- read_table("subject_train.txt", col_names <- "subject_index")
X_train <- read_table("X_train.txt", col_names <- features$functions)
y_train <- read_table("y_train.txt", col_names <- "activity_index")

setwd("../../Getting_and_Cleaning_Data_Course_Project")

#Part 1: Merges the training and the test sets to create one data set.

subjects <- rbind(subject_train, subject_test)
x_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
merge_data <- cbind(subjects, y_data, x_data)

#Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.
tidy_data <- select(merge_data, activity_index, subject_index, contains("mean"), contains("std"))

#Part 3: Uses descriptive activity names to name the activities in the data set.
tidy_data$activity_index <- activities_labels[tidy_data$activity_index, 2]

#Part 4: Appropriately labels the data set with descriptive variable names.
names(tidy_data)[1] = "Activity"
names(tidy_data)[2] = "Subject"
names(tidy_data)<-gsub("BodyBody", "Body ", names(tidy_data))
names(tidy_data)<-gsub("-", " ", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time ", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency ", names(tidy_data))
names(tidy_data)<-gsub("Acc", "Accelerometer ", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope ", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude ", names(tidy_data))
names(tidy_data)<-gsub("angle", "Angle ", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity ", names(tidy_data))
names(tidy_data)<-gsub("[Mm]ean\\(\\)- | [Mm]ean\\(\\)", "Mean ", names(tidy_data))
names(tidy_data)<-gsub("[Mm]eanFreq\\(\\)- | [Mm]eanFreq\\(\\)", "Mean Frequency ", names(tidy_data))
names(tidy_data)<-gsub("std\\(\\)", "STD ", names(tidy_data))
names(tidy_data)<-gsub("\\)", " ", names(tidy_data))
names(tidy_data)<-gsub("\\(", " ", names(tidy_data))

#Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

mean_tidy_data <- summarise_all(group_by(tidy_data, Subject, Activity), funs(mean))

write.table(mean_tidy_data, "mean_tidy_data.txt", row.name=FALSE)
