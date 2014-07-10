checkdatadir <- function () {
  if(!file.exists("data")){
    dir.create("data")
  }
}

q1_downloadcsv <- function (){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileURL, destfile="./data/ACS_housing.csv")
  ## list.files("data")
  housing <- read.csv("./data/ACS_housing.csv")
  housing[,"VAL"] <- as.numeric(housing[,"VAL"])
  housing[,"TYPE"] <- as.numeric(housing[,"TYPE"])
  bad <- is.na(housing[,"VAL"])
  bad2 <- is.na(housing[,"TYPE"])
  nrow(housing[(!bad) & (!bad2) & (housing$VAL == 24) & (housing$TYPE ==1),])
}

q1_downloadxlsx <- function(){
  library("XLConnect")
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileURL, destfile="./data/NGAP.xlsx")
  ## wb <- loadWorkbook("./data/NGAP.xlsx")
  ## lst = readWorksheet(wb, sheet = 1)  
  lst = readWorksheetFromFile("./data/NGAP.xlsx", sheet = 1, startRow=18, endRow=23, startCol=7, endCol=15)  
}