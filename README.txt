###run_analyis.R README.txt

#Written by Micaela on July 24, 2015

##Directions:
Reminder: Before running the script, make sure you change your working directory to wherever you
would like it.

Reminder 2: Make sure to load the reshape2 package before running the code.

#First section of code ("Read in Data")
This section will download the Samsung data from the UCI HAR website into your working
directory.  The datafile will be unzipped and two dataframes will be read in: training
and test.

#Merge training and test sets to make combined dataset
Before combining the test and training sets, the Subject variables and Activity label 
variables are added to each dataset.  

The "combined" dataset will contain all variables for all types of activities for all
subjects.

#Extract only mean and standard deviation variables for each measurement.
A for loop is implemented to search through all features in the dataset for the 
indices that correspond to a variable with either mean() or sd() in the variable name.

The combined dataset is then subsetted using these indices to make a new dataset that only
contains the mean and standard deviation variables for each measurement ("mean_sd_data").

#Use descriptive activity names to name the activities in the dataset
The Activity column in the "mean_sd_data" dataset was originally numeric.  To make the 
Activities in the Activity column easier to interpret, the Activity column is renamed
with the labels from the activity_labels.txt file.

#Appropriately label the dataset with descriptive variable names. 
The column names in "mean_sd_data" were not originally descriptive.  To make it easier
to understand which variable is which, the feature labels for the included variables were
extracted from "features.txt".  These labels were then used to rename the columns in 
"mean_sd_data".

#Create a dataset with the average of each variable for each activity and each subject.
Uses the reshape2 package to melt and then cast "mean_sd_data" into a new dataset (tidyData2)
where each row corresponds to a particular subject/type of activity.  Each subject
has six rows of data corresponding to the six types of activity.  The columns are the 
aggregated means for the variables.  


