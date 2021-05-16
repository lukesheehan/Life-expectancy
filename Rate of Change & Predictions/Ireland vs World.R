###packages used ###

install.packages("readr")
library(readr)

install.packages("gcookbook")
library(gcookbook)

install.packages("ggplot2")
library(ggplot2)

install.packages("tidyverse")
library("tidyverse")

install.packages("Hmisc")
library("Hmisc")



## creating dataframe from csv file

Life <- read_csv('Life Expectancy Data.csv') 


#######variables##################







### Ireland. I am calculating the total years of life expectancy for each year


Ireland2015 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2015"),4])
Ireland2014 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2014"),4])
Ireland2013 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2013"),4])
Ireland2012 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2012"),4])
Ireland2011 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2011"),4])
Ireland2010 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2010"),4])
Ireland2009 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2009"),4])
Ireland2008 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2008"),4])
Ireland2007 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2007"),4])
Ireland2006 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2006"),4])
Ireland2005 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2005"),4])
Ireland2004 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2004"),4])
Ireland2003 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2003"),4])
Ireland2002 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2002"),4])
Ireland2001 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2001"),4])
Ireland2000 = sum(Life[which(Life[,1]=="Ireland" & Life[,2]=="2000"),4])


#####Rest of world###

###calculating total countries in my data set

TotalDeveloped = sum((Life$Status=="Developing") & (Life$Year == "2006"), na.rm=TRUE)
TotalDeveloping = sum((Life$Status=="Developed") & (Life$Year == "2006"), na.rm=TRUE)

TotalCountries = sum(TotalDeveloped + TotalDeveloping)


World2015 = sum(Life[which(Life[,2]=="2015"),4])
World2014 = sum(Life[which(Life[,2]=="2014"),4])
World2013 = sum(Life[which(Life[,2]=="2013"),4], na.rm=TRUE)
World2012 = sum(Life[which(Life[,2]=="2012"),4])
World2011 = sum(Life[which(Life[,2]=="2011"),4])
World2010 = sum(Life[which(Life[,2]=="2010"),4])
World2009 = sum(Life[which(Life[,2]=="2009"),4])
World2008 = sum(Life[which(Life[,2]=="2008"),4])
World2007 = sum(Life[which(Life[,2]=="2007"),4])
World2006 = sum(Life[which(Life[,2]=="2006"),4])
World2005 = sum(Life[which(Life[,2]=="2005"),4])
World2004 = sum(Life[which(Life[,2]=="2004"),4])
World2003 = sum(Life[which(Life[,2]=="2003"),4])
World2002 = sum(Life[which(Life[,2]=="2002"),4])
World2001 = sum(Life[which(Life[,2]=="2001"),4])
World2000 = sum(Life[which(Life[,2]=="2000"),4])




###averages for the world

AvgWorld2015 = sum(World2015/TotalCountries)
AvgWorld2014 = sum(World2014/TotalCountries)
AvgWorld2013 = sum(World2013/TotalCountries)
AvgWorld2012 = sum(World2012/TotalCountries)
AvgWorld2011 = sum(World2011/TotalCountries)
AvgWorld2010 = sum(World2010/TotalCountries)
AvgWorld2009 = sum(World2009/TotalCountries)
AvgWorld2008 = sum(World2008/TotalCountries)
AvgWorld2007 = sum(World2007/TotalCountries)
AvgWorld2006 = sum(World2006/TotalCountries)
AvgWorld2005 = sum(World2005/TotalCountries)
AvgWorld2004 = sum(World2004/TotalCountries)
AvgWorld2003 = sum(World2003/TotalCountries)
AvgWorld2002 = sum(World2002/TotalCountries)
AvgWorld2001 = sum(World2001/TotalCountries)
AvgWorld2000 = sum(World2000/TotalCountries)



###vectors##


irelandvector <- c(Ireland2000,Ireland2001,Ireland2002,Ireland2003,
                   Ireland2004,Ireland2005,Ireland2006,Ireland2007,
                   Ireland2008,Ireland2009,Ireland2010,Ireland2011,
                   Ireland2012,Ireland2013,Ireland2014,Ireland2015) 


worldvector <- c(AvgWorld2000,AvgWorld2001,AvgWorld2002,AvgWorld2003,
                 AvgWorld2004,AvgWorld2005,AvgWorld2006,AvgWorld2007,
                 AvgWorld2008,AvgWorld2009,AvgWorld2010,AvgWorld2011,
                 AvgWorld2012,AvgWorld2013,AvgWorld2014,AvgWorld2015) 


####plots###
### plotting life expectancy for Ireland


plot(irelandvector,type = "o", col = "red", xlab = "Year", ylab = "Life Expectancy",
     main = "Ireland Life Expectancy",xaxt='n')

### adding a year label on the x axis
lablist<-as.vector(c(2000:2015))
axis(1, at=seq(1, 16, by=1), labels = FALSE)
text(seq(1, 16, by=1), par("usr")[3] - 0.2, labels = lablist, srt = 45, pos = 1, xpd = TRUE)


##same for world

