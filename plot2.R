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

# Plot 2

png("plot2.png", width=480, height=480)

plot(data$Newtime, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab = "", type = "l")

dev.off()
