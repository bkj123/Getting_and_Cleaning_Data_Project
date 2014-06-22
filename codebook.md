# Code Book

## Data source
The data has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  

## Columns
Column names are described in the README.txt file of the source data mentioned above with 2 exceptions that were added:

1. column names were 'cleaned' by comverting all to lower case and removing symbols like parentheses.

2. 2 columns were added:
	a. subjectnumber: a string identifying the experiment subject
	b. activity: a string covering a subject's activity during data collection

## Output
1. average_data.txt: text file containing tidy data with the average of every column based on a mean or standard deviatioin
2. merged_SYX.txt: text file used to create average_data.txt.  It combines subject, Y, and X data test and training data.
