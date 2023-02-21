#Getting and Cleaning Data Course Project
## This is the CodeBook for this project
### Source Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:\
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones \
Data for this project can be found at the following link: \
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### R Script
#### Part 0: Reading datasets from unzipped UCI HAR Dataset file. 
In this part, eight files from three separate directories were imported as tables, each named their file name, not including the file name extension. The variables include the following:\
#####  activities_labels: this is a list of the 6 different activities that are performed when collecting data, and the label of each activity from numbers 1 to 6.\ 
#####  features: this is a list that includes 561 different features that were measured. Details are available in an accompanying file (features_info.txt) that comes with the second link above. \
#####  subject_test: contains an entry of the subject index for each test 9 of 30 subjects took, for a total of 2947 entries.\
#####  X_test: contains recorded data for the aforementioned subjects, in a dataframe that records 2947 entries over 561 features. \
#####  y_test: contains an entry of the activity index for each test 9 of 30 subjects took, for a total of 2947 entries.\
#####  subject_train: similar to subject_test, but the subjects are the remaining 21 of the 30.\
#####  X_train: similar to X_test, but the subjects are the remaining 21 of the 30.\
#####  y_train: similar to y_test, but the subjects are the remaining 21 of the 30.\
As the files were imported from their respective directories into R, the setwd() command was utilized a few times to access the necessary files. Ultimately, we returned to the starting directory via the command:\
setwd("../../Getting_and_Cleaning_Data_Course_Project")

#### Part 1: Merges the training and the test sets to create one data set. 
##### subjects: First of all, the datasets containing subjects are joined together to form an index, so as to prepare merging all 30 subjects' data on the same dataset later.\
##### x_data: Similarly, we bind X_train and X_test so that recorded data for all 30 subjects in all their activities are presented in a dataframe that records 10299 entries over 561 features.\
##### y_data: Also an 10299-entry index that depicts the activity performed in that row via the activity index.\ 
##### merge_data: merges subject with x_data and y_data to get 10299 entries of 563 columns, including 1 subject_index, 1 activity_index, and 561 features.
#### Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
##### tidy_data: selects the relevant columns from merge_data, since we're only interested in the mean and standard deviation of features, 86 out of 561 columns were selected.
#### Part 3: Uses descriptive activity names to name the activities in the data set. 
Instead of using the activity_index as the first column of tidy_data, we change it to descriptive activity names.
#### Part 4: Appropriately labels the data set with descriptive variable names.
Using the power of common expressions, we make the column names a bit more readable, thus obtaining descriptive variable names.
#### Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##### mean_tidy_data: summarizes tidy_data by collapsing measurements done to the same subject for the same activity into the mean of all such measurements. We are now left with 30(subjects) * 6(activities) = 180 rows by 88 columns of tidy data.
