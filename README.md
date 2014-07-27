This file explains  how the R code run_analysis.R  works.
The zip  data  from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip was uncompressed and  
saved in a folder entitled Coursera_project.
    
The code run_analysis.R is saved in the folder Coursera_project
    

In order to run the code use source("run_analysis.R")  in RStudio.


The code generates  two output files which are saved  in the current working directory:
        
merged_data.txt: it contains a data frame called cleaned_Data 
        
results_with_means.txt: it contains a data frame called result.
    

Use data <- read.table("results_with_means.txt") in RStudio to read the file. 


