# plot1.R

# read data file
energy_data <- read.table("./household_power_consumption.txt"
                          , sep= ";"
                          , na.strings= "?"
                          , header=TRUE)

# print aggregate memory usage statistics
print(paste('R is using', memory.size()
            , 'MB out of limit', memory.limit(), 'MB'))

date_format <- "%d/%m/%Y"

# extract dates 02/01/2007 and 02/02/2007
t <- rbind(energy_data[as.Date(energy_data$Date, format=date_format) == "2007-02-01",]
	, energy_data[as.Date(energy_data$Date, format=date_format) == "2007-02-02",])

# combine date and time fields and determine day of week	
attach(t)
t$datetime <- strptime(paste(t$Date, t$Time), format="%d/%m/%Y %H:%M:%S")
t$dayofweek <- weekdays(t$datetime, abbreviate=TRUE)
detach(t)

# ensure data ordered correctly
t <- t[order(t$datetime),]

png("plot3.png", 480, 480)
plot(x = t$datetime
             , y = t$Sub_metering_1
             , type = "n"
             , xlab = ""
             , ylab = "Energy sub metering")
lines(x = t$datetime
             , y = t$Sub_metering_1
             , type = "l"
             )
lines(x = t$datetime
      , y = t$Sub_metering_2
      , type = "l"
      , col="red"
)
lines(x = t$datetime
      , y = t$Sub_metering_3
      , type = "l"
      , col="blue"
)

legend("topright"
       , lty = 1
       , col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
graphics.off()
