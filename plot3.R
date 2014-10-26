# Set the working directory
setwd("/Users/jessefish/coursera/coursera-exploratory-data-analysis")

# Load in summarySCC_PM25.rds and Source_Classification_Code.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Grab the Balitmore fips metric
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Perform the agg
agg <- aggregate(Emissions ~ year, baltimoreNEI,sum)

# Create plot3.png using the ggplot2 library
png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)
ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE) +
        facet_grid(.~type,scales = "free",space="free") + labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions for Baltimore 1999-2008"))
print(ggp)

dev.off()