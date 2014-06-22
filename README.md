Getting_and_Cleaning_Data_Project
=================================
# Introduction
This repository covers a course project of a Coursera Johns Hopkins' course called 'Getting and Cleaning Data'.  It accesseses and manipulates Smartphone data from Samsung.


# Execution 
- based on Windows 7
- Run run_analysis.R which will download and unzip the source data and then manipulate it.

## Major areas of execution
0. download file and extract data to working directory. Ensure plyr library is loaded for ddply.
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 	
5. 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes: 
1. downloaed zip file (dataset.zip) is ~ 61Mb compressed and ~269Mb uncompressed (UCI HAR Dataset folder).
2. output and code is less than 1 Mb
3. script ran in 90 seconds (Intel i5/2.5 Ghz, 8 Gb memory, Win7-64 Pro).  60 seconds of this time was downloading and uncompressing the compressed source data.
4. see codebook.md for additional information
	
# Output: 
1. average_data.txt: text file containing tidy data with the average of every column based on a mean or standard deviatioin
2. merged_SYX.txt: text file used to create average_data.txt.  It combines subject, Y, and X data test and training data.
