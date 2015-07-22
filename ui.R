library(shiny)

shinyUI(fluidPage(
  titlePanel("ASVAB"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select the year to see a Histogram of ASVAB scores for that year."),
      
      selectInput("var", 
                  label = "Choose a Year",
                  choices = c("2003", "2004", "2005"),
                  selected = "2005")
    , submitButton(text="View Histogram")  
    ),
    
    mainPanel(plotOutput("plot"), textOutput("summary"))
  )
))