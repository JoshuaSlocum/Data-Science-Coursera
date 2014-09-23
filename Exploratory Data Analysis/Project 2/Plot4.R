# Plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# To answer this question we will look at 
# 1) total coal emissions over the period
# 2) the composition of coal emissions sectors over the period

# Step 0: Data Import and package load
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# Step 1: Prepare Data

# Find the SCC codes for coal combustion-related sources form the SCC data frame
# The unique names list is small enough that we can do this by printing it to the console.
EI.Sector.names <- unique(SCC$EI.Sector)
print(EI.Sector.names)
# we see that the names of interest are [1],[6],[11]
#The relevant SCC codes are
need.names <- EI.Sector.names[c(1,6,11)]
SCC.codes <- SCC[SCC$EI.Sector %in% need.names,1]
SCC.names <- SCC[SCC$SCC %in% SCC.codes,c(1,4)]

# now we subset the total US Data from NEI to just those SCC codes and add the SCC sector names
coal.data <- NEI[NEI$SCC %in% SCC.codes,]
coal.data <- merge(coal.data,SCC.names,by.x="SCC",by.y="SCC")

# now we total up the emissions by year
total.em <- tapply(coal.data$Emissions,coal.data$year,sum)

# Step 2: Plotting the data for total coal emissions
png(filename ="./Project 2/Plot4a.png",width=580,height=580,units="px")
barplot(total.em,main="Total US Coal PM2.5 Emissions by Year",xlab="Year",ylab="Total Emissions (tons)")
dev.off()


# Step 3: Plotting the data for coal emissions sector composition
coal.data$EI.Sector <- factor(coal.data$EI.Sector)
coal.data$year <- factor(coal.data$year)

png(filename ="./Project 2/Plot4b.png",width=580,height=580,units="px")

g <- ggplot(coal.data,aes(x=year,y=Emissions,fill=EI.Sector)) + geom_bar(stat="identity",position=position_dodge())
g <- g + ggtitle("US Coal Emissions 1999-2008 by Coal EI Sector") + ylab("Total Emissions")

print(g)
dev.off()

