complete <- function(directory, id = 1:332){
  olddir <- getwd()
  setwd(directory)
  ids <- c()
  nobs <- c()
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
    nob <- complete.cases(data) 
    clean <- data[nob, ]
    nobs <- c(nobs, nrow(clean))
    ids <- c(ids, i)
  }
  setwd(olddir)
  data.frame(id = ids, nobs = nobs)
}