#I want to simulate a data set which includes  7 columns:"APPLICATION_FOR“, ”BALLOTS_BLANK“, ”BALLOTS_IN_FAVOUR”，“BLLOTS_OPPOSED","OPEN_DATE", "CLOSE_DATE", "FINAL_VOTER_COUNT" and 1235 rows with random entries.
#loads several R packages
library(dplyr)
set.seed(123)
simulatedpolls_data <- tibble(
  APPLICATION_FOR = sample(c("Option A", "Option B", "Option C"), 1235, replace = TRUE),
  BALLOTS_BLANK = sample(0:50, 1235, replace = TRUE),
  BALLOTS_IN_FAVOUR = sample(20:100, 1235, replace = TRUE),
  BALLOTS_OPPOSED = sample(5:30, 1235, replace = TRUE),
  OPEN_DATE = sample(seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by="day"), 1235, replace = TRUE),
  CLOSE_DATE = sample(seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by="day"), 1235, replace = TRUE),
  FINAL_VOTER_COUNT = sample(500:2000, 1235, replace = TRUE)
)

#display the first 6 rows
head(simulatedpolls_data)

# Check/test the simulation data
num_columns <- ncol(simulated_data)
num_rows <- nrow(simulated_data)
if (num_columns == 7 && num_rows == 1235) {
  print("The dataset has the correct number of columns and rows.")
} else {
  print("The dataset does not have the correct number of columns and rows.")
}

#output the simulation csv file in R
write_csv(
  x = simulatedpolls_data,
  file = "/cloud/project/input/data/simulation1_toronto_polls.csv"
)
