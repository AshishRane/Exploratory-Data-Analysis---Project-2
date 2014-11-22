#### Coursera - Data Science Specialization Course
#### "Exploratory Data Analysis" - Week 3 -> Project 2 -> Plot 4
#### Date: 22 Nov 2014
#### Author: Ashish Rane

#Set the working directory to the location of your data files
#Read the Data files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Import library

library(ggplot2)

#Generate data for plotting

CoalComb = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

#Merge two data sets

merge_data <- merge(x=NEI, y=CoalComb, by='SCC')
Sum_merge_data <- aggregate(merge_data[, 'Emissions'], by=list(merge_data$year), sum)
colnames(Sum_merge_data) <- c('Year', 'Emissions')

#Create Plot 4 to show how emissions from coal combustion-related sources changed from 1999???2008

png('Plot4.png', width=480, height=480)

ggplot(data=Sum_merge_data, aes(x=Year, y=Emissions/1000)) + 
        geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
        ggtitle(expression("Total PM2.5 Coal Combustion Emissions in the US")) + 
        ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
        geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
        theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

dev.off()

############################ End of Script ###################################