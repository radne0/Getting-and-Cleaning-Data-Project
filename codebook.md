---
title: "Getting and Cleaning Data"
date: "2024-02-02"
output: html_document
---

## Codebook

This dataset utilizes a subset of the dataset on Human Activity Recognition Using Smartphones

[https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones](https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones)

From the initial data set the following transformation was performed (see readme.md for more details on the process)

* Merge the subject_test.txt, X_test.txt and y_test.txt (both the test and training folders) contained in UCI HAR Dataset.
* Subset the dataset to only include measurements that were mean or standard deviation measurements.
* Tidy up the data and given meaningful column names to remaining features
* Analyze the data by calculating the mean of each desired measurement for each subject and activity.


# Description of columns 


| Column 1: Subject   |      
|--------------|
|    Type: positive integers.  |     
|    Possible Values:  1-30.   | 
|    Description: an ID for each subject that took place in the experiment.  | 
  
  
| Column 2: Activity  |
|--------------------------|
| Type: Text      |
| Possible Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  |   
| Description: This field indicates that action performed by the subject for this particular observation  | 
    
    
| Column 3: Measurement.Name  |
|-------------|
| Name: Measurement.Name | 
| Type: Text | 
| Description: Names of the collected measurements that deal with mean or standard deviation.  

Possible Values: 1 of 79 mean or sd measurements:    
[1] "tBodyAcc-mean()-X"              
[2] "tBodyAcc-mean()-Y"              
[3] "tBodyAcc-mean()-Z"              
[4] "tBodyAcc-std()-X"               
[5] "tBodyAcc-std()-Y"               
[6] "tBodyAcc-std()-Z"               
[7] "tGravityAcc-mean()-X"           
[8] "tGravityAcc-mean()-Y"           
[9] "tGravityAcc-mean()-Z"           
[10] "tGravityAcc-std()-X"            
[11] "tGravityAcc-std()-Y"            
[12] "tGravityAcc-std()-Z"            
[13] "tBodyAccJerk-mean()-X"          
[14] "tBodyAccJerk-mean()-Y"          
[15] "tBodyAccJerk-mean()-Z"          
[16] "tBodyAccJerk-std()-X"           
[17] "tBodyAccJerk-std()-Y"           
[18] "tBodyAccJerk-std()-Z"           
[19] "tBodyGyro-mean()-X"             
[20] "tBodyGyro-mean()-Y"             
[21] "tBodyGyro-mean()-Z"             
[22] "tBodyGyro-std()-X"              
[23] "tBodyGyro-std()-Y"              
[24] "tBodyGyro-std()-Z"              
[25] "tBodyGyroJerk-mean()-X"         
[26] "tBodyGyroJerk-mean()-Y"         
[27] "tBodyGyroJerk-mean()-Z"         
[28] "tBodyGyroJerk-std()-X"          
[29] "tBodyGyroJerk-std()-Y"          
[30] "tBodyGyroJerk-std()-Z"          
[31] "tBodyAccMag-mean()"             
[32] "tBodyAccMag-std()"              
[33] "tGravityAccMag-mean()"          
[34] "tGravityAccMag-std()"           
[35] "tBodyAccJerkMag-mean()"         
[36] "tBodyAccJerkMag-std()"          
[37] "tBodyGyroMag-mean()"            
[38] "tBodyGyroMag-std()"             
[39] "tBodyGyroJerkMag-mean()"        
[40] "tBodyGyroJerkMag-std()"         
[41] "fBodyAcc-mean()-X"              
[42] "fBodyAcc-mean()-Y"              
[43] "fBodyAcc-mean()-Z"              
[44] "fBodyAcc-std()-X"               
[45] "fBodyAcc-std()-Y"               
[46] "fBodyAcc-std()-Z"               
[47] "fBodyAcc-meanFreq()-X"          
[48] "fBodyAcc-meanFreq()-Y"          
[49] "fBodyAcc-meanFreq()-Z"          
[50] "fBodyAccJerk-mean()-X"          
[51] "fBodyAccJerk-mean()-Y"          
[52] "fBodyAccJerk-mean()-Z"          
[53] "fBodyAccJerk-std()-X"           
[54] "fBodyAccJerk-std()-Y"           
[55] "fBodyAccJerk-std()-Z"           
[56] "fBodyAccJerk-meanFreq()-X"      
[57] "fBodyAccJerk-meanFreq()-Y"      
[58] "fBodyAccJerk-meanFreq()-Z"      
[59] "fBodyGyro-mean()-X"             
[60] "fBodyGyro-mean()-Y"             
[61] "fBodyGyro-mean()-Z"             
[62] "fBodyGyro-std()-X"              
[63] "fBodyGyro-std()-Y"              
[64] "fBodyGyro-std()-Z"              
[65] "fBodyGyro-meanFreq()-X"         
[66] "fBodyGyro-meanFreq()-Y"         
[67] "fBodyGyro-meanFreq()-Z"         
[68] "fBodyAccMag-mean()"             
[69] "fBodyAccMag-std()"              
[70] "fBodyAccMag-meanFreq()"         
[71] "fBodyBodyAccJerkMag-mean()"     
[72] "fBodyBodyAccJerkMag-std()"      
[73] "fBodyBodyAccJerkMag-meanFreq()"         
[74] "fBodyBodyGyroMag-mean()"        
[75] "fBodyBodyGyroMag-std()"         
[76] "fBodyBodyGyroMag-meanFreq()"    
[77] "fBodyBodyGyroJerkMag-mean()"    
[78] "fBodyBodyGyroJerkMag-std()"     
[79] "fBodyBodyGyroJerkMag-meanFreq()"

| Column 4: measurement.means   |      
|--------------|
|    Type: real numbers    |     
|    Possible Values:  [-1,1].   | 
|    Description: mean of the taken measurements.  This is our final summary column.

### Details on Column 3's measurements.

Most information on the values contained in column 3 an be found in the documentation in the original dataset.   
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  The contents relevant to our subsetting data is included here for completeness 



The base measurement taken were taken in the time (t) or frequency domain (f).  (with one measurement for X, one for Y and one for Z where indicated.). 

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

The set of variables that were estimated in this subsetting dataset were.

mean(): Mean value
std(): Standard deviation











