corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    completeCount <- complete(directory)
    output <- vector(mode="numeric")
    meetThresh <- subset(completeCount,nobs > threshold)
    if (length(meetThresh) > 0) {
        for (i in meetThresh$id) {
            file <- file.path(directory,sprintf("%03i.csv",i))
            data <- read.csv(file,header=T)
            output <- append(output,cor(data["sulfate"],data["nitrate"],
                                        use="complete.obs"))
        }
    }
    output
}