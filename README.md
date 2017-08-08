# get_clean_data_project
Getting and Cleaning Data

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
The row data: a non-tidy dataset of accelerometers data from the Samsung Galaxy S smartphone (see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Instructions: 
Create one R script called run_analysis.R that does the following:
    1. Merges the training and the test sets to create one data set
    2. Extracts only the measurements on the mean and standard deviation for each measurement
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

Content in this repository: 
    1. run_analysis.R: R script to merge, clean-up, transform the raw data and create the tiny data set (created in RStudio Ver. 1.0.153 in Windows 10)
    2. CodeBook.md: Code Book describes the original data, the variables and the transformations performed to clean up the data and creates tidy dataset
    3. outputdata.txt: Tidy dataset output file created from the script run_analysis.R
    4. README.md 
    
Before running the script: 
    1. Read the Codebook for the steps taken and variables info
    2. install dplyr package
    3. install if read.table


During run of the script: 
    1. Opens "README.txt"" to view and refer info for the dataset files.
    2. Opens "features_info.txt" to refer more info about variables measurment names 
    3. Opens "outputdata.txt - the independend tudy datasetoutput file with average .
    
Run run_analysis.R
    
Notes: 
    in your working dir 
    The second tidy dataset "outpudata.txt" is saved in the unzipped folder: "UCI HAR Dataset" 
    Variables names and data structure - refer Codebook.md. 
