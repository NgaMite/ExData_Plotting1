data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec =".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)
sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)
vol <- as.numeric(subSetData$Voltage)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png")
par(mfrow = c(2,2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime,vol,type = "l", ylab = "Voltage")

plot(datetime, sub1, type = "l",ylab = "Energy Sub Metering",xlab = "")
lines(datetime,sub2, type = "l", col ="red")
lines(datetime,sub3, type = "l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime,globalReactivePower, type = "l",ylab = "Global_reactive_power")
dev.off()