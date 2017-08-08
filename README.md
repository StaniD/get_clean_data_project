## Getting and Cleaning Data
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
The row data: a non-tidy dataset of accelerometers data from the Samsung Galaxy S smartphone (see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Instructions: 
Create one R script called run_analysis.R that does the following:
    1. Merges the training and the test sets to create one data set
    2. Extracts only the measurements on the mean and standard deviation for each measurement
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject    
## Content in this repository: 
    1. run_analysis.R: R script to merge, clean-up, transform the raw data and create the tiny data set (created in RStudio Ver. 1.0.153 in Windows 10)
    2. CodeBook.md: Code Book describes the original data, the variables and the transformations performed to clean up the data and creates tidy dataset
    3. alltidydata.txt: All tidy dataset after step 4 created with run_analysis.R
    4. tidymeansdata.txt: Second tidy dataset with means created from step 5 with thescript run_analysis.R
    5. README.md     
## Before running the script: 
    1. Read the Codebook for the steps taken and variables info
    2. Ensure that you have installed "data.table" and "dplyr" packages
    3. To install packages use: install.packages("data.table"); install.packages("dplyr")    
## During run of the script: 
    1. Opens "README.txt"" to view and refer info for the dataset files.
    2. Opens "features_info.txt" to refer more info about measurement variables names 
    3. Opens "tidymeansdata.txt" - the 2nd tidy dataset file with average of the measurements    
## Run run_analysis.R
    source(run_analysis.R)
## Notes: 
    The raw data will be downloaded in your working directory. 
    2 files with datasets will be saved in your working directory:
    - all tidy dataset as "alltidydata.txt"
    - second tidy dataset as "tidymeansdata.txt"
    Variables names and data structure - refer to CodeBook.md in this repo. 
