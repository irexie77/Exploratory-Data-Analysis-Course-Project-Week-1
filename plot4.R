# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week1")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


## read file
file <- "household_power_consumption.txt"



## read data using read.table
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


## subset data from the dates 2007-02-01 and 2007-02-02
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## merge date and time
TimeDate <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## change the class
ActivePower <- as.numeric(dataSubset$Global_active_power)
Sub_metering_1 <- as.numeric(dataSubset$Sub_metering_1)
Sub_metering_2 <- as.numeric(dataSubset$Sub_metering_2)
Sub_metering_3 <- as.numeric(dataSubset$Sub_metering_3)
Global_reactive_power <- as.numeric(dataSubset$Global_reactive_power)
Voltage <- as.numeric(dataSubset$Voltage)


## Global Active Power vs. Time. Voltage vs. Time. Submetering vs. Time and Global Reactive Power vs. Time
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))  ## to get 4 plots in a single view

plot(TimeDate, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(TimeDate, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(TimeDate, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

lines(TimeDate, Sub_metering_2, type="l", col="red")
lines(TimeDate, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(TimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()