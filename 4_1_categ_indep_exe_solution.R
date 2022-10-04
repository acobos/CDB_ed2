# birth weight data in package MASS ----
library(tidyverse)

d <- MASS::birthwt %>% 
  mutate(race = factor(race, levels = 1:3, labels = c("white", "black", "other")),
         low = factor(low, levels = c(1,0), labels = c("Low", "Normal")),
         smoke = factor(smoke, levels = c(1,0), labels = c("smoker", "non_smoker")))

head(d)   


# low birth weight related to race? ----

library(mosaic)

# the contingency table (saving it to x)
x <- tally(low ~ race, data = d)
x

# see percentages of low/normal in each race
tally(low ~ race, data = d, format = "percent")

# same, graphically
library(ggformula)
gf_props( ~ race, fill = ~ low, position = "fill", data = d)

# chi-square test, without continuiy correction
# (because I do not expect low expected frequencies)
res <- chisq.test(x, correct = FALSE)
res

# let's see expected frequencies to confirm
res$expected          # see them
res$expected > 5      # see if they are all > 5

# compute RR
library(epitools)
riskratio(t(x), rev="columns")

# Verify RR values from table shown in output: 
(11/26) / (23/96)     # P(low) in black vs white
(25/67) / (23/96)     # P(low) in other vs white

# get the RR only 
res <- riskratio(t(x), rev="columns") 
class(res)
names(res)
res$measure

# can be done in one step, but you need to be sure that
# you are getting the right RR, i.e., the table is built as required
# to get the RR you want

riskratio(t(x), rev="columns")$measure

# merging black and other ----
d <- mutate(d, race_2 = ifelse(d$race == "white", "white", "black/other"))

# just to verify if race_2 was correctly created
tally(race ~ race_2, data = d)

# the contingency table
x <- tally(low ~ race_2, data = d)

# chi-square test
chisq.test(x, correct = FALSE)

# the 1st two elements of the result 
riskratio(t(x), rev="columns")[1:2]

# the previous was white / black or other, it's ok but
# if I want black or other / white, I need to reverse rows too
riskratio(t(x), rev="both")[1:2]

