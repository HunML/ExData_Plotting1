## get the data we need
mydata <- subset(read.table("./household_power_consumption.txt",header=TRUE, stringsAsFactors=FALSE, sep=";"),Date == "1/2/2007" | Date == "2/2/2007")

## convert the data to be plotted
Global_active_power <- as.numeric(mydata$Global_active_power)
Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
Voltage <- as.numeric(mydata$Voltage)
Date_Time <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

## plot historgrams, close device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(Date_Time, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Date_Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(Date_Time, Sub_metering_2, type="l", col="red")
lines(Date_Time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.2, col=c("black", "red", "blue"), bty="n")
plot(Date_Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
