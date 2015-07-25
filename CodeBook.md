#Code Book for Getting and Cleaning Data Course Project

##Dataset used:
The dataset is the Human Activity Recognition Using Smartphones Data Set from the 
UCI Machine Learning Repository (UCI HAR). 

##Description of study:
Wearable technology is becoming more and more common.  Researchers in Spain and Italy
tested the ability of a readily available technology (smartphones) to capture human
movement during different types of daily activity.  
For the study, 30 subjects between the ages of 19-48 years wore Samsung Galaxy SII 
smartphones on their waist while doing six different activities (Walking, 
Walking upstairs, Walking downstairs, Sitting, Standing, Laying).  
The phone's accelerometer and gyroscope captured movement while the subject did the 
activities.

###Source of data:
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and 
Xavier Parra(2)1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 

##Description of original data used:
The UCI HAR dataset includes multiple files containing: a test dataset, a training 
dataset, and information on the 561 different variables collected.  For the present 
analyses, the following files were used:
-'X_train.txt' : Data for 70% of the subjects
-'X_test.txt' : Data for 30% of the subjects, exact same variables as the train dataset
-'y_train.txt' : Labels for the training dataset
-'y_test.txt' : Labels for the testing dataset
-'subject_train.txt' : Link training data to subjects
-'subject_test.txt' : Link testing data to subjects
- 'activity_labels.txt' : Link labels with their activity name
- 'features.txt' : List of all of the features

More information about how the original researchers pre-processed the data and other files
included in the dataset can be found in the README.txt in the original UCI HAR dataset.

##Description of datasets formed for current analyses:
A combined dataset was formed by merging together the training and testing datasets, as 
well as adding in both Subject and Activity labels.  The dataframe "combined" has 
dimensions of 10299 x 563. 

The dataframe "mean_sd_data" was formed by subsetting "combined" by the column names
that contained either "mean()" or "std()". Dimensions = 10299 x 68.

"tidyData2" took the "mean_sd_data" dataset and averaged each variable
for each activity and each subject. Dimensions = 180 x 68.

##Variables 
From the original UCI HAR README.txt, the authors collected and pre-processed the 
following measurements:
-tBodyAcc-XYZ: time domain measure for Body Linear Acceleration
-tGravityAcc-XYZ: time domain measure for Gravity Acceleration
-tBodyAccJerk-XYZ: Jerk signal derived in time for Body Linear Acceleration 
-tBodyGyro-XYZ: time domain measure for Body gyroscope data 
-tBodyGyroJerk-XYZ: Jerk signal derived in time for Body gyroscope data
-tBodyAccMag: magnitude of Body Acceleration signal
-tGravityAccMag: magnitude of Gravity Acceleration signal
-tBodyAccJerkMag: magnitude of jerk Body Acceleration
-tBodyGyroMag: magnitude of gyroscope Body signal
-tBodyGyroJerkMag: magnitude of jerk gyroscope Body signal
-fBodyAcc-XYZ: fast Fourier Transform of Body Linear Acceleration
-fBodyAccJerk-XYZ: fast Fourier Transform of jerk Body Acceleration
-fBodyGyro-XYZ: fast Fourier Transform of gyroscope Body measure
-fBodyAccMag: fast Fourier Transform of magnitude of Body Acceleration measure
-fBodyAccJerkMag: fast Fourier Transform of magnitude of jerk Body Acceleration
-fBodyGyroMag: fast Fourier Transform of magnitude of gyroscope body measure
-fBodyGyroJerkMag: fast Fourier Transform of magnitude of jerk gyroscope body measure

For each the measurements, the authors created the following variables (taken verbatim
from the UCI HAR website):
-mean(): Mean value
-std(): Standard deviation
-mad(): Median absolute deviation 
-max(): Largest value in array
-min(): Smallest value in array
-sma(): Signal magnitude area
-energy(): Energy measure. Sum of the squares divided by the number of values. 
-iqr(): Interquartile range 
-entropy(): Signal entropy
-arCoeff(): Autorregresion coefficients with Burg order equal to 4
-correlation(): correlation coefficient between two signals
-maxInds(): index of the frequency component with largest magnitude
-meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-skewness(): skewness of the frequency domain signal 
-kurtosis(): kurtosis of the frequency domain signal 
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each 
-window.
-angle(): Angle between to vectors.

For all datasets created for the present analyses, all units of measurement were kept
the same as the original dataset as prepared by the original authors (above).  

All of the above variables were included in the "combined" dataset.  In addition,
the "combined" dataset includes a variable to denote which subject ('Subject') and type
of activity ('Activity')

Only the mean and standard deviation variables, as well as Subject and Activity variables,
 from combined were included in the "mean_sd_data" dataset.
 
"tidyData2" dataset contains the original Subject and Activity variables, as well as the 
means for all mean and sd variables from "mean_sd_data" aggregated within 
each Subject and Activity.
