library(shiny)


dataset <- read.csv("Advertising.csv")

ui <- fluidPage(
  selectInput(inputId = "advertising_channel",
              label = "Select an advertising channel",
              choices = c("TV", "Radio", "Newspaper")),
  plotOutput("scatterplot")
  
)

server <- function(input, output){
  output$scatterplot <- renderPlot({
    plot(dataset[,input$advertising_channel], dataset$Sales,
         xlab = input$advertising_channel,
         ylab = "Sales",
         main = "Scatterplot between advertising channel and sales")
  })
}
  
shinyApp(ui = ui, server = server) 
  
  