library(ggplot2)
library(Cairo)   # For nicer ggplot2 output when deployed on Linux



install.packages('rsconnect')
library(rsconnect)



rsconnect::setAccountInfo(name='lukesheehan', token='9E19D3DF3C41DF66AF4D50422D3AB4DD', secret='XUFCCKJSxsUR3falAFG4UQwpuZNzDcmNryA04VEY')

shiny::runApp()

library(rsconnect)
deployApp()