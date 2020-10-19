library(processx)

test_that("shiny app launches succesfully", {
  
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

