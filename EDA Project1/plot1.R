######### Week 1 Project #########

# Load the raw data and subset
household_power_consumption <- read.csv("F:/JHU Data Science/Exploratory Data Analysis/week 1/household_power_consumption.txt", sep=";", na.strings = "?")
data <- subset(household_power_consumption, Date == '1/2/2007' | Date == '2/2/2007',  select = Date:Sub_metering_3)
attach(data)


### Plot 1

# open png device
png(filename="plot1.png", bg="transparent", width=480, height=480)

# do the plotting
hist(Global_active_power, col='red', main='Global Active Power',
     xlab='Global Active Power (kilowatts)')

# close the device
dev.off() 