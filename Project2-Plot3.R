library(ggplot2)
NEI <- readRDS("eda2/summarySCC_PM25.rds")
SCC <- readRDS("eda2/Source_Classification_Code.rds")

NEI.Baltimore <- NEI[NEI$fips=="24510", ]
NEI.Baltimore$type <- as.factor(NEI.Baltimore$type)

summary(NEI.Baltimore$type)

EmissionsByYearandType.Baltimore <- aggregate(Emissions ~ year + type , NEI.Baltimore, sum)

ggplot(EmissionsByYearandType.Baltimore, aes(x=factor(year), y=Emissions, fill = year ,label = round(Emissions,2))) +
 facet_grid(. ~ type) +
 geom_bar(stat="identity", width = 0.3)	+
 xlab("Year") + 
 ylab("Total Emissions") +
 ggtitle("Total PM2.5 Emissions in Baltimore, MD all sources")+
 theme(legend.position = "none")

dev.copy(png, file="eda2/Plot3.png")
dev.off()