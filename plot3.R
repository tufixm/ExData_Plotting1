# this may be redundant, if the data is already loaded
# the file should be unzipped
# the text file should be placed in the working directory

# read the raw data
house.power.raw = read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
house.power.raw$Date = as.Date(house.power.raw$Date, format="%d/%m/%Y")

# filter the data for the 2 needed days
pwr.data = house.power.raw[house.power.raw$Date == as.Date("2007-02-01") | house.power.raw$Date == as.Date("2007-02-02"),]

# merge the Date and Time columns into a DateTime common column
pwr.data$DateTime = strptime(paste(pwr.data$Date, pwr.data$Time), format="%F %T")

# plot the 3rd figure
png("plot3.png")
plot(pwr.data$DateTime, pwr.data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr.data$DateTime, pwr.data$Sub_metering_2, col="red")
lines(pwr.data$DateTime, pwr.data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
