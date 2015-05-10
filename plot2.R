#  Exploratory Data Analysis Project 1
# Plot 2     line Global Active Power by Date
# by Santiago Armida: May 10, 2015
library(plyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method ="curl")
unzip("./data/household_power_consumption.zip")
#if(!file.exists("data")) {
#  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#  temp <- tempfile()
#  download.file(fileUrl,temp)
#  unzip(temp)
#}
## read data
alldata <- read.table("./data/household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?")
## filter data 1 and 2 february 2007
plotdata <- filter(alldata,Date == "1/2/2007")
plotdata <- rbind(plotdata,filter(alldata,Date == "2/2/2007"))
## convert Date and Time into a Date type variable
DT <- strptime(paste(plotdata$Date, plotdata$Time), format="%d/%m/%Y %H:%M:%S")
plD <- select(plotdata,3:9)
## Join the date with the data
plotD <-cbind(DT,plD)
## define resource PNG
png(filename = "Plot2.png", width = 480, height = 480, units = "px")
## Make plot line type, no x label
plot(plotD$DT,plotD$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
## Close resource
