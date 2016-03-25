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

pollutantmean <- function(directory, pollutant, id=1:332) {
# 'directory is a character vector of length 1 indicating the
# location of the CSV files

# 'pollutant is a character vector of length 1 indicating the name of
# the pollutant for which we will calculate the mean; either 
# "sulfate" or "nitrate"

# 'id' is an integer vector indicating the monitor ID numbers to be used

# Return the mean of the pollutant across all monitors listed in the 
# 'id' vector (ignoring NA values)
# NOTE: DO NOT ROUND the result!
    
    # create vector to store aggregated pollutant data
    monpolls <- c()
  
    # extract pollutant data and append to monpolls
    for (i in seq_along(id)) {
        
        # get correct format for filename
        if (id[i] < 10){
            fid <- "00"
        } else if (id[i] >= 10 & id[i] < 100) {
            fid <- "0"
        } else 
            fid <- "" 
        
        # open and read the monitor file
        monfile <- paste(directory, "/", fid, id[i], ".csv", sep="")
        mondata <- read.csv(monfile)
        
        # add pollutant data to monpolls vector
        monpolls <- c(monpolls, mondata[,pollutant])
    }
    # return mean of vector containing pollutant data for all monitors requested,
    # ignoring missing values
    mean(monpolls, na.rm = TRUE)
}