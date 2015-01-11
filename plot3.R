
plot3 <- function() {
  
  # use setwd("your_path") to set the working directory
  # your_path: the path contain the "household_power_consumption.txt" file
  
  # Read the "household_power_consumption.txt" and contain into "data"
  col_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  # grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"): find EXACTLY 1/2/2007 or 2/2/2007 in file
  # We will only be using data from the dates 2007-02-01 and 2007-02-02.  
  data <- read.table(text = grep("^[1,2]/2/2007", 
                                 readLines("household_power_consumption.txt"), 
                                 value = TRUE), sep = ";", header = TRUE, 
                     col.names = col_names)
  
  # class(data$Date) == factor. So we should convert it to Date type
  # convert to Date type (yyyy-mm-dd) 
  # format = "%d/%m/%Y": is format contain in data (such as: 1/2/2007)
  # NOTE: %Y instead of %y
  # we should convert 1/2/2007 to 2007-02-01
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  # bind Date and Time, result like that "2007-02-01 00:01:00"
  DateTime <- paste(data$Date, data$Time) # class(DateTime) is "character"
  # convert "2007-02-01 00:01:00" to "2007-02-01 00:01:00 ICT"
  DateTime <- as.POSIXct(DateTime) # class(DateTime) are "POSIXct" "POSIXt"
  
  par(mar = c(4, 4, 2, 2))
  # # data$Sub_metering_1
  plot(DateTime, data$Sub_metering_1, type = "l", 
       xlab = "", ylab = "Energy sub metering")
  # data$Sub_metering_2
  lines(DateTime, data$Sub_metering_2, col = "red")
  # data$Sub_metering_3
  lines(DateTime, data$Sub_metering_3, col = "blue")
  legend("topright", lwd=1, col = c("black", "red", "blue"),  
         legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
  
  # Copy my plot to a PNG file, with 480x480 format
  dev.copy(png, file = "plot3.png", width = 480, height = 480)  
  # Close device
  dev.off()
}