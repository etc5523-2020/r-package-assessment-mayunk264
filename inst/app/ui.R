library(shiny)
library(plotly)
library(lubridate)
library(coronavirus)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(kableExtra)
library(tidyr)


oz_covid_df <- coronavirus::coronavirus %>%
    filter(country=="Australia",
           type=="confirmed")

vic_covid_df <- coronavirus::coronavirus %>%
    filter(country=="Australia",
           province=="Victoria",
           type=="death") %>%
    select(date,cases)

oz_table_df <- coronavirus::coronavirus %>%
    filter(country=="Australia") %>%
    pivot_wider(names_from = type,values_from = cases) %>%
    group_by(date) %>%
    summarise(sum_confirmed=sum(confirmed),
              sum_death=sum(death),
              sum_recovered=sum(recovered)) %>%
    mutate(cum_confirmed=cumsum(sum_confirmed),
           cum_death=cumsum(sum_death),
           cum_recovered=cumsum(sum_recovered)) %>%
    rename(`Daily Confirmed`=sum_confirmed,
           `Daily Death`=sum_death,
           `Daily Recovered`=sum_recovered,
           `Cumulative Confirmed`=cum_confirmed,
           `Cumulative Deaths`=cum_death,
           `Cumulative Recovered`=cum_recovered
    )

shinyUI(dashboardPage(skin="green",
                      dashboardHeader(title="Coronavirus in Australia",
                                      titleWidth = 250),
                      
                      dashboardSidebar(width=250,
                                       sidebarMenu(
                                           menuItem("About", tabName = "about", icon = icon("list-alt")),
                                           menuItem("Confirmed Cases by State", tabName = "dashboard", icon = icon("dashboard")),
                                           menuItem("Coronavirus Summary Table", tabName= "yepper",icon = icon("th")),
                                           menuItem("Deaths in Victoria", tabName = "widgets", icon = icon("bar-chart-o")),
                                           menuItem("References", tabName = "biblio", icon = icon("pen"))
                                       )
                      ),
                      
                      dashboardBody(tabItems(
                          tabItem(tabName = "about",
                                  h3("About"),
                                  htmlOutput("AboutSection")),
                          tabItem(tabName = "dashboard",
                                  h3("Confirmed Cases by state"),
                                  p("The below graphic shows daily confirmed coronavirus cases for your selected state over time."),
                                  br(),
                                  plotOutput("statePlot"),
                                  br(),
                                  box(stateSelectInput())
                          ),
                          
                          tabItem(tabName = "yepper",
                                  h3("Coronavirus Summary Table - Australia"),
                                  p("The below table displays Australia's coronavirus statistics for your chosen date."),
                                  br(),
                                  fluidRow(tableOutput("table")),
                                  br(),
                                  dateInput("date1", "Please select a date:", value = "2020-03-16")
                          ),
                          
                          tabItem(tabName = "widgets",
                                  h3("Coronavirus Death in Victoria"),
                                  p("As you might have noticed if you looked at Victoria's confirmed coronavirus cases in the 'Confirmed Coronavirus cases by state' tab, the pandemic has devastated the area. The below graphic helps ilustrate this by showing coronavirus-related death in Victoria over time."),
                                  br(),
                                  plotlyOutput("vicDeathPlot"),
                                  br(),
                                  uiOutput("VicDeathParagraph")),
                          
                          tabItem(tabName = "biblio",
                                  h3("References"),
                                  uiOutput("References"))
                          
                      ))))
