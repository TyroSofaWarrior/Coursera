corr <- function(directory, threshold = 0){
  olddir <- getwd()
  setwd(directory)
  names <- dir()
  r <- c()
  for (name in names){
    data <- read.table(file = name, header = TRUE, sep = ",")
    useful <- complete.cases(data) 
    clean <- data[useful, ]
    if(nrow(clean) > threshold){
        r <- c(r, cor(clean[,"sulfate"], clean[,'nitrate']))
    }
  }
  setwd(olddir)
  r
}