# load the packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(readr)

# load the data file
police_killings <- read.csv("~/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)

# select the state for boxplot
select <- function(state_chosen){
  select <- police_killings %>%
    filter(state == state_chosen) 
  return(select)
}

# create boxplot and violin plot function
plot_by_age <- function(state){
  state_data <- select(state)
  chart <- ggplot(data = state_data) +
    geom_violin(
      mapping = aes(x = state, y = age), 
      na.rm = TRUE,
      fill = "#00BFC4"
    ) + 
    geom_boxplot(
      mapping = aes(x = state, y = age),
      na.rm = TRUE,
      width = .1,
      fill = "#00BFC4"
    ) + 
    labs(
      x = "State",
      y = "Age",
      title = paste("Deaths distribution based on age in", state)
    ) + 
    coord_flip()
  return(chart)
}
