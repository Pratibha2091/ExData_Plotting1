##Pratibha Wagle
##Creating Plot 3
data <- read.table("HPC.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
x <- subset(data, Date == "2/2/2007")
y <- subset(data, Date == "1/2/2007")
z <- rbind(x, y)
globalActivePower <- as.numeric(z$Global_active_power)
subMetering1 <- as.numeric(z$Sub_metering_1)
subMetering2 <- as.numeric(z$Sub_metering_2)
subMetering3 <- as.numeric(z$Sub_metering_3)
##Convert Date format
z$Date <- as.Date(z$Date, format="%d/%m/%Y")
## Converting dates
datetime <- paste(as.Date(z$Date), z$Time)
z$Datetime <- as.POSIXct(datetime)
## Plotting Plot 2
plot(z$Datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(z$Datetime, subMetering2, type="l", col="red")
lines(z$Datetime, subMetering3, type="l", col="blue")
##Creating the box on toright
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()