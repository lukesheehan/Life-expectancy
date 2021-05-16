library(tidyverse)
install.packages("tidyverse")
##fixing file
df_LifeGDP <- read.csv('Life2015changed.csv', sep = ",")

GDP <- read.csv('GDP per capita PPP 2011 – WDI (2016).csv', sep = ",")

GDP2 <- GDP %>% 
  filter(Year == 2014)

###rename column name
colnames(GDP2)

names(GDP2)[names(GDP2) == "Entity"] <- "Country"

###merge data sets
merge1 <- merge(GDP2,df_LifeGDP,by="Country")

##getting rid of inaccurate columns

merge1[,-c(9,10,16,19)] -> merge1
merge1[,-c(2)] -> merge1

##renaming gdp column
colnames(merge1)
names(merge1)[names(merge1) == "GDP.per.capita.PPP.2011.â...WDI..2016."] <- "GDP"
names(merge1)[names(merge1) == "Year.y"] <- "Year"
