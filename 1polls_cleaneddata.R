install.packages("opendatatoronto")
install.packages("janitor")
install.packages("knitr")
install.packages("lubridate")
install.packages("tidyverse")

library("janitor")
library("knitr")
library("lubridate")
library("opendatatoronto")
library("tidyverse")



library(dplyr)
polls_columns <- select(toronto_polls,OPEN_DATE, CLOSE_DATE, FINAL_VOTER_COUNT, APPLICATION_FOR, BALLOTS_BLANK, BALLOTS_IN_FAVOUR, BALLOTS_OPPOSED)
print(polls_columns)

library(dplyr)
filtered_data1 <- polls_columns %>%
  filter(
    !is.na(APPLICATION_FOR) & APPLICATION_FOR != "",
    !is.na(BALLOTS_BLANK) & BALLOTS_BLANK != "",
    !is.na(BALLOTS_IN_FAVOUR) & BALLOTS_IN_FAVOUR != "",
    !is.na(BALLOTS_OPPOSED) & BALLOTS_OPPOSED != "",
    !is.na(OPEN_DATE) & OPEN_DATE != "",
    !is.na(CLOSE_DATE) & CLOSE_DATE != "",
    !is.na(FINAL_VOTER_COUNT) & FINAL_VOTER_COUNT != ""
  )

print(filtered_data1)


write_csv(
  x = filtered_data1,
  file = "cleaneddata_toronto_polls.csv"
)




