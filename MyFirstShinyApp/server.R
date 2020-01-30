#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
# Define server logic required to draw a histogram
carsData <- mtcars
carsData$am <- factor(carsData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("carsData ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("carsData ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data = carsData)
  })

  output$caption <- renderText({
    formulaText()
  })

  output$modelBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = carsData,
            outline = input$variable)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  
  output$modelPlot <- renderPlot({
    with(carsData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  output$explain <- renderText({
    "This peer assessed assignment has two parts.
     First, you will create a Shiny application and deploy it on Rstudio's servers.
     Second, you will use Slidify or Rstudio Presenter 
     to prepare a reproducible pitch presentation about your application. "
    })
  
  

})
