#' Australia's Coronavirus data
#'
#' This dataset contains Australia's daily and cumulative coronavirus data for 2020
#' 
#' @import 
#' coronavirus
#' dplyr
#' tidyr
#' 
#' @format a tibble with 192 observations and 7 variables:
#' 
#' - **date**: the date on a particular day
#' - **'Daily Confirmed'**: the daily confirmed coronavirus cases in Australia on that given date
#' - **'Daily Death'**: the daily confirmed coronavirus deaths in Australia on that given date
#' - **'Daily Recovered'**: the daily confirmed coronavirus drecoveries in Australia on that given date
#' - **'Cumulative Confirmed'**: the cumulative confirmed coronavirus cases in Australia on that given date
#' - **'Cumulative Deaths'**: the cumulative confirmed coronavirus deaths in Australia on that given date
#' - **'Cumulative Recovered'**: the cumulative confirmed coronavirus recoveries in Australia on that given date
#'  
#' 
#' @source The dataset is a processed version of Rami Krispin's 'coronavirus' dataset from the 'coronavirus package' which can be found here: https://github.com/RamiKrispin/coronavirus

"oz_covid_data"