# load the packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(readr)

# load the data file
police_killings <- read_csv("~/Documents/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
View(police_killings)

# select the state for boxplot
select <- function(state_chosen){
  select <- police_killings %>%
    filter(state == state_chosen) 
  return(select)
}

# create boxplot function
plot_by_age <- function(state){
  state_data <- select(state)
  chart <- ggplot(data = state_data) +
    geom_violin(
      mapping = aes(x = state, y = age), 
      na.rm = TRUE,
      fill = "light blue"
    ) + 
    labs(
      x = "State",
      y = "Age",
      title = paste("Violinplot by Age in", state)
    ) 
  return(chart)
}

select("CA")
plot_by_age("CA")
