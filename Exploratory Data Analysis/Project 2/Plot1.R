# Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# Upload a PNG file containing your plot addressing this question.


# To do this we will sum up the emissions by year by source to get total emissions per year.
# Then we will plot the totals using a bar chart
# This assumes the data are in the working directory
NEI <- readRDS("summarySCC_PM25.rds")

# Step 1: Calculating total emissions per year
total.em <- tapply(NEI$Emissions,NEI$year,sum)

# Step 2: Create the bar plot using the base system. There should be a folder called "Project 2" in the working directory to store results.
png(filename ="./Project 2/Plot1.png",width=580,height=580,units="px")
barplot(total.em,main="Total US PM2.5 Emissions by Year",xlab="Year",ylab="Total Emissions (tons)")
dev.off()

# As we can see from the plot, total emissions have decreased from 1999 to 2008 with the largest drops from 1999 to 2002 and 2005 to 2008.




