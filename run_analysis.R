##################################################################
## Getting and Clening Data 
## Peer-reviewsd Assignment 4 from Coursera
## Author: Amitava G.
## R version: Rx64 3.3.1, Run on Windows 10

## This is a two-part R script. In Part I, a given set of external 
## dataset was downloaed. The raw source data contained in multiple 
## text files are related to an experimental study. These data were 
## processed to obtain one single dataset that contain a large number
## of statistical measures. In Part II, the resultant dataset was
## further processed to obtain a single independent tidy daraset that
## yield the mean values of each variable.

##################################################################
#PART I
##################################################################

### Step 1. Install/load necessary packages, set working directory and 
      ### download the raw data from external source ###

install.package("downloader")
library(downloader)
library(data.table)
library(dplyr)

### Set File path for the working directory ##
setwd("C:/Users/amitava/Desktop/Coursera/01. Data Scientist/03. Getting and Cleaning Data/Week-4/downloadFolder") 

### Upon download, unzip and unlink the temp file to save disk space
sourceFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
targetFile <- "C:/Users/amitava/Desktop/Coursera/01. Data Scientist/03. Getting and Cleaning Data/Week-4/downloadFolder"
temp <- tempfile()
download.file(sourceFile,temp)
unz(temp, "targetFile")
unlink(temp)

### For convenience, setwd at the root folder level where the downloaded files reside
setwd("C:/Users/amitava/Desktop/Coursera/01. Data Scientist/03. Getting and Cleaning Data/Week-4/downloadFolder/UCI HAR Dataset")

### Step 2. Notice there are separate folders for test and train data ##
    ### Pre-process the "test" data.table first.
    ### Read in X_test.txt that contains the statistical data (variable values). Next, 
    ### y_test.txt with the label (values 1:6 that would be mapped to 6 different
    ### activity names, such as laying, walking etc). Finally, read in subject_test.txt 
    ### that has 30 "unique" subjects (1:30).

testData <- read.table("./test/X_test.txt", 
               sep="", 
               fill=FALSE)  ## dim(testData): [1] 2947  561
testLabel <- read.table("./test/y_test.txt")  ##dim(testLabel): [1] 2947    1
testSubject <- read.table("./test/Inertial Signals/subject_test.txt")  ##dim(testSubject): [1] 2947    1


### Step 3. Similarly, Prepare the "train" data ###
trainData <- read.table("./train/X_train.txt", 
                  sep="", 
                  fill=FALSE)  ##dim(trainData): [1] 7352  561
trainLabel <- read.table("./train/y_train.txt")  ##dim(trainLabel): [1] 7352    1
trainSubject <- read.table("./train/subject_train.txt")  ## dim(trainSubject): [1] 7352    1


### Step 4. Join the test and train data ###
combinedData <- rbind(testData, trainData) ## dim(combinedData): [1] 10299   561
features <- read.table("./features.txt", 
                          sep="", 
                          fill=FALSE) ## dim(varFeatures): [1] 561   2

### Step 5. Add the column names ###
names(combinedData) <- features[ , 2]
names(combinedData) <- tolower(names(combinedData))
col_str <- names(combinedData) ## length(col_str) : [1] 561
selectedColumns <- c(grep("*mean*", col_str, value = TRUE), grep("*std*", col_str, value = TRUE))
        
        ## Based on the descriptions of the variables in the feature_info file,
        ## "mean()" does NOT necessarily appear at the end of each variable 
        ## for estimated mean. For example, meanFreq(), gravityMean, tBodyAccMean
        ## tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean are variable
        ## that do NOT have mean() at the end of the variable names. A string search
        ## with *mean* and *std* captures these variables. This makes hte 
        ## count of varivles 86. Otherwise, a count 66 is obtained with the following
        ## string search:
        ## selectedColumns <- grep("mean\\(\\)|std\\(\\)", col_str, value = TRUE)
        ## length(selectedColumns): [1] 66
        ## My preferred grep captures 86 vatiables with NO NO duplicates in 
        ## "selectedColumns". Tahnkfully, based on mentor's note, there is no 
        ## grading criteria based on this! :-)

selectedData <- combinedData[selectedColumns]
names(selectedData) <- gsub("\\()", "", names(selectedData))

### Step 6. Use descriptive activity names to name the activities in the data set ###

activity <- read.table("./activity_labels.txt")
activity[ , 2] <- tolower(gsub("_", "", activity[ , 2]))
substr(activity[2:3, 2], 8, 8) <- toupper(substr(activity[2:3, 2], 8, 8))

combinedSubject <- rbind(testSubject, trainSubject) ## dim(combinedSubject):[1] 10299  1
names(combinedSubject) <- "subject"
        ##  length(unique(combinedSubject$"subject")) : [1] 30
        ## This matched with a total of 30 individual subjects

combinedLabel <- rbind(testLabel, trainLabel)  ## dim(combinedLabel) :  [1] 10299     1
combinedLabel[, 1] <- activity[combinedLabel[, 1], 2]
        #activityLabel <- activity[combinedLabel[, 1], 2]
        #combinedLabel[, 1] <- activityLabel
names(combinedLabel) <- "activity"
        ##  length(unique(combinedLabel$"activity")) : [1] 6
        ## This mathes with the 6 diffrent activity listed in the acctivity_label file

### Step 7. Add the data frmaes together via cbind and sort the observations based
### on the two ids (subject and activity) ###
finalDataTable <- cbind(combinedSubject, combinedLabel, selectedData) ##All required columns added
finalDataTable <- finalDataTable %>%
                  arrange(subject, activity)
                  ## dim(finalDataTable) : [1] 10299    88
                  ## str(finalDataTable) : 'data.frame'

### Step 8. Write the data in a text file and save a local copy in the working dir. 
write.table(finalDataTable,"finalDataTable.txt",sep="\t",row.names=FALSE)
 
##################################################################
#PART II
##################################################################

## In this part, the target data obtained in step 7 above was used
## as the source data. The data were further processed via "melt" 
## and "cast" functions in order to create a second, independent tidy 
## data set with the average of each variable for each activity and 
## each subject

### Step 9. Install the "reshape" package to use the "melt" and "dcast"
### functions

install.package("reshape")
library("reshape")

### Step 10. Use a copy of the finalDataTable obtained in step 6 
### Melt the table to obtain a "tall, sknny table" (precursor of "tidy data")
groupedData <- finalDataTable
groupedDataMolten <- melt(groupedData, id = c("subject", "activity"))
  
## Step 11. Casting the data to get the mean of each subject and each activity
tidyDataSet <- dcast(groupedDataMelt, subject + activity ~ variable, mean)
      ## dim(tidyDataSet) : [1] 180  88
      ## str(tidyDataSet) : data.frame with first 2 columns: subject, activity

### Notice the tidyDataSet table has 2 columns for ID's (subject and activity) and
### the remaining are measure variables (total 88 columns as expected). Also notice
### the expected number of observtions (rows) =  30 (subject) x 6 (activity) = 180.
### The data set has 3 main characteristics of "tidy data": 1. Each row is a
### separate observation; 2. each column is a distinct variable and 3. all the
### data in the table form a single related and coherent data set.

## Step 12. Write the tidy data into a text file
write.table(tidyDataSet,"tidyDataSet.txt",sep="\t",row.names=FALSE)
