
Link to the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data received for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Summary of experiment:
We have the results of experiments run on 30 subjects. Each of them has performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with a smartphone.
The data from the accelerometer and gyroscope of the smartphone gives a 3-axial linear acceleration and a 3-axial angular velocity, taken at a constant rate of 50Hz. They are processed by windows of time (as described in README.txt).
From the signals extracted and for each windows of time, 561 variables were calculated (see features.txt for info) and the results of those variables have been provided in X_test and X_training. There are 2 datasets because the subjects have been split into a test and a training dataset.

Objective1:
Merge the test and training datasets, add the activity and the subject and select only the variables of the type mean and standard deviation.
This goes from Step1 to Step3 in the script run_analysis.R

Objective2:
From this clean dataset, prepare a second one grouping by subject and activity and displaying only the mean of all the windows for each combination of subject/activity
This refers to Step4 in the script run_analysis.R

File used:
- features.txt: names of the 561 variables deducted from the signals
- activity_labels.txt: activity id and corresponding name
- X_test.txt: the source file which has the values of the 561 variables for all observations corresponding to the test dataset
- y_test.txt: the activity id for all the observations (windows of time) corresponding to the test dataset
- subject_test.txt: the subject for all the observations (windows of time) corresponding to the test dataset
- X_train.txt: the source file which has the values of the 561 variables for all observations corresponding to the train dataset
- y_train.txt: the activity id for all the observations (windows of time) corresponding to the train dataset
- subject_train.txt: the subject for all the observations (windows of time) corresponding to the train dataset

Variables selected:
- activity_name (text): the name of the activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- subject_id (integer): who performed the activity among the 30 subjects
- partition_name (text): the name of the original dataset to which it belongs (train vs. test)
- Out of the 561 variables, we select only the one related to mean and standard deviation. For a more detailed description of the variable, please refer to the original document (features_info.txt)
