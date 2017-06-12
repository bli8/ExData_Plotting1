house <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    na.strings = "?", colClasses = c('character','character',
                                                     'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

house$Date <- as.Date(house$Date,"%d/%m/%Y")
house1 <- subset(house,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
datetime <- paste(as.Date(house1$Date), house1$Time)
house1$datetime <- as.POSIXct(datetime)

#plot3
with(house1, {plot(Sub_metering_1 ~ datetime, type = "l",
                   ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ datetime, col = 'Red')
  lines(Sub_metering_3 ~ datetime, col = 'Blue')})

legend("topright",col = c("black", "red", "blue"),lty = 1,lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
