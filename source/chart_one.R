# stacked bar chart:horizontal axis is race, vertical axis is number of murders, stacked is whether they were armed or not
library(dplyr)
library(ggplot2)

# Imports csv files into RStudio
police_killings <- read.csv("~/Documents/info201/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
police_killings$race[police_killings$race == "A"] <- "Asian"
police_killings$race[police_killings$race == "B"] <- "Black"
police_killings$race[police_killings$race == "H"] <- "Hispanic"
police_killings$race[police_killings$race == "W"] <- "White"
police_killings$race[police_killings$race == "N"] <- "Native"
police_killings$race[police_killings$race == "O"] <- "Other"
police_killings$race[police_killings$race == ""] <- "Unknown"

# Select the state for lollipop plot
select <- function(state_chosen){
  select <- police_killings %>%
    filter(state == state_chosen) 
  return(select)
}

# Create lollipop plot
body_cam_charts <- function(state){
  df2 <- select(state) %>%
    count(race, body_camera) %>%
    mutate(Freq = n)
  chart <- ggplot(df2)+
    geom_linerange(aes(x = race, ymin = 0, ymax = Freq, colour = body_camera), 
                   position = position_dodge(width = 1))+
    labs(title = paste("Race vs Police's Use of Body Cams in Killings in", state),
         x = "Race",
         y = "Number of Deaths") +
    geom_point(aes(x = race, y = Freq, colour = body_camera),
               position = position_dodge(width = 1))+
    coord_flip()
  
  return(chart)
}

# Stacked chart
stacked_chart <- function(state){
  df2 <- select(state) %>%
    count(race, body_camera) %>%
    mutate(Freq = n)
  chart <- ggplot(data = df2, aes(x = race, y = Freq, fill = body_camera)) + 
    geom_bar(position="fill", stat="identity")+
    labs(title = paste("Race vs use of Body Camera"),
         x = "Race",
         y = "Percent of Deaths")
  
  return(chart)
}