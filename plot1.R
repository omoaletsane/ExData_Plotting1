### PLOT 1 R Swift Code
### Set Working Directory Where the Data was Downloaded to
setwd("~/ONLINE COURSES/DATA SCIENCE/Coursera Data Science/Electrical Power Consumption Dataset")
### Reads data from file 
dataFile <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")
### Change Date Column to Date Type
dataFile[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
### Filter Dates for 2007-02-01 and 2007-02-02
dataFile <- dataFile[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
### Set Working Directory to Desktop as png can't save to hard disk directly
setwd("C:/Users/Dux")
png("plot1.png", width=480, height=480)  ### PGN Plot
### Plot 1
hist(dataFile[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
### Close the file
dev.off()
