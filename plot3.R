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

# Creating a PNG image plotting three variables over time. The lines function adds
# data on the original plot while the legend function adds a legend according to
# the specifications in the arguments
png(filename = "plot3.png", width = 480, height = 480)
plot(dt, test$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt, test$Sub_metering_2, col = "red" )
lines(dt, test$Sub_metering_3, col = "blue" )
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col = 
         c("black","red", "blue"))
dev.off()