######### Week 1 Project #########

# Load the raw data and subset
household_power_consumption <- read.csv("F:/JHU Data Science/Exploratory Data Analysis/week 1/household_power_consumption.txt", sep=";", na.strings = "?")
data <- subset(household_power_consumption, Date == '1/2/2007' | Date == '2/2/2007',  select = Date:Sub_metering_3)
attach(data)


### Plot 4

# open png device
png(filename="plot4.png", bg="transparent", width=480, height=480)

# divided into four sections
par(mfrow=c(2, 2))

# combine date and time and format correctly (call lubricate)
formatDate <- as.Date(Date, format="%d/%m/%Y")
require("lubridate") 

# Set locale so Thu, Fri and Sat (Eng) are displayed
Sys.setlocale("LC_TIME", "C")

### TOP LEFT
plot(DT, Global_active_power, type="l", xlab='', ylab='Global Active Power (kilowatts)')

### TOP RIGHT
plot(DT, Voltage, type="l", xlab='datetime', ylab='Voltage', ylim=c(234, 246))

### BOTTOM LEFT
plot(DT, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', ylim=c(0, 40))
lines(DT, Sub_metering_2, col='red')
lines(DT, Sub_metering_3, col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       lty=1, lwd=1, ncol=1,cex=0.8, bty="1", inset =c(0,0), text.col=c("black"))

### BOTTOM RIGHT
plot(DT, Global_reactive_power, type="l", xlab='datetime', ylab='Global reactive power', ylim=c(0, 0.5))

# close the device
dev.off()