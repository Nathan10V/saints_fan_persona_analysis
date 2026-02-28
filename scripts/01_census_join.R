library(tidyverse)
library(tidycensus)


#Target Variables
target_vars <- c(
  med_income = "B19013_001",
  med_age    = "B01002_001",
  pop_total  = "B01003_001",
  total_households = "B11005_001", 
  kids_households  = "B11005_002",
  total_pop_25     = "B15003_001",     
  bachelors        = "B15003_022",        
  masters          = "B15003_023",          
  prof_degree      = "B15003_024",      
  doctorate        = "B15003_025"
  )

# 'Median Household Income' (B19013_001) for 2022
census_data <- get_acs(
  geography = "zcta", 
  variables = target_vars, 
  year = 2022,
  output ="wide"
) |> 
  mutate(
    med_incomeE = med_incomeE,
    med_ageE    = med_ageE,
    educationE  = (bachelorsE + mastersE + prof_degreeE + doctorateE) / total_pop_25E,
    pop_totalE  = pop_totalE
  ) |>
  mutate(pct_kids = kids_householdsE / total_householdsE,
         pct_college = (bachelorsE + mastersE + prof_degreeE + doctorateE) / total_pop_25E  
    
  ) |> 
  select(zip = GEOID,
         neighborhood_income = med_incomeE,
         neighborhood_age    = med_ageE,
         neighborhood_pop    = pop_totalE,
         pct_kids,
         pct_college,
         )

# 2. Load your Saints Survey CSV
saints_data <- read_csv("data/saints_final.csv")

# 3. Data Engineering: The Join Prep
# ZIP codes must be strings to join correctly.
saints_clean <- saints_data |> 
  mutate(
    zip = as.character(zip),
    zip = str_pad(zip, width = 5, side = "left", pad = "0")
  )

# 4. The Join
# This adds the Census income to every fan in your survey
saints_with_wealth <- saints_clean |> 
  inner_join(census_data, by = "zip")

# 5. Save the new, enriched dataset
write_csv(saints_with_wealth, "data/saints_with_census.csv")