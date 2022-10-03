library(dplyr)
d <- rio::import("data/hta.xlsx", sheet = "data") 



# Subset patients from Catalunya and select variables `pid`, `age`, and `sex`
d %>% 
  filter(region == 9) %>% 
  select(pid, age, sex)
  
# Could you do the same inverting the order of operations? 
# No: once you select vars, region is not available!
d %>% 
  select(pid, age, sex) %>% 
  filter(region == 9) 
  
# Same, but sort cases by age; hint: see `?arrange`
d %>% 
  filter(region == 9) %>% 
  select(pid, age, sex) %>% 
  arrange(age)

# Same, but sorting by decreasing age; hint: see `?arrange`, second example.
d %>% 
  filter(region == 9) %>% 
  select(pid, age, sex) %>% 
  arrange(desc(age))

# Same but sorting by sex and decreasing age
d %>% 
  filter(region == 9) %>% 
  select(pid, age, sex) %>% 
  arrange(sex, desc(age))

