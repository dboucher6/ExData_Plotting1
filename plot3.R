plot3 <- function() {
  
  # read in the power tables and subset to 2007-02-01 an 2007-02-02
  power <- read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";")
  febpower <- subset(power, Date=="1/2/2007")
  febpower <- rbind(febpower, subset(power, Date=="2/2/2007"))
  febpower$DateTime <- paste(febpower$Date, febpower$Time)
  febpower$DateTime <- strptime(x = as.character(febpower$DateTime), format = "%d/%m/%Y %H:%M")
  
  #plot the sub_meter graph
  # note that png() will default to the specified 480x480px
  png(file="plot3.png")
  par(mfcol=c(1,1))
  plot(febpower$DateTime, febpower$Sub_metering_1, type="l",ylab="Sub Metering",xlab="Date Time")
  lines(febpower$DateTime, febpower$Sub_metering_2, col="red")
  lines(febpower$DateTime, febpower$Sub_metering_3, col="blue")
  legend(col=c("black", "red", "blue"), lwd=2, legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), x="topright")
  dev.off()
  
}