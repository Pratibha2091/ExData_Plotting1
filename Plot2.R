##Pratibha Wagle
##Creating Plot 2
data <- read.table("HPC.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
x <- subset(data, Date == "2/2/2007")
y <- subset(data, Date == "1/2/2007")
z <- rbind(x, y)
globalActivePower <- as.numeric(z$Global_active_power)
##Convert Date format
z$Date <- as.Date(z$Date, format="%d/%m/%Y")
## Converting dates
datetime <- paste(as.Date(z$Date), z$Time)
z$Datetime <- as.POSIXct(datetime)
## Plotting Plot 2
plot(z$Datetime, globalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()