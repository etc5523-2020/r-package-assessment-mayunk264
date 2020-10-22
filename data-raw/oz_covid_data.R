## code to prepare `oz_covid_data` dataset goes here

library(coronavirus)
library(dplyr)
library(tidyr)

oz_covid_data <- coronavirus::coronavirus %>%
  filter(country=="Australia") %>%
  pivot_wider(names_from = type,values_from = cases) %>%
  group_by(date) %>%
  summarise(sum_confirmed=sum(confirmed),
            sum_death=sum(death),
            sum_recovered=sum(recovered)) %>%
  mutate(cum_confirmed=cumsum(sum_confirmed),
         cum_death=cumsum(sum_death),
         cum_recovered=cumsum(sum_recovered)) %>%
  rename(`Daily Confirmed`=sum_confirmed,
         `Daily Death`=sum_death,
         `Daily Recovered`=sum_recovered,
         `Cumulative Confirmed`=cum_confirmed,
         `Cumulative Deaths`=cum_death,
         `Cumulative Recovered`=cum_recovered)

usethis::use_data(oz_covid_data, overwrite = TRUE)
