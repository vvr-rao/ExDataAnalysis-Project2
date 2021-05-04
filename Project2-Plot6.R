NEI <- readRDS("eda2/summarySCC_PM25.rds")
SCC <- readRDS("eda2/Source_Classification_Code.rds")

NEI.Baltimore.LA.OnRoad <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
str(NEI.Baltimore.LA.OnRoad$fips)


NEI.Baltimore.LA.OnRoad$fips[NEI.Baltimore.LA.OnRoad$fips=="24510"] <- "Baltimore"
NEI.Baltimore.LA.OnRoad$fips[NEI.Baltimore.LA.OnRoad$fips=="06037"] <- "Los Angeles"

NEI.Baltimore.LA.OnRoad$fips <- as.factor(NEI.Baltimore.LA.OnRoad$fips)
summary(NEI.Baltimore.LA.OnRoad$fips)

EmissionsByYearandLocation.Baltimore.LA <- aggregate(Emissions ~ year + fips , NEI.Baltimore.LA.OnRoad, sum)

ggplot(NEI.Baltimore.LA.OnRoad, aes(x=factor(fips), y=Emissions, fill = fips ,label = round(Emissions,2))) +
 facet_grid(. ~ year) +
 geom_bar(stat="identity", width = 0.3)	+
 xlab("Year") + 
 ylab("Total Emissions") +
 ggtitle("Total PM2.5 emissions in Baltimore and LA - Motor Vehicles")+
 theme(legend.position = "none")

dev.copy(png, file="eda2/Plot6.png")
dev.off()