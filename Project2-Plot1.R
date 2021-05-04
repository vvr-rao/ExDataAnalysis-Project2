NEI <- readRDS("eda2/summarySCC_PM25.rds")
SCC <- readRDS("eda2/Source_Classification_Code.rds")


EmissionsByYear.total <- aggregate(Emissions ~ year, NEI, sum)
range(EmissionsByYear.total$Emissions)

bplot <- barplot(height=EmissionsByYear.total$Emissions, names.arg=EmissionsByYear.total$year, xlab="years", ylab="Total Emission",main="Total PM2.5 Emissions By Year",ylim=c(0,8500000))

text(x = bplot, y = round(EmissionsByYear.total$Emissions,2), label = round(EmissionsByYear.total$Emissions,2), pos = 3, cex = 0.8, col = "black")
bplot

dev.copy(png, file="eda2/Plot1.png")
dev.off()
