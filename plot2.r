## get the data we need
mydata <- subset(read.table("./household_power_consumption.txt",header=TRUE, stringsAsFactors=FALSE, sep=";"),Date == "1/2/2007" | Date == "2/2/2007")

## convert the data to be plotted
Global_active_power <- as.numeric(mydata$Global_active_power)
Date_Time <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## plot historgram, close device
png("plot2.png", width=480, height=480)
plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
