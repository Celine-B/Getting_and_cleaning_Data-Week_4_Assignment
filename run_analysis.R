# Getting and cleaning data - Week 4 assignment

# The file 'UCI HAR Dataset' has been downloaded and unzipped in C:\Users\cline\Desktop\Documents\Coursera\DSrepo

## Step 1: setting working directory
getwd()
setwd("/Users/cline/Desktop/Documents/Coursera/DSrepo/UCI HAR Dataset/")

# Saving folder path in a variable
pathdata <- getwd()

# Checking the list of files
list.files(recursive=TRUE)

# The files are in 3 categories: Activity | Subject | Features


## Step 2: creating the datasets
# a - For the Activity files
dataActivityTest  <- read.table(file.path(pathdata, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(pathdata, "train", "Y_train.txt"),header = FALSE)

# b - For the Subject files
dataSubjectTrain <- read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(pathdata, "test" , "subject_test.txt"),header = FALSE)

# c - For the Features files
dataFeaturesTest  <- read.table(file.path(pathdata, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)


## Step 3: merging test and train datasets
# a - Merging test and train data for the 3 type of datasets (Activity-Subject-Features)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# b - Setting column names
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(pathdata, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

# c - Merging columns to have a single dataframe
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)


## Step 4: creating dataset with extract of mean and standard deviation for each mesurement
# a - Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# b - Subset the data frame by seleted names of Features
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

# c - Check the structures of the data frame
str(Data)


## Step 5: Uses descriptive activity names to name the activities in the data set
# a - Read descriptive activity names from "activity_labels.txt"
activityLabels <- read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

# b - Factorise Variable activity in the data frame Data using descriptive activity names
head(Data$activity,30)


## Step 6: Label the data set with decriptive variable names
# Checking current column names
names(Data)

# Need to transform column names: 
# prefix t => time
# Acc => Accelerometer
# Gyro => Gyroscope
# prefix f => frequency
# Mag => Magnitude
# BodyBody => Body
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# re-check
names(Data)

## Step 7: creating a second, independent tidy data set with the average of each variable for each activity and each subject
# a - New tidy set 
library(plyr);
tidydataset<-aggregate(. ~subject + activity, Data, mean)
tidydataset<-tidydataset[order(tidydataset$subject,tidydataset$activity),]

# b - Writing ouput in a text file 
write.table(tidydataset, file = "tidydataset.txt",row.name=FALSE)
