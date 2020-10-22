#' Launch the shiny application 'Coronavirus in Australia
#' 
#' @description This function launches the shiny application 'Coronavirus in Australia'. The app allows the user to interact with Australia's coronavirus data.
#' 
#' @return Executing this function will return the 'Coronavirus in Australia' shiny application. There is no need to include an argument within the function when executing the application.
#' 
#' @example
#' \dontrun(
#' launch_app()
#' )
#' 
#' @import shiny
#' 
#' @export
launch_app <- function() {
  appDir <- system.file("app", package = "ozcovid")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `ozcovid`.", call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}