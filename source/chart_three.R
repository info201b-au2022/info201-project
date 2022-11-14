# load the packages
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)

# load the data file
police_killings <- read_csv("~/Documents/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
View(police_killings)

# create boxplot function
boxplot_by_age <- function(police_killings){
  chart <- ggplot(data = police_killings, mapping = aes(x = state, y = age), na.rm = TRUE) + 
    geom_boxplot() + 
    labs(
      x = "State",
      y = "Age",
      title = "Boxplot by Age"
    ) 
  return(chart)
}

boxplot_by_age(police_killings)

