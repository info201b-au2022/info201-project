# app_server
library(shiny)
library(ggplot2)

server <- function(input, output) {
  output$chart1 <- renderPlot({ 
    df <- police_killings %>%
      filter(state == input$stateselected) %>%
      count(race, body_camera) %>%
      mutate(Freq = n)
    
    chart <- ggplot(data = df, aes(x = race, y = Freq, fill = body_camera)) + 
      geom_bar(position="fill", stat="identity")+
      labs(title = paste("Race vs Use of Body Camera")
           x = "Race",
           y = "Percent of Deaths")
    
    return(chart)
  })
}

