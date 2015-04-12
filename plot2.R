# Plots Global Active Power against time
# Assumes the file "household_power_consumption.txt" is in the working directory 
# # Read the data
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
relpc <- pc[pc$Date == "1/2/2007"| pc$Date == "2/2/2007",]
relpc$Time <- strptime(paste(as.character(relpc$Date), as.character(relpc$Time)), "%d/%m/%Y %H:%M")
relpc$Global_active_power <- as.numeric(as.character(relpc$Global_active_power))
is.na(relpc) <- as.character(relpc) =="?"
# # Plot the data and write to PNG file
png("plot2.png", width=480, height=480, units="px", bg="transparent")
par(adj=0.5, mar=c(5,4,2,2), font=2)
plot(relpc[,"Time"],relpc[,"Global_active_power"], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()