plot3 <- function()
{
  library(ggplot2)
  
  #load the NEI
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #load the SCC
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #filter the data
  filteredData <- filter(NEI, fips=="24510")
  
  #summary all the emissions per year from all sources
  summOfEmissions <- ddply(filteredData,.(year), summarise,sum(Emissions))
  
  #Create the plot in png file

  ggplot(filteredData, aes(x=type)) + 
    geom_histogram(aes(y = ..density..), color="black", fill=NA) +
    geom_density(color="blue")
  
  ggsave(file="plot3.png")
  #close
  dev.off()
}