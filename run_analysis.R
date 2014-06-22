# run_analysis.R
# data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# process/step areas:
# 0.  download file and extract data to working directory. Ensure plyr library is loaded for ddply.
# 1.Merges the training and the test sets to create one data set. 
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.Creates a second, independent tidy data set with the average of each variable for each activity 
#   and each subject.  This is what is what we submit

# 0.  download file and extract data to working directory. Ensure plyr library is loaded for ddply.
library(plyr)

zip.url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zip.file<-'dataset.zip'
download.file(zip.url, destfile = zip.file)
unzip(zip.file)

# 1. Merges the training and the test sets to create one data set with X, Y, and Subject
temp1<-read.table("./UCI HAR Dataset/train/X_train.txt")
temp2<-read.table("./UCI HAR Dataset/test/X_test.txt")
Xdf<-rbind(temp1, temp2)

temp1<-read.table("./UCI HAR Dataset/train/y_train.txt")
temp2<-read.table("./UCI HAR Dataset/test/y_test.txt")
Ydf<-rbind(temp1, temp2)

temp1<-read.table("./UCI HAR Dataset/train/subject_train.txt")
temp2<-read.table("./UCI HAR Dataset/test/subject_test.txt")
Sdf<-rbind(temp1, temp2)
# citizenship: clean up what is not needed.
rm(temp1,temp2)

# 2.Extracts only the measurements on the mean and std dev for each measurement ala features.txt
features <- read.table("./UCI HAR Dataset/features.txt")

# get list of all of the columns with mean and std. update Xdf
mean_and_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
Xdf <- Xdf[, mean_and_std]

# set column names
names(Xdf) <- features[mean_and_std, 2]
# get rid of unwanted chars in column names
names(Xdf) <- gsub("\\(|\\)", "", names(Xdf))
names(Xdf) <- tolower(names(Xdf))
# cleanup vars that are not needed.
rm(mean_and_std, features)

# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# clean up activity names (column 2) including lowercase
activityLabels[, 2] = gsub("_", "", tolower(as.character(activityLabels[, 2])))
Ydf[,1] = activityLabels[Ydf[,1], 2]

# rename V1 to activity
names(Ydf) <- "activity"
# rename V1 to subjectnumber
names(Sdf) <- "subjectnumber"

# combine everything (Xdf, Ydf, Sdf) into one object and one txt file
mergeSYX <- cbind(Sdf, Ydf, Xdf)
write.table(mergeSYX, "merged_SYX.txt")

# 5.Creates a second, independent tidy data set with the average of each variable for each activity 
#   and each subject. This is what we submit

cols2excl = which(names(mergeSYX) %in% c("subjectnumber", "activity"))
result <- ddply(mergeSYX, .(subjectnumber, activity), .fun=function(x){ colMeans(x[,-cols2excl]) })

write.table(result, "average_data.txt")
# clean up objects
rm(mergeSYX, cols2excl)
