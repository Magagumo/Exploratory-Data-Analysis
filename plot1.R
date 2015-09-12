Electric1 <- read.csv('E:/Coursera R Programming/R, Exploratory Data Analysis/household_power_consumption.txt', 
                     header = TRUE, stringsAsFactors = FALSE, sep = ';', nrows = 69516)

ElecSub <- subset(Electric1, Date %in% c('1/2/2007', '2/2/2007'))

png(file = 'E:/Coursera R Programming/R, Exploratory Data Analysis/plot1.png')
plot1.png <- hist(as.numeric(ElecSub$Global_active_power), col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.off()