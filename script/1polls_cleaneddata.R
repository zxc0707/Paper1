install.packages("opendatatoronto")
install.packages("janitor")
install.packages("knitr")
install.packages("lubridate")
install.packages("tidyverse")
#loads several R packages
library("janitor")
library("knitr")
library("lubridate")
library("opendatatoronto")
library("tidyverse")


#Picking out the selected columns.
library(dplyr)
polls_columns <- select(toronto_polls,BALLOTS_SPOILED, BALLOTS_DISTRIBUTED, OPEN_DATE, CLOSE_DATE, FINAL_VOTER_COUNT, APPLICATION_FOR, BALLOTS_BLANK, BALLOTS_IN_FAVOUR, BALLOTS_OPPOSED)
print(polls_columns)


#Eliminating the missing data from all rows and columns.
filtered_data1 <- polls_columns[complete.cases(toronto_polls[, c("BALLOTS_SPOILED", "BALLOTS_DISTRIBUTED", "OPEN_DATE", "CLOSE_DATE", "FINAL_VOTER_COUNT", "APPLICATION_FOR", "BALLOTS_BLANK", "BALLOTS_IN_FAVOUR", "BALLOTS_OPPOSED")]), ]
head(filtered_data1)



#Creating a new column called "DURATION" which represents the difference between 2 date(CLOSE_DATE,OPEN_DATE).
filtered_data1 <- filtered_data1 %>%
  mutate(
    CLOSE_DATE = as.Date(CLOSE_DATE),
    OPEN_DATE = as.Date(OPEN_DATE),
    DURATION = as.numeric(CLOSE_DATE - OPEN_DATE)
  )
head(filtered_data1)

#Creating a new column called "DIFFERENCES" which represents the difference between "BALLOTS_IN_FAVOUR" and "BALLOTS_OPPOSED"
filtered_data1 <- filtered_data1 %>%
  mutate(DIFFERENCES = BALLOTS_IN_FAVOUR - BALLOTS_OPPOSED)
head(filtered_data1)



#output a csv file in R

write_csv(
  x = filtered_data1,
  file = "/cloud/project/input/data/cleaneddata_toronto_polls.csv"
)




