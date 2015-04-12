# Plots Sub-metering data against time
# Assumes that the file "household_power_consumption.txt" is in the working directory
# # Read the data
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
relpc <- pc[pc$Date == "1/2/2007"| pc$Date == "2/2/2007",]
relpc$Time <- strptime(paste(as.character(relpc$Date), as.character(relpc$Time)), "%d/%m/%Y %H:%M")
is.na(relpc) <- as.character(relpc) =="?"
# # Plot the data and write to a PNG file
png("plot3.png", width=480, height=480, units="px", bg="transparent")
par(adj=0.5, mar=c(5,4,2,2), font=2)
plot(relpc[,"Time"], as.numeric(as.character(relpc[,"Sub_metering_1"])), type="l", xlab="", ylab="Energy sub metering")
lines(relpc[,"Time"], as.numeric(as.character(relpc[,"Sub_metering_2"])), col="red")
lines(relpc[,"Time"], as.numeric(as.character(relpc[,"Sub_metering_3"])), col="blue")
legend("topright", legend= c("Sub_metering_1 ", "Sub_metering_2  ", "Sub_metering_3  ") , col=c("black","red", "blue"), lty=1)
dev.off()