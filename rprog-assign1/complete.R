complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    fileNames <- file.path("specdata",sprintf("%03i.csv",id))

    output <- data.frame(id=id,nobs=0)
    for (i in id) {
        file <- file.path("specdata",sprintf("%03i.csv",i))
        data <- read.csv(file,header=T)
        good <- complete.cases(data)
        numComplete <- sum(good)
        output[which(output$id==i),"nobs"] <- numComplete
    }
    output
}