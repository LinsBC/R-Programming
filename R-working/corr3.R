corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating the 
    ## location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the number
    ## of completely observed observations (on all variables) required to
    ## compute the correlation between nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    ## Call complete (prog asgmt 2) to count complete cases for each monitor
    completedata <- complete(directory)
    
    ## Count number of rows in completedata (i.e. how many files in directory)
    totalmons <- nrow(completedata)
    
    ## Create a vector of monitors with complete cases over the threshold
    cormons <- vector("numeric", 0)
    
    ## Loop through all files in directory 
    for (i in 1:totalmons) {
       
        ## if this monitor has complete cases greater than threshold...
        if (completedata[i,2] > threshold) {
            
            fid <- ""
            ## get file name for this monitor, open and read file
            if (i < 10){
                fid <- "00"
            } else if (i <= 99) {
                fid <- "0"
            } else
                fid <-""
            
            monfile <- paste(directory, "/", fid, i, ".csv", sep="")
            mondata <- read.csv(monfile)
            
            ok <-complete.cases(mondata)
            
            ## ...calculate correlation between sulfate and nitrate
            ## for this monitor
            # correlation <- cor(mondata[ok,"sulfate"], mondata[ok,"nitrate"])
            correlation <- cor(mondata[,"sulfate"], mondata[,"nitrate"], use = "complete")
            
            ## add to cormons vector
            cormons <- c(cormons, correlation)
        }
    }
    cormons
}


