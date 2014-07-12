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

# plot 1
png("plot1.png", 480, 480)
hist(x=as.numeric(t$Global_active_power)
	, col = "red"
	, main = "Global Active Power"
	, ylab = "Frequency"
	, xlab = "Global Active Power (kilowatts)"
	)
graphics.off()
