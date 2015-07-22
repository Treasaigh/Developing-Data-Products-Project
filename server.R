# server.R

shinyServer(function(input, output) {
  
  output$summary <- renderText({
    data <- read.csv(file = 'training.csv', head=TRUE, 
                     na.strings = c('NA','#DIV/0!',''))
    year <- input$var
    td0 <- trainData[ which(trainData$EVENT_YEAR==year), ]
    paste(summary(td0))

  })
  
  output$plot <- renderPlot({
    data <- read.csv(file = 'training.csv', head=TRUE, 
                          na.strings = c('NA','#DIV/0!',''))

    year <- input$var
    par(mfrow=c(1,3))
    td0 <- trainData[ which(trainData$EVENT_YEAR==year), ]
    hist(td0$ASVAB_AVERAGE, breaks = 10, main = "All Data")
    td1 <- trainData[ which(trainData$Grad=='No' & trainData$EVENT_YEAR==year), ]
    hist(td1$ASVAB_AVERAGE, breaks = 10, main ="Eliminations")
    td2 <- trainData[ which(trainData$Grad=='Yes' & trainData$EVENT_YEAR==year), ]
    hist(td2$ASVAB_AVERAGE, breaks = 10, main = "Grads")
  })
  
})