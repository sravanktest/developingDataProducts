#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(navbarPage("",
  tabPanel("Application",
  # Application title
  titlePanel("Wage data - Random Forest Prediction model"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("folds",
                   "Number of folds for Random Forest Cross validation:",
                   min = 2,
                   max = 5,
                   value = 2)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Model"),
      verbatimTextOutput("printModel"),
      h2("Final Model"),
      verbatimTextOutput("printFinalModel")
      
    )
  )
  ),
  tabPanel("Documentaion",
           mainPanel(
             includeMarkdown("AboutApp.Rmd")
           )
      )
))
