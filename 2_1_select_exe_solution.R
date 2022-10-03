library(dplyr)
d <- rio::import("data/hta.xlsx", sheet = "data") 

# Select `pid` and all BP vars using `contains()`, and save as `bp`
bp <- select(d, pid, contains("bp_v"))

# Select all variables excluding all BP variables, and save as `non_bp`
non_bp <- select(d, -contains("bp_v")) 

# Select `pid` and all diagnostics using `starts_with()`, and print first 6 rows
select(d, pid, starts_with("dx")) %>% head()

# Select `pid` and all dates, and print first 6 rows
select(d, pid, ends_with("dt")) %>% head()

# Select `pid` and all treatment variables (`lmr`to `other`), and print first 6 rows
select(d, pid, lmr:other) %>% head()

