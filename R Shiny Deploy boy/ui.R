library(shiny)

ui <- fluidPage( 
  fluidRow(
    column(width = 6,
           plotOutput("plot2", height = 350,),
           plotOutput("plot1", height = 350,)
    ),
  )
)