#plot3
if (!file.exists("./household_power_consumption.txt")){
    unzip("./exdata-data-household_power_consumption.zip")
}
electdata<-read.table("./household_power_consumption.txt", header = T, sep = ";", colClasses=c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
electdata$Date<-strptime(electdata$Date, format="%d/%m/%Y")
subset<-electdata[electdata$Date<"2007-02-03"&electdata$Date>"2007-01-31",]
subset$datetime<-as.POSIXct(paste(subset$Date, subset$Time))

#Make the plot:
png(file="plot3.png", width=480, height=480)
plot(subset$datetime, subset$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(subset$datetime, subset$Sub_metering_1, col="black")
lines(subset$datetime, subset$Sub_metering_2, col="red")
lines(subset$datetime, subset$Sub_metering_3, col="blue")
legend("topright", lwd=c(1,1,1), col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()