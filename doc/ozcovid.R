## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
#install package
devtools::install_github("etc5523-2020/r-package-assessment-mayunk264")

#load package
library(ozcovid)

## ----launch-app, eval=FALSE---------------------------------------------------
#  #launch the Shiny application
#  ozcovid::launch_app()

## ----oz-covid-data, eval=FALSE------------------------------------------------
#  #generate the oz_covid_data dataset
#  ozcovid::oz_covid_data

