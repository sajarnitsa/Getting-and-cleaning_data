CodeBook

This codebook describes the variables, the data as well as the handling performed on the data  to clean it up. 
    

The data was downloaded from the address: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 

The code run_analysis.R  performs the following   series of steps to clean the data:


Read X_train.txt, y_train.txt and subject_train.txt from the  folder "./train" folder and store the data in the files 
train_Data, train_Label and train_Subject variables respectively.


Read X_test.txt, y_test.txt and subject_test.txt from the  folder "./test" folder and save them in test_Data, test_Label and test_Subject variables respectively.

Join test_Data and  train_Data in total_Data 

joins test_Label and train_Label in total_Label 

joins test_Subject and  train_Subject in total_Subject.

Read the features.txt file from the "/" folder and store the data in a variable called features.  
We only extract the measurements on the mean and standard deviation.
        

We clean the column names. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
        
We Read the activity_labels.txt file from the "./"" folder and store the data in a variable called activity.

We clean the activity names in the second column of activity. We make all names to lower cases.
        
Transform the values of joinLabel according to the activity data frame.
        

We combine total_Subject, total_Label and  total_Data by column to get cleaned_Data. Properly name the first two columns, "subject" and "activity". 


We Write the cleaned_Data out to the file  "merged_data.txt" file in the  working directory.
        

We generate a tidy data set with the average of each measurement for each activity and each subject. 

We Write the result out to "results_with_means.txt" file in the working directory.
