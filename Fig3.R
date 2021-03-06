## Assignment  Exploratory
## read data
prelim<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
##select time interval
power_series<-subset(prelim, prelim$Date=="1/2/2007" | prelim$Date=="2/2/2007")
## Create time axis from Date and Time
xu<-paste(as.Date(power_series$Date,"%d/%m/%Y"),power_series$Time)
power_series$Time<-strptime(xu,"%Y-%m-%d %H:%M:%S")
## open device
png(file="fig3.png")
##Plot
with(power_series,plot(Time,  Sub_metering_1,type="l",ylab="energy sub-metering", xlab=""))
lines(power_series$Time, power_series$Sub_metering_2,col="red",type="l")
lines(power_series$Time, power_series$Sub_metering_3,col="blue",type="l")
legend("topright", lty=1, lwd=2, col=c("black","red","blue"),legend=c("sub-metering1","sub-metering2","sub-metering3"))
dev.off() 