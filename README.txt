This README file describes how to use the accompanying run_analysis.R script
and the raw data files that contain data from an experimental study.

1. Use the run_anaysis.R script to download the raw data files or, alternatively,
   manually download and unzip the files with raw datasets via the following link:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR
   Place the data files in the current working directory where R is running.
2. The list of files in the data set is available below (taken from the original 
   README file for the original published data sets).
3. Run the R script and notice that two output files are generated in the current 
   working directory: finalDataTable.txt and tidyDataSet.txt. These data frames
   can also be read in via the following commands:
	data <- read.table(file_path, header = TRUE) 
    	View(data)
4. The finalDataTable.txt is the output for the first part of the exercise. This data
   is a subset of the original dataset and contains only the variables that have "mean" and
   "std" in their variable names. Accordingly, this data frame has 86 variables and 2 ids
   (subject and activity). This data represents a clean dataset (no duplicate row/columns) 
   that are a product of combining the data with their respective variable names.
5. The second output file (tidyDataSet.txt) contains the final processed data via reshaping
   of the finalDataTable.txt. This data forms a tidy data set.
6. There are 30 subjects (1 - 30) with each having 6 activities (laying, walking etc).
   Therefore, there are 180 observations.

Here is a brief description of the data files.

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

