NEI <- readRDS("eda2/summarySCC_PM25.rds")
SCC <- readRDS("eda2/Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")


coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCC.coal <- NEISCC[coalMatches, ]

EmissionsByYear.coal <- aggregate(Emissions ~ year, NEISCC.coal, sum)
range(EmissionsByYear.coal)

bplot <- barplot(height=EmissionsByYear.coal$Emissions, names.arg=EmissionsByYear.coal$year, xlab="years", ylab="Total Emissions",main="Total PM2.5 emissions at various years for Coal all of USA",ylim=c(0,700000))

text(x = bplot, y = round(EmissionsByYear.coal$Emissions,2), label = round(EmissionsByYear.coal$Emissions,2), pos = 3, cex = 0.8, col = "black")
bplot

dev.copy(png, file="eda2/Plot4.png")
dev.off()