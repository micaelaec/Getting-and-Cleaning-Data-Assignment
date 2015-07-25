#Read in Data
if(!file.exists("./data")){dir.create("./data")}
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "./data/file.zip", method="curl")
(dateDownloaded <- date())

unzip("./data/file.zip")
training <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#Merges the training and the test sets to create one data set.
#First add subjects and labels to each dataset
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

labels_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
labels_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

training <- cbind(subjects_train,labels_train,training)
test <- cbind(subjects_test,labels_test,test)

names(training)[1:2] <- c("Subject", "Activity")
names(test)[1:2] <- c("Subject", "Activity")

combined <- merge(training, test, all=TRUE)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
feature <- read.table("./UCI HAR Dataset/features.txt")

mean_indices <- c()
sd_indices <- c()
for (i in 1:nrow(feature)){
  if("mean()" %in% strsplit(as.character(feature$V2[i]),"-")[[1]]){
    mean_indices[i] <- rownames(feature)[i]
  }
  if("std()" %in% strsplit(as.character(feature$V2[i]),"-")[[1]]){
    sd_indices[i] <- rownames(feature)[i]
  }
  all_indices <- c(mean_indices,sd_indices)
  all_indices <- all_indices[!is.na(all_indices)]
}

col_needed <- paste("V",all_indices, sep="")

mean_sd_data <- combined[,c("Subject", "Activity", col_needed)]

#Uses descriptive activity names to name the activities in the data set
mean_sd_data$Activity <- factor(mean_sd_data$Activity)
levels(mean_sd_data$Activity) <- c(as.character(read.table("./UCI HAR Dataset/activity_labels.txt")[,2]))

#Appropriately labels the data set with descriptive variable names. 
labels <- read.table("./UCI HAR Dataset/features.txt")
des_names <- labels[paste("V", labels[,1], sep="") %in% colnames(mean_sd_data),]
colnames(mean_sd_data)[-(1:2)] <- as.character(des_names[,2])

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
require(reshape2)
dataMelt <- melt(mean_sd_data, id=c("Subject","Activity"))
tidyData2 <- dcast(dataMelt,Subject+Activity~variable, mean)
colnames(tidyData2)[-(1:2)] <- lapply(des_names, FUN= function(x) {paste("aggregated mean",as.character(des_names[,2]))})$V2 #renamed the variables since they are now the means aggregated within subject and activity
