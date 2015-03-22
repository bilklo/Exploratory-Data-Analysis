plot5 <- function()
{
  library(ggplot2)
  
  #load the NEI
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #load the SCC
  SCC <- readRDS("Source_Classification_Code.rds")
  

  #Find 
  CoalMain<-as.character(SCC[grep("Automotive",SCC$EI.Sector),1])
  CoalLevelOne<-as.character(SCC[grep("Automotive",SCC$SCC.Level.One),1])
  CoalLevelTwo<-as.character(SCC[grep("Automotive",SCC$SCC.Level.Two),1])
  CoalLevelThree<-as.character(SCC[grep("Automotive",SCC$SCC.Level.Three),1])
  CoalLevelFour<-as.character(SCC[grep("Automotive",SCC$SCC.Level.Four),1])
  CoalLevelShortName <- as.character(SCC[grep("Automotive",SCC$Short.Name),1])
  ids <- c(CoalMain,CoalLevelOne, 
           CoalLevelTwo, CoalLevelThree, 
           CoalLevelFour,CoalLevelShortName)
  unique_ids <- unique(ids)


  data <- merge(NEI,data.frame(unique_ids),
                by.x = "SCC",
                by.y = "unique_ids", 
                all=FALSE)
  
  
  #Create the plot in png file
  png("plot5.png",width = 480, height = 480, bg="transparent")
  boxplot(data$Emissions ~ data$SCC, data=data, 
          xlab="motor vehicle sources", ylab="emissions" )
  #close
  dev.off()
}