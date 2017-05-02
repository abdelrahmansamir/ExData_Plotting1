## step 1 -> download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
eData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## step 2 -> cleans data
desiredData <- subset(eData, eData$Date == "1/2/2007" | eData$Date == "2/2/2007")
desiredData$newDate <- with(desiredData, as.POSIXct(paste(Date, Time, sep = " "), format="%d/%m/%Y %H:%M:%S"))
pwr <- as.numeric(desiredData$Global_active_power)
desiredData$Global_active_power <- as.numeric(as.character(desiredData$Global_active_power))
## step 3 ->creates Plot 2
png("plot2.png")
plot(desiredData$newDate, desiredData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
