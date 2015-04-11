plot1 <- function(){
 
  # read in data, assumes text file is in the working directory
  
  ftxt <- "household_power_consumption.txt"
  
  varnames <- colnames(read.table(file = ftxt, header = TRUE, sep = ";", nrows = 1)) # column names
  
  dat <- read.table(file = ftxt, header = FALSE, sep = ";", na.strings = "?", col.names = varnames, nrows = 2879, skip = 66638) # read only a subset of the data, corresponding to measurements from dates 2007-2-1 through 2007-2-2
  
  #format date variable
  dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")
  dat$datetime <- paste(dat$Date,dat$Time)
  dat$datetime <- strptime(dat$datetime,format = "%Y-%m-%d %H:%M:%S")
  
  # create plot
  png(filename = "plot1.png")
  hist(dat$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
  dev.off()
  
}

