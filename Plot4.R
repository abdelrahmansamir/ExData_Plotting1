##  download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
ptable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

## subset out the two days we are looking for
ptabledata <-  subset(ptable, Date == "1/2/2007" | Date == "2/2/2007")

##open .png file
png("plot4.png", width = 480, height = 480)

##concat Date and Time into DateTime
ptabledata$DateTime <- strptime(paste(ptabledata$Date,ptabledata$Time),"%d/%m/%Y %H:%M:%S")

##set up 2x2 layout
par(mfrow = c(2,2))

##draw Plot1
plot(ptabledata$DateTime,
     ptabledata$Global_active_power, 
     type = "l",
     ylab = "Global Active Power",
     xlab = NA)


##draw Plot2
plot(ptabledata$DateTime,
     ptabledata$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

## draw Plot3
plot(ptabledata$DateTime,
     ptabledata$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering",
     xlab = NA)
lines(ptabledata$DateTime,
      ptabledata$Sub_metering_2, 
      type = "l",
      col = "red")
lines(ptabledata$DateTime,
      ptabledata$Sub_metering_3, 
      type = "l",
      col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), 
       col = c("black", "red", "blue"),
       bty = "n")

##draw Plot4
plot(ptabledata$DateTime,
     ptabledata$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     lwd = .5)

##close png file
dev.off()
