house <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    na.strings = "?", colClasses = c('character','character',
                                                     'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

house$Date <- as.Date(house$Date,"%d/%m/%Y")
house1 <- subset(house,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
datetime <- paste(as.Date(house1$Date), house1$Time)
house1$datetime <- as.POSIXct(datetime)

#plot1
hist(house1$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowathouse1s)", col="red")