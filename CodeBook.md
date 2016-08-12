## Purpose:
The run_analysis script runs a series of steps on the Human Activity Recogniton Using Smartphones Dataset. The raw data are located on the following site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Steps:
 The analysis performs the series of actions listed in the function to:
 1. Merge the training and the test sets
 2. Extracts on the measurements on the mean and standard deviation for each measurement
   -> measurements on the mean and standard deviation are indicated in the features
 3. Use descriptive activity names to name the activites in the data set
   -> this is accomplished by merging the activity labels with the activities
 4. Appropriately labeling the data set with descripting variable names
   -> This is accomplished by updating the names on the data set as indicated by the features info
 5. Creating a separate tidy data set with the average of each variable for each activity and each subject

 Further details on the transformation are embedded in the script.
  
 Assumes the files are imported as follows:
 rawTrain = X_train (i.e. training set data)
 rawTest = X_test (i.e. test set data)
 rawTrainLabels = y_train (i.e. labels for data set; labels of test & train are the same)
 activity_labels = activity_labels (i.e. activity labels for data set; activity labels are the same for both test)
 features = features (i.e. variable - feature - names for data set; features are the same for each set)
 rawTestSubjects = subject_test (i.e. subjects for test set)
 rawTrainSubjects = subject_train (i.e. subjects for training set)
 
Note: a separate script could be created to load the data.
 
### Results:
 The script results in the following variables with the associated mean values for the subject / activities perfomed by the subjects:
 
 [1] "subjects"                   "activity"                   "timebodyaccmeanx"           "timebodyaccmeany"          
 [5] "timebodyaccmeanz"           "timebodyaccstdx"            "timebodyaccstdy"            "timebodyaccstdz"           
 [9] "timegravityaccmeanx"        "timegravityaccmeany"        "timegravityaccmeanz"        "timegravityaccstdx"        
[13] "timegravityaccstdy"         "timegravityaccstdz"         "timebodyaccjerkmeanx"       "timebodyaccjerkmeany"      
[17] "timebodyaccjerkmeanz"       "timebodyaccjerkstdx"        "timebodyaccjerkstdy"        "timebodyaccjerkstdz"       
[21] "timebodygyromeanx"          "timebodygyromeany"          "timebodygyromeanz"          "timebodygyrostdx"          
[25] "timebodygyrostdy"           "timebodygyrostdz"           "timebodygyrojerkmeanx"      "timebodygyrojerkmeany"     
[29] "timebodygyrojerkmeanz"      "timebodygyrojerkstdx"       "timebodygyrojerkstdy"       "timebodygyrojerkstdz"      
[33] "timebodyaccmagmean"         "timebodyaccmagstd"          "timegravityaccmagmean"      "timegravityaccmagstd"      
[37] "timebodyaccjerkmagmean"     "timebodyaccjerkmagstd"      "timebodygyromagmean"        "timebodygyromagstd"        
[41] "timebodygyrojerkmagmean"    "timebodygyrojerkmagstd"     "fftbodyaccmeanx"            "fftbodyaccmeany"           
[45] "fftbodyaccmeanz"            "fftbodyaccstdx"             "fftbodyaccstdy"             "fftbodyaccstdz"            
[49] "fftbodyaccjerkmeanx"        "fftbodyaccjerkmeany"        "fftbodyaccjerkmeanz"        "fftbodyaccjerkstdx"        
[53] "fftbodyaccjerkstdy"         "fftbodyaccjerkstdz"         "fftbodygyromeanx"           "fftbodygyromeany"          
[57] "fftbodygyromeanz"           "fftbodygyrostdx"            "fftbodygyrostdy"            "fftbodygyrostdz"           
[61] "fftbodyaccmagmean"          "fftbodyaccmagstd"           "fftbodybodyaccjerkmagmean"  "fftbodybodyaccjerkmagstd"  
[65] "fftbodybodygyromagmean"     "fftbodybodygyromagstd"      "fftbodybodygyrojerkmagmean" "fftbodybodygyrojerkmagstd" 
 
subjects - the subject who performed the activity. A total of 30 subjects participated
activity - the activity performed while gathering the data. This could be of serveral values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING
The remaining values of the following format:
* [time]: time domain signals that were captured at a constant rate of 50 Hz
* [fft]: Fast Fourier Transform (FFT) applied to the signals. fft indicates frequency domain signals
* [body]: body acceleration value
* [gyro]: velocity from gyroscope
* [acc]: accelerometer value 
* [jerk]: jerk motion value
* [mag]: magnitude value
* [xyz]: the 3-acial signals in the X, Y and Z directions
* [mean]: mean values of the signals
* [std]: standard deviation of the signals