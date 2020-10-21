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
#' ggplot2
#' dplyr
#' 
#' @export

stateRenderPlot <- function() {
  renderPlot({
  
  ggplot(filter(oz_covid_df,province==input$province)) +
    geom_line(aes(x=date,y=cases)) +
    xlab("Date") +
    ylab("Confirmed Cases") +
    ggtitle("Confirmed Coronavirus Cases")
  
})
}