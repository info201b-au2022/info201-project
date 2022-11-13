# summary_info.R 
# Imports csv files into RStudio
police_killings <- read.csv("~/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
median_household_income_2015 <- read.csv("~/info201/project/info201-project/data/MedianHouseholdIncome2015.csv", stringsAsFactors = FALSE)
poverty_levels <- read.csv("~/info201/project/info201-project/data/PercentagePeopleBelowPovertyLevel.csv", stringsAsFactors = FALSE)
complete_high_school <- read.csv("~/info201/project/info201-project/data/PercentOver25CompletedHighSchool.csv", stringsAsFactors = FALSE)
demographic <- read.csv("~/info201/project/info201-project/data/ShareRaceByCity.csv", stringsAsFactors = FALSE)

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
  