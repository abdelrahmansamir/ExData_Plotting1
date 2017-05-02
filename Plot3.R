## download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
power<-read.table(file="./household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
power<-power[power$Date %in% start:end, ]
power$datetime<-paste(power$Date,power$Time)
power$datetime<-as.POSIXlt(power$datetime,format="%Y-%m-%d %H:%M:%S")

## Plot the graph, add lines for additional variables, create legend
png("plot3.png",width=480,height=480)
with(power, plot(datetime, Sub_metering_1, type="l", col="black",
    xlab="", ylab="Energy sub metering"))
with(power, lines(datetime,Sub_metering_2, col="orange"))
with(power, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col=c("black","orange","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
