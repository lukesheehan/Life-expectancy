library(caret)
library(dplyr)
library(parallel)
library(doParallel)
library(gbm)
library(earth)
library(fastDummies)
library(mlbench)
library(MLmetrics)
library(tidyverse)


#install.packages('gbm')
#install.packages('fastDummies')
#install.packages('dplyr')

##me
install.packages("doSNOW")

install.packages("doParallel") 

install.packages("doMPI")

install.packages("registerDoParallel")
##me

LifeE <- read_csv('Life2015changed.csv')
##luke
LifeE[is.na(LifeE)] <- 0
##luke missing values

num_cores <- 1 #Find out how many cores you have and give it 2 less than the amount of cores you have ...
##I have 2 , so 0? changed it to 1, the changed to NULL
cluster <- makePSOCKcluster(num_cores)
registerDoParallel(cluster)

###seperate thing
setRepositories()
##seperate thing

# Not used as it is not recommended for RF    LifeE_one_hot <- dummy_cols(LifeE)
# Not used as it is not recommended for RF    LifeE_dummies <- dummy_cols(LifeE, remove_first_dummy = TRUE)



###pick random, i went for 3
set.seed(3)
  train_index <- createDataPartition(
    LifeE$`Life expectancy`, 
    p = 0.75,
    list = FALSE
  )
 ###added comma , removed it
  expectancy_train <- LifeE[train_index,]
  expectancy_test <- LifeE[-train_index,]
  #Dont use for this expectancy_train_one_hot <- LifeE_one_hot[train_index,] 
  #Dont use for this expectancy_test_one_hot <- LifeE_one_hot[-train_index,]
  #Dont use for this expectancy_train_dummies <- LifeE_dummies[train_index,]
  #Dont use for this expectancy_test_dummies <- LifeE_dummies[-train_index,]
  
  
  repeats = 5
  folds = 10
  
  fit_control <- trainControl(
    method = 'repeatedcv',
    number = folds,
    repeats = repeats,
    search = 'random'
  )
  
  ptm <- proc.time() #measure how long it takes
  
 
  
  
  rf_fit <- train(
    `Life expectancy` ~ ., 
    data = expectancy_train,
    method = 'rf',
    metric = 'MAE',
    tuneLength = 40,
    allowParallel = TRUE,
    verbose = FALSE,
    trControl = fit_control
  )
  
  
  random_forest_time <- proc.time() - ptm
  
  
  rf_fit
  
  
  random_forest_predictions <- predict(rf_fit, newdata = expectancy_test)
  random_forest_mae <- MAE(random_forest_predictions, expectancy_test$`Life expectancy`)
  random_forest_mape <- MAPE(random_forest_predictions, expectancy_test$`Life expectancy`)
  
  
  predictions <- predict(rf_fit, newdata = expectancy_train)
  MAE(predictions, expectancy_train$`Life expectancy`)
  
  max(expectancy_test$`Life expectancy`) - min(expectancy_test$`Life expectancy`)
  