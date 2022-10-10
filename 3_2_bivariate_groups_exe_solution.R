library(tidyverse)
library(ggformula)


d <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  mutate(sex = factor(sex, 1:2, c("male", "female"))) %>% 
  filter(!is.na(sex))

# Produce the following plots to compare the distribution of age in men and women:
# Jitter, boxplot, violin, density

d %>% 
  gf_jitter(age ~ sex, width = .2, alpha = 0.4) + coord_flip()

d %>% 
  gf_boxplot(age ~ sex, notch = TRUE) + coord_flip()

d %>% 
  gf_violin(age ~ sex) + coord_flip()

d %>% 
  gf_density(~ age, fill = ~ sex)


# Compute age groups with cutpoints 0, 40 and 70, and produce a stacked barchart 
# to compare age gropups in  men and women. Do you see any difference?
d %>% 
  mutate(age_group = cut(age, c(0, 40, 70, Inf))) %>% 
  gf_props(~ sex , fill = ~ age_group, position = "fill") 
