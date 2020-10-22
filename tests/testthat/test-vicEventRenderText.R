context("Testing vicEventRenderText function")
library(ozcovid)
library(shiny)

test_that("error message appears if user tries to include an argument within the function - the function is not deisgned to be used within the console (only within shiny app)", {
  expect_error(ozcovid::vicEventRenderText("hello"))
})

test_that("the result the first time the function is run is the same as he second time that it is run", {
  expect_equal_to_reference(ozcovid::vicEventRenderText(),"vicEventRenderText_ReferenceValueDoc.R")
})
