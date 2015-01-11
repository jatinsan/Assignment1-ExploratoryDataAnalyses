alldata<- read.csv("household_power_consumption.txt", header = T, sep = ';',nrows = 2075259,stringsAsFactors = F,na.strings = "?", comment.char = "",
                   check.names = F,quote = '\"')
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")
data <- subset(alldata, subset = (Date <= "2007-02-02" & Date >= "2007-02-01" ))

dt <- paste(as.Date(data$Date), data$Time)
xlb <- as.POSIXct(dt)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
plot(Global_active_power ~ xlb, type = "l", 
ylab = "Global Active Power", xlab = "")
plot(Voltage ~ xlb, type = "l", ylab = "Voltage", xlab = "xlb")
plot(Sub_metering_1 ~ xlb, type = "l", ylab = "Energy sub metering",
       xlab = "")
lines(Sub_metering_2 ~ xlb, col = 'Red')
lines(Sub_metering_3 ~ xlb, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ xlb, type = "l", 
ylab = "Global_rective_power", xlab = "xlb")
})

dev.copy(png, file = "plot4.png")
dev.off()