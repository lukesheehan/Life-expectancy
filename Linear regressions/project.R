install.packages(c("tidyverse", "reshape2", "gridExtra", "ggplot2", "ggthemes", "scales", "dplyr", "mice", "randomForest"))
install.packages("Amelia")
library(tidyverse)
library(gridExtra)
library(reshape2)
library(ggplot2)
library(ggthemes)
library(scales)
library(dplyr)
library(mice)
library(randomForest)
library(Amelia)

 
LifeExp <- read_csv('Life Expectancy Data.csv')
Social <- read_csv('2015.csv')
Life2015 <- LifeExp %>% 
       filter(Year == 2015)


write.table(Life2015, file="Life2015.csv", sep=",")


Social[,-c(3,4)] -> SocialRemoved

merge(Life2015,SocialRemoved) -> Merge1

Merge1[,-c(7,8)] -> Merge1
Merge1[,-c(12)] -> Merge1
#https://www.listendata.com/2015/06/r-keep-drop-columns-from-data-frame.html

#renaming
Merge1 <- Merge1 %>% 
      drop_na() %>% 
      rename('Lifeexpectancy'='Life expectancy',
               'GDPpercap'='Economy (GDP per Capita)',
             'Happiness'='Dystopia Residual') %>% 
      filter(!is.na(Lifeexpectancy), !is.na(GDPpercap), !is.na(Happiness))
 head(Merge1)

 #https://www.kaggle.com/hkhouli/r-who-life-expectancy
 
avg_lifexp = mean(Merge1$Lifeexpectancy)
avg_gdp = mean(Merge1$GDPpercap)
plot(avg_lifexp,avg_gdp)
#https://www.statmethods.net/management/merging.html

attach(Merge1)
plot(Lifeexpectancy, GDPpercap, main="Life expectancy vs GDP",
     xlab="Life expectancy ", ylab="GDP per capita ", pch=20)

attach(merge1)
plot(Lifeexpectancy, Freedom, main="Life expectancy vs Freedom",
     xlab="Life expectancy ", ylab="Freedom ", pch=20)
#https://www.statmethods.net/graphs/scatterplot.html

attach(Life)
plot(Life.expectancy, GDP, main="Life expectancy vs Happiness",
     xlab="Life expectancy ", ylab="Regions", pch=20)
x <- Life[order(Life$Life.expectancy),] # sort by mpg
x$Region <- factor(x$Region) # it must be a factor
x$color[x$Region=='Western Europe'] <- "yellow"
x$color[x$Region=='North America'] <- "black"
x$color[x$Region=='Latin America and Caribbean'] <- "purple"
x$color[x$Region=='Australia and New Zealand'] <- "deepskyblue"
x$color[x$Region=='Eastern Asia'] <- "magenta"
x$color[x$Region=='Central and Eastern Europe'] <- "blue"
x$color[x$Region=='Middle East and Northern Africa'] <- "dark green"
x$color[x$Region=='Southeastern Asia'] <- "orange"
x$color[x$Region=='Southern Asia'] <- "red"
x$color[x$Region=='Sub-Saharan Africa'] <- "brown"
dotchart(x$Life.expectancy,labels=row.names(x),cex=.7,groups= x$Region,
         main="Life expectancy of countries grouped by region",
         xlab="Life expectancy", gcolor="black", color=x$color)

#https://www.statmethods.net/graphs/dot.html