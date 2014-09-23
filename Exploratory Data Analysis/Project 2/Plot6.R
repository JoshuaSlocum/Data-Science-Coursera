# Plot 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time in motor vehicle emissions?

# Step 0: Data Import and package load
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# Step 1: Prepare Data

# Subset to Baltimore and LA
city.data <- NEI[NEI$fips %in% c(24510,"06037"),]
city.data$type <- factor(city.data$type)
city.data$year <- factor(city.data$year)
city.data$city <- ifelse(city.data$fips==24510,"Baltimore","LA")


# find Motor vehicle related SCC source codes from the SCC dataframe
# The unique names list is small enough that we can do this by printing it to the console.
EI.Sector.names <- unique(SCC$EI.Sector)
print(EI.Sector.names)
# we see that the names of interest are 21 to 24 (we exclude non-road vehicles which are items 25:30)
#The relevant SCC codes are
need.names <- EI.Sector.names[c(21:24)]
SCC.codes <- SCC[SCC$EI.Sector %in% need.names,1]
SCC.names <- SCC[SCC$SCC %in% SCC.codes,c(1,4)]

# now we subset the cityimore Data from NEI to just those SCC codes and add the SCC sector names
city.data <- city.data[city.data$SCC %in% SCC.codes,]
city.data <- merge(city.data,SCC.names,by.x="SCC",by.y="SCC")

# now we total up the emissions by year by city
total.em <- tapply(city.data$Emissions,list(city.data$city,city.data$year),sum)

# Step 2: Plotting the data for total baltimore and LA MV emissions
png(filename ="./Project 2/Plot6a.png",width=580,height=580,units="px")
par(mfrow = c(2,1)) 
barplot(total.em[1,],main="Total Baltimore Motor Vehicle Emissions by Year",xlab="Year",ylab="Total Emissions (tons)")
barplot(total.em[2,],main="Total LA Motor Vehicle Emissions by Year",xlab="Year",ylab="Total Emissions (tons)")
dev.off()




# Step 3: Plotting the data for mv emissions sector composition
city.data$EI.Sector <- factor(city.data$EI.Sector)

png(filename ="./Project 2/Plot6b.png",width=780,height=780,units="px")

g <- ggplot(city.data,aes(x=year,y=Emissions,fill=EI.Sector)) + geom_bar(stat="identity",position=position_dodge())
g <- g + ggtitle("Baltimore v. LA MV Emissions 1999-2008 by Sector") + ylab("Total Emissions")+facet_grid(.~city)

print(g)
dev.off()