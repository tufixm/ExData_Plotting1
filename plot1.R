# the file should be unzipped
# the text file should be placed in the working directory

# read the raw data
house.power.raw = read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
house.power.raw$Date = as.Date(house.power.raw$Date, format="%d/%m/%Y")

# filter the data for the 2 needed days
pwr.data = house.power.raw[house.power.raw$Date == as.Date("2007-02-01") | house.power.raw$Date == as.Date("2007-02-02"),]

# merge the Date and Time columns into a DateTime common column
pwr.data$DateTime = strptime(paste(pwr.data$Date, pwr.data$Time), format="%F %T")

# plot the 1st figure
png("plot1.png")
hist(pwr.data$Global_active_power, xlab="Global active power (kilowatts)", main="Global active power", col="red")
dev.off()
