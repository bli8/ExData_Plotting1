house <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    na.strings = "?", colClasses = c('character','character',
                                                     'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

house$Date <- as.Date(house$Date,"%d/%m/%Y")
house1 <- subset(house,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
datetime <- paste(as.Date(house1$Date), house1$Time)
house1$datetime <- as.POSIXct(datetime)

#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(house1, {plot(Global_active_power ~ datetime, type = "l",
                   ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2 ~ datetime, col = 'Red')
  lines(Sub_metering_3 ~ datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ datetime, type = "l",
       ylab = "Global_rective_power", xlab = "datetime")})