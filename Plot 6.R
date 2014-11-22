#### Coursera - Data Science Specialization Course
#### "Exploratory Data Analysis" - Week 3 -> Project 2 -> Plot 6
#### Date: 22 Nov 2014
#### Author: Ashish Rane

#Set the working directory to the location of your data files
#Read the Data files

NEI <- readRDS("summarySCC_PM25.rds")
SouRCC <- readRDS("Source_Classification_Code.rds")

#Import library

library(ggplot2)

#Generate data for plotting

mv <- grep("vehicle",SouRCC$EI.Sector,value=T,ignore.case=T)
SouRCC.mv <- subset(SouRCC, SRC$EI.Sector %in% mv, select=SCC)
BalCity.LA <- subset(NEI, fips == "24510"|fips == "06037")
NEI.mv <- subset(BalCity.LA, BalCity.LA$SCC %in% SouRCC.mv$SCC)
plotdata <- aggregate(NEI.mv[c("Emissions")], list(fips = NEI.mv$fips, year = NEI.mv$year), sum)
plotdata$city <- rep(NA, nrow(plotdata))
plotdata[plotdata$fips == "06037", ][, "city"] <- "Los Angles County"
plotdata[plotdata$fips == "24510", ][, "city"] <- "Baltimore City"


#Create Plot 6 to compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California
png('Plot6.png', width=480, height=480)

pp6 <- ggplot(plotdata, aes(x=year, y=Emissions, colour=city)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1, method="loess") +
        ggtitle("Vehicle Emissions in Baltimore City vs. LA")

print(pp6)

dev.off()

############################ End of Script ###################################