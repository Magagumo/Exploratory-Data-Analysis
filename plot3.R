Electric2 <- read.table('E:/Coursera R Programming/R, Exploratory Data Analysis/household_power_consumption.txt', 
                        header = TRUE, stringsAsFactors = FALSE, sep = ';', nrows = 69516)

ElecSub <- subset(Electric1, Date %in% c('1/2/2007', '2/2/2007'))
ElecSub$DateTime <- paste(ElecSub$Date, ElecSub$Time, sep = ' ')
ElecSub$DateTimeConv <- as.POSIXct(ElecSub$DateTime, format = '%d/%m/%Y %H:%M:%S')
head(ElecSub$DateTimeConv)

ElecSub$Weekname <- weekdays.Date(as.Date(ElecSub$DateTimeConv) )

ElecSub2 <- subset(ElecSub, weekdays.Date(as.Date(ElecSub$Date)) %in% c('Thursday', 'Friday', 'Saturday'))

png(file = 'E:/Coursera R Programming/R, Exploratory Data Analysis/plot3.png')
plot3 <- plot(ElecSub$DateTimeConv, y = ElecSub$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
lines(ElecSub$DateTimeConv, y = ElecSub$Sub_metering_2, type = 'l', col = 'red')
lines(ElecSub$DateTimeConv, y = ElecSub$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", lwd = '1', col = c("black", "red", 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()