library(tidyverse)

# Ridge plot for AHI by cervical circumference quartile ----
d <- rio::import("data/OSAS.xls")  %>% 
  mutate(ccg = cut(cervical_circumference, 
                  breaks = c(30, 38.5, 41.5, 44, 55)))

# table(d$ccg, useNA = "ifany")

library(ggridges)
library(ggplot2)

d %>% ggplot(aes(x = ahi, y = ccg, fill = ccg)) +
  geom_density_ridges() +
  theme(legend.position = "none")

# there is a function in ggformula as well
library(ggformula)
gf_density_ridges(ccg ~ ahi, fill = ~ccg, data = d) %>% 
  gf_refine(theme(legend.position = "none"))



# ggpubr ----

library(ggpubr)
d %>% 
  mutate(gender = factor(gender, 0:1, c("female", "male"))) %>% 
  gf_boxplot(ahi ~ gender, fill = ~gender) %>% 
  gf_refine(stat_compare_means()) +

d %>% 
  gf_boxplot(ahi ~ ccg, fill = ~ccg) %>% 
  gf_refine(stat_compare_means())


# Review exercise: plotting BP (AHT data) ----
d <- rio::import("data/hta.xlsx") %>% 
  select(pid, sbp_v1:dbp_v6) %>%
  pivot_longer(sbp_v1:dbp_v6, names_to = "var", values_to = "bp")  %>% 
  na.omit() %>% 
  separate(var, into = c("variable", "visit")) 
  
  
gf_boxplot(bp ~ visit, fill = ~fct_rev(variable), data = d) %>% 
  gf_hline(yintercept = 140, lty = 2, col = "#F8766D") %>% 
  gf_hline(yintercept = 90, lty = 2, col = "#00BFC4") %>% 
  gf_labs(y = "BP (mmHg") %>% 
  gf_theme(legend.title = element_blank())

# show_col(hue_pal()(2))