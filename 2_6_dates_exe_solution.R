library(tidyverse)
library(lubridate)

# DISEHTAE data ---- 
d <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, ends_with("_dt"))

# What is the class of `ah_dx_dt` and `data_xtract_dt`?
class(d$ah_dx_dt)
class(d$data_xtract_dt)

# Convert them to to `Date` objects.
d <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, ends_with("dt")) %>%
  mutate(data_xtract_dt  = as.Date(data_xtract_dt),
         ah_dx_dt = as.Date(ah_dx_dt))

class(d$ah_dx_dt)
class(d$data_xtract_dt)

# Compute the years from the AHT diagnostic to the data extraction date.
d %>% 
  mutate(years_since_dx = round(as.numeric(data_xtract_dt - ah_dx_dt)/365.25, 1),
         
         # Create a new variable for the week day of the data extraction date       
         data_xtract_wd = wday(data_xtract_dt, label = TRUE, abbr = FALSE))



# Use the `lubridate` function `dmy()` to define a `Date` object from the following character vector. 
# Did it work? 
x <- c("05-mar-58", "2/12/57", "28-12-91", "7/jun/93")
x
class(x)

dmy(x)
dmy(x) %>% class()



