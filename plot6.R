# Set the working directory
setwd("/Users/jessefish/coursera/coursera-exploratory-data-analysis")

# Load in summarySCC_PM25.rds and Source_Classification_Code.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Grab the vehicle-related data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Baltimore and Los Angeles fips and combine
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

# Create plot6.png using the ggplot2 library
png("plot6.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)
ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) + geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions for Baltimore and LA - 1999-2008"))

print(ggp)

dev.off()