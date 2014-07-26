1.Data source, the related data files and structure
The data source is from Human Activity Recognition Using Smartphones Dataset(Version 1.0.). 
The related data files are activity_labels.txt
features.txt
features_info.txt
README.txt
test/subject_test.txt
test/y_test.txt
test/X_test.txt
train/subject_train.txt
train/y_train.txt
train/X_train.txt

The raw data are the records from X_test.txt and X_train.txt with y_test.txt and y_train.txt for 
activity labels, subject_test.txt and subject_train.txt as subject column for each record. 
features.txt is for the column names for records from train/test data sets. 

2.Instructions on the explanation and usage of each data files 

activity_labels.txt is six activity name describing each activity 
("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING" and 
"LAYING"). It is needed to link the class labels(1,2,3,4,5,6) with activity name;
features.txt is used for applying column names in the test/train records.
features_info.txt is used to understand each variable (column) in order to locate which 
measurements to extract from raw data and how we can apply descriptive column names to 
variables.
train/X_train.txt: training set.
train/y_train.txt:training labels. It contains the activity labels for each train record. It is needed to 
match the activity labels with activity name.
test/X_text.txt:test set.
test/y_test.txt: test labels.It contains the activity labels for each test record. It is needed to merge 
the activity labels with activity name.
subject_test.txt: for each test record, the subject who performed the task. It will be added to test 
records.
subject_train.txt: for each train record, the subject who performed the task. It will be added to 
train records.

3.The purpose of the script and the tasks performed by the script
The run_analysis script will summarize the average of each mean and standard deviation 
measurements for each activity and each subject.

The steps are as follows: 

(1) Merge the training and test sets to create one data set. 
    -Set the working directory of the local of the downloaded unzipped "UCI HAR Dataset" and to 
the test folder
    -Read in the test data from X_test.txt to test, test labels from y_test.txt to testlabels, test 
subjects from subject_test.txt to subjecttest
    - Read in the train data from X_train.txt to train, train labels from y_train.txt to trainlabels, train 
subjects from subject_train.txt to subjecttrain
    - Combine test and train datasets, test and train subjects, test and train labels with rbind 
function into combinesets, combinesubject and combinelabels
    - Apply subjectnum to the combinesubject's column name

(2) Only the mean and standard deviation for each measurement are extracted.
    - Move the working directory up one level
    - Read in column names from features.txt to columnnames
    - Lowercase and uniform the column names and store them in unicolumnnames 
    - Use grep functino to extract column names which contain "mean()" and "std" from 
unicolumnnames and store the desired variables to exactcolumn
    - Select the desired columns from the combinesets to extractdataset
 
(3) Use descriptive activity names to name the activities in the data set. 
    - Read in the activity name from activity_labels.txt to activityname
    - Add a new column to the combinelabels dataset to match the activity name with activity labels 
from activityname dataset
    -  Apply activitynum and activityname to the column names of combinelabels

(4) Apply descriptive variable names to the data set. 
     - Use sub function to replace"acc" with "accelerometer", "gyro" with "gyroscope", "^t" with 
"timedomain", "^f" with "frequencydomain", "mag" with "magnitude" in columna names  of 
extractdataset
     - Use gsub function to replace "-" with "" and "\\()" with "" in extractdataset
     - Use cbind to combine combinesubject, combinelabels and extractdataset to completedataset 
so that the completedataset contains subjectnum, activitynum, activityname and 66 
measurements columns
 
(5) Create a tidy data set based on the previous data set with the average of each variable for 
each activity for each subject. 
     - Create the same dataset as the completedataset to seconddata
     - Install "reshape" package and use the melt function to reshape the seconddata melting the 
66 measures and only left subjectnum, activityname and activitynum as id variables
     - Install "reshape2" package and use dcast function to  average each measurement variable 
for each activity for each subject 
     - Store the dcasted result to the tidydata dataset and write it out to file. 

4.Result of the script: 
The result of the tidy data set contains 180 observations of 68 variables. 180 observations are 
from 30 subjects with 6 activities each. And the 68 variables are the average of the selected 
mean and standard deviation measurements.