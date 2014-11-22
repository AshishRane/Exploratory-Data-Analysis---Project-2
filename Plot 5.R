#### Coursera - Data Science Specialization Course
#### "Exploratory Data Analysis" - Week 3 -> Project 2 -> Plot 5
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
BalCity <- subset(NEI, fips == "24510")
NEI.mv <- subset(BalCity, BalCity$SCC %in%  SouRCC.mv$SCC)
plotdata <- aggregate(NEI.mv[c("Emissions")], list(year = NEI.mv$year), sum)

#Create Plot 5 to show how total emission from motor vehicle sources changed from 1999-2008 in Baltimore City

png('Plot5.png', width=480, height=480)

plot(plotdata$year, plotdata$Emissions, type = "l", 
     main = "Total Emissions from Motor Vehicle Sources in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()

############################ End of Script ###################################