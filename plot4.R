# In order to reproduce this code you must include the data.table and dplyr libaries to your R 
# repository as well as download the "household_power_consumption" data supplied in the assignment

library(data.table)
library(dplyr)

# Reading in the data and filter the appropriate dates from it. Note that I have stored the
# txt data supplied by the assignment in the "data" directory.
powerData <- fread("data/household_power_consumption.txt", na.strings = "?")
test <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Joining the Date and Time columns of the dataframe to create a posix datetime object
dt <- as.POSIXct(paste(test$Date, test$Time), format="%d/%m/%Y %H:%M:%S")

# Creating a PNG image, The "par" command creates multiple plots within a overall graph. In this 
# case two plots across and two plots down.
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(dt, test$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(dt, test$Voltage, type = "l", xlab = "", ylab = "Voltage")
plot(dt, test$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt, test$Sub_metering_2, col = "red" )
lines(dt, test$Sub_metering_3, col = "blue" )
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col = 
         c("black","red", "blue"), bty = "n")
plot(dt, test$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")

dev.off()