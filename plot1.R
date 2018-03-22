# working directory where files are stored. NOTE: This is my working directory.
setwd("C:\\Users\\Ivy\\Google Drive\\DATA SCIENCE!!\\MODULE 4\\Week1")

# changing the margin (since I get error)
par(mar=c(5,5,2,2))


## read file
file <- ("household_power_consumption.txt")


## read data using read.table
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


## subset data from the dates 2007-02-01 and 2007-02-02
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# change the class 
ActivePower <- as.numeric(dataSubset$Global_active_power)

## construct the histogram from the above date. With x-axis as the "Global Active Power (kilowatts)" and y-axis as the "Frequency". The main title as "Global Active Power"
png("plot1.png", width=480, height=480) 
hist(ActivePower, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()