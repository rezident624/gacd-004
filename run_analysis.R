## Cleaning data is very useful. This file contains 2 functions that allow us 
## to get the tidy data from UCI HAR Dataset.

## This function creates the tidy data that contains only the measurements on 
## the mean and standard deviation for each measurement. 
createTidyData <- function(directory) 
{
    labelsX <- read.table(paste(c(directory,'/features.txt'), collapse=''), 
                          stringsAsFactors = FALSE)
    labelsY <- read.table(paste(c(directory,'/activity_labels.txt'), 
                                collapse=''), stringsAsFactors = FALSE)
    trainX <- read.table(paste(c(directory,'/train/X_train.txt'), collapse=''))
    trainY <- read.table(paste(c(directory,'/train/y_train.txt'), collapse=''))
    trainSubject <- read.table(paste(c(directory,'/train/subject_train.txt'), 
                                     collapse=''))
    testX <- read.table(paste(c(directory,'/test/X_test.txt'), collapse=''))
    testY <- read.table(paste(c(directory,'/test/y_test.txt'), collapse=''))
    testSubject <- read.table(paste(c(directory,'/test/subject_test.txt'), 
                                    collapse=''))
    X <- rbind(trainX, testX)
    Y <- rbind(trainY, testY)
    Subject <- rbind(trainSubject, testSubject)
    names(Subject) <- 'Subject'
    names(X) <- labelsX$V2
    Y$V1 <- as.factor(labelsY$V2[Y$V1])
    names(Y) <- 'Activity'
    X <- X[,grep('\\-(mean\\(\\)|std\\(\\))', names(X))]
    data <- cbind(Y, Subject, X)
    data
}

## This function creates the tidy data set with the average of each variable 
## for each activity and each subject. 
createAverageTidyData <- function(directory)
{
    labelsX <- read.table(paste(c(directory,'/features.txt'), collapse=''), 
                          stringsAsFactors = FALSE)
    labelsY <- read.table(paste(c(directory,'/activity_labels.txt'), 
                                collapse=''), stringsAsFactors = FALSE)
    trainX <- read.table(paste(c(directory,'/train/X_train.txt'), collapse=''))
    trainY <- read.table(paste(c(directory,'/train/y_train.txt'), collapse=''))
    trainSubject <- read.table(paste(c(directory,'/train/subject_train.txt'), 
                                     collapse=''))
    testX <- read.table(paste(c(directory,'/test/X_test.txt'), collapse=''))
    testY <- read.table(paste(c(directory,'/test/y_test.txt'), collapse=''))
    testSubject <- read.table(paste(c(directory,'/test/subject_test.txt'), 
                                    collapse=''))
    X <- rbind(trainX, testX)
    Y <- rbind(trainY, testY)
    Subject <- rbind(trainSubject, testSubject)
    names(Subject) <- 'Subject'
    names(X) <- labelsX$V2
    Y$V1 <- as.factor(labelsY$V2[Y$V1])
    names(Y) <- 'Activity'
    data <- cbind(Y, Subject, X)
    aggregate(data[,3:ncol(data)], by=data[c("Activity","Subject")], FUN=mean)
}