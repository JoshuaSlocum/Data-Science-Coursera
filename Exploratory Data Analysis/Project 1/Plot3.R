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

# Plot 3 Energy sub meterinng line plot over time for 3 series

# Open PNG device with size width 480px and height 480px
png(filename ="./Exploratory Data Analysis/ExData_Plotting1/Plot3.png",width=480,height=480,units="px")

# Create plot with first series, second series, third series, then legend
plot(x=data$datetime,y=data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=data$datetime,y=data$Sub_metering_2,col="red")
lines(x=data$datetime,y=data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close PNG
dev.off()