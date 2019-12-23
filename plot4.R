#Set working directory
setwd("/home/bas/Downloads/ExData_Plotting1")

#Read in the data via data table (much faster)
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?")

# Change Date Column to Date Type via data table
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
data <- data[(Date == "2007-02-01") | (Date == "2007-02-02")]

# Make a date-time variable
data$Newtime <- as.POSIXct(paste(data$Date,data$Time, sep =" "))

# Now, construct plots in the right order
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#Upper left
plot(data$Newtime, data$Global_active_power, ylab="Global Active Power", xlab = "", type = "l")

#Upper right
plot(data$Newtime, data$Voltage, ylab = "Voltage", type = "l", xlab = "datetime")

#Lower left
plot(data$Newtime, data$Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "l")
lines(data$Newtime, data$Sub_metering_2, col = "red")
lines(data$Newtime, data$Sub_metering_3, col = "blue")

legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), bty="n") 

#Lower right
plot(data$Newtime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
