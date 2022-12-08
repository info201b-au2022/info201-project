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
      labs(title = paste("Race vs Use of Body Camera in", input$stateselected, "from 2015 to 2017"),
           x = "Race",
           y = "Percent of Deaths")
    
    return(chart)
  })
  
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
    caption <- paste0("This graph displays the number of deaths that occur per 
    race in ", input$selectstate, ". When looking at different states. those with more diverse 
    demographics such as California will see a wide variety in the race of those 
    killed in violent police shootings, but those who are more majority-white 
    such as Kentucky will see a much bigger ratio of White people killed. Native 
    Americans, being a much smaller proportion of the population of most states, 
    typically do not see very many deaths in any states, while White people, 
    being the majority race in America, see a pretty high proportion of deaths 
    cause by police officers in any state.")
    
    return(caption)
  })
  
  output$chart3 <- renderPlotly({
    
    police_killings <- police_killings %>%
      filter(state == c(input$state_var))
    
    plot_ly(police_killings,
            x = ~age,
            y = ~state,
            color = ~state,
            type = "box"
            ) %>%
    layout(title = "Age distribution Boxplot")
  })
}