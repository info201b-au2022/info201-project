# app_ui
library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(shinythemes)
library(markdown)

police_killings <- read.csv("PoliceKillingsUS.csv", stringsAsFactors = FALSE)
police_killings$race[police_killings$race == "A"] <- "Asian"
police_killings$race[police_killings$race == "B"] <- "Black"
police_killings$race[police_killings$race == "H"] <- "Hispanic"
police_killings$race[police_killings$race == "W"] <- "White"
police_killings$race[police_killings$race == "N"] <- "Native"
police_killings$race[police_killings$race == "O"] <- "Other"
police_killings$race[police_killings$race == ""] <- "Unknown"

states <- sort(unique(police_killings$state))

introduction_panel <- tabPanel(
  title = "Introduction",
  titlePanel("Introduction"),
  mainPanel(p("This data set presents statistics about killings by police across the United States 
              from 2015 to 2017, provided by the Washington Post database and posted onto Kaggle. 
              This app displays three visualizations to help answer questions about the possible 
              factors and influences on police killings."),
            h3("We seek to answer these questions: "),
            p("Does one’s race influence killings by police?"),
            p("How does one’s age influence killings by police? "),
            p("How does the use of a body camera differ amongst different states and races? "),
            img(src="https://i0.wp.com/www.yesmagazine.org/wp-content/uploads/imports/269ff4c6d4074b30b2435d19b482de76.jpg?w=1400&quality=90&ssl=1",
                height = 390, 
                width = 680))
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
    choices = states
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
  )
)

interactive_2_chart <- mainPanel(
  plotlyOutput("chart2"),
  h3("Summary and Insights"),
  textOutput("caption2")
)

interactive_2_panel <- tabPanel(
  title = "Chart 2",
  titlePanel("Deaths Based on Race in Different States"),
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
  titlePanel("Summary"),
  mainPanel(
            h2("Takeaways"),
            h3("Body Cameras"),
            p("In every state, the large majority of police killings failed to incorporate 
              the use of a body camera. There seems to be no correlation between body camera 
              use and race, as there's a lack of body camera use in general, except for a few 
              outliers, where there may have been not a lot of deaths occurring in that state, and 
              therefore showing a higher proportion of body camera use. When comparing the state with 
              the highest poverty level in the data (Mississippi) to the state with the lowest poverty level 
              (New Jersey), it's interesting to note that while neither states incorporate heavy use of 
              the body camera, New Jersey has more use of it than Mississippi with victims in the Asian 
              category. When looking at a large and diverse state like California, The majority of deaths across 
              all races fail to incorporate the use of body cameras."),
            h3("Race"),
            p("When looking through the bar graph for each state, there's many instances in which there's 
              majority white deaths, which is to be expected in a predominately white populated country. However,
              looking at states such as California and New York will show that there are way more black and 
              Hispanic deaths than white deaths, despite the disparity in the population. Even in states like 
              Ohio with a much smaller general population, we see an overwhelmingly large number of black deaths 
              in conjunction with other races. Thus, we can reasonably conclude that race plays a large part in 
              police brutality and that despite the larger number of white deaths compared to black deaths, 
              the proportion of the black population dying to police brutality and the proportion of the white 
              population dying to the same cause is overwhelmingly different."),
            h3("Age"),
            p("According to the boxplot that we created, the victims in most states are relatively younger than we thought.
              When looking into specific states, California has significantly higher number of younger victims 
              from police killing than elder victims from police killing, as well as a few high outliers; 
              while in Kentucky, the number of younger and elder victims from police killing are much closer. 
              Based on the age distribution of California and Kentucky, it is reasonable to infer that there are 
              more police killing victims died at their early twenties or early thirties comparing to victims that 
              died at a extremely old or young age")
))

report_panel <- tabPanel(
  title = "Report",
  includeMarkdown("p01-proposal.md")
)

ui <- navbarPage(
  theme = shinytheme("united"),
  "Police Brutality",
  introduction_panel,
  interactive_1_panel,
  interactive_2_panel,
  interactive_3_panel,
  summary_panel,
  report_panel
)
