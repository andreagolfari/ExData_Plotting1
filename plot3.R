# P L O T 3

# Reading data from a Data folder within the directory
rawdata <- read.csv("Data/household_power_consumption.txt",
                    header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Subsetting on the required dates
data <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") # formatting date
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) # creating a variable for continuous date-time

#plotting to png file
png(file = "plot3.png", width = 480, height = 480)

with(data, {
        plot(Sub_metering_1 ~ DateTime, 
                type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2 ~ DateTime, col = "red")
        lines(Sub_metering_3 ~ DateTime, col = "blue")
        })

# Creating legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()       # closing the png device
