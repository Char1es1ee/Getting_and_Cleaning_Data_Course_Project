# Getting and Cleaning Data Course Project
This is the README file of the Getting_and_Cleaning_Data_Course_Project. It contains general information about everything in this repository.
For the peer graded assignment, please refer to the R code (run_analysis.R), codebook (Codebook.md), and the tidy dataset file (mean_tidy_data.txt).

## Files:
### run_analysis.R
This script requires the installation of the 'dplyr' package. \
run_analysis.R contains the process which I took to extract the tidy dataset file from the source file, available at: \
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip \
A detailed description can be found at their site: \
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In run_analysis.R you can find 6 parts of code in total (including Part 0: setting up), the other steps, as specified by the assignment, are: \
Part 1: Merges the training and the test sets to create one data set. \
Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. \
Part 3: Uses descriptive activity names to name the activities in the data set. \
Part 4: Appropriately labels the data set with descriptive variable names. \
Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### CodeBook.md
CodeBook.md contains the procedures of the data-cleaning process, as well as brief descriptions of the name and contents of variables within run_analysis.R.

### mean_tidy_data.txt
This txt file is the output after Part 5, it is a tidy dataset file with the average of each variable for each activity and each subject.
