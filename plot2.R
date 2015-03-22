plot2 <- function()
{
  #load the NEI
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #load the SCC
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #Filter the data based in fips=24510
  select<-filter(NEI,fips=="24510")
  
  #summary all the emissions per year from all sources
  summOfEmissions <- ddply(select,.(year), summarise,sum(Emissions))
  
  #Create the plot in png file
  png("plot2.png",width = 480, height = 480, bg="transparent")
  plot(summOfEmissions$year,summOfEmissions$..1, type='l', 
       ylab = "Total Emissions", xlab = "Years")
  #close
  dev.off()
}