# CodeBook

## Data Description

#### You can obtain data by using functions: data <- createTidyData(directory) and data2 <- createAverageTidyData(directory).

#### 'data' calculates in 5 steps:
* Getting raw data from '/train/X_train.txt', '/train/y_train.txt', '/train/subject_train.txt', '/test/X_test.txt', '/test/y_test.txt', '/test/subject_test.txt' files.
* Merging test and train data for X, Y, Subject.
* Setting names for X, Y, Subject, obtained from '/features.txt' and '/activity_labels.txt' files.
* Extracting only the measurements on the mean and standard deviation for each measurement in X.
* Merge X, Y, Subject in one data.frame.

#### 'data2' calculates in 5 steps too:
* Getting raw data from '/train/X_train.txt', '/train/y_train.txt', '/train/subject_train.txt', '/test/X_test.txt', '/test/y_test.txt', '/test/subject_test.txt' files.
* Merging test and train data for X, Y, Subject.
* Setting names for X, Y, Subject, obtained from '/features.txt' and '/activity_labels.txt' files.
* Merge X, Y, Subject in one data.frame.
* Creating tidy data set with the average of each variable for each activity and each subject using aggregate() function.

## Variables Description

#### The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

#### Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

####Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

####These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

* tBodyAcc-XYZ
* GravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

####The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

#### Note: 'data' contains only mean() and std()

####Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable (only in 'data2'):

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
