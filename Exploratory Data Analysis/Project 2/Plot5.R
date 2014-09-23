# Plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# To answer this question we will look at 
# 1) total baltimore MV emissions over the period
# 2) the composition of baltimore MV emissions sectors over the period

# Step 0: Data Import and package load
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# Step 1: Prepare Data

# Subset to baltimore
balt.data <- NEI[NEI$fips==24510,]
balt.data$type <- factor(balt.data$type)
balt.data$year <- factor(balt.data$year)

# find Motor vehical related SCC source codes from the SCC dataframe
# The unique names list is small enough that we can do this by printing it to the console.
EI.Sector.names <- unique(SCC$EI.Sector)
print(EI.Sector.names)
# we see that the names of interest are 21 to 24 (we exclude non-road vehicles which are items 25:30)
#The relevant SCC codes are
need.names <- EI.Sector.names[c(21:24)]
SCC.codes <- SCC[SCC$EI.Sector %in% need.names,1]
SCC.names <- SCC[SCC$SCC %in% SCC.codes,c(1,4)]

# now we subset the baltimore Data from NEI to just those SCC codes and add the SCC sector names
balt.data <- balt.data[balt.data$SCC %in% SCC.codes,]
balt.data <- merge(balt.data,SCC.names,by.x="SCC",by.y="SCC")

# now we total up the emissions by year
total.em <- tapply(balt.data$Emissions,balt.data$year,sum)

# Step 2: Plotting the data for total baltimore MV emissions
png(filename ="./Project 2/Plot5a.png",width=580,height=580,units="px")
barplot(total.em,main="Total Baltimore Motor Vehicle PM2.5 Emissions by Year",xlab="Year",ylab="Total Emissions (tons)")
dev.off()


# Step 3: Plotting the data for baltimore mv emissions sector composition
balt.data$EI.Sector <- factor(balt.data$EI.Sector)

png(filename ="./Project 2/Plot5b.png",width=580,height=580,units="px")

g <- ggplot(balt.data,aes(x=year,y=Emissions,fill=EI.Sector)) + geom_bar(stat="identity",position=position_dodge())
g <- g + ggtitle("Baltimore MV Emissions 1999-2008 by EI Sector") + ylab("Total Emissions")

print(g)
dev.off()