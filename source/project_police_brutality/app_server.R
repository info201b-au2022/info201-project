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
  
    output$caption1 <- renderText({
    caption <- paste("This graph displays the proportion of deaths that included 
                     the use of a body camera or not per race in ", input$stateselected, 
                     ". Some states don't have data for every race, as there may have been 
                     no killings for that race. It's also important to note that these charts 
                     represent proportions and we must consider that certain categories and states 
                     have less deaths than others when comparing proportions, which can be further 
                     shown by Chart 2. Certain states like California, which is very large and diverse, 
                     represent a larger amount of data and deaths that have occurred in the United 
                     States compared to smaller states with less data like Rhode Island.")
    
    return(caption)
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
    paste0("This graph displays the number of deaths that occur per 
            race in ", input$selectstate, ". When looking at different states. those with more diverse 
            demographics such as California will see a wide variety in the race of those 
            killed in violent police shootings, but those who are more majority-white 
            such as Kentucky will see a much bigger ratio of White people killed. Native 
            Americans, being a much smaller proportion of the population of most states, 
            typically do not see very many deaths in any states, while White people, 
            being the majority race in America, see a pretty high proportion of deaths 
            cause by police officers in any state. However, though there's a smaller 
            proportion of black and Hispanic population in the country, many states 
            have disproportionately higher gun violence towards those two races in 
            particular."
           )
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