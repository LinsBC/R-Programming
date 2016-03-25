# Week 2 - Programming Assignment
#
# Remove this later:
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 
# 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory' 
# argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id=1:332){
# 'directory is a character vector of length 1 indicating the
# location of the CSV files

# 'pollutant is a character vector of length 1 indicating the name of
# the pollutant for which we will calculate the mean; either 
# "sulfate" or "nitrate"

# 'id' is an integer vector indicating the monitor ID numbers to be used

# Return the mean of the pollutant across all monitors listed in the 
# 'id' vector (ignoring NA values)
# NOTE: DO NOT ROUND the result!

    # get current working directory and save
    #old.wd <- getwd()
    # set working directory to directory
    #setwd(directory)
    
    # create vector for storing means
    monmean <- vector("numeric", length=length(id))
    
    # calculate mean for each monitor
    for (i in seq_along(id)){
        
        # get correct format for filename;
        # if current id < 100 then fill with 0s
        if (i < 10){
            fid <- "00"
        } else if (i >= 10 & i < 100) {
            fid <- "0"
        } else 
            fid <- "" 
        
        # open and read the monitor file
        monfile <- paste(directory, "/", fid, i, ".csv", sep="")
        mondata <- read.csv(monfile)
        #mondata <- read.csv(paste(id[i], ".csv", sep=""))
        
        # mean the column matching pollutant; ignore NAs
        monmean[i] <- mean(mondata[, pollutant], na.rm = TRUE)
    }
    # mean the monitor means and output
    result <- mean(monmean)
    result
}