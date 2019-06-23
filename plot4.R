# P L O T 4

# Reading data from a Data folder within the directory
rawdata <- read.csv("Data/household_power_consumption.txt",
                    header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Subsetting on the required dates
data <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") # formatting date
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) # creating a variable for continuous date-time

#plotting to png file
png(file = "plot4.png", width = 480, height = 480)

# Setting parameters for multiple graphs
par(mfrow=c(2,2), mar=c(5,5,2,1), oma=c(0,0,1,0))

with(data, {
        
        plot(Global_active_power ~ DateTime, type = "l",   # topleft graph
             ylab = "Global Active Power", xlab = "")      
        
        plot(Voltage ~ DateTime, type = "l",               # topright graph
             ylab = "Voltage", xlab = "datetime")          
        
        plot(Sub_metering_1 ~ DateTime,                    # bottomleft graph
                type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2 ~ DateTime, col = "red")
        lines(Sub_metering_3 ~ DateTime, col = "blue")
        
        legend("topright", col = c("black", "red", "blue"), bty = "n", lty = 1, lwd = 2,
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(Global_reactive_power ~ DateTime, type = "l",  # bottomright graph
             ylab = "Global_reactive_power", xlab = "datetime")
})

dev.off()       # closing the png device
