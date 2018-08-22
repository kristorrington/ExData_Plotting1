setwd("C:/Users/Kris/Documents/Coursera/Exploratory Data Analysis/Course Project 1")
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(alldata)

library(dplyr)

subset.dates <- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))

#str(subset.dates)

subset.dates$Global_active_power <- as.numeric(subset.dates$Global_active_power)

# str(subset.dates)

### plot 1

hist(subset.dates$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()