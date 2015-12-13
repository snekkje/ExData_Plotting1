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

# Creating a PNG image using the plot command that reproduced the disired output.
png(filename = "plot2.png", width = 480, height = 480)
plot(dt, test$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()