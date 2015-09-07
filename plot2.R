#plot2
if (!file.exists("./household_power_consumption.txt")){
    unzip("./exdata-data-household_power_consumption.zip")
}
electdata<-read.table("./household_power_consumption.txt", header = T, sep = ";", colClasses=c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
electdata$Date<-strptime(electdata$Date, format="%d/%m/%Y")
subset<-electdata[electdata$Date<"2007-02-03"&electdata$Date>"2007-01-31",]
subset$datetime<-as.POSIXct(paste(subset$Date, subset$Time))

#Make the plot:
png(file="plot2.png", width=480, height=480)
plot(subset$datetime, subset$Global_active_power, pch="", xlab="", ylab="Global Active Power (kilowatts)")
lines(subset$datetime, subset$Global_active_power)
dev.off()