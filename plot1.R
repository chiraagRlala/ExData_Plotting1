### Reading the specific data from line 66637 to line 68517
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

### Setting the appropriate column names of 'data'
ForColNames <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
colnames(data) <- colnames(ForColNames) # Giving column names to data

# Launch PNG
png(file = "plot1.png", width = 480, height = 480)

# Creating the histogram
hist(data[,3], col = 'red', main = "Global Active Power", xlab = 'Global Active Power (kilowatts)')

dev.off() # Save the plot and end