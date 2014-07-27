# Merging  the training and the test sets to create one data set.
setwd('C:/Users/victor/downloads/Coursera_project')
train_Data <- read.table("./train/X_train.txt")
head(train_Data)
tail(train_Data)
train_Label <- read.table("./train/y_train.txt")
train_Subject <- read.table("./train/subject_train.txt")
test_Data <- read.table("./test/X_test.txt")
test_Label <- read.table("./test/y_test.txt")
test_Subject <- read.table("./test/subject_test.txt")
total_Data <- rbind(train_Data, test_Data)
total_Label <- rbind(train_Label, test_Label)

total_Subject <- rbind(train_Subject, test_Subject)


#  We proceeed to  extract  the  mean and standard deviation for each measurement.
features <- read.table("./features.txt")

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

total_Data <- total_Data[, meanStdIndices]

# remove "()"
names(total_Data) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) 
# capitalize M
names(total_Data) <- gsub("mean", "Mean", names(total_Data)) 
# capitalize S
names(total_Data) <- gsub("std", "Std", names(total_Data))
# remove "-" in column names 
names(total_Data) <- gsub("-", "", names(total_Data)) 

# Usage of  descriptive activity names to describe the activities in the data set
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[total_Label[, 1], 2]
total_Label[, 1] <- activityLabel
names(total_Label) <- "activity"

# Labelling  the data set with descriptive activity names.
names(total_Subject) <- "subject"
cleaned_Data <- cbind(total_Subject, total_Label, total_Data)

# writing  out the first dataset

write.table(cleaned_Data, "merged_data.txt") 

# We create a tidy data set with the average of each variable for each activity and each subject.
subjectLen <- length(table(total_Subject)) 
activityLen <- dim(activity)[1] 
columnLen <- dim(cleaned_Data)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleaned_Data)
row <- 1
for(i in 1:subjectLen) {
    for(j in 1:activityLen) {
        result[row, 1] <- sort(unique(total_Subject)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == cleaned_Data$subject
        bool2 <- activity[j, 2] == cleaned_Data$activity
        result[row, 3:columnLen] <- colMeans(cleaned_Data[bool1&bool2, 3:columnLen])
        row <- row + 1
    }
}


# writing out the second dataset
write.table(result, "results_with_means.txt") 

# data <- read.table("./results_with_means.txt")
