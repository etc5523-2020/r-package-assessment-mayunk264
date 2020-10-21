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

shinyServer(function(input, output) {

    output$statePlot <- stateRenderPlot()
    
    output$vicDeathPlot <- renderPlotly({
        
        plot_ly(vic_covid_df,x=~date,y=~cases,type= "bar", source = "subset")
    })
    
    output$VicDeathParagraph <- renderText({
        event.data <- event_data(event = "plotly_click", source = "subset")
        if (is.null(event.data)) {
            print("Click on any point to generate a sentence describing the amount of deaths in Victoria as a result of the coronavirus on any particular day.")
        } else { 
            HTML('On',event.data$x,'in Victoria, there were', event.data$y,'deaths related to the coronavirus.')
        }
    })
    
    output$table <- function(){
        req(input$date1)
        
        oz_table_df %>%
            filter(date==input$date1) %>%
            select(-date) %>%
            knitr::kable("html",table.attr="class='xtab'") %>%
            kable_styling("striped","hover") %>%
            add_header_above(c("Daily" = 3, "Cumulative" = 3))
        
    }
    
    output$AboutSection <- renderText(paste0("<p>Hello and welcome to the &apos;Coronavirus in Australia&apos; dashboard!</p>
      <p><strong>The creator of this application is Mayunk Bharadwaj.</strong></p>
      <p>The purpose of this application is to allow the user to interact with and manipulate data to gain an understanding of how the Coronavirus pandemic has affected Australia. There are three main components to the application:</p>
      <p>1. Confirmed cases by State. The user is able to select a state of interest and generate a graph illustrating how confirmed coronavirus cases have changed over time.</p>
      <p>2. Coronavirus Summary Table. The user is able to select a specific date and identify how many confirmed cases, cumulative confirmed cases, deaths, cumulative deaths, recoveries and cumulative recoveries occurred in Australia at the selected date.</p>
      <p>3. Deaths in Victoria. The user is able to view a graph showing how many coronavirus-related deaths have occurred in Victoria over time. The user is able to click on any given data point to generate a sentence describing how many deaths occurred in Victoria on that particular day. The user is free to use this sentence in their own work.</p>
      <p><br></p>")
    )
    
    output$References <- renderText(paste0("<p>C. Sievert. Interactive Web-Based Data Visualization with R, plotly, and shiny. Chapman and Hall/CRC. Florida, 2020.</p>
<p>Garrett Grolemund, Hadley Wickham (2011). Dates and Times Made Easy with lubridate. Journal of Statistical Software, 40(3), 1-25. URL http://www.jstatsoft.org/v40/i03/</p>
<p>Hadley Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source Software, 4(43), 1686, https://doi.org/10.21105/joss.01686</p>
<p>Hao Zhu (2019). kableExtra: Construct Complex Table with &apos;kable&apos; and Pipe Syntax. R package version 1.1.0. https://CRAN.R-project.org/package=kableExtra</p>
<p>Rami Krispin and Jarrett Byrnes (2020). coronavirus: The 2019 Novel Coronavirus COVID-19 (2019-nCoV) Dataset. R package version 0.3.0.9000. https://github.com/RamiKrispin/coronavirus</p>
<p>Winston Chang and Barbara Borges Ribeiro (2018). shinydashboard: Create Dashboards with &apos;Shiny&apos;. R package version 0.7.1 https://CRAN.R-project.org/package=shinydashboard</p>
<p>Winston Chang, Joe Cheng, JJ Allaire, Yihui Xie and Jonathan McPherson (2020). &nbsp; shiny: Web Application Framework for R. R package version 1.5.0. https://CRAN.R-project.org/package=shiny</p>
<p><br></p>"))

})
