# app_ui
library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(shinythemes)

police_killings <- read.csv("~/Documents/info201/info201-project/data/PoliceKillingsUS.csv", stringsAsFactors = FALSE)

chart_1_main <- mainPanel(
  plotOutput("chart1")
)

chart_1_sidebar <- sidebarPanel(
  selectInput(
    inputId = "selectvar",
    label = "Variable to Chart",
    choices = list(
      "Reported Threat Level" = "threat_level",
      "Use of Body Camera" = "body_camera",
      "Gender" = "gender"
    )
  )
)

chart_1_sidebar2 <- sidebarPanel(
  selectInput(
    inputId = "stateselected",
    label = "Select a State",
    choices = sort(unique(police_killings$state))
  )
)

chart_1_panel <- tabPanel(
  title = "Chart 1",
  titlePanel("Chart 1"),
  sidebarLayout(
    chart_1_sidebar2,
    chart_1_main
  )
)
ui <- navbarPage(
  chart_1_panel
)