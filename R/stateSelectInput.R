#'Refactored 'selectInput' ui code into 'stateSelectInput' function
#'
#'@description Allows user to select state/territory of choice within shiny app to generate graph of confirmed coronavirus cases over time.
#'
#'@return This function will not return anything within the console. Its purpose is to demonstrate the refactoring of the previous 'selectInput' ui code into a new 'stateSelectInput' function.
#'
#'@example
#'stateSelectInput()
#'
#'@export
stateSelectInput <- function() {
  selectInput("province",
              "Please select a state",
              choices = c("Australian Capital Territory", "New South Wales", "Northern Territory", "Queensland", "South Australia","Victoria","Western Australia"))
  
}