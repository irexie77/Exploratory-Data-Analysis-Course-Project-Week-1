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


## global active power vs date and time
png("plot2.png", width=480, height=480)
plot(TimeDate, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()