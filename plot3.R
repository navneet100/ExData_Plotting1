setwd("D:\\Documents\\Downloads\\EDA\\Week 1\\Assignment 1")

inputData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses =c("character","character",rep("numeric",7)),na="?")

subData<-inputData[as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-02",]

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png")
plot(datetime,subMeter1, type = "l", xlab="", ylab="Energy sub metering")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
dev.off()
