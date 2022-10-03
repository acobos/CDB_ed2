library(tidyverse)

d <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, region, sex, smoke, dx_dm) %>% 
  mutate(smoke = factor(smoke, 1:4, c("current", "never", "ex", "unknown")),
         sex = factor(sex, 1:2, c("male", "female")),
         dx_dm = factor(dx_dm, 1:2, c("yes", "no")),
         region = factor(region, 
                         levels = 1:17, 
                         labels = c("Andalucía", "Aragón", "Asturias",
                                    "Baleares", "Canarias", "Cantabria",
                                    "Castilla-La Mancha", "Castilla-León",
                                    "Catalunya", "Extremadura", "Galicia", 
                                    "La Rioja", "Madrid", "Murcia", "Navarra",
                                    "País Vasco", "Valencia")))

# Count the number of men and women for each region.
count(d, region, sex)
d %>% count(region, sex)

# Count the number of diabetic patients of each sex.
count(d, sex, dx_dm)

# Get blood pressure data in tidy format (`pid`, `visit`, `sbp` and `dbp`)
bp <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, sbp_v1:dbp_v6) %>% 
  pivot_longer(sbp_v1:dbp_v6) %>% 
  separate(name, into = c("var", "visit")) %>% 
  pivot_wider(names_from = var) %>% 
  na.omit() 

head(bp)

# discard the first three visits; 
# with the remaining visits, compute for each patient:
#  + the mean values of SBP and DBP.
#  + the number of rows used to compute each of the means.

bp %>% 
  filter(!visit %in% c("v1", "v2", "v3")) %>% 
  group_by(pid) %>% 
  summarise(sbp_mean = mean(sbp),
            dbp_mean = mean(dbp),
            obs = n())
  
# Starting with drug treatments in long format, compute the number of drugs taken by each patient.
n_of_drugs <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, bb:other) %>% 
  pivot_longer(bb:other) %>% 
  filter(value == 1) %>% 
  group_by(pid) %>% 
  summarise(n_drugs = n())

# What is the most frequent number of drugs prescribed to a patient? 
# How many patients had just one drug prescribed? And how many had two, or three? 
# Is there any patient with more than three drugs?

n_of_drugs %>% count(n_drugs)
  
