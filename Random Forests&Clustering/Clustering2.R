#https://uc-r.github.io/kmeans_clustering
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

df <-read.csv("WHO2015.csv")
df <- na.omit(df)


df2 <- USArrests

df[,-c(1,4,5)] -> df3

df4 <- df3[,-1]
rownames(df4) <- df3[,1]
###changing rownames to countries

df4 <- scale(df4)

distance <- get_dist(df4)
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))
###come back to this with filtered data set

k2 <- kmeans(df4, centers = 2, nstart = 25)

str(k2)

fviz_cluster(k2, data = df4)

k3 <- kmeans(df4, centers = 3, nstart = 25)

str(k3)

fviz_cluster(k3, data = df4)

k4 <- kmeans(df4, centers = 4, nstart = 25)

str(k4)

fviz_cluster(k4, data = df4)

df4 %>%
  as_tibble() %>%
  mutate(cluster = k2$cluster,
         state = row.names(df4)) %>%
  ggplot(aes(Life.expectancy, GDP, color = factor(cluster), label = state)) +
  geom_text()

df4 %>%
  as_tibble() %>%
  mutate(cluster = k4$cluster,
         state = row.names(df4)) %>%
  ggplot(aes(Life.expectancy, GDP, color = factor(cluster), label = state)) +
  geom_text()


df4 %>%
  as_tibble() %>%
  mutate(cluster = k4$cluster,
         state = row.names(df4)) %>%
  ggplot(aes(Life.expectancy, Schooling, color = factor(cluster), label = state)) +
  geom_text()

k3 <- kmeans(df4, centers = 3, nstart = 25)
k4 <- kmeans(df4, centers = 4, nstart = 25)
k5 <- kmeans(df4, centers = 5, nstart = 25)

# plots to compare
p1 <- fviz_cluster(k2, geom = "point", data = df4) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = df4) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = df4) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = df4) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)

##determining optimal clusters

set.seed(123)

# function to compute total within-cluster sum of square 
wss <- function(k) {
  kmeans(df4, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

# extract wss for 2-15 clusters
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

set.seed(123)

fviz_nbclust(df4, kmeans, method = "wss")

# function to compute average silhouette for k clusters
avg_sil <- function(k) {
  km.res <- kmeans(df4, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(df4))
  mean(ss[, 3])
}

# Compute and plot wss for k = 2 to k = 15
k.values <- 2:15

# extract avg silhouette for 2-15 clusters
avg_sil_values <- map_dbl(k.values, avg_sil)

plot(k.values, avg_sil_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Average Silhouettes")

fviz_nbclust(df4, kmeans, method = "silhouette")



set.seed(123)
gap_stat <- clusGap(df4, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
# Print the result
print(gap_stat, method = "firstmax")

fviz_gap_stat(gap_stat)


set.seed(123)
final <- kmeans(df4, 2, nstart = 25)
print(final)

fviz_cluster(final, data = df4)


df4 %>%
  mutate(Cluster = final$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")