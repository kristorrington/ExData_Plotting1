setwd("C:/Users/Kris/Documents/Coursera/Exploratory Data Analysis/Course Project 1")
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(alldata)

library(dplyr)

subset.dates <- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))

#str(subset.dates)

subset.dates$Global_active_power <- as.numeric(subset.dates$Global_active_power)

# str(subset.dates)

datetime <- strptime(paste(subset.dates$Date, subset.dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

### plot 4
par(mfrow = c(2, 2))
plot(datetime,subset.dates$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
plot(datetime, subset.dates$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
plot(datetime,subset.dates$Sub_metering_1, ylab = "Energy sub meeting", xlab = "", type = "l")
lines(datetime, subset.dates$Sub_metering_2, col = "red")
lines(datetime, subset.dates$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, subset.dates$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()