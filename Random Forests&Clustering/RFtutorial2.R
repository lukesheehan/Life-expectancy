#https://www.r-bloggers.com/2018/01/how-to-implement-random-forests-in-r/

install.packages("randomForest")
library(randomForest)

data1 <- read.csv('Life2015changed.csv', header = TRUE)

##added part##
data1[is.na(data1)] <- 0
##by me##

head(data1)
str(data1)
summary(data1)
head(data1)

str(data1)

summary(data1)

#####part 2

set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]
summary(TrainSet)
summary(ValidSet)

##part 3

model1 <- randomForest(Life.expectancy ~ ., data = TrainSet, importance = TRUE)
model1

##part 4

model2 <- randomForest(Life.expectancy ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)
model2

##part 5

predTrain <- predict(model2, TrainSet, type = "class")

table(predTrain, TrainSet$Life.expectancy)

predValid <- predict(model2, ValidSet, type = "class")

mean(predValid == ValidSet$Life.expectancy)                    
table(predValid,ValidSet$Life.expectancy)

##part 6
importance(model2)        
varImpPlot(model2)

##works well

##part 7
##COLUMN NAMES?
##not sure about a=c
a=c()
i=5
for (i in 3:8) {
  model3 <- randomForest(Life.expectancy ~ ., data = TrainSet, ntree = 500, mtry = i, importance = TRUE)
  predValid <- predict(model3, ValidSet, type = "class")
  a[i-2] = mean(predValid == ValidSet$Life.expectancy)
}

a

plot(3:8,a)

###part 8
install.packages("rpart")
install.packages("caret")
install.packages("e1071")
library(rpart)
library(caret)
library(e1071)

model_dt = train(Life.expectancy ~ ., data = TrainSet, method = "rpart")
model_dt_1 = predict(model_dt, data = TrainSet)
table(model_dt_1, TrainSet$Life.expectancy)
##problems here