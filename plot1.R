NEI <- readRDS("proj2/summarySCC_PM25.rds")
SCC <- readRDS("proj2/Source_Classification_Code.rds")
boxplot(Emissions ~ year, NEI, xlab = "Year", ylab = "Emissions", main="Total Emissions", outline=F)

dev.copy(png, file = "plot1A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
