# Plot 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#Upload a PNG file containing your plot addressing this question.

# Step 0: Data Import
# This assumes the data are in the working directory
NEI <- readRDS("summarySCC_PM25.rds")

# Step 1: Calculating total emissions per year for Baltimore
balt.data <- NEI[NEI$fips==24510,]
total.em <- tapply(balt.data$Emissions,balt.data$year,sum)

# Step 2: Create the bar plot using the base system. There should be a folder called "Project 2" in the working directory to store results.
png(filename ="./Project 2/Plot2.png",width=580,height=580,units="px")
barplot(total.em,main="Total Baltimore City, MD PM2.5 Emissions by Year",xlab="Year",ylab="Total Emissions (tons)")
dev.off()