############################################################################################################
# Runs a series of steps on the Human Activity Recogniton Using Smartphones Dataset
# The analysis performs the series of actions listed in the function to:
# 1. Merge the training and the test sets
# 2. Extracts on the measurements on the mean and standard deviation for each measurement
#   -> measurements on the mean and standard deviation are indicated in the features
# 3. Use descriptive activity names to name the activites in the data set
#   -> this is accomplished by merging the activity labels with the activities
# 4. Appropriately labeling the data set with descripting variable names
#   -> This is accomplished by updating the names on the data set as indicated by the features info
# 5. Creating a separate tidy data set with the average of each variable for each activity and each subject

# Assumes the files are imported as follows:
# rawTrain = X_train
# rawTest = X_test
# rawTrainLabels = y_train (labels of test & train are the same)
# activity_labels = activity_labels (activity labels are the same for both test)
# features = features (features are the same for each set)
# rawTestSubjects = subject_test
# rawTrainSubkects = subject_train
#############################################################################################################
run_analysis <- function() {
  # load libraries
  library(dplyr)
  library(data.table)

  # Apply feature names to data sets
  names(rawTrain) <- features$V2
  names(rawTest) <- features$V2
  
  # Update the labels in the training labels with the appropriate activity names
  for (i in rawTrainLabels) {
    rawTrainLabels$V1 <- activity_labels[rawTrainLabels$V1,]$V2
  }
  # Update the labels in the test labels with the appropriate activity names
  for (i in rawTestLabels) {
    rawTestLabels$V1 <- activity_labels[rawTestLabels$V1,]$V2
  }
  
  # rename subjects and activity columns
  names(rawTrainSubjects) <- "subjects"
  names(rawTestSubjects) <- "subjects"
  names(rawTrainLabels) <- "activity"
  names(rawTestLabels) <- "activity"
  # conbine the training set data, training activites and training subjects
  comTrain <- cbind(rawTrain,rawTrainLabels, rawTrainSubjects)
  # conbine the test set data, test activites and test subjects
  comTest <- cbind(rawTest,rawTestLabels, rawTestSubjects)
  
  # Merge the two data sets (train and test)
  modData <- rbind(comTrain,comTest)
  
  # obtain the mean (identified by '-mean()') and standard deviation (identified by '-std()') measurements, activity and subjects data
  modData2 <- modData[,c(grep("*-mean\\()*|*-std\\()*",names(modData), value = TRUE), "activity", "subjects") ]
  
  # Update variable names to a simpler yet more meaningful values:
  # f -> fft
  # t -> time
  # change to lower case
  # remove '()'  and '-' characters
  names(modData2) <- sub("^[f]","fft", names(modData2))
  names(modData2) <- sub("^[t]","time", names(modData2))
  names(modData2) <- tolower(names(modData2))
  names(modData2) <- sub("\\()", "", names(modData2))
  names(modData2) <- gsub("-", "", names(modData2))
  
  # group by the subjects then activity and run mean on each result
  result <-group_by(modData2, subjects, activity) %>% summarise_each(funs(mean))
  # return results
  result
}