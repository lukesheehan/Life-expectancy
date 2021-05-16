install.packages("readr")
library(readr)

install.packages("lmtest")
library(lmtest)

library(tidyverse)


Life<- read_csv("WHO2015.csv")
summary(Life)
boxplot(Life$Life.expectancy,ylab="Happiness Score")
boxplot(Life$`Logged GDP per capita`,ylab="GDP per capita")
boxplot(Life$`Freedom to make life choices`,ylab="Freedom level")
boxplot(Life$`Generosity`,ylab="Generosity Score")

pairs(Life[c('Life.expectancy', 'GDP', 'Schooling', 'HIV.AIDS')])

Happiness<- read_csv("world-happiness-report-2021.csv")

####renaming column

names(Happiness)[names(Happiness) == "Country name"] <- "Country"

##merging
merge1 <- merge(Life,Happiness,by="Country")

Smoking<- read_csv("smoking.csv")

merge2 <- merge(merge1,Smoking,by="Country")


###plots
attach(merge2)
plot(Life.expectancy, totalSmokingRate, main="Life expectancy vs Smoking Rates",
     xlab="Life expectancy ", ylab="Smoking Rates ", pch=20)

attach(merge1)
plot(Life.expectancy, HIV.AIDS, main="Life expectancy vs HIV/AIDS Rates",
     xlab="Life expectancy ", ylab="HIV/AIDS ", pch=20)

attach(merge1)
plot(Life.expectancy, `Ladder score`, main="Life expectancy vs Happiness Score",
     xlab="Life expectancy ", ylab="Happiness Score", pch=20)
##good#

attach(merge1)
plot(Life.expectancy, `Social support`, main="Life expectancy vs Social Support",
     xlab="Life expectancy ", ylab="Social Support", pch=20)

attach(merge1)
plot(Life.expectancy, `Freedom to make life choices`, main="Life expectancy vs Freedom to make life choices",
     xlab="Life expectancy ", ylab="Freedom", pch=20)

attach(merge1)
plot(Life.expectancy, Generosity, main="Life expectancy vs Generosity",
     xlab="Life expectancy ", ylab="Generosity", pch=20)

###out of merge 

attach(Life)
plot(Life.expectancy, GDP, main="Life expectancy vs GDP per capita",
     xlab="Life expectancy ", ylab="GDP per capita", pch=20)

attach(Life)
plot(Life.expectancy, Schooling, main="Life expectancy vs Schooling",
     xlab="Life expectancy ", ylab="Schooling", pch=20)




