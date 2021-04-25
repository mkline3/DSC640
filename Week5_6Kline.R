#importing needed files
library(ggplot2)
library(tidyr)
library(dplyr)

#reading csv

df <- read.csv("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex3-3/unemployement-rate-1948-2010.csv")

#treemap
library(treemap)

treemap(dtf=df, index=c("Period", "Value"),vSize="Value")


#area chart
ggplot(df, aes(Year, Value)) + geom_area() + ggtitle("Value vs Year")

#stacked area chart
ggplot(df, aes(Year, Value, fill=Period)) + geom_area() + ggtitle("Value vs Year by Period")
