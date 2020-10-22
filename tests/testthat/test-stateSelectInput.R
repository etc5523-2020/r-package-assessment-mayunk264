context("Testing stateSelectInput function")
library(ozcovid)


test_that("error message appears if user tries to include an argument within the function - the function is not designed to be used within the console (only within shiny app)", {
  expect_error(ozcovid::stateSelectInput("Victoria"))
})
