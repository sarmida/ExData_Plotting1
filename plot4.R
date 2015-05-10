#  Exploratory Data Analysis Project 1
# Plot 4     4 plots
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
png(filename = "plot4.png", width = 480, height = 480, units = "px")
## Make plot 4 4 plots in a Resource
par(mfcol=c(2,2))
## plot upper left
plot(plotD$DT,plotD$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")
## Make lower left
plot(plotD$DT,plotD$Sub_metering_1,"l",xlab="",ylab="Energy sub metering")
lines(plotD$DT,plotD$Sub_metering_2,"l",col="red")
lines(plotD$DT,plotD$Sub_metering_3,"l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       text.width = strwidth("1,000,000"),
       lty = 1, xjust = 1, yjust = 1,text.col = c("black","red","blue"),,text.font = 1,bty="n")
## Make upper right
plot(plotD$DT,plotD$Voltage,"l",xlab="datetime",ylab="Voltage")
## Make lower right
plot(plotD$DT,plotD$Global_reactive_power,"l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
## Close resource
