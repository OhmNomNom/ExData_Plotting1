data <- read.csv('household_power_consumption.txt',
                 na.strings = '?', sep = ';',
                 colClasses = c('character', 'character', 'numeric', 
                                'numeric', 'numeric', 'numeric', 
                                'numeric', 'numeric', 'numeric')
)

data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

data_timestamps <- as.POSIXct(with(data, paste(Date, Time)),
                              format = '%d/%m/%Y %H:%M:%OS')

png(filename = 'plot4.png', width = 480, height = 480)

par(mfcol = c(2, 2))

plot(data_timestamps, data$Global_active_power, type = 'l', xlab = '',
     ylab = 'Global Active Power (kilowatts)')

plot(data_timestamps, data$Sub_metering_1, type = 'l', xlab = '', col = 'black',
     ylab = 'Energy sub metering')
points(data_timestamps, data$Sub_metering_2, type = 'l', xlab = '', col = 'red')
points(data_timestamps, data$Sub_metering_3, type = 'l', xlab = '', col = 'blue')

legend('topright', bty = 'n',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 1, col = c('black', 'red', 'blue'))

plot(data_timestamps, data$Voltage, type = 'l', xlab = 'datetime',
     ylab = 'Voltage')

plot(data_timestamps, data$Global_reactive_power, type = 'l', xlab = 'datetime',
     ylab = 'Global_reactive_power')


dev.off()
