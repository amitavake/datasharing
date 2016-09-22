==================================================================
Code Book for "Getting and Cleaning Data" - Week 4 Peer-Reviewwd Assignment
==================================================================

1. Background of the Data:
	The following brief description of the background on the data was obtained
  	from the Coursera exercise:
	One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit,
	Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website
	represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where
	the data was obtained:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

	See below for a brief descrption on the experimental study and the data collected from the study. 

2. Aquiring and Cleaning Data as part of the Coursera exercise:
   The raw source data were obtained via the following link:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. The following steps were followed in the attached run_analysis.R script in order to "clean" and assemble the data:
   Please refer to the attached R script (run_analysis.R) for more details.

	Step 1: download the raw data from external source into the R working directory.
	Step 2: Read in the "test" data from files, test/X_test.txt, test/y_test.txt and test/Inertial Signals/subject_test.txt
		and save them as testData, testLabel and testSubject data frames.
	Step 3: Similarly, Prepare the "train" data to obtain trainData, trainLabel and trainSubject data frames.
	Step 4: Join the test and train data via rbind to obtain combinedData data frame. Also, read in the features.txt file
	Step 5: a) Add the column names from the feature data frame to the combinedData data frame.
		b) Search for patterns "*mean*" and "*std*" from the variable names in the combinedData data frame and subset the
		data only for those variables with the matching patterns in the column names.
	Step 6: a) Use descriptive activity names to name the activities in the data set. For example, remove underscore in the 
		varriable names and use camelCase letters in varriable names (e.g., walkingUpstairs).
		b) Replace the numeric values of activity (1 thourgh  6) with the names of the activities (e.g, laying, walking etc.)
	Step 7: Use these activity names in the final data frame finalDataTable. Add the data frmaes together via cbind and sort 
		the observations based on the two ids (subject and activity).
	Step 8. Write the data in a text file and save a local copy in the working dir as finalDataTable.txt 

4. The following steps were followed in order to obtain a "single, independent tody data set:
	Step 9: Install and load the "reshape" package to use the "melt" and "dcast" functions
	Step 10: Use a copy of the finalDataTable obtained in step 6. Melt the data frame based on id's (subject and activity)
	        to obtain a precursor of "tidy data set".
	Step 11: Cast the data to get the mean of each subject and each activity.
	Step 12: Write the tidy data into a text file.	The name of the data frame is 

5. How to read the final processed data (tidy data set):
	The data can be read back to R via the followng command:
	data <- read.table(file_path, header = TRUE) 
    	View(data)
    	
6. Followiing is the complete list of variables in the tidyData. Note that the first 2 variables are id's 
(subject and activity). They are factors. The remaining tidyDataSet data frame variables are computed
mean for each subject and activity combination. The "x", "y" and "z" in the variable names represent
measuements in those directions.

•	subject	
•	activity	
•	tbodyacc-mean-x	
•	tbodyacc-mean-y	
•	tbodyacc-mean-z	
•	tgravityacc-mean-x	
•	tgravityacc-mean-y	
•	tgravityacc-mean-z	
•	tbodyaccjerk-mean-x	
•	tbodyaccjerk-mean-y	
•	tbodyaccjerk-mean-z	
•	tbodygyro-mean-x	
•	tbodygyro-mean-y	
•	tbodygyro-mean-z	
•	tbodygyrojerk-mean-x	
•	tbodygyrojerk-mean-y	
•	tbodygyrojerk-mean-z	
•	tbodyaccmag-mean	
•	tgravityaccmag-mean	
•	tbodyaccjerkmag-mean	
•	tbodygyromag-mean	
•	tbodygyrojerkmag-mean	
•	fbodyacc-mean-x	
•	fbodyacc-mean-y	
•	fbodyacc-mean-z	
•	fbodyacc-meanfreq-x	
•	fbodyacc-meanfreq-y	
•	fbodyacc-meanfreq-z	
•	fbodyaccjerk-mean-x	
•	fbodyaccjerk-mean-y	
•	fbodyaccjerk-mean-z	
•	fbodyaccjerk-meanfreq-x	
•	fbodyaccjerk-meanfreq-y	
•	fbodyaccjerk-meanfreq-z	
•	fbodygyro-mean-x	
•	fbodygyro-mean-y	
•	fbodygyro-mean-z	
•	fbodygyro-meanfreq-x	
•	fbodygyro-meanfreq-y	
•	fbodygyro-meanfreq-z	
•	fbodyaccmag-mean	
•	fbodyaccmag-meanfreq	
•	fbodybodyaccjerkmag-mean	
•	fbodybodyaccjerkmag-meanfreq	
•	fbodybodygyromag-mean	
•	fbodybodygyromag-meanfreq	
•	fbodybodygyrojerkmag-mean	
•	fbodybodygyrojerkmag-meanfreq	
•	angle(tbodyaccmean,gravity)	
•	angle(tbodyaccjerkmean),gravitymean)	
•	angle(tbodygyromean,gravitymean)	
•	angle(tbodygyrojerkmean,gravitymean)	
•	angle(x,gravitymean)	
•	angle(y,gravitymean)	
•	angle(z,gravitymean)	
•	tbodyacc-std-x	
•	tbodyacc-std-y	
•	tbodyacc-std-z	
•	tgravityacc-std-x	
•	tgravityacc-std-y	
•	tgravityacc-std-z	
•	tbodyaccjerk-std-x	
•	tbodyaccjerk-std-y	
•	tbodyaccjerk-std-z	
•	tbodygyro-std-x	
•	tbodygyro-std-y	
•	tbodygyro-std-z	
•	tbodygyrojerk-std-x	
•	tbodygyrojerk-std-y	
•	tbodygyrojerk-std-z	
•	tbodyaccmag-std	
•	tgravityaccmag-std	
•	tbodyaccjerkmag-std	
•	tbodygyromag-std	
•	tbodygyrojerkmag-std	
•	fbodyacc-std-x	
•	fbodyacc-std-y	
•	fbodyacc-std-z	
•	fbodyaccjerk-std-x	
•	fbodyaccjerk-std-y	
•	fbodyaccjerk-std-z	
•	fbodygyro-std-x	
•	fbodygyro-std-y	
•	fbodygyro-std-z	
•	fbodyaccmag-std	
•	fbodybodyaccjerkmag-std	
•	fbodybodygyromag-std	
•	fbodybodygyrojerkmag-std

    
7. The original codebook/metadata doc (by the original author) explains each variable in the dataset and is available below:
   
------------------------------------------------------------------------------------------------------------------------

For convenience, given below is the original README file from the Human Activity Recognition Using Smartphones Dataset
(Version 1.0). See below for the citation:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
