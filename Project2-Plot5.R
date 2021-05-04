NEI <- readRDS("eda2/summarySCC_PM25.rds")
SCC <- readRDS("eda2/Source_Classification_Code.rds")

NEI.Baltimore.OnRoad <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]

EmissionsByYear.BaltimoreMotorVeh <- aggregate(Emissions ~ year, NEI.Baltimore.OnRoad, sum)
range(EmissionsByYear.BaltimoreMotorVeh$Emissions)

bplot <- barplot(height=EmissionsByYear.BaltimoreMotorVeh$Emissions, names.arg=EmissionsByYear.BaltimoreMotorVeh$year, xlab="years", ylab="Total PM2.5 emission",main="Total PM2.5 emissions at various years in Baltimore from Motor Vehicles",ylim=c(0,400))

text(x = bplot, y = round(EmissionsByYear.BaltimoreMotorVeh$Emissions,2), label = round(EmissionsByYear.BaltimoreMotorVeh$Emissions,2), pos = 3, cex = 0.8, col = "black")
bplot

dev.copy(png, file="eda2/Plot5.png")
dev.off()