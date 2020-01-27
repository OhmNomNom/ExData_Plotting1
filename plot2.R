data <- read.csv('household_power_consumption.txt',
                 na.strings = '?', sep = ';',
                 colClasses = c('character', 'character', 'numeric', 
                                'numeric', 'numeric', 'numeric', 
                                'numeric', 'numeric', 'numeric')
)

data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

png(filename = 'plot2.png', width = 480, height = 480)

data_timestamps <- as.POSIXct(with(data, paste(Date, Time)),
                              format = '%d/%m/%Y %H:%M:%OS')

plot(data_timestamps, data$Global_active_power, type = 'l', xlab = '',
     ylab = 'Global Active Power (kilowatts)')

dev.off()
