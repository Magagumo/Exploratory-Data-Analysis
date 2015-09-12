Electric2 <- read.table('E:/Coursera R Programming/R, Exploratory Data Analysis/household_power_consumption.txt', 
                        header = TRUE, stringsAsFactors = FALSE, sep = ';', nrows = 69516)

ElecSub <- subset(Electric1, Date %in% c('1/2/2007', '2/2/2007'))
ElecSub$DateTime <- paste(ElecSub$Date, ElecSub$Time, sep = ' ')
ElecSub$DateTimeConv <- as.POSIXct(ElecSub$DateTime, format = '%d/%m/%Y %H:%M:%S')
head(ElecSub$DateTimeConv)

ElecSub$Weekname <- weekdays.Date(as.Date(ElecSub$DateTimeConv) )

ElecSub2 <- subset(ElecSub, weekdays.Date(as.Date(ElecSub$Date)) %in% c('Thursday', 'Friday', 'Saturday'))

png(file = 'E:/Coursera R Programming/R, Exploratory Data Analysis/plot4.png')
plot4 <- par(mfrow = c(2, 2))
plot(ElecSub$DateTimeConv, ElecSub$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
plot(x = ElecSub$DateTimeConv, y = ElecSub$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datatime')
plot(ElecSub$DateTimeConv, y = ElecSub$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
lines(ElecSub$DateTimeConv, y = ElecSub$Sub_metering_2, type = 'l', col = 'red')
lines(ElecSub$DateTimeConv, y = ElecSub$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", lwd = '1', col = c("black", "red", 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
plot(x = ElecSub$DateTimeConv, y = ElecSub$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = 'datatime')
dev.off()
