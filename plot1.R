a<-read.table("household_power_consumption.txt",sep=";",as.is = T,header=T)
as.Date()
dat_subset1<- a[which(a[, "Date"] %in% "1/2/2007"), ]
dat_subset2<- a[which(a[, "Date"] %in% "2/2/2007"), ]

total <- rbind(dat_subset1,dat_subset2)  
s<-as.numeric(total$Global_active_power)

hist(s,col="red",breaks=12,xlab = "Global Active Power (kilowatts)",
          main="Global Active Power",ylim=c(0,1200))

dev.copy(png, file = "plot1.png")
dev.off()