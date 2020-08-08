pollutantmean <- function(directory, pollutant, id = 1:332){
    olddir <- getwd()
    setwd(directory)
    r <- c()
    for (i in id){
        number <- if (i < 10) {
          c(0, 0, i)
        } else if (i < 100) {
          c (0, i)
        } else {
          i
        }
        name <- paste(c(as.character(number), '.csv'), collapse = "")
        data <- read.table(file = name, header = TRUE, sep = ",")
        usedcollumn <- data[,pollutant]
        r <- c(r, usedcollumn)
    }
    setwd(olddir)
    mean(r, na.rm = TRUE)
}