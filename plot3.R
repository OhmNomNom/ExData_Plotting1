data <- read.csv('household_power_consumption.txt',
                 na.strings = '?', sep = ';',
                 colClasses = c('character', 'character', 'numeric', 
                                'numeric', 'numeric', 'numeric', 
                                'numeric', 'numeric', 'numeric')
)

data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

png(filename = 'plot3.png', width = 480, height = 480)

data_timestamps <- as.POSIXct(with(data, paste(Date, Time)),
                              format = '%d/%m/%Y %H:%M:%OS')

plot(data_timestamps, data$Sub_metering_1, type = 'l', xlab = '', col = 'black',
     ylab = 'Energy sub metering')
points(data_timestamps, data$Sub_metering_2, type = 'l', xlab = '', col = 'red')
points(data_timestamps, data$Sub_metering_3, type = 'l', xlab = '', col = 'blue')

legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 1, col = c('black', 'red', 'blue'))

dev.off()
