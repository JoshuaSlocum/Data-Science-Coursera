setwd("./Data-Science-Coursera/Getting and Cleaning Data/")

# Problem 1 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./Data/survey4.csv", method = "curl")

data <- read.csv("./Data/survey4.csv",header=TRUE)
head(data)

apply(names(data),FUN="strsplit")

strsplit(names(data),"wgtp")


# Problem 2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="./Data/FGDP2.csv", method = "curl")

gdp.data <- read.csv("./Data/FGDP2.csv",col.names=c("Country","Rank","","Economy","GDP","note","","","",""),header=FALSE,skip=5,nrow=190)
head(gdp.data)
gdp.data <- gdp.data[,c(1,2,4,5)]

GDP <- as.character(gdp.data$GDP)
GDP <- as.numeric(gsub(",","",GDP))
mean(GDP)


# Problem 3
countryNames <- gdp.data$Economy
countryNames[grep("*United",countryNames)]


# Problem 4

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="./Data/edu.csv", method = "curl")

edu.data <- read.csv("./Data/edu.csv",header=TRUE)
head(edu.data)

combined.data <- merge (gdp.data,edu.data,by.x="Country",by.y="CountryCode")
combined.data <- combined.data[order(combined.data$Rank,decreasing=TRUE),]

fiscal <- combined.data[grep("[Ff]iscal year end",combined.data$Special.Notes),]
length(grep("[Jj]une",fiscal$Special.Notes))


# Problem 5 
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
val.2012 <- sampleTimes[grep("^2012",sampleTimes)]
length(val.2012)
