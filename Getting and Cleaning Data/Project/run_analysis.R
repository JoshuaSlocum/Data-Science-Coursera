# Code requires that the file "run_analysis.R" and the folder "UCI HAR Dataset" are in the working directory. Requires reshape2 package (Step 5).
# Output is tidy data set.

# 1. Merge train and test sets.

#  1.a Load training data and combine into one training data set using cbind.
train.path <- "./UCI HAR Dataset/train"
train.subject <- read.table(paste(train.path,"subject_train.txt",sep="/"),header = FALSE)
train.X <- read.table(paste(train.path,"X_train.txt",sep="/"),header = FALSE)
train.Y <- read.table(paste(train.path,"Y_train.txt",sep="/"),header = FALSE)
train.data <- cbind(train.subject,train.Y,train.X)

#  1.b Load the test data into one test data set using cbind.
test.path <- "./UCI HAR Dataset/test"
test.subject <- read.table(paste(test.path,"subject_test.txt",sep="/"),header = FALSE)
test.X <- read.table(paste(test.path,"X_test.txt",sep="/"),header = FALSE)
test.Y <- read.table(paste(test.path,"Y_test.txt",sep="/"),header = FALSE)
test.data <- cbind(test.subject,test.Y,test.X)

#  1.c Remove the temporary individual data frames the the global environment.
rm(train.subject)
rm(train.X)
rm(train.Y)
rm(test.subject)
rm(test.X)
rm(test.Y)

# 1.d Combine "train.data" and "test.data" into one dataset using rbind and then remove them.
combined.data <- rbind(train.data,test.data)
rm(test.data)
rm(train.data)


# 2. Extract measurements on mean and SD for each measurement.
#   This correspeonds with features including mean() and std() in the name. Refer to the CobeBook and README for more info.

#  2.a Get and Apply feature names to dataset loaded from UCI HAR Dataset files
##  NOTE: This corresponds to step 4. of the assignment directions. I complete here as I use the names in step 3.
feature.names.data <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,col.names=c("VarID","VarName"))
feature.names <- c("Subject","ActID",paste(feature.names.data$VarName))
names(combined.data) <- feature.names

#  2.b Search for features that have mean() and std() in the name in the feature.names vector to get the column indices of features we wish to keep
keep.cols <- sort(c(1,2,grep("mean()",feature.names,fixed=TRUE),grep("std()",feature.names,fixed=TRUE)))

#  2.c Use keep.cols to subset combined.data to the right columns
combined.data <- combined.data[,keep.cols]

# 3. Apply descriptive names to activities.
#    Conveniently, there is a list of activity labels already provided in the activity_labels.txt file.
activity.names.data <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names=c("ActID","Activity_Label"))

temp<-merge(combined.data,activity.names.data,by.x="ActID",by.y="ActID")

combined.data <- temp[order(temp$Subject),] # assign and reorder by subject

combined.data <- combined.data[c(2,69,3:68)] # reorder columns so subject and activity come first
row.names(combined.data) <- NULL  # remove the row numbers as row names that appeard after the assign step
rm(temp)

# 4. Label the data set with descriptive variable names
#  This step is completed above under 2.a

# 5. Output tidy data set with average of each variable for each activity by subject.
# That is, for each subject, we calculate and record the mean of each variable by activity. Thus each subject will have 6 averages for a total of 180 rows and 68 columns. This step requires the reshape2 package.

library(reshape2)
tidy.melt <- melt(combined.data,id=c("Subject","Activity_Label"))
tidy.cast <- dcast(tidy.melt,Subject + Activity_Label ~ variable, mean)

write.table(tidy.cast,file="TidyData.txt",row.names=FALSE)


