#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  tabPanel("Answer",
  fluidPage(
  
  # Application title
  titlePanel("Relation between different values of cars"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "First Variable:",
                  c("choose from menu" = "",
                    "Distance (cu.in.)" = "dist",
                    "horsepower" = "hp",
                    "speed" = "sp",
                    "Weight" = "wt",
                    "Transmission" = "am"
                    )),

      selectInput("variable", "Second Variable:",
                  c("choose from menu" = "",
                    "Distance (cu.in.)" = "dist",
                    "horsepower" = "hp",
                    "speed" = "sp",
                    "Weight" = "wt",
                    "Transmission" = "am"
                  ))
    ),

    
    mainPanel(
      h3(textOutput("Relation between variables")),
      
      tabsetPanel(type = "tabs", 
                  tabPanel("BoxPlot", plotOutput("modelBoxPlot")),
                  tabPanel("model", 
                           plotOutput("modelPlot"),
                           verbatimTextOutput("fit")
                  ),
                  tabPanel("explanation of Assignment", 
                           plotOutput("explain"),
                           verbatimTextOutput("fit")
                  )
      )
  )
  )
  )
))
