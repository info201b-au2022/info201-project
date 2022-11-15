# summary_info.R 

# Imports csv files into RStudio
police_killings <- read.csv("~/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
median_household_income_2015 <- read.csv("~/info201/project/info201-project/data/MedianHouseholdIncome2015.csv", stringsAsFactors = FALSE)
poverty_levels <- read.csv("~/info201/project/info201-project/data/PercentagePeopleBelowPovertyLevel.csv", stringsAsFactors = FALSE)
complete_high_school <- read.csv("~/info201/project/info201-project/data/PercentOver25CompletedHighSchool.csv", stringsAsFactors = FALSE)
demographic <- read.csv("~/info201/project/info201-project/data/ShareRaceByCity.csv", stringsAsFactors = FALSE)

# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()

# Returns the number of observations in PoliceKillingsUS dataset
summary_info$num_observations <- nrow(police_killings)

# Returns the geographic area with the highest percentage of people below poverty level
summary_info$max_poverty <- poverty_levels %>%
  group_by(Geographic.Area) %>%
  summarize(mean_poverty = mean(as.integer(poverty_rate), na.rm = TRUE)) %>%
  filter(mean_poverty == max(mean_poverty, na.rm = T)) %>%
  return(Geographic.Area)

# Returns the geographic area with the lowest percentage of people below poverty level
summary_info$min_poverty <- poverty_levels %>%
  group_by(Geographic.Area) %>%
  summarize(mean_poverty = mean(as.integer(poverty_rate), na.rm = TRUE)) %>%
  filter(mean_poverty == min(mean_poverty, na.rm = T)) %>%
  return(Geographic.Area)

# Returns count of POC people killed compared to white people, poc = true
summary_info$race_count <- police_killings %>%
  count(str_detect(race, "W") == FALSE)

# Returns count of men killed compared to women, men = true
summary_info$gender_count <- police_killings %>%
  count(str_detect(gender, "F") == FALSE)
  