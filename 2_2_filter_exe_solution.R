library(dplyr)
d <- rio::import("data/hta.xlsx", sheet = "data") 
demo <- select(d, pid, sex, age, region, smoke)

# Subset current smokers
filter(demo, smoke == 1)

# Subset current smokers or ex-smokers
filter(demo, smoke == 1 | smoke ==3)

# Same, but younger than 65
filter(demo, (smoke == 1 | smoke ==3) & age < 65)

# Subset the 10 youngest patients
slice_min(demo, age, n = 10)

# Get a random sample of size 100
set.seed(1)
sample_n(demo, 100)

