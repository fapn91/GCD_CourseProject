### This is the course project for the "Getting and Cleaning Data" class. ###
## Follow these steps in order to complete the project. 

## Set your working directory.
setwd("YourDirectoryHere")

## Save and download and unzip the data.
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "YourDestFileHere")
unzip("YourZipFileHere")

## Load the"dplyr" package.
library(dplyr)

## Read both the activity labels and features. 
# activity_labels.txt contains the class labels with their activity name. 
activity<-read.table("./data/project/UCI HAR Dataset/activity_labels.txt")
# features.txt contains the measurements taken in the experiments.
features<-read.table("./data/project/UCI HAR Dataset/features.txt")

## Read the test and the train data files. 
# "test_sub" and "train_sub" contain the subjects who participated in the test-part and the 
# train part, respectively.
test_sub<-read.table("./data/project/UCI HAR Dataset/test/subject_test.txt")
train_sub<-read.table("./data/project/UCI HAR Dataset/train/subject_train.txt")
# "test_x"  and "train_x "contatin the data collected from each subject in the 
# test-part and the train-part, respectively. 
test_x<-read.table("./data/project/UCI HAR Dataset/test/X_test.txt")
train_x<-read.table("./data/project/UCI HAR Dataset/train/X_train.txt")
# "test_y" and "train_y" contain the test labels representing a single activity in each part.
test_y<-read.table("./data/project/UCI HAR Dataset/test/Y_test.txt")
train_y<-read.table("./data/project/UCI HAR Dataset/train/Y_train.txt")

## Join the activity data frame with both "test_y" and "train_y" so each activity can be named
junto_test<-plyr::join(test_y,activity,by="V1")
junto_train<-plyr::join(train_y,activity,by="V1")

## Combine the subject, activity and the data collected for each part of the experiment.
test<-cbind(test_sub,as.character(junto_test$V2),test_x)
train<-cbind(train_sub,as.character(junto_train$V2),train_x)

## Change the name of the variables using the features data frame
names(test)<-c("subject","activity",as.character(features$V2)) 
names(train)<-c("subject","activity",as.character(features$V2))

## Combine these two datasets into a single one using rbind() function
tidy_data<-rbind(test,train)

## Extract the measurements on the mean and standard deviation. 
tidy_data<-cbind(tidy_data[1:2],tidy[,grep("mean",names(tidy_data))],tidy[,grep("std",names(tidy_data))])

## In order to make the variables more descriptive, run the following codes in strict order:
desc=c(names(tidy_data)[1:2],grep("mean",names(tidy_data),value = T),grep("std",names(tidy_data),value = T))
desc=gsub("-"," ",desc); desc=gsub("mean"," mean",desc); desc=gsub("std"," standard deviation",desc)
desc=sub("t","time ",desc);desc=sub("f","frequency ",desc);desc=sub("actime ivity","activity",desc); desc=gsub("subjectime ","subject",desc)
desc=sub("stime andard","standard",desc);desc=sub("meanFreq","mean Freq",desc)
names(tidy_data) = desc

# If you want, check that features of this data set using dim(), str() or class() function
dim(tidy_data) ; str(tidy_data) ; class(tidy_data)
# You can also have a quick and neat look at the data set with the tbl_df() function
tbl_df(tidy_data)

## Work is not finished, though. Now it is needed to create a second tidy data set in which
# it contains only "the average of each variable for each activity and each subject."
# This can be done with the group_by () function with respect to subject and activity, and 
# the summarise_each(funs(mean)) function that runs as followed:
tidy_final<-group_by(tidy_data,subject,activity) %>% dplyr::summarise_each(funs(mean)) 

## Check at the dimensions of this tidy data set
dim(tidy_final)
# which confirms that the data set is correct since the experiment has 30 
# participants and 6 activities; therefore, 180 observations. 

## Take a wide look at the final data set
View(tidy_final)

## Finally, save the data set as txt.file
write.table(tidy_final,file="./data/tidy_data.txt",row.name=FALSE)
