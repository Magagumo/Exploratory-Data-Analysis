Electric2 <- read.table('E:/Coursera R Programming/R, Exploratory Data Analysis/household_power_consumption.txt', 
                      header = TRUE, stringsAsFactors = FALSE, sep = ';', nrows = 69516)

ElecSub <- subset(Electric1, Date %in% c('1/2/2007', '2/2/2007'))
ElecSub$DateTime <- paste(ElecSub$Date, ElecSub$Time, sep = ' ')
ElecSub$DateTimeConv <- as.POSIXct(ElecSub$DateTime, format = '%d/%m/%Y %H:%M:%S')
head(ElecSub$DateTimeConv)

ElecSub$Weekname <- weekdays.Date(as.Date(ElecSub$DateTimeConv) )

ElecSub2 <- subset(ElecSub, weekdays.Date(as.Date(ElecSub$Date)) %in% c('Thursday', 'Friday', 'Saturday'))

png(file = 'E:/Coursera R Programming/R, Exploratory Data Analysis/plot2.png')
plot2 <- plot(x = ElecSub$DateTimeConv, y = ElecSub$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()