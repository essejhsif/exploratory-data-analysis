# Set the working directory
setwd("/Users/jessefish/coursera/coursera-exploratory-data-analysis")

# Load in summarySCC_PM25.rds and Source_Classification_Code.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Perform the agg 
agg <- aggregate(Emissions ~ year,NEI, sum)

# Create plot1.png - a bar chart
png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot((agg$Emissions)/10^6,names.arg=aggTotals$year,xlab="Year",ylab="PM2.5 Emissions",main="Total PM2.5 Emissions for US 1999-2008")

dev.off()