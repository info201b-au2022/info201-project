# summary_table.R 
# Imports csv files into RStudio
library(tidyverse)

police_killings <- read.csv("~/info201/info201-project/project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)

aggregate <- police_killings %>%
  group_by(state) %>%
  summarize(deaths = n(), 
            white = sum(race == "W"),
            unknown = sum(race == ""),
            other = sum(race == "O"),
            native = sum(race == "N"),
            hispanic = sum(race == "H"),
            black = sum(race == "B"),
            asian = sum(race == "A"),
            youngest = min(age, na.rm = TRUE), 
            oldest = max(age, na.rm = TRUE),
            body_camera_on = round(sum(body_camera == TRUE, na.rm = TRUE) / n(), 2),
            body_camera_off = round(sum(body_camera == FALSE, na.rm = TRUE) / n(), 2)
            )
