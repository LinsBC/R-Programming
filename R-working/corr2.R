corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating the 
    ## location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the number
    ## of completely observed observations (on all variables) required to
    ## compute the correlation between nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    ## Create a vector of monitors with complete cases over the threshold
    cormons <- vector("numeric", 0)
    
    ## Loop through all files in directory 
    files <- list.files(directory, full.names=TRUE)
    
    for (i in 1:length(files)) {
        mondata <- read.csv(files[i])
        completedata <- sum(complete.cases(mondata))
        
        ## if this monitor has complete cases greater than threshold...
        if (completedata > threshold) {
            
            #... calculate correlation
            correlation <- cor(mondata[,"sulfate"], mondata[,"nitrate"], 
                               use = "complete")
            
            ## add to cormons vector
            cormons <- c(cormons, correlation)
        }
    }
    cormons
}


