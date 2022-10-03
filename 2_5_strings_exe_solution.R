library(tidyverse)

# With antecedents below, create a data.frame and produce a proper frequency table. 

antec <- c("Arterial hypertension", "arterial hypertension", "ARTERIAL HYPERTENSION",
           "arterial   hypertension ", "arterial hypertension ",  "Pneumonia", 
           "pneumonia", " pneumonia")

data.frame(antec) %>% 
  mutate(antec = antec %>% str_squish() %>% str_to_sentence()) %>% 
  count(antec)

# With the cip codes below, create a data.frame and compute variables 
# `sex` (with appropriate labels) and 
# `year_of_birth` (should be numeric). 
# Hint: to convert a character vector into a numeric vector, use `as.numeric()`.

cip <- c("FEGA0720525000", "ROMA1690913000", "PEJI0910503")

data.frame(cip) %>% 
  mutate(sex = str_sub(cip, 5, 5),
         sex = factor(sex, 0:1, c("male", "female")),
         yob = as.numeric(str_sub(cip, 6, 7)))

# equivalent
data.frame(cip) %>% 
  mutate(sex = str_sub(cip, 5, 5) %>% factor(0:1, c("male", "female")),
         yob = str_sub(cip, 6, 7) %>% as.numeric())


# With the DISEHTAE data, compute an additional column having this value for the 
# first patient:  "A 52 years male, diagnosed with AHT on 1998-01-01". 

d <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  mutate(sex = factor(sex, 1:2, c("male", "female"))) %>% 
  select(age, sex, ah_dx_dt) %>% 
  mutate(narrative = str_glue("A {age} years {as.character(sex)}, diagnosed with AHT on {ah_dx_dt}"))

head(d)         
