

# Reading data from a Data folder within the directory
rawdata <- read.csv("Data/household_power_consumption.txt",
                    header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# Subsetting
data <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))


data$Date <- as.Date(data$Date, format = "%d/%m/%Y") # formatting date
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) # creating a variable for continuous date-time

#plotting to png file
png(file = "plot2.png", width = 480, height = 480)

with(data, plot(Global_active_power ~ DateTime, 
                type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()       # closing the png device
