# Set the working directory
setwd("/Users/jessefish/coursera/coursera-exploratory-data-analysis")

# Load in summarySCC_PM25.rds and Source_Classification_Code.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Grab the Baltimore fips metric
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Perform the agg 
agg <- aggregate(Emissions ~ year, baltimoreNEI,sum)

# Create plot2.png - a bar chart
png("plot2.png",width=480,height=480,units="px",bg="transparent")
barplot(agg$Emissions,names.arg=agg$year,xlab="Year",ylab="PM2.5 Emissions (Tons) for Baltimore",main="Total PM2.5 Emissions for Baltimore 1999-2008")

dev.off()