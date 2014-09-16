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

# Plot 2 Line plot of Global Active Power over time

# Open PNG device with size width 480px and height 480px
png(filename ="./Exploratory Data Analysis/ExData_Plotting1/Plot2.png",width=480,height=480,units="px")

# Create plot
plot(x=data$datetime,y=data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Close PNG
dev.off()