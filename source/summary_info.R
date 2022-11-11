# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()

# Returns the number of observations in PoliceKiilingsUS dataset
summary_info$num_observations <- nrow(PoliceKillingsUS)

# Returns the geographic area with the highest percentage of people below poverty level
summary_info$max_poverty <- PercentagePeopleBelowPovertyLevel %>%
  filter(poverty_rate == max(poverty_rate, na.rm = T)) %>%
  select(`Geographic Area`)

# Returns the geographic area with the lowest percentage of people below poverty level
summary_info$min_poverty <- PercentagePeopleBelowPovertyLevel %>%
  filter(poverty_rate == min(poverty_rate, na.rm = T)) %>%
  select(`Geographic Area`)

# Returns count of POC people killed compared to white people
summary_info$race_count <- PoliceKillingsUS %>%
  count(str_detect(race, "W") == FALSE)
  