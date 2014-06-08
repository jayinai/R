######### Week 1 Project #########

# Load the raw data and subset
household_power_consumption <- read.csv("F:/JHU Data Science/Exploratory Data Analysis/week 1/household_power_consumption.txt", sep=";", na.strings = "?")
data <- subset(household_power_consumption, Date == '1/2/2007' | Date == '2/2/2007',  select = Date:Sub_metering_3)
attach(data)


### Plot 2

# open png device
png(filename="plot2.png", bg="transparent", width=480, height=480)

# combine date and time and format correctly (call lubricate)
formatDate <- as.Date(Date, format="%d/%m/%Y")
require("lubridate") 
DT <- ymd_hms(paste(formatDate, Time, sep = "_"))

# Set locale so Thu, Fri and Sat (Eng) are displayed
Sys.setlocale("LC_TIME", "C")

# Do the final plotting
plot(DT, Global_active_power, type="l", xlab='', ylab='Global Active Power (kilowatts)')

# close the device
dev.off()
