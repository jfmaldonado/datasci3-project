# Instructions

In order to use the script "run_analysis.R", follow the next steps:

1.  Download the [input data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2.  Decompress the input data into a folder.
3.  Open the file "run_analysis.R" in RStudio.
4.  In the line 78 of the script, replace the parameter of "setwd" by the path of the folder in which you descompressed the input data (for example, "C:/Users/IAmGreat/Downloads/UCI HAR Dataset").
5.  Execute the entire script.

The scripts works in the following way:

1.  Invokes the function "getMergedData()" which returns the data in the folders 'test' and 'train' as a data frame.
2.  The function "getMergedData()" invokes the function "readData()" two times for read the 'test' and the 'train' data (this functions reads 'x', 'y' and 'subject' data, concatenates their values into a single data frame and removes all columns that are neither a mean value or a standard deviation value), and the groups this information into a data frame.
3.  Using the 'aggregate()' function, the merged data is processed in order to calculate the average of each variable for each activity and each subject.
4.  The result data frame is stored in a CVS file.

# Code book

## Grouping variables

*Subject*: Number identifying the subject from which the data was gathered.

*Activity*: Activity that the subject was doing when the data was measured.

## Measured variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-  tBodyAcc-XYZ
-  tGravityAcc-XYZ
-  tBodyAccJerk-XYZ
-  tBodyGyro-XYZ
-  tBodyGyroJerk-XYZ
-  tBodyAccMag
-  tGravityAccMag
-  tBodyAccJerkMag
-  tBodyGyroMag
-  tBodyGyroJerkMag
-  fBodyAcc-XYZ
-  fBodyAccJerk-XYZ
-  fBodyGyro-XYZ
-  fBodyAccMag
-  fBodyAccJerkMag
-  fBodyGyroMag
-  fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

-  mean..: Mean value
-  std..: Standard deviation
