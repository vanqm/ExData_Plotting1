
plot1 <- function() {
  
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
    
  par(mar = c(4, 4, 2, 2))
  hist(data$Global_active_power, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "plot1.png", width = 480, height = 480)  ## Copy my plot to a PNG file
  dev.off()  ## Don't forget to close the PNG device!
}