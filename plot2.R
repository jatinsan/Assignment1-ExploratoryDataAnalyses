alldata<- read.csv("household_power_consumption.txt", header = T, sep = ';',
                   nrows = 2075259,
                   stringsAsFactors = F,na.strings = "?", comment.char = "",
                   check.names = F,
                   quote = '\"')
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

data <- subset(alldata, subset = (Date <= "2007-02-02" & Date >= "2007-02-01" ))

dt <- paste(as.Date(data$Date), data$Time)
xlb <- as.POSIXct(dt)

plot(data[,3] ~ xlb,
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()