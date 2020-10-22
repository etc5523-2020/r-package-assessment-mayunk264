context("Testing launch_app function")

library(processx)
library(ozcovid)


test_that("The Shiny App launches", {
  
  x <- process$new( 
    "R", 
    c(
      "-e", 
      "ozcovid::launch_app()"
    )
  )
  Sys.sleep(5)
  expect_true(x$is_alive())
  x$kill()
})

test_that("error message appears if user tries to include an argument within the function", {
  expect_error(ozcovid::launch_app(hello))
})

