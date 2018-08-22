setwd("C:/Users/Kris/Documents/Coursera/Exploratory Data Analysis/Course Project 1")
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(alldata)

library(dplyr)

subset.dates <- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))

#str(subset.dates)

subset.dates$Global_active_power <- as.numeric(subset.dates$Global_active_power)

# str(subset.dates)

datetime <- strptime(paste(subset.dates$Date, subset.dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

### plot 2


plot(datetime,subset.dates$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()