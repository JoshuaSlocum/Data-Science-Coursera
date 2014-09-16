# Problem 1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./data/survey.csv", method = "curl")


surveyData <- read.table("./Getting and Cleaning Data/data/survey.csv", sep=",",header = TRUE)
head(surveyData)

properties <- surveyData[!is.na(surveyData$VAL),]
HVprops <- properties[properties$VAL == 24,]
nrow(HVprops)


# Problem 2
# no need to code, FES should be one variable per column, not two

#Problem 3

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ", destfile="./Getting and Cleaning Data/data/NGAP.xlsx", method = "curl")

colindex <- 7:15
rowindex <- 18:23

dat<- read.xlsx("./Getting and Cleaning Data/data/NGAP.xlsx",sheetIndex=1,colIndex=colindex,rowIndex=rowindex)

sum(dat$Zip*dat$Ext,na.rm=T) 


# Prblem 4
# Note xml cannot handle https so modified to http

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL, useInternalNodes=TRUE)
rootNode <- xmlRoot(doc)

zips <- abs(as.numeric(xpathSApply(rootNode,"//zipcode",xmlValue)))
zips
length(zips[zips==21231])


# Problem 5 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="./Getting and Cleaning data/data/survey2.csv", method = "curl")

DT <- fread("./Getting and Cleaning Data/data/survey2.csv")

DT[,mean(pwgtp15),by=SEX]