plot(worldvector,type = "o", col = "red", xlab = "Year", ylab = "Life Expectancy",
     main = "World Life Expectancy",xaxt='n')


lablist<-as.vector(c(2000:2015))
axis(1, at=seq(1, 16, by=1), labels = FALSE)
text(seq(1, 16, by=1), par("usr")[3] - 0.2, labels = lablist, srt = 45, pos = 1, xpd = TRUE)


##creating a table for more plots


#table 


###creating a new table with years
table2 <- matrix(c(2000,Ireland2000,AvgWorld2000,2001,Ireland2001,AvgWorld2001,2002,Ireland2002,AvgWorld2002,2003,Ireland2003,AvgWorld2003,2004,Ireland2004,AvgWorld2004,
                   2005,Ireland2005,AvgWorld2005,2006,Ireland2006,AvgWorld2006,2007,Ireland2007, AvgWorld2007,
                   2008,Ireland2008,AvgWorld2008,2009,Ireland2009, AvgWorld2009,2010,Ireland2010,AvgWorld2010,
                   2011,Ireland2011,AvgWorld2011,2012,Ireland2012,AvgWorld2012,2013,Ireland2013,AvgWorld2013,
                   2014,Ireland2014,AvgWorld2014,2015,Ireland2015,AvgWorld2015
),ncol=3,byrow=TRUE)
colnames(table2) <- c("Year","Ireland","World")
rownames(table2) <- c("2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015")
table2 <- as.table(table2)
table2


dataframe2 <- as.data.frame.matrix(table2)  


### new plot of life expectancy for Ireland
ggplot(data = dataframe2, aes(x = Year, y = Ireland))+
  geom_line()

##new plot for world
ggplot(data = dataframe2, aes(x = Year, y = World))+
  geom_line()

colors <- c("World" = "blue", "Ireland" = "darkred")

###plotting both Ireland and world
ggplot(dataframe2, aes(x=Year,y =Life-Expectancy)) + 
  geom_line(aes(y = Ireland), color = "darkred") + 
  geom_line(aes(y = World), color="steelblue") 


##same plot with legend
ggplot(dataframe2, aes(x = Year)) +
  geom_line(aes(y = Ireland, color = "Ireland"), size = 1) +
  geom_line(aes(y = World, color = "World"), size = 1) +
  labs(x = "Year",
       y = "Life-Expectancy",
       color = "Legend") +
  scale_color_manual(values = colors)


## same plot differenet line
ggplot(dataframe2, aes(x=Year)) + 
  geom_line(aes(y = Ireland), color = "darkred") + 
  geom_line(aes(y = World), color="steelblue") 




##rate of change


### calculating the sum of the difference in the y values (life expectancy between years)
## this is to calculate the average growth from year to year
TotalIreland = sum((Ireland2001-Ireland2000)+(Ireland2002-Ireland2001)+(Ireland2003-Ireland2002)+(Ireland2004-Ireland2003)+
                     (Ireland2005-Ireland2004)+(Ireland2006-Ireland2005)+(Ireland2007-Ireland2006)+(Ireland2008-Ireland2007)
                   +(Ireland2009-Ireland2008)+(Ireland2010-Ireland2009)+(Ireland2011-Ireland2010)+(Ireland2012-Ireland2011)
                   +(Ireland2013-Ireland2012)+(Ireland2014-Ireland2013)+(Ireland2015-Ireland2014))


##dividing vector by total number of differences  i looked at (15)
AvgrateofchangeIreland = TotalIreland/15

###same for rest of the world
TotalWorld = sum((AvgWorld2001-AvgWorld2000)+(AvgWorld2002-AvgWorld2001)+(AvgWorld2003-AvgWorld2002)+
                   (AvgWorld2004-AvgWorld2003)+(AvgWorld2005-AvgWorld2004)+(AvgWorld2006-AvgWorld2005)+
                   (AvgWorld2007-AvgWorld2006)+(AvgWorld2008-AvgWorld2007)+(AvgWorld2009-AvgWorld2008)+
                   (AvgWorld2010-AvgWorld2009)+(AvgWorld2011-AvgWorld2010)+(AvgWorld2012-AvgWorld2011)+
                   (AvgWorld2013-AvgWorld2012)+(AvgWorld2014-AvgWorld2013)+(AvgWorld2015-AvgWorld2014))

AvgrateofchangeWorld = TotalWorld/15

##best fit line
###adding a best fit line to plot to show slope better

ggplot(dataframe2,aes(x = Year, y = Ireland)) +
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm', formula= y~x) + 
  geom_line(aes(y = Ireland), color="green") 

ggplot(dataframe2,aes(x = Year, y = World)) +
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm', formula= y~x) + 
  geom_line(aes(y = World), color="red") 


###########predictions###

Ireland2016 = sum(Ireland2015+AvgrateofchangeIreland)
Ireland2017 = sum(Ireland2016+AvgrateofchangeIreland)
Ireland2018 = sum(Ireland2017+AvgrateofchangeIreland)
Ireland2019 = sum(Ireland2018+AvgrateofchangeIreland)
Ireland2020 = sum(Ireland2019+AvgrateofchangeIreland)
Ireland2021 = sum(Ireland2020+AvgrateofchangeIreland)
Ireland2022 = sum(Ireland2021+AvgrateofchangeIreland)
Ireland2023 = sum(Ireland2022+AvgrateofchangeIreland)
Ireland2024 = sum(Ireland2023+AvgrateofchangeIreland)
Ireland2025 = sum(Ireland2024+AvgrateofchangeIreland)

