plot2 <- function() {
  
  # read in the power tables and subset to 2007-02-01 an 2007-02-02
  power <- read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";")
  febpower <- subset(power, Date=="1/2/2007")
  febpower <- rbind(febpower, subset(power, Date=="2/2/2007"))
  febpower$DateTime <- paste(febpower$Date, febpower$Time)
  febpower$DateTime <- strptime(x = as.character(febpower$DateTime), format = "%d/%m/%Y %H:%M")
  
  #plot the line graph
  # note that png() will default to the specified 480x480px
  png(file="plot2.png")
  par(mfcol=c(1,1))
  plot(febpower$DateTime, febpower$Global_active_power, type="l", ylab="GAP", xlab="Date Time")
  dev.off()
}