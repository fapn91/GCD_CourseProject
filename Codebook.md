### Codebook ###

Data that you obtain from the script (both are located in the readme.md and run_analysis.R) has 180 observations, 30 subjects doing each 6 different activities. It also has 75 variables, the first two are "subject" and "activity". The rest are compose by the mean and standard deviations of the following measurements:

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
  
There are exacly 73 measurement variables, excluding "subject" and "activity". The measurements are the averages of each variable for each activity and each subject.  The data is obtain from these link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip You may use the unzip() function in RStudio, or do it manually (right click on the file and unzip it) in order to open the data set.

You should load (and also be familiarized with) both "plyr" and "dplyr" packages in R. These commands will help you in ativating both packages:

```{R}
install.packages("plyr")
install.packages("dplyr")
library(plyr)
library(dplyr)
```
