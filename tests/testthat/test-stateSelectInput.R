context("Testing stateSelectInput function")
library(ozcovid)


test_that("error message appears if user tries to include an argument within the function - the function is not designed to be used within the console (only within shiny app)", {
  expect_error(ozcovid::stateSelectInput("Victoria"))
})

test_that("the function executes silenty - no output. This is important as the function is meant to service the shiny app and not as a stand alone function for the end user.", {
  expect_silent(ozcovid::stateSelectInput())
})
