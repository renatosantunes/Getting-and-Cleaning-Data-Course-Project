The Coursera Getting and Cleaning Data Final Project was working with data
collected from the accelerometers from Samsung Galaxy S smartphone. A full
description is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data eas downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The experiments have been carried out with a group of 30 volunteers (called 
subject) within an age bracked of 19-48 years.

Each person performed six activities (laying, sitting, standing, walking,
walking downstairs, walking upstairs) wearing a Samsung Galaxy II on the waist.

With the embedded accelerometer and gyroscope, 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz was captured. The obtained
was randomly partitioned in two sets (70% training data and 30% test data).

The original dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the
 activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from
 the smartphone accelerometer X axis in standard gravity units 'g'. Every row
 shows a 128 element vector. The same description applies for the
 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal
 obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector
 measured by the gyroscope for each window sample. The units are radians/second. 

Features are normalized and bounded within [-1,1].

Each feature vector is a row on the text file.

On the Coursera project, the training and test data were merged, to form a 
unique dataset. Then, measurements of mean and standard deviation for each
measurement were selected (THE MEASUREMENTS ARE TRIAXIAL ACCELERATION FROM 
THE ACCELEROMETER, ESTIMATED BODY ACCELERATION AND TRIAXIAL ANGULAR VELOCITY 
FROM THE GYROSCOPE, SO ONLY MEAN AND STANDARD DEVIATION FROM THESE VARIABLES 
WERE SELECTED).

All the columns of the dataset were renamed for better understanding.

Activity names were used to rename the activities in the dataset.

A second dataset was created, with the average of each variable for each 
activity and each subject (30 subjects * 6 activities = 180 divisions)
	subject 1 - laying
	subject 1 - sitting
	.
	.
	.
	subject 30 - walking downstairs
	subject 30 - walking upstairs
The mean was calculated using the measuremnts os the Samsung Galaxy II

The required dataset was created ina file called "tidy_data.txt".
The script used is "run_analysis.R"
Details of the transformation can be viewed in "codebook.md"
