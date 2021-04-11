#importing needed files
library("readxl")
library(ggplot2)
library(tidyr)
library(dplyr)

#reading in a data set from the sample data set
pop <- read_excel("C:/Users/Matt Kline/Documents/GitHub/DSC640/ex2-2/world-population.xlsm",1)


ggplot(pop, aes(Year, Population)) +  geom_line() + ggtitle("Line Year vs Population")

ggplot(pop, aes(Year, Population)) +  geom_step() + ggtitle("Step Year vs Population")
