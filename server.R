#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(randomForest)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  data(iris)
  set.seed(555)
  observeEvent(input$folds, {

    rf_model <- train(Species~., data=iris, method="rf",
                  trControl=trainControl(method="cv",number=input$folds),
                  prox=TRUE,allowParallel=TRUE)
    
    output$printModel <- renderPrint({
      print(rf_model)
    })
    
    output$printFinalModel <- renderPrint({
      print(rf_model$finalModel)
    })
  })
  

  
})
