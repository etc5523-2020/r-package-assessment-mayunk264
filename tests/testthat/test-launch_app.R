context("Testing launch_app function")

library(ozcovid)


test_that("error message appears if user tries to include an argument within the function", {
  expect_error(ozcovid::launch_app(hello))
})


test_that("application launches successfully",{
  expect_visible(ozcovid::launch_app())
})