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

q1_downloadxml <- function(){
  library("XML")
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  download.file(fileURL, destfile="./data/restaurants.xml")
  doc <- xmlTreeParse("./data/restaurants.xml", useInternal=TRUE)

  ## seems like fileURL doesn't work with https so I downloaded it first but
  ## can use http instead of https and it works!!! just discard the "s"
  #   fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  #   fileURL2 <- sub('https', 'http', fileURL)
  #   doc <- xmlTreeParse(fileURL2, useInternal = TRUE)
  
  ## can also use:
  #library(XML)
  #library(RCurl)
  #fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  #xData <- getURL(fileURL)
  #doc <- xmlParse(xData)
  
  #rootNode <- xmlRoot(doc)
  #xmlName(rootNode)
  zips <- xpathSApply(rootNode,"//zipcode",xmlValue)
  a <- zips == "21231"
  length(zips[a])
}

q1_jsonexample <- function() {
  library(jsonlite)
  jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
}

q1_datatable <- function(){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
  DT <- fread(fileURL)
}


