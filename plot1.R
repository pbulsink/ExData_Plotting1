#plot1
if (!file.exists("./household_power_consumption.txt")){
    unzip("./exdata-data-household_power_consumption.zip")
}
electdata<-read.table("./household_power_consumption.txt", header = T, sep = ";", colClasses=c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
electdata$Date<-strptime(electdata$Date, format="%d/%m/%Y")
subset<-electdata[electdata$Date<"2007-02-03"&electdata$Date>"2007-01-31",]

#Make the plot:
png(file="plot1.png", width=480, height=480)
hist(subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
