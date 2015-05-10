#  Exploratory Data Analysis Project 1
# Plot 1     Histogram
# by Santiago Armida: May 10, 2015
library(plyr)
#if(!file.exists("data")) {
#  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#  temp <- tempfile()
#  download.file(fileUrl,temp)
#  unzip(temp)
#}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method ="curl")
unzip("./data/household_power_consumption.zip")
#if(!file.exists("data")) {
#  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#  temp <- tempfile()
#  download.file(fileUrl,temp)
#  unzip(temp)
#  unlink(temp)   
#}
## read data
alldata <- read.table("./data/household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?")
plotdata <- filter(alldata,Date == "1/2/2007")
plotdata <- rbind(plotdata,filter(alldata,Date == "2/2/2007"))

png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(plotdata$Global_active_power,main= "Global Active Power", col="red",xlab = "Global Active Power (kilowatts)")
dev.off()
