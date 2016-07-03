## Assignment  Exploratory
## read data
prelim<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
##select time interval
power_series<-subset(prelim, prelim$Date=="1/2/2007" | prelim$Date=="2/2/2007")
## Create time axis from Date and Time
xu<-paste(as.Date(power_series$Date,"%d/%m/%Y"),power_series$Time)
power_series$Time<-strptime(xu,"%Y-%m-%d %H:%M:%S")
##open device
png(file="fig1.png")
##Plot
with(power_series,hist(Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main="Histogram of Global Active Power"))
##close device
dev.off()