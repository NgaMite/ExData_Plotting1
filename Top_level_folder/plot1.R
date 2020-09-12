data <- read.table("household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors = FALSE
                   , dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalactivepower <- as.numeric(subSetData$Global_active_power)

png("plot1.png")
hist(globalactivepower,col = "red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()