library(ggplot2)
NEI <- readRDS("proj2/summarySCC_PM25.rds")
NEI <- transform(NEI, year = factor(year))
NEI <- transform(NEI, type = factor(type))
NEI <- transform(NEI, Pollutant = factor(Pollutant))
NEI <- transform(NEI, SCC = factor(SCC))

SCC <- readRDS("proj2/Source_Classification_Code.rds")
levels(SCC$EI.Sector)

ei=subset(SCC, EI.Sector == "Fuel Comb - Comm/Institutional - Coal")
sccfactors=ei$SCC

sub = subset(NEI, SCC %in% sccfactors)
baseplot=ggplot(sub, aes(year, Emissions))
baseplot + geom_boxplot(size = 1, alpha = 1/2)  + ggtitle("US Coal Emissions") + coord_cartesian(ylim = c(0, 4)) + ylab("Coal Combustion Emissions") + xlab("Year")

dev.copy(png, file = "plot1A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device
