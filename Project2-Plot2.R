NEI <- readRDS("eda2/summarySCC_PM25.rds")
SCC <- readRDS("eda2/Source_Classification_Code.rds")

NEI.Baltimore <- NEI[NEI$fips=="24510", ]

EmissionsByYear.Baltimore <- aggregate(Emissions ~ year, NEI.Baltimore, sum)
range(EmissionsByYear.Baltimore$Emissions)

bplot <- barplot(height=EmissionsByYear.Baltimore$Emissions, names.arg=EmissionsByYear.Baltimore$year, xlab="years", ylab="Total Emission",main="Total PM2.5 Emissions By Year in Baltimore",ylim=c(0,4000))

text(x = bplot, y = round(EmissionsByYear.Baltimore$Emissions,2), label = round(EmissionsByYear.Baltimore$Emissions,2), pos = 3, cex = 0.8, col = "black")
bplot

dev.copy(png, file="eda2/Plot2.png")
dev.off()