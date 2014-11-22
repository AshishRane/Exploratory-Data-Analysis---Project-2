#### Coursera - Data Science Specialization Course
#### "Exploratory Data Analysis" - Week 3 -> Project 2 -> Plot 1
#### Date: 21 Nov 2014
#### Author: Ashish Rane

#Set the working directory to the location of your data files
#Read the Data files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Generate data for plotting
plot1 <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

#Create Plot 1

png('Plot1.png', width=480, height=480)
plot(plot1$year, plot1$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions")

dev.off()

############################ End of Script ###################################