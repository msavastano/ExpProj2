library(ggplot2)
NEI <- readRDS("proj2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))
NEI <- transform(NEI, type = factor(type))
NEI <- transform(NEI, Pollutant = factor(Pollutant))

SCC <- readRDS("proj2/Source_Classification_Code.rds")

baltPM<-subset(NEI, fips == 24510)
baseplot=ggplot(baltPM, aes(year, Emissions))
baseplot + geom_boxplot(aes(color = type),size = 1)   + ggtitle("Baltimore City Emissions by Type") + coord_cartesian(ylim = c(0, 100))


dev.copy(png, file = "plot1A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
