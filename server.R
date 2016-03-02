# server.R
library(shiny)
library(dplyr)
library(plotly)

#mean length and width of pedal and sepal for each species
group_name <- iris %>% group_by(Species) %>% summarise(sepal_length = mean(Sepal.Length),
                                                       sepal_width = mean(Sepal.Width),
                                                       petal_length = mean(Petal.Length),
                                                       petal_width = mean(Petal.Width))


#shiny server
shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    
    #get sizes for each dimension of selected species
    Size <- group_name[[input$sizes]]
    
    #get species
    Species <- group_name$Species
    
    # a simple histogram of movie ratings
    p <- plot_ly(
      x = Species,
      y = Size,
      name = "Average Lengths and Widths",
      type = "bar",
      filename="r-docs/simple-bar",
      marker = list(color = toRGB(input$color))
    )
  })
})

