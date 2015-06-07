### Reading the specific data from line 66637 to line 68517
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

### Setting the appropriate column names of 'data'
ForColNames <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
colnames(data) <- colnames(ForColNames) # Giving column names to data

### Combining Date and Time column into single column of 'DateTime'
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
finaldates <- paste(data$Date, data$Time)
finaldates <- as.POSIXct(finaldates)    #Date and time as POSIXct object
data["datetime"] <- finaldates          #adding the combined column to data.frame

# Launching PNG
png(file = "plot4.png", width = 480, height = 480)

# Creating the multiple plots
par(mfcol = c(2, 2))
with(data, {
        # First plot
        plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
        
        # Second plot
        plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
        # Adding lines
        lines(datetime, Sub_metering_2, type = 'l', col = 'red')
        lines(datetime, Sub_metering_3, type = 'l', col = 'blue')
        # Adding legends
        legend("topright", legend=colnames(data)[7:9], col=c("black","red","blue"), lty=c(1,1,1), bty = 'n')
        
        # Third plot
        plot(datetime, Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
        
        # Fourth plot
        plot(datetime, Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
        })

dev.off() # Save the plot and end