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

summary_panel <- tabPanel(
  title = "Summary",
  titlePanel("Summary")
)

report_panel <- tabPanel(
  title = "Report",
  titlePanel("Power Abuse: An Analysis of Police Brutality and its Pervasiveness 
             in the US")
)

ui <- navbarPage(
  theme = shinytheme("united"),
  "Gun Violence",
  introduction_panel,
  interactive_2_panel,
  summary_panel,
  report_panel,
  tabPanel("Compare Victims Age Distribution by States", 
           
           sidebarLayout(
             sidebarPanel(selectInput("state_var",
                                      label = "Select State: ",
                                      choices = c(unique(police_killings$state)),
                                      selected = "WA",
                                      multiple = TRUE)),
             mainPanel(plotlyOutput("plot3"),
                       h3("Summary and Insights"),
                       p("This data visualization displays the age distribution of victims in 
                         a given state or selected given states. Through observing the boxplot 
                         of each state, users may able to see the age distribution pattern of 
                         police shooting victims in each state. By multi selecting the state, 
                         users may also be able to compare and contrast the age distribution 
                         in different state. "),
                       p("The users may explore the age distribution patterns of different states
                         based on their interest, finding states with similar patterns or have a big
                         difference. "))
           )
  )
)
