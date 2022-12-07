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
