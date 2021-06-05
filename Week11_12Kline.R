#importing needed files
library(ggplot2)
library(tidyr)
library(dplyr)
library(plotly)
#reading csv

df <- read.csv("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex6-2/crimeratesbystate-formatted.csv")
#dropping a row to exclude full country
df <- df[df$state != "United States ",]

#histogram
fig <- plot_ly(x=df$murder, type="histogram")
fig

#boxplot
boxplot(df$robbery,data=df,main="Robbery")


#bullet chart
ggplot(df) + geom_bar(aes(state,robbery)) + xlab("States") + ylab("Robbery")

#density
ggplot(df, aes(x=murder))+ geom_density()
