# Plot 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# Step 0: Data Import and package loading
# This assumes the data are in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
# ggplot2 is required for the graphs
library(ggplot2)


# Step 1: Prepare Data
balt.data <- NEI[NEI$fips==24510,]
balt.data$type <- factor(balt.data$type)
balt.data$year <- factor(balt.data$year)
           

# Step 2: Create the plot
png(filename ="./Project 2/Plot3.png",width=580,height=580,units="px")

g <- ggplot(balt.data,aes(x=year,y=Emissions,fill=type)) + geom_bar(stat="identity",position=position_dodge())
g <- g + ggtitle("Baltimore Total Emissions 1999-2008 by Source Type") + ylab("Total Emissions")
print(g)
dev.off()