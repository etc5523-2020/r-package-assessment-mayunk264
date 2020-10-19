#'@export
stateSelectInput <- function() {
  selectInput("province",
              "Please select a state",
              choices = c("Australian Capital Territory", "New South Wales", "Northern Territory", "Queensland", "South Australia","Victoria","Western Australia"))
  
}