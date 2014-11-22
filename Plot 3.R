#### Coursera - Data Science Specialization Course
#### "Exploratory Data Analysis" - Week 3 -> Project 2 -> Plot 3
#### Date: 21 Nov 2014
#### Author: Ashish Rane

#Set the working directory to the location of your data files
#Read the Data files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Import library

library(ggplot2)

#Generate data for plotting

BalCity <- subset(NEI, fips == "24510")
plot3 <- aggregate(BalCity[c("Emissions")], list(type = BalCity$type, year = BalCity$year), sum)

#Create Plot 3

png('Plot3.png', width=480, height=480)
pl <- ggplot(plot3, aes(x=year, y=Emissions, colour=type)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1, method="loess") +
        ggtitle("Total Emissions by Type in Baltimore City")

print(pl)

dev.off()

############################ End of Script ###################################