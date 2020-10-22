#'Refactored 'selectInput' ui code into 'stateSelectInput' function
#'
#'@description Allows user to select state/territory of choice within shiny app to generate graph of confirmed coronavirus cases over time. There is no need to include an argument within the function when executing the function.
#'
#'@return This function will not return anything meaningful for the end-user within the console. Its purpose is to demonstrate the refactoring of the previous 'selectInput' ui code into a new 'stateSelectInput' function. The code for the function may be used as a template by the user to include their own 'selectInput' UI within a different shiny app.
#'
#'@example
#'\dontrun(
#'stateSelectInput()
#')
#'
#'@import shiny
#'
#'@export
stateSelectInput <- function() {
  selectInput("province",
              "Please select a state",
              choices = c("Australian Capital Territory", "New South Wales", "Northern Territory", "Queensland", "South Australia","Victoria","Western Australia"))
  
}