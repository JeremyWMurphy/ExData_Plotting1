plot4 <- function(){
  
  # read in data, assumes text file is in the working directory
  
  ftxt <- "household_power_consumption.txt"
  
  varnames <- colnames(read.table(file = ftxt, header = TRUE, sep = ";", nrows = 1)) # column names
  
  dat <- read.table(file = ftxt, header = FALSE, sep = ";", na.strings = "?", col.names = varnames, nrows = 2879, skip = 66638) # read only a subset of the data, corresponding to measurements from dates 2007-2-1 through 2007-2-2
  
  #format date variable
  dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")
  dat$datetime <- paste(dat$Date,dat$Time)
  dat$datetime <- strptime(dat$datetime,format = "%Y-%m-%d %H:%M:%S")
  
  # create plot
  png(filename = "plot4.png")
  
  par(mfrow = c(2, 2))
  
  plot(dat$datetime,dat$Global_active_power,type = "l", col = "black", ylab = "Global Active Power", xlab = "")
  
  plot(dat$datetime,dat$Voltage,type = "l", col = "black", ylab = "Voltage",xlab = "datetime")
  
  plot(dat$datetime,dat$Sub_metering_1,type = "l",col = "black",ylab = "Energy sub metering",xlab = "")
  lines(dat$datetime,dat$Sub_metering_2,col = "red")
  lines(dat$datetime,dat$Sub_metering_3,col = "blue")
  legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = -1 ,lty = 1, col = c("black","red","blue"), bty = "n")
  
  plot(dat$datetime,dat$Global_reactive_power,type = "l", col = "black", ylab = "Global_reactive_power", xlab = "datetime")
  
  dev.off()
  
}
