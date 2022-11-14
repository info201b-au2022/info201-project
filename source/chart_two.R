library(tidyverse)
# Chart that displays death based on race depending on what state you input
police_killings <- read.csv("~/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
police_killings$race[police_killings$race == "A"] <- "Asian"
police_killings$race[police_killings$race == "B"] <- "Black"
police_killings$race[police_killings$race == "H"] <- "Hispanic"
police_killings$race[police_killings$race == "W"] <- "White"
police_killings$race[police_killings$race == "N"] <- "Native"
police_killings$race[police_killings$race == "O"] <- "Other"
police_killings$race[police_killings$race == ""] <- "Unknown"

grouped <- function(state_chosen){
  grouped <- police_killings %>%
  filter(state == state_chosen) %>%
  group_by(race) %>%
  summarize(
    number_of_deaths = n()
  )
  
  return(grouped)
}

race_chart <- function(state){
  race_data <- grouped(state)
  chart <- ggplot(data = race_data) +
    geom_bar(
      mapping = aes(y = number_of_deaths, x= race),
      stat = "identity"
    ) + 
    ggtitle(paste("Deaths based on race in", state, "from 2015 to 2017")) + 
    xlab("Race") +
    ylab("Number of deaths") +
    coord_flip()
  
  return(chart)
}

ca_group = grouped("CA")
race_chart("CA")
