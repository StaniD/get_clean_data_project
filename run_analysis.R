wd<-getwd()
#Download the Dataset.zip
if(file.exists("Dataset.zip")==FALSE){
  download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ,destfile="Dataset.zip")
}
# unzip the dataset
unzip("Dataset.zip")
if(dir.exists("UCI HAR Dataset") == FALSE){
  stop("downloaded zip is corrupt. download and extract manually in working directory")
  }

# set working dir to "UCI HAR Dataset"
setwd("UCI HAR Dataset")

# load libraries 
library(data.table)
library(dplyr)
# refer to the readme file for more info on test and training data files 
file.show("README.txt")

#1. Merge the training and the test sets to create one data set
    #Read the testing and training dataset, labels and subjects data
dataset_train <- read.table("./train/X_train.txt")
activitylabels_train <- read.table("./train/y_train.txt")
subjects_train <- read.table("./train/subject_train.txt")
dataset_test <- read.table("./test/X_test.txt")
activitylabels_test <- read.table("./test/y_test.txt") 
subjects_test <- read.table("./test/subject_test.txt")

    # merge the test end training data by row
alldataset <- rbind(dataset_train, dataset_test)
allactivities <- rbind(activitylabels_train, activitylabels_test)
allsubjects <- rbind(subjects_train, subjects_test) 
    # read in the measurement labels dataset
allfeatures <- read.table("features.txt")
file.show("features_info.txt")
    # names the columns of alldataset with 2nd column of allfeatures as vector 
colnames(alldataset) <- as.vector(allfeatures$V2)

#2. Extracts only the measurements on the mean and standard deviation for each measurement
    # subset only the columns that contain "mean()" or "std()"
alldataset <- alldataset[, grepl("mean\\(\\)|std\\(\\)", colnames(alldataset))] 

#3. Uses descriptive activity names to name the activities in the data set 
activity_names <- read.table("activity_labels.txt")
colnames(allactivities)<- c("activity_num")
    # transform activity_names - to lower case: 
activity_names$V2<- tolower(activity_names$V2)
activity<-as.vector(activity_names[match(allactivities$activity_num, activity_names$V1), "V2"])

    # merge as first column "ativity" into alldataset
alldataset<-cbind(activity,alldataset)
    # names V1 and merge as fisrt column allsubjects into alldataset
colnames(allsubjects)<- c("subjects")
alldataset<-cbind(allsubjects,alldataset)
 
#4. Appropriately labels the dataset with descriptive activity names. 
    # clean the data variables: remove "(", ")", "-" from the column names 
    # repetition words "bodybody" to "body"
    # replace "t" to "time" and "f" to "frequency"
alldataset <- alldataset %>% 
  setNames(tolower(gsub("\\(\\)","",names(.)))) %>%                                       
  setNames(gsub("-","_", names(.))) %>% 
  setNames(gsub("bodybody","body", names(.))) %>%
  setNames(gsub("^t", "time", names(.))) %>%
  setNames(gsub("^f", "frequency", names(.)))

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  # group the running data by subject and activity, then
  # calculate the mean of every measurement.
outputdata <- alldataset %>%
  group_by(subjects, activity) %>%
  summarise_all(funs(mean))

# write alltidydata and tidymeansdata with calculated means of measurements 
# to 2 files in your working directory
setwd(wd)
write.table(alldataset, file="alltidydata.txt", row.name=FALSE)
write.table(outputdata, file="tidymeansdata.txt", row.name=FALSE)
file.show("tidymeansdata.txt")
