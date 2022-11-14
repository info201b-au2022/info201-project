# summary_table.R 
# Imports csv files into RStudio
library(tidyverse)

police_killings <- read.csv("~/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
median_household_income_2015 <- read.csv("~/info201/project/info201-project/data/MedianHouseholdIncome2015.csv", stringsAsFactors = FALSE)
poverty_levels <- read.csv("~/info201/project/info201-project/data/PercentagePeopleBelowPovertyLevel.csv", stringsAsFactors = FALSE)
complete_high_school <- read.csv("~/info201/project/info201-project/data/PercentOver25CompletedHighSchool.csv", stringsAsFactors = FALSE)
demographic <- read.csv("~/info201/project/info201-project/data/ShareRaceByCity.csv", stringsAsFactors = FALSE)

police_killings$race[police_killings$race == "A"] <- "Asian"
police_killings$race[police_killings$race == "B"] <- "Black"
police_killings$race[police_killings$race == "H"] <- "Hispanic"
police_killings$race[police_killings$race == "W"] <- "White"
police_killings$race[police_killings$race == "N"] <- "Native"
police_killings$race[police_killings$race == "O"] <- "Other"
police_killings$race[police_killings$race == ""] <- "Unknown"

poverty_levels <- poverty_levels %>%
  rename(state = Geographic.Area) %>%
  mutate(city = str_remove_all(City, " city| town| village| CDP| borough")) %>%
  select(-(City))

median_household_income_2015 <- median_household_income_2015 %>%
  rename(state = Geographic.Area) %>%
  mutate(city = str_remove_all(City, " city| town| village| CDP| borough")) %>%
  select(-(City))

complete_high_school <- complete_high_school %>%
  rename(state = Geographic.Area) %>%
  mutate(city = str_remove_all(City, " city| town| village| CDP| borough")) %>%
  select(-(City))

demographic <- demographic %>%
  rename(state = Geographic.area) %>%
  mutate(city = str_remove_all(City, " city| town| village| CDP| borough")) %>%
  select(-(City))

aggregate <- list(police_killings, median_household_income_2015, complete_high_school, poverty_levels, demographic) %>%
  reduce(left_join, by = c("city", "state")) %>%
  group_by(date)
