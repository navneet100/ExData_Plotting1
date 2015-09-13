setwd("D:\\Documents\\Downloads\\EDA\\Week 1\\Assignment 1")

inputData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses =c("character","character",rep("numeric",7)),na="?")

subData<-inputData[as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(inputData$Date, format="%d/%m/%Y") == "2007-02-02",]

png("plot1.png")
hist(subData$Global_active_power, col = 'red', xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()
