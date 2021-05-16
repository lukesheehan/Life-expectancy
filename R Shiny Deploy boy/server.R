server <- function(input, output) {
  # For storing which rows have been excluded
  ##vals <- reactiveValues(
  ##  keeprows = rep(TRUE, nrow(data1))
  ##)
  data1 <- read.csv('WHO20152.csv', header = TRUE)
  output$plot1 <- renderPlot({
    # Plot the kept and excluded points as two separate data sets
   ## keep    <- data1[ vals$keeprows, , drop = FALSE]
   ## exclude <- data1[!vals$keeprows, , drop = FALSE]
    #data1 <- read.csv('WHO20152.csv', header = TRUE)
    #attach(data1)
    #plot(Life.expectancy, GDP, main="Life expectancy vs GDP",
     #    xlab="Life expectancy ", ylab="GDP per capita ", pch=20)
    
     attach(data1)
     plot(Life.expectancy, Schooling, main="Life expectancy vs Freedom",
          xlab="Life expectancy ", ylab="Freedom ", pch=20)
  })
  
  output$plot2 <- renderPlot({
    # Plot the kept and excluded points as two separate data sets
 ##   keep    <- data1[ vals$keeprows, , drop = FALSE]
 ##   exclude <- data1[!vals$keeprows, , drop = FALSE]
    
    attach(data1)
    plot(Life.expectancy, GDP, main="Life expectancy vs GDP",
         xlab="Life expectancy ", ylab="GDP per capita ", pch=20)
    
  })
  
  
}

#shinyApp(ui, server)