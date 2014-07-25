library(ggplot2)
library(grid)
library(gridExtra)
NEI <- readRDS("proj2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))
NEI <- transform(NEI, type = factor(type))
NEI <- transform(NEI, Pollutant = factor(Pollutant))
NEI <- transform(NEI, SCC = factor(SCC))
baltPM<-subset(NEI, fips == 24510)
LAPM<-subset(NEI, fips == "06037")

SCC <- readRDS("proj2/Source_Classification_Code.rds")
tr=grepl("^Mobile - On-Road",SCC$EI.Sector)
levels(SCC$EI.Sector)

ei=subset(SCC, tr)
sccfactors=ei$SCC

subla = subset(LAPM, SCC %in% sccfactors)

sub = subset(baltPM, SCC %in% sccfactors)

baseplot=ggplot(sub, aes(year, Emissions)) + geom_boxplot(size = 1, alpha = .5, color="green")  +  coord_cartesian(ylim = c(0, 10)) + ggtitle("Baltimore City")

baseplotla=ggplot(subla, aes(year, Emissions))+ geom_boxplot(size = 1, alpha = .5, color="blue")  + 
  coord_cartesian(ylim = c(0, 100)) + ggtitle("LA")

grid.arrange(baseplotla, baseplot, nrow = 2, main = "Baltimore City and Los Angeles Auto Emissions")
