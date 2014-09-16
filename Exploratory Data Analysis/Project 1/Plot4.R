# Import the Power Data

data <- read.table("./Exploratory Data Analysis/Data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

# Subet dates 2007-02-01 to 2007-02-02

start <- "2007-02-01"
end <- "2007-02-02"

data$Date <- as.Date(data$Date,format="%d/%m/%Y")  #Convert to date format

data <- data[(data$Date >= start & data$Date <= end),] #Perform subset

# Add a datetime column

data$datetime <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

##########################################################################

# Plot 4 2x2 plot of various variables

# Open PNG device with size width 480px and height 480px
png(filename ="./Exploratory Data Analysis/ExData_Plotting1/Plot4.png",width=480,height=480,units="px")

# Set up 2x2 plotting space
opar <- par(mfrow=c(1,1))  # save orginal mfrow param
par(mfrow = c(2,2))  # change params to 2x2 filled in row-wise
     
# Create plot Top Left: Global Active Power over time
plot(x=data$datetime,y=data$Global_active_power,type="l",ylab="Global Active Power",xlab="")

# Create plot Top Right: Voltage over time
plot(x=data$datetime,y=data$Voltage,type="l",ylab="Voltage",xlab="datetime")

# Create plot Bottom Left: Energy sub metering over time (3 series)
plot(x=data$datetime,y=data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=data$datetime,y=data$Sub_metering_2,col="red")
lines(x=data$datetime,y=data$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Create plot Bottom Right: Global Reactive Power over time
plot(x=data$datetime,y=data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

# Close PNG
dev.off()

# Reset mfrow param
par(opar)
