##Code Book
## Getting and Cleaning Data
 
## 1. The Raw data: 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

The raw data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 2. Actions perfromed on raw data:
run_analysis.R :
  Downloads and unzip the raw data in working directory 
  Read and combine the training and test datasets into one
      result: 
          >dim(alldataset) 
          [1] 10299   561
  Set column names on the variables from the file "features.txt"
  Subset from the dataset the  mean or standard deviation measurements: 
      these are the columns with mean() or std() in their names
      result: 
          >dim(alldataset)
          [1] 10299    66
  Read the activity names from "activity_labels.txt" file and replaces the coresponding label with the activity name. 
  Merge allsubjects and activity as first and second columns into the dataset      
        result: 
        >dim(alldataset)
        [1] 10299    68
  Clean the dataset variables: 
    remove "(", ")", "-" from the column names 
    repetition words "bodybody" to "body"
    replase "t" to "time"" and "f" to "frequency"
  Creates a second tidy dataset grouped by subject and activity, and calculate the mean for every measurement columns (3:68).
    
  Change working directory one level up and save 2 datasets as 2 text files: alltidydata.txt and tidymeansdata.txt. Opens tidymeansdata.txt in text editor. 
  
## 3. Variables and observations:
    subjects - represents the participants, who have taken this experiments.
    activity - represents 1 of the 6 activities for each participant have been been taken.     means of all measurable variables - the average of each measurement of the activity and subject. for more info refer the opened file: features_info.txt
    Each observation contains subject, activity name and measurement variables.
    
## 4. Variables list of tidymeanstdata.txt: 
> str(outputdata)
Classes 'grouped_df', 'tbl_df', 'tbl' and 'data.frame':	180 obs. of  68 variables:
 subjects                     : int  1 1 1 1 1 1 2 2 2 2 ...
 activity                     : Factor w/ 6 levels "laying","sitting",..: 1 2 3 4 5 6 1 2 3 4 ...
   timebodyacc_mean_x           : num  0.222 0.261 0.279 0.277 0.289 ...
   timebodyacc_mean_y           : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
   timebodyacc_mean_z           : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
   timebodyacc_std_x            : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
   timebodyacc_std_y            : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
   timebodyacc_std_z            : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
   timegravityacc_mean_x        : num  -0.249 0.832 0.943 0.935 0.932 ...
   timegravityacc_mean_y        : num  0.706 0.204 -0.273 -0.282 -0.267 ...
   timegravityacc_mean_z        : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
   timegravityacc_std_x         : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
   timegravityacc_std_y         : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
   timegravityacc_std_z         : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
   timebodyaccjerk_mean_x       : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
   timebodyaccjerk_mean_y       : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
   timebodyaccjerk_mean_z       : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
   timebodyaccjerk_std_x        : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
   timebodyaccjerk_std_y        : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
   timebodyaccjerk_std_z        : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
   timebodygyro_mean_x          : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
   timebodygyro_mean_y          : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
   timebodygyro_mean_z          : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
   timebodygyro_std_x           : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
   timebodygyro_std_y           : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
   timebodygyro_std_z           : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
   timebodygyrojerk_mean_x      : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
   timebodygyrojerk_mean_y      : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
   timebodygyrojerk_mean_z      : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
   timebodygyrojerk_std_x       : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
   timebodygyrojerk_std_y       : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
   timebodygyrojerk_std_z       : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
   timebodyaccmag_mean          : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
   timebodyaccmag_std           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
   timegravityaccmag_mean       : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
   timegravityaccmag_std        : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
   timebodyaccjerkmag_mean      : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
   timebodyaccjerkmag_std       : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
   timebodygyromag_mean         : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
   timebodygyromag_std          : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
   timebodygyrojerkmag_mean     : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
   timebodygyrojerkmag_std      : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
   frequencybodyacc_mean_x      : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
   frequencybodyacc_mean_y      : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
   frequencybodyacc_mean_z      : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
   frequencybodyacc_std_x       : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
   frequencybodyacc_std_y       : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
   frequencybodyacc_std_z       : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
   frequencybodyaccjerk_mean_x  : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
   frequencybodyaccjerk_mean_y  : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
   frequencybodyaccjerk_mean_z  : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
   frequencybodyaccjerk_std_x   : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
   frequencybodyaccjerk_std_y   : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
   frequencybodyaccjerk_std_z   : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
   frequencybodygyro_mean_x     : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
   frequencybodygyro_mean_y     : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
   frequencybodygyro_mean_z     : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
   frequencybodygyro_std_x      : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
   frequencybodygyro_std_y      : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
   frequencybodygyro_std_z      : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
   frequencybodyaccmag_mean     : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
   frequencybodyaccmag_std      : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
   frequencybodyaccjerkmag_mean : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
   frequencybodyaccjerkmag_std  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
   frequencybodygyromag_mean    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
   frequencybodygyromag_std     : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
   frequencybodygyrojerkmag_mean: num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
   frequencybodygyrojerkmag_std : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...

