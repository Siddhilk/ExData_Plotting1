#reading data file
epc_data <- read.table(
  text = grep("^[1-2]/2/2007", readLines("./data/household_power_consumption.txt"), value = TRUE), 
  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  header = TRUE, sep = ";")

#Date and Time conversion
epc_data$Datetime <- strptime(paste(epc_data$Date, epc_data$Time), "%d/%m/%Y %H:%M:%S")

#creating chart 
plot(epc_data$Datetime, 
     epc_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#copying to png file
dev.copy(png, file = "plot2.png", width=480, height=480, units="px")


#closing device
dev.off()