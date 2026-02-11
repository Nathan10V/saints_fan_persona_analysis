library(haven)
library(readr)

# Read the raw survey file
raw_data <- read_sav("data/Saints 2023 Final Data Set.sav")

# Export as CSV for the main project
write_excel_csv(raw_data, "data/saints_final.csv")