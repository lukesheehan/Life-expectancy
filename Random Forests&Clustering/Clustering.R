#https://uc-r.github.io/kmeans_clustering
#https://www.kaggle.com/akan27/clustering-in-r
library(tidyverse)
list.files(path = "../input")

install.packages("cluster")
install.packages("factoextra")
install.packages("tidyverse")

library(cluster) 
library(factoextra)
library(tidyverse)



custData<-read.csv("WHO2015.csv")
head(custData)

which(is.na(as.numeric(as.character(custData[[1]]))))

custData[,-c(2,4,5)] -> custData


custData2 <- custData %>% 
  filter(Year == 2015)




###works###

custData[is.na(custData)] <- 0
##works but is it good?##



write.csv(custData,"non_scaled_custdata.csv")

scaled_custData<-scale(custData)

write.csv(scaled_custData,"scaled_custdata.csv")

custClusters<-kmeans(scaled_custData,4)
custClusters



custClusters$totss
custClusters$tot.withinss
custClusters$betweenss

custClusters$tot.withinss + custClusters$betweenss

custClusters$withinss

sum(custClusters$withinss)

class(custClusters)

custClusters$cluster

custClusters$tot.withinss

k_max<-50 ##too big?
k_max<-20 ##didnt work either

tot_wss<-sapply(1:k_max,function(k){kmeans(scaled_custData,k)$tot.withinss})

between_ss<-sapply(1:k_max,function(k){kmeans(scaled_custData,k)$betweenss})

tot_ss<-sapply(1:k_max,function(k){kmeans(scaled_custData,k)$totss})

plot(1:k_max,tot_wss,
     type = "b",xlab="Number of Clusters",ylab="Total Within SS")

plot(1:k_max,between_ss,
     type = "b",xlab="Number of Clusters",ylab="Between SS")

plot(1:k_max,tot_ss,
     type = "b",xlab="Number of Clusters",ylab="Total SS")

fviz_cluster(custClusters,scaled_custData)

fviz_nbclust(scaled_custData,kmeans,method="wss")