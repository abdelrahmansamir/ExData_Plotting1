## step 1 -> download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
ptable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

## subset out the two days we are looking for
pdata <-  subset(ptable, Date == "1/2/2007" | Date == "2/2/2007")

##open .png file
png("plot1.png", width = 480, height = 480)

## draw red histogram of global active power with an x label
hist(pdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

##close png file
dev.off()
