plot4 <- function() {
  
  # read in the power tables and subset to 2007-02-01 an 2007-02-02
  power <- read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";")
  febpower <- subset(power, Date=="1/2/2007")
  febpower <- rbind(febpower, subset(power, Date=="2/2/2007"))
  febpower$DateTime <- paste(febpower$Date, febpower$Time)
  febpower$DateTime <- strptime(x = as.character(febpower$DateTime), format = "%d/%m/%Y %H:%M")
  
  #plot the 4 graphs
  # note that png() will default to the specified 480x480px
  
  png(file="plot4.png")
  
  par(mfcol=c(2,2))
  plot(febpower$DateTime, febpower$Global_active_power, type="l", ylab="GAP", xlab="Date Time")
  
  plot(febpower$DateTime, febpower$Voltage, type="l", ylab="Voltage",xlab="Date Time")
  
  plot(febpower$DateTime, febpower$Sub_metering_1, type="l", ylab="Sub Metering",xlab="Date Time")
  lines(febpower$DateTime, febpower$Sub_metering_2, col="red")
  lines(febpower$DateTime, febpower$Sub_metering_3, col="blue")
  legend(col=c("black", "red", "blue"), lwd=2, legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), x="topright")
  
  plot(febpower$DateTime, febpower$Global_reactive_power, type="l", ylab="GRP",xlab="Date Time")
  
  dev.off()
  
}