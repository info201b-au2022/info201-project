# app_ui
library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(shinythemes)

police_killings <- read.csv("~/info201/project/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)
police_killings$race[police_killings$race == "A"] <- "Asian"
police_killings$race[police_killings$race == "B"] <- "Black"
police_killings$race[police_killings$race == "H"] <- "Hispanic"
police_killings$race[police_killings$race == "W"] <- "White"
police_killings$race[police_killings$race == "N"] <- "Native"
police_killings$race[police_killings$race == "O"] <- "Other"
police_killings$race[police_killings$race == ""] <- "Unknown"

states <- unique(police_killings$state)

interactive_2_sidebar <- sidebarPanel(
  selectInput(
    inputId = "selectstate",
    label = "Select a state",
    choices = states
  )
  #, selectInput(
  #   inputId = "selectvar",
  #   label = "Desired Emission Type",
  #   choices = c(
  #     "Overall including land-use change (CO2)" = "co2_including_luc", 
  #     "Overall excluding land-use change (CO2)" = "co2", 
  #     "Coal (CO2)" = "coal_co2",
  #     "Flaring (CO2)" = "flaring_co2",
  #     "Cement (CO2)" = "cement_co2",
  #     "Gas (CO2)" = "gas_co2",
  #     "Land-use change (CO2)" = "land_use_change_co2",
  #     "Oil (CO2)" = "oil_co2"
  #   )
  # )
)

interactive_2_chart <- mainPanel(
  plotlyOutput("chart2"),
  textOutput("caption2")
)

interactive_2_panel <- tabPanel(
  title = "Chart 2",
  titlePanel("Deaths Based on Race in Different States Interactive Graph"),
  sidebarLayout(
    interactive_2_sidebar,
    interactive_2_chart
  )
)

ui <- navbarPage(
  theme = shinytheme("cerulean"),
  "Gun Violence",
  interactive_2_panel
)
