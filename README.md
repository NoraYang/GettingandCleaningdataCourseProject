1.Data source, the related data files and structure: 

The data source is Human Activity Recognition Using Smartphones Dataset (Version 1.0.). The related data files are
activity_labels.txt;
features.txt;
features_info.txt;
README.txt;
test/subject_test.txt;
test/y_test.txt;
test/X_test.txt;
train/subject_train.txt;
train/y_train.txt;
train/X_train.txt;

The raw data are the records from X_test.txt and X_train.txt with y_test.txt and y_train.txt for activity labels, subject_test.txt and subject_train.txt as subject column for each record. features.txt is for the column names for records from train/test data sets. 

2.Instructions on the explanation and usage of each data files:  

- activity_labels.txt is six activity name describing each activity ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING" and "LAYING"). It is needed to link the class labels(1,2,3,4,5,6) with activity name
- features.txt is used for applying column names in the test/train records.
- features_info.txt is used to understand each variable (column) in order to locate which measurements to extract from raw data and how we can apply descriptive column names to variables.
- train/X_train.txt: training set.
- train/y_train.txt:training labels. It contains the activity labels for each train record. It is needed to match the activity labels with activity name.
- test/X_text.txt:test set.
- test/y_test.txt: test labels.It contains the activity labels for each test record. It is needed to merge the activity labels with activity name.
- subject_test.txt: for each test record, the subject who performed the task. It will be added to test records.
- subject_train.txt: for each train record, the subject who performed the task. It will be added to train records.

3.The purpose of the script and the tasks performed by the script

The run_analysis script will summarize the average of each mean and standard deviation measurements for each activity and each subject.

The steps are as follows: 
Merge the training and test sets to create one data set. Then only the mean and standard deviation for each measurement are extracted. Use descriptive activity names to name the activities in the data set. Apply descriptive variable names to the data set. At last create a tidy data set based on the previous data set with the average of each variable for each activity for each subject.

4.Result of the script: 

The result of the tidy data set contains 180 observations of 68 variables. 180 observations are from 30 subjects with 6 activities each. And the 68 variables are the 
average of the selected mean and standard deviation measurements.