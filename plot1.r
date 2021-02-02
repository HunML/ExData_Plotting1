## get the data we need
mydata <- subset(read.table("./household_power_consumption.txt",header=TRUE, stringsAsFactors=FALSE, sep=";"),Date == "1/2/2007" | Date == "2/2/2007")

## convert the data to be plotted
Global_active_power <- as.numeric(mydata$Global_active_power)

## plot historgram, close device
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

