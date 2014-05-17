pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    fileNames <- file.path("specdata",sprintf("%03i.csv",id))
    
    totalCount <- 0
    totalSum <- 0
    for (file in fileNames) {
        data <- read.csv(file,header=T)
        notNA <- !is.na(data[pollutant])
        totalCount <- totalCount + length(which(notNA))
        totalSum <- totalSum + sum(data[pollutant],na.rm=T)
    }
    totalSum/totalCount
}