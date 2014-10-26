# Set the working directory
setwd("/Users/jessefish/coursera/coursera-exploratory-data-analysis")

# Load in summarySCC_PM25.rds and Source_Classification_Code.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Grab all the coal related data
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combustionCoal <- (combustion & coal)
combustionSCC <- SCC[combustionCoal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

# Create plot4.png using the ggplot2 library
png("plot4.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)
ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) + labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion - US - 1999-2008"))
print(ggp)

dev.off()