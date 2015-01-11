alldata<- read.csv("household_power_consumption.txt", header = T, sep = ';',nrows = 2075259,stringsAsFactors = F,na.strings = "?", comment.char = "",
check.names = F,quote = '\"')
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")
data <- subset(alldata, subset = (Date <= "2007-02-02" & Date >= "2007-02-01" ))

dt <- paste(as.Date(data$Date), data$Time)
xlb <- as.POSIXct(dt)

with(data, {plot(Sub_metering_1 ~ xlb, type = "l",ylab = "Global Active Power (kilowatts)",
                 xlab = "")
            lines(Sub_metering_2 ~ xlb, col = 'Red')
            lines(Sub_metering_3 ~ xlb, col = 'Blue')})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()