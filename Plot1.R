## step 1 -> download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
eData <- read.csv("household_power_consumption.txt",sep = ";")
## step 2 -> cleans data
dataReq <- subset(eData, eData$Date == "1/2/2007" | eData$Date == "2/2/2007")
dataReq$newDate <- with(dataReq, as.POSIXct(paste(Date, Time, sep = " "), format="%d/%m/%Y %H:%M:%S"))
apwr <- as.numeric(dataReq$Global_active_power)
## creates Plot 1
png("plot1.png")
hist(apwr, freq = TRUE, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()

