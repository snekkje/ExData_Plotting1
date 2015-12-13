# In order to reproduce this code you must include the data.table and dplyr libaries to your R 
# repository as well as download the "household_power_consumption" data supplied in the assignment

library(data.table)
library(dplyr)

# Reading in the data and filter the appropriate dates from it. Note that I have stored the
# txt data supplied by the assignment in the "data" directory.
powerData <- fread("data/household_power_consumption.txt", na.strings = "?")
test <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Buiding the PNG image. A histogram is asked for in this case which is generated
# by the "hist" function. The arguments reproduce the desired output.
png(filename = "plot1.png", width = 480, height = 480)
hist(test$Global_active_power,main = "Global Active Power", xlab = 
       "Global Active Power (kilowatts)",col = "red")
dev.off()
