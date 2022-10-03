library(tidyr)

# Starting from dataframe bp (with vars pid, visit, sbp, dbp), ...

# blood pressure monitoring (bpm)
bp <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, contains("bp_v")) %>% 
  pivot_longer(sbp_v1:dbp_v6) %>% 
  na.omit() %>% 
  separate(name, into = c("var", "visit")) %>% 
  pivot_wider(names_from = var)

# create new dataframe bp_monitoring, with one row per patient and two variables: 
#   pid and num_bpm, the number of visits in which BP was measured.

bp_monitoring <- bp %>% 
  group_by(pid) %>% 
  summarise(num_bpm = n()) %>% 
  ungroup()

# Create a new dataframe `drugs`, with one row per patient and two variables: 
# `pid` and `num_drugs`, the number of drugs a patient has been prescribed.

drugs <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, bb:other) %>% 
  pivot_longer(bb:other) %>% 
  filter(value == 1) %>% 
  count(pid) %>% 
  rename(num_drugs = n)

# Create dataframe `demo` with variables `pid`, `age`, `sex` and `region`.
final <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, sex, age, region) %>% 
  
  # Combine all three dataframes into a single dataframe having 500 rows.
  left_join(bp_monitoring) %>% 
  left_join(drugs) %>% 
  mutate(num_bpm = ifelse(is.na(num_bpm), 0, num_bpm),
         num_drugs = ifelse(is.na(num_drugs), 0, num_drugs))



