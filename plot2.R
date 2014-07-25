NEI <- readRDS("proj2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))
NEI <- transform(NEI, type = factor(type))
NEI <- transform(NEI, Pollutant = factor(Pollutant))

SCC <- readRDS("proj2/Source_Classification_Code.rds")


baltPM<-subset(NEI, fips == 24510)
boxplot(Emissions ~ year, baltPM, xlab = "Year", ylab = "Emissions", main="Baltimore City Emissions",outline=F, range=.5)

dev.copy(png, file = "plot1A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
