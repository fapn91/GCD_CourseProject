### Codebook ###

This project is part of the Getting and Cleaning Data coursera class. The aim of this work is to take some sets of data and prepare ir for later analysis. In order to acomplish the project, it is necesary to use most of the tools that have been teached in this course. 

Data is obtained from these link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip You may use the unzip() function in RStudio, or do it manually (right click on the file and unzip it) to open the data set.

You should load (and also be familiarized with) both "plyr" and "dplyr" packages in R. Run these commands to ativate both packages:

```{R}
install.packages("plyr")
install.packages("dplyr")
library(plyr)
library(dplyr)
```

Also, to avoid any kind of confusion when running the R script, it is very helpful to write as follows:

```{R}
plyr::join...
dplyr::summarise(...)
```

## Raw data

There are 561 variables representing different measurements from these features:

```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

Also, there is the subject variable, which in total are 30 subjects; and the activity variable in which there are six different activities.  

## Processed data

Subject data stays the same. Activity data is changed into a more descriptive variable and takes the following values:

```
1     walking
2     walking upstairs
3     walking downstairs
4     sitting
5     standing
6     laying
```

The final tidy data obtained has 180 observations, 30 subjects doing each 6 different activities. Excluding subject and activity variables, there are 86 variables which are composed only by the measurements that contain the mean and  standard deviation of the features.  

For more information about the data set, please read the following txt files in Notepad or Notepad++:

```
YourDirectoryHere\UCI HAR Dataset\README.txt
YourDirectoryHere\UCI HAR Dataset\features_info.txt
```
