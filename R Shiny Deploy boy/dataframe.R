data1 <- read.csv('WHO20152.csv', header = TRUE)

ggplot(data=data1, aes(x=Life.expectancy, y=Schooling))+
  geom_line()

ggplot(data1,aes(Life.expectancy, Schooling)) +
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm', formula= y~x)

ggplot(data1,aes(x = Life.expectancy, y = GDP)) +
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm', formula= y~x) + 
  geom_line(aes(y = Schooling), color="green") 

ggplot(data1,aes(x = Schooling, y = GDP)) +
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm', formula= y~x) + 
  geom_line(aes(y = GDP), color="red") 

attach(data1)
plot(Life.expectancy, GDP, main="Life expectancy vs GDP",
     xlab="Life expectancy ", ylab="GDP per capita ", pch=20)

##works ^

 smoke <- matrix(c(51,43,22,92,28,21,68,22,9),ncol=3,byrow=TRUE)
 colnames(smoke) <- c("High","Low","Middle")
 rownames(smoke) <- c("current","former","never")
 smoke <- as.table(smoke)
 smoke

 plot(smoke,main="Smoking Status By Socioeconomic Status")
 

###works