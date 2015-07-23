setwd("/Users/saiteja/Documents/Coursera/gettin&cleaning data/course project/UCI HAR Dataset")

#  Read data files

feat <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
library(plyr)
#reading from train folder
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
sub_train <- read.table("train/subject_train.txt")

#reading from test folder

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
sub_test <- read.table("test/subject_test.txt")

# 1. Merging training and test data sets

xdata <- rbind(xtrain,xtest)
ydata <- rbind(ytrain,ytest)
sub_data <- rbind(sub_train,sub_test)
# 2 . Extracts only the measurements on the mean and standard deviation. 
#features with mean and std
mean_std_feat <- grep("-(mean|std)\\(\\)",feat[,2])
# 3. uses descriptive activity names to name the activities in the data set
## Subsetting the data and renaming 
xdata <- xdata[,mean_std_feat]
names(xdata) <- feat[mean_std_feat,2]
# 4. Appropriately labels the data set with descriptive variable names. 
ydata[,1] <- activity[ydata[,1],2]
names(ydata) <- "activity"

names(sub_data) <- "subject"

## 5. creates a second, independent tidy data set with the average of each 
##     variable for each activity and each subject.
all <- cbind(xdata,ydata,sub_data)

avg_data <- ddply(all,.(subject,activity),function(x) colMeans(x[,1:66]))
write.table(avg_data,"avg_data.txt",row.names = FALSE)

