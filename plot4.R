# Produces four plots. 
# Assumes that the file "household_power_consumption.txt" is in the working directory.
# # Read household power consumption data for Feb. 1 & 2, 2007
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
relpc <- pc[pc$Date == "1/2/2007"| pc$Date == "2/2/2007",]
relpc$Time <- strptime(paste(as.character(relpc$Date), as.character(relpc$Time)), "%d/%m/%Y %H:%M")
is.na(relpc) <- as.character(relpc) =="?"
# # plot various measures against time and write to a PNG file
png("plot4.png", width=480, height=480, units="px", bg="transparent")
par(mfcol=c(2,2), mar=c(4,4,3,2), oma=c(1,1,2,0), bg="transparent")
with (relpc, {
  plot(Time, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power")
  plot(Time, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
  lines(Time, as.numeric(as.character(Sub_metering_2)), col="red")
  lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue")
  legend("topright", legend= c("Sub_metering_1 ", "Sub_metering_2  ", "Sub_metering_3  ") , col=c("black","red", "blue"), lty=1, cex=.8, bty="n")
  plot(Time,as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")
  plot(Time,as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
  })
dev.off()