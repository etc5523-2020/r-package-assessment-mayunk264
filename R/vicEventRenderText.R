#'Refactored server-side output$VicDeathParagraph code into new function 'vicEventRenderText' function.
#' 
#' @description Within the shiny application, this function generates a sentence describing the date and number of deaths that occurred in Victoria related to coronavirus on that date by asking the user to click on any point on the Victorian coronavirus-related deaths graphic.
#' 
#' @return This function will not return anything meaningful for the end-user within the console. Its purpose is to demonstrate the refactoring of the previous 'output$VicDeathParagraph' server code into a new 'vicEventRenderText()' function. The code for the function may be used as a template by the user to include their own 'event_data' server code within a different shiny app.
#' 
#' @example
#' \dontrun(
#' vicEventRenderText()
#' )
#'
#' 
#' @import
#' shiny
#' plotly
#' 
#' 
#' @export

vicEventRenderText <- function() {
  
  renderText({
    event.data <- event_data(event = "plotly_click", source = "subset")
    if (is.null(event.data)) {
      print("Click on any point to generate a sentence describing the amount of deaths in Victoria as a result of the coronavirus on any particular day.")
    } else { 
      HTML('On',event.data$x,'in Victoria, there were', event.data$y,'deaths related to the coronavirus.')
    }
  })
}