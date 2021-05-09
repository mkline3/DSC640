#importing needed files
library(ggplot2)
library(tidyr)
library(dplyr)

#reading csv

df <- read.csv("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex4-2/crimerates-by-state-2005.csv")

#removing united states column

df <- subset(df, state != "United States")


#scatter plot
ggplot(df, aes(x=aggravated_assault, y=motor_vehicle_theft)) + geom_point() + ggtitle("Aggravated Assault vs Motor Vehicle Theft")

#density plot
ggplot(df, aes(x=aggravated_assault, y=motor_vehicle_theft))+ geom_bin2d(bins = 70) + scale_fill_continuous(type = "viridis") + theme_bw()+ ggtitle("Aggravated Assault vs Motor Vehicle Theft")

ggplot(df, aes(x=aggravated_assault))+ geom_density()

#bubble chart

ggplot(df, aes(x=population,y=larceny_theft, size=population, color=state)) + geom_point(alpha=0.5) + scale_size(range=c(0.1,20))
