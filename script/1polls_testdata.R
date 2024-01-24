# Test the number of rows and columns for the simulation data
num_columns <- ncol(simulated_data)
num_rows <- nrow(simulated_data)
if (num_columns == 7 && num_rows == 1235) {
  print("The dataset has the correct number of columns and rows.")
} else {
  print("The dataset does not have the correct number of columns and rows.")
}

# Test whether the column "BALLOTS_BLANK"are all numeric data?
all_numeric <- all(is.numeric(simulatedpolls_data$BALLOTS_BLANK))

if (all_numeric) {
  print("All values in BALLOTS_BLANK are numeric.")
} else {
  print("Some values in BALLOTS_BLANK are not numeric.")
}

#Test whether the column"BALLOTS_IN_FAVOUR"are all numeric data?
all_numeric <- all(is.numeric(simulatedpolls_data$BALLOTS_IN_FAVOUR))

if (all_numeric) {
  print("All values in BALLOTS_IN_FAVOUR are numeric.")
} else {
  print("Some values in BALLOTS_IN_FAVOUR are not numeric.")
}
#Test whether the column"BALLOTS_OPPOSED"are all numeric data?
all_numeric <- all(is.numeric(simulatedpolls_data$BALLOTS_OPPOSED))

if (all_numeric) {
  print("All values in BALLOTS_OPPOSED are numeric.")
} else {
  print("Some values in BALLOTS_OPPOSED are not numeric.")
}
#Test whether the column"FINAL_VOTER_COUNT"are all numeric data?
all_numeric <- all(is.numeric(simulatedpolls_data$FINAL_VOTER_COUNT))

if (all_numeric) {
  print("All values in FINAL_VOTER_COUNT are numeric.")
} else {
  print("Some values in FINAL_VOTER_COUNT are not numeric.")
}