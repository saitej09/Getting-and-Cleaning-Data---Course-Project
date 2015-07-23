The script  "run_analysis.R"  performs the following 5 steps to get the tidy data output from the raw data.

1. After reading all the data, the test and training data are merged with the command rbind().

2. The data is subset by extracting only the measurements on the mean and standard deviation for each measurement 

3. They are given their correct names from "features.txt".

4. Appropriate labels from the 6 activities listed in "activity_labels.txt" replace the variable names of the data set.

5. A new dataset is generated with the average of  each activity and each subject ie; ( 30 subjects * 6 activities )

The following variables are used in the R script:

xtrain, ytrain, sub_train read the data from the train folder of the data set downloaded. Similarly, xtest, ytest, sub_test read the data from the test folder.

xdata, ydata and sub_data are the merged data.

feat reads the variables from "features.txt" which are the correct names to xdata.

activity stores all the labels from "activity_labels.txt".

all houses the combined data of xdata, ydata and sub_data which is clean data set.

avg_data holds all the averages of the all data set which is written to a text file "avg_data.txt"
