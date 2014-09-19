setwd("./Data-Science-Coursera/Getting and Cleaning Data/")

# Problem 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./Data/survey3.csv", method = "curl")

data <- read.csv("./Data/survey3.csv",header=TRUE)
head(data)

# Use ACR = 3 for acerage >= 10 and AGS  = 6 for sold more than $10k agri products

agricultureLogical <- data$ACR==3 & data$AGS == 6
which(agricultureLogical)


# Problem 2

library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile="./Data/image.jpg", method = "curl")

image <- readJPEG("./Data/image.jpg",native=TRUE)

quantile(image,probs=seq(0,1,.1))

# Problem 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="./Data/FGDP.csv", method = "curl")

gdp.data <- read.csv("./Data/FGDP.csv",col.names=c("Country","Rank","","Economy","GDP","note","","","",""),header=FALSE,skip=5,nrow=190)
head(gdp.data)
gdp.data <- gdp.data[,c(1,2,4,5)]

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="./Data/edu.csv", method = "curl")

edu.data <- read.csv("./Data/edu.csv",header=TRUE)
head(edu.data)

combined.data <- merge (gdp.data,edu.data,by.x="Country",by.y="CountryCode")
combined.data <- combined.data[order(combined.data$Rank,decreasing=TRUE),]


# Problem 4

group.1 <- "High income: OECD"
group.2 <- "High income: nonOECD"
mean(combined.data[combined.data$Income.Group == group.1,2])
mean(combined.data[combined.data$Income.Group == group.2,2])


# Problem 5
combined.data$cuts <- cut2(combined.data$Rank,g=5)
table(combined.data$cuts,combined.data$Income.Group)
