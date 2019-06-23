
library(lubridate)

# Reading data from a Data folder within the directory
rawdata <- read.csv("Data/household_power_consumption.txt",
                    header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Subsetting
data <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))

data$Date <- dmy(data$Date) # convert variable to date format

# hist(data$Global_active_power, main = "Global Active Power",
#     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

png(file = "plot1.png", width = 480, height = 480)     #plotting to png file

hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()       # closing the png device
