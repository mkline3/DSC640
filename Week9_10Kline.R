#importing needed files
library(ggplot2)
library(tidyr)
library(dplyr)

#reading csv

nba <- read.csv("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex5-2/ppg2008.csv")

costco <- read.csv("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex5-2/costcos-geocoded.csv")

df1 <- data.frame(nba[,-1], row.names = nba[,1])

#heat map
heatmap(as.matrix(df1), scale="column",col=heat.colors(256),main="Stats per player",Rowv=NA, Colv=NA)


#contour map

ggplot(data=nba, aes(x=PTS, y=MIN)) +
  ylim(15,50) + theme_bw()+
  geom_point(alpha=0.1, col="red") + 
  geom_density2d(color="black") +
  ggtitle("Contour plot") +
  theme(plot.title = element_text(hjust=0.5)) +
  labs(x="Points", y="Minutes")


#maps
library(maps)
library(mapdata)
usa <- map_data("usa")

cost <- costco[costco$Longitude > -130,]

gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = "red", color = "blue") + 
  coord_fixed(1.3)
gg1 + 
  geom_point(data=cost, aes(x=Longitude,y=Latitude), color="black",size=2)+
  geom_point(data=cost, aes(x=Longitude,y=Latitude), color="yellow",size=1)+
  ggtitle("Costco Locations in USA")
