#### Coursera - Data Science Specialization Course
#### "Exploratory Data Analysis" - Week 3 -> Project 2 -> Plot 2
#### Date: 21 Nov 2014
#### Author: Ashish Rane

#Set the working directory to the location of your data files
#Read the Data files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Generate data for plotting
BalCity <- subset(NEI, fips == "24510")
plot2 <- aggregate(BalCity[c("Emissions")], list(year = BalCity$year), sum)

#Create Plot 2

png('Plot2.png', width=480, height=480)
plot(plot2$year, plot2$Emissions, type = "l",
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()

############################ End of Script ###################################