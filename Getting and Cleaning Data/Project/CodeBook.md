# Code Book

This information is taken from the *features_info.txt* file in the *UCI HAR Dataset* folder mentioned in the **README**. It does not represent all the information found there, only that which is relevant to the analysis discused in the **README** that is performed by the *run_analysis.R* file.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##### Original Variable List
>* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

While other values were calcualted for the above variables, for our analysis we are concerned only with the `mean()` and `std()` (standard deviation) and so we are only interested in variables with *"-mean()-"* or *"-std()-"* in the name. An example of one is `tBodyAcc-mean()-Z`. The full list is found below. The original values of the variables were normalized to be [-1,1] and so are unitless.

Within the *TinyData.txt* file the following variables names are used.

1. `Subject`
 + This takes values 1-30 and representes the experiment subject (person).
2. `Activity_Label` represents the activity the subject was performing while the data were recorded. It can takes the following values in the *TidyData*:

>1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


+ Please note that in the original data the activities are coded using the numerical values in the above table. The *run_analsyis.R* file recodes those values using the text values in the above table.

The other 66 variables represent the by `Subject` by `Activity_Label` means. These are also the orignal names for these variables. The original names are retained since adding "Mean of" would have been tedious and redundant since all values in the tidy data are means and this is also explained in the **README**. Since the original data was normalized to be [-1,1] the means fall within the same range (and also have no units).

3. "tBodyAcc-mean()-X"
4. "tBodyAcc-mean()-Y"
5. "tBodyAcc-mean()-Z"
6. "tBodyAcc-std()-X"
7. "tBodyAcc-std()-Y"
8. "tBodyAcc-std()-Z"
9. "tGravityAcc-mean()-X"
10. "tGravityAcc-mean()-Y"
11. "tGravityAcc-mean()-Z"
12. "tGravityAcc-std()-X"
13. "tGravityAcc-std()-Y"
14. "tGravityAcc-std()-Z"
15. "tBodyAccJerk-mean()-X"
16. "tBodyAccJerk-mean()-Y"
17. "tBodyAccJerk-mean()-Z"
18. "tBodyAccJerk-std()-X"
19. "tBodyAccJerk-std()-Y"
20. "tBodyAccJerk-std()-Z"
21. "tBodyGyro-mean()-X"
22. "tBodyGyro-mean()-Y"
23. "tBodyGyro-mean()-Z"
24. "tBodyGyro-std()-X"
25. "tBodyGyro-std()-Y"
26. "tBodyGyro-std()-Z"
27. "tBodyGyroJerk-mean()-X"
28. "tBodyGyroJerk-mean()-Y"
29. "tBodyGyroJerk-mean()-Z"
30. "tBodyGyroJerk-std()-X"
31. "tBodyGyroJerk-std()-Y"
32. "tBodyGyroJerk-std()-Z"
33. "tBodyAccMag-mean()"
34. "tBodyAccMag-std()"
35. "tGravityAccMag-mean()"
36. "tGravityAccMag-std()"
37. "tBodyAccJerkMag-mean()"
38. "tBodyAccJerkMag-std()"
39. "tBodyGyroMag-mean()"
40. "tBodyGyroMag-std()"
41. "tBodyGyroJerkMag-mean()"
42. "tBodyGyroJerkMag-std()"
43. "fBodyAcc-mean()-X"
44. "fBodyAcc-mean()-Y"
45. "fBodyAcc-mean()-Z"
46. "fBodyAcc-std()-X"
47. "fBodyAcc-std()-Y"
48. "fBodyAcc-std()-Z"
49. "fBodyAccJerk-mean()-X"
50. "fBodyAccJerk-mean()-Y"
51. "fBodyAccJerk-mean()-Z"
52. "fBodyAccJerk-std()-X"
53. "fBodyAccJerk-std()-Y"
54. "fBodyAccJerk-std()-Z"
55. "fBodyGyro-mean()-X"
56. "fBodyGyro-mean()-Y"
57. "fBodyGyro-mean()-Z"
58. "fBodyGyro-std()-X"
59. "fBodyGyro-std()-Y"
60. "fBodyGyro-std()-Z"
61. "fBodyAccMag-mean()"
62. "fBodyAccMag-std()"
63. "fBodyBodyAccJerkMag-mean()"
64. "fBodyBodyAccJerkMag-std()"
65. "fBodyBodyGyroMag-mean()"
66. "fBodyBodyGyroMag-std()"
67. "fBodyBodyGyroJerkMag-mean()"
68. "fBodyBodyGyroJerkMag-std()"
