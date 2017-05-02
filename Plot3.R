## step 1 -> download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
eData <- read.csv("household_power_consumption.txt",sep = ";")
## step 2 -> cleans data
eData <- subset(electricData, electricData$Date == "1/2/2007" | electricData$Date == "2/2/2007")
eData$newDate <- with(eData, as.POSIXct(paste(Date, Time, sep = " "), format="%d/%m/%Y %H:%M:%S"))
pwr <- as.numeric(eData$Global_active_power)
eData$Global_active_power <- as.numeric(as.character(eData$Global_active_power))
eData$newMeter1 <- as.numeric(as.character(eData$Sub_metering_1))
eData$newMeter2 <- as.numeric(as.character(eData$Sub_metering_2))
eData$newMeter3 <- as.numeric(as.character(eData$Sub_metering_3))
## step 3 -> creates Plot 3
png("plot3.png", width = 480, height = 480)
plot(eData$newDate, eData$newMeter1, type = "l", ylim = c(0, max(eData$newMeter1, eData$newMeter3, eData$newMeter2)), xlab = "", ylab = "Energy sub metering")
lines(eData$newDate, eData$newMeter2, type = "l", col = "red")
lines(eData$newDate, eData$newMeter3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
