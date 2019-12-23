#Set working directory
setwd("/home/bas/Downloads/ExData_Plotting1")

#Read in the data via data table (much faster)
data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Date Column to Date Type via data table
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
data <- data[(Date == "2007-02-01") | (Date == "2007-02-02")]

png("plot1.png", width=480, height=480)

# Plot 1
hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
