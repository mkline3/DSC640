#importing needed files
library("readxl")
library(ggplot2)
library(tidyr)
library(dplyr)

#reading in a data set from the sample data set
winners <- read_excel("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex1-2/hotdog-contest-winners.xlsm",1)

#change column names to be used 
colnames(winners)<- c("Year","Winner","Dogs_Eaten","Country","New_Record")

#barplot
ggplot(winners, aes( x =Winner, y = Dogs_Eaten)) + geom_bar(stat="identity")+scale_x_discrete(guide = guide_axis(n.dodge=5)) #had to add dodge to prevent overlap

#stacked bar

by_winner <- table(winners$Winner, winners$Dogs_Eaten)

barplot(by_winner, col=colors(), legend=rownames(by_winner), args.legend= list(x = ncol(by_winner) +3, y=max(colSums(by_winner)), bty="n"))

#pie chart

country = table(winners$Country)
country <- as.data.frame(country)
country$precent <- round(100*country$Freq/sum(country$Freq),digits=1)
country$label <- paste(country$Var1, " (",country$precent,"%)", sep="")
pie(country$Freq, labels=country$label, main="Pie chart of Winners by country")

#donut
country$fraction <- country$Freq / sum(country$Freq)
country$ymax <- cumsum(country$fraction)
country$ymin <- c(0, head(country$ymax, n=-1))
ggplot(country, aes(ymax=ymax,ymin=ymin,xmax=5, xmin=4, fill=Var1)) + geom_rect() + coord_polar(theta="y") +xlim(c(3,5))

