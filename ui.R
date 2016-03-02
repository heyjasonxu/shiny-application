# ui.R

#shiny UI
shinyUI(fluidPage(
  #title
  titlePanel("Length and width of different types of flowers"),
  
  #side panel
  sidebarPanel(
    
    #buttons to choose different measurements
    radioButtons("sizes", label = "Sizes",
                 choices = list("Sepal Length" = 'sepal_length', "Sepal Width" = 'sepal_width',
                                "Petal Length" = 'petal_length', "Petal Width" = 'petal_width'), 
                 selected = 'sepal_length'),
    
    #color of bar graph
    radioButtons("color", label = "Color",
                 choices = list("Green" = 'green', "Blue" = 'blue'), 
                 selected = 'green')
  ),
  mainPanel(
    plotlyOutput("trendPlot")
  )
))