Ireland2026 = sum(Ireland2025+AvgrateofchangeIreland)
Ireland2027 = sum(Ireland2026+AvgrateofchangeIreland)
Ireland2028 = sum(Ireland2027+AvgrateofchangeIreland)
Ireland2029 = sum(Ireland2028+AvgrateofchangeIreland)
Ireland2030 = sum(Ireland2029+AvgrateofchangeIreland)

###rest of world predictions

AvgWorld2016 = sum(AvgWorld2015+AvgrateofchangeWorld)
AvgWorld2017 = sum(AvgWorld2016+AvgrateofchangeWorld)
AvgWorld2018 = sum(AvgWorld2017+AvgrateofchangeWorld)
AvgWorld2019 = sum(AvgWorld2018+AvgrateofchangeWorld)
AvgWorld2020 = sum(AvgWorld2019+AvgrateofchangeWorld)
AvgWorld2021 = sum(AvgWorld2020+AvgrateofchangeWorld)
AvgWorld2022 = sum(AvgWorld2021+AvgrateofchangeWorld)
AvgWorld2023 = sum(AvgWorld2022+AvgrateofchangeWorld)
AvgWorld2024 = sum(AvgWorld2023+AvgrateofchangeWorld)
AvgWorld2025 = sum(AvgWorld2024+AvgrateofchangeWorld)

AvgWorld2026 = sum(AvgWorld2025+AvgrateofchangeWorld)
AvgWorld2027 = sum(AvgWorld2026+AvgrateofchangeWorld)
AvgWorld2028 = sum(AvgWorld2027+AvgrateofchangeWorld)
AvgWorld2029 = sum(AvgWorld2028+AvgrateofchangeWorld)
AvgWorld2030 = sum(AvgWorld2029+AvgrateofchangeWorld)

####table


tablepredict <- matrix(c(2000,Ireland2000,AvgWorld2000,2001,Ireland2001,AvgWorld2001,2002,Ireland2002,AvgWorld2002,2003,Ireland2003,AvgWorld2003,2004,Ireland2004,AvgWorld2004,
                   2005,Ireland2005,AvgWorld2005,2006,Ireland2006,AvgWorld2006,2007,Ireland2007, AvgWorld2007,
                   2008,Ireland2008,AvgWorld2008,2009,Ireland2009, AvgWorld2009,2010,Ireland2010,AvgWorld2010,
                   2011,Ireland2011,AvgWorld2011,2012,Ireland2012,AvgWorld2012,2013,Ireland2013,AvgWorld2013,
                   2014,Ireland2014,AvgWorld2014,2015,Ireland2015,AvgWorld2015,2016,Ireland2016,AvgWorld2016
                   ,2017,Ireland2017,AvgWorld2017,2018,Ireland2018,AvgWorld2018,2019,Ireland2019,AvgWorld2019
                   ,2020,Ireland2020,AvgWorld2020,2021,Ireland2021,AvgWorld2021,2022,Ireland2022,AvgWorld2022
                   ,2023,Ireland2023,AvgWorld2023,2024,Ireland2024,AvgWorld2024,2025,Ireland2025,AvgWorld2025
                   ,2026,Ireland2026,AvgWorld2026,2027,Ireland2027,AvgWorld2027,2028,Ireland2028,AvgWorld2028
                   ,2029,Ireland2029,AvgWorld2029,2030,Ireland2030,AvgWorld2030
                   
),ncol=3,byrow=TRUE)
colnames(tablepredict) <- c("Year","Ireland","World")
rownames(tablepredict) <- c("2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017",
                            "2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030")
tablepredict <- as.table(tablepredict)
tablepredict



dataframepredict <- as.data.frame.matrix(tablepredict)  

ggplot(dataframepredict, aes(x=Year)) + 
  geom_line(aes(y = Ireland), color = "darkred") + 
  geom_line(aes(y = World), color="steelblue") 

write.csv(dataframepredict,'predictions2.csv', row.names = FALSE)

#average difference

averagedifference = sum((Ireland2000 - AvgWorld2000)+(Ireland2001-AvgWorld2001)+(Ireland2002-AvgWorld2002)
                        +(Ireland2003-AvgWorld2003)+(Ireland2004-AvgWorld2004)+(Ireland2005-AvgWorld2005)
                        +(Ireland2006-AvgWorld2006)+(Ireland2007-AvgWorld2007)+(Ireland2008-AvgWorld2008)
                        +(Ireland2009-AvgWorld2009)+(Ireland2010-AvgWorld2010)+(Ireland2011-AvgWorld2011)
                        +(Ireland2012-AvgWorld2012)+(Ireland2013-AvgWorld2013)+(Ireland2014-AvgWorld2014)
                        +(Ireland2015-AvgWorld2015)) / 16
