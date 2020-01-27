data <- read.csv('household_power_consumption.txt',
                  na.strings = '?', sep = ';',
                  colClasses = c('character', 'character', 'numeric', 
                                 'numeric', 'numeric', 'numeric', 
                                 'numeric', 'numeric', 'numeric')
                 )

data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

png(filename = 'plot1.png', width = 480, height = 480)

hist(data$Global_active_power, 
     col = 'red', breaks = 24, 
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()