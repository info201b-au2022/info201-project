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

introduction_panel <- tabPanel(
  title = "Introduction",
  titlePanel("Introduction")
)

interactive_1_main <- mainPanel(
  plotOutput("chart1"),
  h3("Summary and Insights"),
  textOutput("caption1")
)

interactive_1_sidebar <- sidebarPanel(
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

interactive_1_sidebar2 <- sidebarPanel(
  selectInput(
    inputId = "stateselected",
    label = "Select a State",
    choices = sort(unique(police_killings$state))
  )
)

interactive_1_panel <- tabPanel(
  title = "Chart 1",
  titlePanel("Proportion of Body Camera Usage by Race in Different States"),
  sidebarLayout(
    interactive_1_sidebar2,
    interactive_1_main
  )
)

interactive_2_sidebar <- sidebarPanel(
  selectInput(
    inputId = "selectstate",
    label = "Select a state",
    choices = states,
    selected = "WA"
  )
)

interactive_2_chart <- mainPanel(
  plotlyOutput("chart2"),
  h3("Summary and Insights"),
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

interactive_3_panel <- tabPanel(
  title = "Chart 3",
  titlePanel("Compare Victims Age Distribution by States"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "state_var",
        label = "Select State: ",
        choices = c(unique(police_killings$state)),
        selected = "WA",
        multiple = TRUE)
      ),
      mainPanel(
        plotlyOutput("chart3"),
        h3("Summary and Insights"),
        p("This data visualization displays the age distribution of victims in 
          a given state or selected given states. Through observing the boxplot 
          of each state, users may able to see the age distribution pattern of 
          police shooting victims in each state. By multi selecting the state, 
          users may also be able to compare and contrast the age distribution 
          in different state. "),
        p("The users may explore the age distribution patterns of different states
          based on their interest, finding states with similar patterns or have a big
          difference. ")
      )
  )
)

summary_panel <- tabPanel(
  title = "Summary",
  titlePanel("Summary")
)

report_panel <- tabPanel(
  title = "Report",
  includeMarkdown("~/info201/project/info201-project/docs/p01-proposal.md")
)

ui <- navbarPage(
  theme = shinytheme("united"),
  "Gun Violence",
  introduction_panel,
  interactive_1_panel,
  interactive_2_panel,
  interactive_3_panel,
  summary_panel,
  report_panel
)
