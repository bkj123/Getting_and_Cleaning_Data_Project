Getting_and_Cleaning_Data_Project
=================================
# Introduction
This repository covers course project of a Coursera Johns Hopkins' course called 'Getting and Cleaning Data'.  It accesseses and manipulates Smartphone data from Samsung.


# Execution 
- based on Windows 7
- Run run_analysis.R which will download and unzip the source data and then manipulate it.

## Major areas of execution
	0.  download file and extract data to working directory. Ensure plyr library is loaded for ddply.
	1.Merges the training and the test sets to create one data set. 
	2.Extracts only the measurements on the mean and standard deviation for each measurement. 
	3.Uses descriptive activity names to name the activities in the data set
	4.Appropriately labels the data set with descriptive variable names. 
	5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes: 
	1. download zip file (dataset.zip) is ~ 61Mb compressed and ~269Mb uncompressed (UCI HAR Dataset folder).
	2. output and code is less than 1 Mb
	3. script ran in 90 seconds (Intel i5/2.5 Ghz, 8 Gb memory, Win7-64 Pro).  60 seconds of this time was downloading and uncompressing the compressed source data.

# Output: 
- The avg_data.txt file shows averages for columns covering means and standard deviation data.
