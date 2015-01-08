# exdata-010 Class Project 1
# student: Mark Anderson (coursera.org@ma7.org)
# date: Tue Jan  6 19:10:24 CST 2015
# filename: get_data.R 

# data for 
# Dataset: Electric power consumption [20Mb]

# Description: Measurements of electric power consumption in one household with a 
# one-minute sampling rate over a period of almost 4 years. Different electrical 
# quantities and some sub-metering values are available.

library("lubridate")

fileColClasses <- function(filename) {
  pre  <- read.table(
      filename,
      header=TRUE,
      nrows=1,
      na.strings='?',
      sep=';'
    )
  classes  <- sapply(pre, class)
}

getData <- function() {

  setwd('~/leNkusWoaceN/ExData_Plotting1')

  clean.file = 'power_consumption.txt'

  if (file.exists(clean.file)) {
    power.consumption<-read.table('power_consumption.txt',header=TRUE,sep=';')
    power.consumption$DateTime <- parse_date_time(power.consumption$DateTime, orders="ymd hms")
  }
  else 
  {  
    url <- 
      'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    file <- 'household_power_consumption.zip'
    uncompress.file <- 'household_power_consumption.txt'
    
    # get file is doesn't already exist
    if (!file.exists(uncompress.file)) {
        if (!file.exists(file)) {
            download.file(url,file,method='curl')
            dateDownloaded <- date()
            dateDownloaded
        }
        # unzip .zip file
        unzip(file)
    }
    
    household.power.consumption <- read.table(
      uncompress.file,
      header=TRUE,
      na.strings='?',
      sep=';',
      colClasses=fileColClasses(uncompress.file)
    )
    
    work.power.consumption <- household.power.consumption[
      household.power.consumption$Date=='1/2/2007' | 
      household.power.consumption$Date=='2/2/2007',
    ]
    
    work.power.consumption$DateTime <- parse_date_time(
      x = paste(as.Date(work.power.consumption$Date, format = "%m/%d/%Y"), work.power.consumption$Time),
      orders="ymd hms")
   
    power.consumption <- work.power.consumption[,c(10,3:9)]
    write.table(power.consumption, clean.file, row.name=FALSE, sep=';')
  }
  return(power.consumption)
}
