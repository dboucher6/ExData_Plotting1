plot1 <- function() {

  # read in the power tables and subset to 2007-02-01 an 2007-02-02
  power <- read.table("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";")
  febpower <- subset(power, Date=="1/2/2007")
  febpower <- rbind(febpower, subset(power, Date=="2/2/2007"))
  febpower$DateTime <- paste(febpower$Date, febpower$Time)
  febpower$DateTime <- strptime(x = as.character(febpower$DateTime), format = "%d/%m/%Y %H:%M")

  # prepare graphics device and create histogram for Global Active Power
  # note that png() will default to the specified 480x480px
  png(file="plot1.png")
  par(mfcol=c(1,1))
  hist(febpower$Global_active_power, col="red", main="Global Active Power")
  dev.off()
}
