plot_1 <- function()
{
  #load the NEI
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #load the SCC
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #summary all the emissions per year from all sources
  summOfEmissions <- ddply(NEI,.(year), summarise,sum(Emissions))
 
  #Create the plot in png file
  png("plot1.png",width = 480, height = 480, bg="transparent")
  plot(summOfEmissions$year,summOfEmissions$..1, type='l', 
       ylab = "Total Emissions", xlab = "Years")
  #close
  dev.off()
}