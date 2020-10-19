#' Refactored output$AboutSection server code into function 'about_app'
#' 
#' @description shows user About section within the shiny application 'Coronavirus in Australia'
#' 
#' @return This function will not return anything within the console. Its purpose is to demonstrate the refactoring of the previous 'output$AboutSection' server code into a new 'about_app' function.
#'
#'@example
#'about_app()
#'
#'@export
about_app <- function() {
  renderText(paste0("<p>Hello and welcome to the &apos;Coronavirus in Australia&apos; dashboard!</p>
      <p><strong>The creator of this application is Mayunk Bharadwaj.</strong></p>
      <p>The purpose of this application is to allow the user to interact with and manipulate data to gain an understanding of how the Coronavirus pandemic has affected Australia. There are three main components to the application:</p>
      <p>1. Confirmed cases by State. The user is able to select a state of interest and generate a graph illustrating how confirmed coronavirus cases have changed over time.</p>
      <p>2. Coronavirus Summary Table. The user is able to select a specific date and identify how many confirmed cases, cumulative confirmed cases, deaths, cumulative deaths, recoveries and cumulative recoveries occurred in Australia at the selected date.</p>
      <p>3. Deaths in Victoria. The user is able to view a graph showing how many coronavirus-related deaths have occurred in Victoria over time. The user is able to click on any given data point to generate a sentence describing how many deaths occurred in Victoria on that particular day. The user is free to use this sentence in their own work.</p>
      <p><br></p>")
  )
}
