#'
#' 
#' @description 
#' @return 
#' 
#' @example
#'
#' 
#' @import
#' shiny
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