## 5. Variables list of alltidydata.txt:
> str(alldataset)
'data.frame':	10299 obs. of  68 variables:
 $ subjects                     : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity                     : Factor w/ 6 levels "laying","sitting",..: 3 3 3 3 3 3 3 3 3 3 ...
 $ timebodyacc_mean_x           : num  0.289 0.278 0.28 0.279 0.277 ...
 $ timebodyacc_mean_y           : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ timebodyacc_mean_z           : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ timebodyacc_std_x            : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ timebodyacc_std_y            : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ timebodyacc_std_z            : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ timegravityacc_mean_x        : num  0.963 0.967 0.967 0.968 0.968 ...
 $ timegravityacc_mean_y        : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
 $ timegravityacc_mean_z        : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
 $ timegravityacc_std_x         : num  -0.985 -0.997 -1 -0.997 -0.998 ...
 $ timegravityacc_std_y         : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
 $ timegravityacc_std_z         : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
 $ timebodyaccjerk_mean_x       : num  0.078 0.074 0.0736 0.0773 0.0734 ...
 $ timebodyaccjerk_mean_y       : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
 $ timebodyaccjerk_mean_z       : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
 $ timebodyaccjerk_std_x        : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
 $ timebodyaccjerk_std_y        : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
 $ timebodyaccjerk_std_z        : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
 $ timebodygyro_mean_x          : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
 $ timebodygyro_mean_y          : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
 $ timebodygyro_mean_z          : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
 $ timebodygyro_std_x           : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
 $ timebodygyro_std_y           : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
 $ timebodygyro_std_z           : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
 $ timebodygyrojerk_mean_x      : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
 $ timebodygyrojerk_mean_y      : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
 $ timebodygyrojerk_mean_z      : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
 $ timebodygyrojerk_std_x       : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
 $ timebodygyrojerk_std_y       : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
 $ timebodygyrojerk_std_z       : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
 $ timebodyaccmag_mean          : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
 $ timebodyaccmag_std           : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
 $ timegravityaccmag_mean       : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
 $ timegravityaccmag_std        : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
 $ timebodyaccjerkmag_mean      : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...
 $ timebodyaccjerkmag_std       : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...
 $ timebodygyromag_mean         : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...
 $ timebodygyromag_std          : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...
 $ timebodygyrojerkmag_mean     : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...
 $ timebodygyrojerkmag_std      : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
 $ frequencybodyacc_mean_x      : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
 $ frequencybodyacc_mean_y      : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
 $ frequencybodyacc_mean_z      : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
 $ frequencybodyacc_std_x       : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
 $ frequencybodyacc_std_y       : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
 $ frequencybodyacc_std_z       : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
 $ frequencybodyaccjerk_mean_x  : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
 $ frequencybodyaccjerk_mean_y  : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
 $ frequencybodyaccjerk_mean_z  : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
 $ frequencybodyaccjerk_std_x   : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
 $ frequencybodyaccjerk_std_y   : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
 $ frequencybodyaccjerk_std_z   : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
 $ frequencybodygyro_mean_x     : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
 $ frequencybodygyro_mean_y     : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
 $ frequencybodygyro_mean_z     : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
 $ frequencybodygyro_std_x      : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
 $ frequencybodygyro_std_y      : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
 $ frequencybodygyro_std_z      : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
 $ frequencybodyaccmag_mean     : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...
 $ frequencybodyaccmag_std      : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...
 $ frequencybodyaccjerkmag_mean : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...
 $ frequencybodyaccjerkmag_std  : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...
 $ frequencybodygyromag_mean    : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...
 $ frequencybodygyromag_std     : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...
 $ frequencybodygyrojerkmag_mean: num  -0.992 -0.996 -0.995 -0.995 -0.995 ...
 $ frequencybodygyrojerkmag_std : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
 