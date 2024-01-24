

library("janitor")
library("knitr")
library("lubridate")
library("opendatatoronto")
library("tidyverse")


library(opendatatoronto)
packages <- list_packages()
packages

polls<-show_package("7bce9bf4-be5c-4261-af01-abfbc3510309")

polls <-list_package_resources()

polls111 <- search_packages("Polls conducted by the City")

polls1111 <- polls111 %>%
  list_package_resources()

#### Acquire ####
toronto_polls <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/
  list_package_resources("7bce9bf4-be5c-4261-af01-abfbc3510309") |>
  # Within that package, we are interested in the 2021 dataset
  filter(name == 
           "Polls Data.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

write_csv(
  x = toronto_polls,
  file = "toronto_polls.csv"
)

head(toronto_polls)