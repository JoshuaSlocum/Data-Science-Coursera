# README

### Introduction
This analysis assumes that you have already obtained the UCI HAR Dataset and are familiar with the information contained in its assocaited **README** file regarding the format of the study and original data. If you do not have it, you can obtain it [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

### Conducting the Analysis
To begin the analysis of the UCI HAR Data, simply run the *run_analysis.R* file. This file assumes that you have a folder named *UCI HAR Dataset* in your wokring directory and have not modified the files or file names contained within. It also depends on having the `reshape2` package installed.

The analysis we are performing is to find the mean value of several variables for each activity by subject. The results are presented in the *TidyData* text file where the values are the means. There are 66 variables (means), and 180 observations (30 subjects with 6 activities each). The total size of the dataset is 180x68. Each row is the means of each of the 66 variables for a (Subject,Activity) pair. More details on how the code works can be found in comments in the *run_analysis.R* file. 

The *run_analysis.R* file will do the following:

1. Combine the train and testing data contained in the *UCI HAR Dataset* folder into one dataset.
  + There are 6 total data sets that must be comibned; 3 from the *test* files and 3 from the *train* files. These files contain the subjects, activity labels, and gyroscpe data.
  + More details can be found in the *UCI HAR Dataset* **README**.
2. Extract the variables for which there are mean and standard deviation measures.
  +   These are variables with **mean()** and **std()** in the name.
  +   More information on variables can be found in the *CodeBook.md* file.
3. Apply descriptive names to the `Activity` variable.
  +   This uses *activity_labels.txt* in the *UCI HAR Dataset* folder.
  +   `Activity` is renamed to `Activity_Label` in the *TidyData*.
4. Apply descriptive variables names.
  +  Since all values in the *TidyData* are means, it would have been redundant to rename each variable, hence they all retain their original names which are descriptive of the acceleromter and gyroscope data they are derived from.
  +  Details on variables names can be found in the *CodeBook.md* file.
5. Calculates the mean of the variables from **Step 2** for each `Activity` by `Subject` and outputs the results to the *TidyData.txt* file in the working directory.
+ This step uses functions from the `reshape2` package.
