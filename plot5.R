library(ggplot2)
NEI <- readRDS("proj2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))
NEI <- transform(NEI, type = factor(type))
NEI <- transform(NEI, Pollutant = factor(Pollutant))
NEI <- transform(NEI, SCC = factor(SCC))
baltPM<-subset(NEI, fips == 24510)
tr=grepl("^Mobile - On-Road",SCC$EI.Sector)
SCC <- readRDS("proj2/Source_Classification_Code.rds")
levels(SCC$EI.Sector)

ei=subset(SCC, tr)
sccfactors=ei$SCC

sub = subset(baltPM, SCC %in% sccfactors)
baseplot=ggplot(sub, aes(year, Emissions))
baseplot + geom_boxplot(size = 1, alpha = 1/2)  + coord_cartesian(ylim = c(0, 5)) + 
  ggtitle("Auto Emissions Baltimore City") + xlab("Year") + ylab("Auto Emissions") 

dev.copy(png, file = "plot1A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device
