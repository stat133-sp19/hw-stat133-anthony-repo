library(shiny)
library(ggplot2)
library(reshape2)


ui <- fluidPage(
   
  titlePanel("Savings Simulation"),
  
  fluidRow(
    
    column(4,
           sliderInput("initial_amount", "Initial Amount", 0, 100000, 1000, step = 500, pre = "$"),
           sliderInput("annual_contribution", "Annual Contribution", 0, 50000, 2000, step = 500, pre = "$")
    ),
    
    column(4,
           sliderInput("return_rate", "Return Rate (in %)", 0, 20, 5, step = 0.1),
           sliderInput("growth_rate", "Growth Rate (in %)", 0, 20, 2, step = 0.1)
    ),
    
    column(4,
           sliderInput("years", "Years", 0, 50, 20, step = 1),
           selectInput("choice", "Facet?", c("Yes", "No"))
           
    )
  ),
  
  titlePanel("Timelines"),
  plotOutput("plot1"),
  titlePanel("Balances"),
  verbatimTextOutput("table")
)


server <- function(input, output) {
  
  dataInput <- reactive({
    amount <- input$initial_amount
    rate <- input$return_rate / 100
    years <- input$years
    contrib <- input$annual_contribution
    growth <- input$growth_rate / 100
 
  
    future_value <- function(amount, rate, years){
      return (amount*(1 + rate)^years)
    }
  
    annuity <- function(contrib, rate, years){
      return (contrib *((1 + rate)^years - 1) / rate)
    }
    
    growing_annuity <- function(contrib, rate, growth, years){
      return (contrib*(((1 + rate)^years - (1 + growth)^years) / (rate - growth)))
    }
  
    modalities <- matrix(0, ncol = 4, nrow = years + 1)
    names <- c("year", "no_contrib", "fixed_contrib", "growing_contrib")
    colnames(modalities) <- names
  
    for (i in 1:nrow(modalities)){
      modalities[i,1] <- i - 1
      modalities[i,2] <- future_value(amount, rate, i - 1)
      modalities[i,3] <- future_value(amount, rate, i - 1) + annuity(contrib, rate, i - 1)
      modalities[i,4] <- future_value(amount, rate, i - 1) + growing_annuity(contrib, rate, growth, i - 1)
    }
    modalities <- data.frame(modalities)
})
  
 
  
  output$plot1 <- renderPlot({
    plot1.data <- melt (dataInput(), id.vars = 'year', variable.name = 'Modalities')
    plot <- ggplot(plot1.data, aes(year, value, group = Modalities)) + 
      geom_line(aes(color = Modalities)) + 
      geom_point(aes(color = Modalities)) +
      labs(title = "Balances of Different Modalities for 10-year Period", x = "Year", y = "Balance") +
      theme_bw()
    if (input$choice == "Yes"){
      plot <- plot + facet_grid(~ Modalities) + geom_area(aes(fill = Modalities, alpha = 0.5))
    }
    
    plot
  })
  
  output$table <- renderPrint({
    print(dataInput())
  })
}



shinyApp(ui = ui, server = server)

