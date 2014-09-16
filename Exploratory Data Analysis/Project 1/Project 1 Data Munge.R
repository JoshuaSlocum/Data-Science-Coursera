# Import the Power Data

data <- read.table("./Exploratory Data Analysis/Data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#Subet dates 2007-02-01 to 2007-02-02

start <- "2007-02-01"
end <- "2007-02-02"

data$Date <- as.Date(data$Date,format="%d/%m/%Y")  #Convert to date format

data <- data[(data$Date >= start & data$Date <= end),] #Subset



