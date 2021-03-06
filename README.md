==============================================================
Script For Creating Tiday Set From  Human Activity Recognition Using Smartphones Dataset
==============================================================
by Sandeep Mehta
==============================================================

This script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a tidy - dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Following files are used for creating tidy data set from original data set.
==========================================================================
- 'features.txt': List of all features.

- 'activity_labels.txt': List of class labels and their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': ID's of subjects in the training data

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': ID's of subjects in the training data

For more information about the "Human Activity Recognition Using Smartphones Dataset Version 1.0" contact: activityrecognition@smartlab.ws

Script Description
==================

- First loads the reshap2 library.
- Reads features information
- Read activity labels assign columns names to activity data
- Read training set data and assign column names to training data
- Read training set labels and assign column names
- Read training subject and assign column names
- Read test set data and assign column names to training data
- Read test set labels and assign column names
- Read training subject and assign column names
- Column bind training and test data
- Merge training and test data
- Get indexes of columns which has mean word in it and extract such column names
- Get indexes of columns which has std word in it and extract such column names
- With the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features and the data is written to the "activity_tidy_data.txt" file.


Description of the "activity_tidy_data.txt" file may be found in the "CodeBook.md" file. 

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
