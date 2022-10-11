library(tidyverse)
library(ggformula)
library(patchwork)

# With the `birthwt` produce these graphic
bw <- MASS::birthwt %>% 
  mutate(smoke = factor(smoke, 0:1, c("non-smoker", "smoker")),
         race = factor(race, 1:3, c("white", "black", "other")))

gf_jitter(bwt ~ race, data = bw, width = 0.2, alpha = 0.4, 
          col = ~fct_rev(smoke),
          ylab = "Birth weight (g)") %>% 
  gf_theme(legend.title = element_blank())


# Graphics on drug dosages
d <- rio::import("data/doses.xlsx") %>% 
  mutate(dose = factor(str_extract(dose, "[:digit:]+"),
                       levels = c("25", "50", "100", "150", "200")))


a <- gf_barh(~ dose, data = d)
b <- d %>% 
  mutate(dose_range = fct_collapse(dose,
                                   "low" = c("25", "50"),
                                   "medium" = "100",
                                   "high" = c("150", "200"))) %>% 
  gf_barh(~ dose_range, ylab = "dose range")

a + b
