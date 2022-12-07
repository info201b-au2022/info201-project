# app_server
library(shiny)
library(ggplot2)

server <- function(input, output) {
  output$chart2 <- renderPlotly({
    data <- police_killings %>%
      filter(state == input$selectstate) %>%
      group_by(race) %>%
      summarize(
        number_of_deaths = n()
      )
    
    plot <- ggplot(data) +
      geom_bar(
        mapping = aes(y = number_of_deaths, x= race),
        stat = "identity"
      ) + 
      labs(
        x = "Race",
        y = "Number of deaths",
        title = paste("Deaths based on race in", input$selectstate, "from 2015 to 2017")
      ) +
      coord_flip()
    
    return(plot)
  })
  
  output$caption2 <- renderText({
    caption <- "This graph displays the number of deaths that occur per race in 
    a given state. When looking at different states. those with more diverse 
    demographics such as California will see a wide variety in the race of those 
    killed in violent police shootings, but those who are more majority-white 
    such as Kentucky will see a much bigger ratio of White people killed. Native 
    Americans, being a much smaller proportion of the population of most states, 
    typically do not see very many deaths in any states, while White people, 
    being the majority race in America, see a pretty high proportion of deaths 
    cause by police officers in any state."
    
    return(caption)
  })
}

