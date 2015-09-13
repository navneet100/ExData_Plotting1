setwd("D:\\Documents\\Downloads\\EDA\\Week 1\\Assignment 1")

inputData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses =c("character","character",rep("numeric",7)),na="?")

subData<-inputData[as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-02",]

colnames(subData)

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

par(mfrow=c(2,2))
#png("plot4.png")
plot(datetime,subData$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
plot(datetime,subData$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(datetime,subMeter1, type = "l", xlab="", ylab="Energy sub metering")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")


plot(datetime,subData$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, "plot4.png")
dev.off()
