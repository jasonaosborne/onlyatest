library(ggplot2)

shinyUI(fluidPage(
  
  # Application title
  #titlePanel("Investigation of Mammal Sleep Data"),
  uiOutput("vTitle"),
#  titlePanel(uiOutput("info")),
  
  # Sidebar with options for the data set
  sidebarLayout(
    sidebarPanel(
      h3("Select the mammal's biological order:"),
      selectizeInput("vore", "Vore", selected = "omni", choices = levels(as.factor(msleep$vore))),
      br(),
      sliderInput("size", "Size of Points on Graph",
                  min = 1, max = 10, value = 5, step = 1),
      checkboxInput("conservation", h4("Color Code Conservation Status", style = "color:red;")),
      conditionalPanel("input.conservation", checkboxInput("opacity",h4("Also change opacity based on REM?")))
    ),
    
    # Show outputs
    mainPanel(
      plotOutput("sleepPlot"),
      textOutput("info"),
      tableOutput("table")
      )
  )
))
