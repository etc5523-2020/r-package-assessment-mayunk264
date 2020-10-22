context("Testing launch_app function")

library(ozcovid)


test_that("error message appears if user tries to include an argument within the function", {
  expect_error(ozcovid::launch_app(hello))
})
