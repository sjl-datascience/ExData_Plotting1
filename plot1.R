# Plots a histogram of Global Active Power
# Assumes that the file "household_power_consumption.txt" is in the working directory
# Read household power consumption data for Feb. 1 & 2, 2007
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
relpc <- pc[pc$Date == "1/2/2007"| pc$Date == "2/2/2007",]
is.na(relpc) <- as.character(relpc) =="?"
# plot the Global Active Power in kilowatts as a histogram and write to a PNG file
relpc$Global_active_power <- as.numeric(as.character(relpc$Global_active_power))
png("plot1.png", width=480, height=480, units="px", bg="transparent")
par(adj=0.5, mar=c(5,4,2,2), font=2)
hist(relpc$Global_active_power, col="red",  xlab= "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()