setwd("D:\\Documents\\Downloads\\EDA\\Week 1\\Assignment 1")

inputData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses =c("character","character",rep("numeric",7)),na="?")

subData<-inputData[as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-02",]

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(datetime,subData$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
