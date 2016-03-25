# Write a function that reads a directory full of files and reports 
# the number of completely observed cases in each data file. The 
# function should return a data frame where the first column is the 
# name of the file and the second column is the number of complete 
# cases. A prototype of this function follows

complete <- function (directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating the
    ## location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers to 
    ## be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the number of
    ## complete cases
    
    ## create an empty data frame to store the counts of complete cases
    mondf <- data.frame(id = NULL, nobs = NULL)
    
    ## Loop through all files in directory 
    files <- list.files(directory, full.names=TRUE)[id]
    
    for (i in 1:length(files)) {
        mondata <- read.csv(files[i])
        
        ## Get the complete cases and count (sum) them into a data frame
        ok <- complete.cases(mondata)
        tempdf <- data.frame(id = id[i], nobs = sum(ok))
        
        ## Append the new data frame to the main one
        mondf <- rbind(mondf, tempdf)
    }
    mondf
}
