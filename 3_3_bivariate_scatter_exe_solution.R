library(tidyverse)
library(ggformula)
library(patchwork)

# Compute the following variables:
# - `flow_100_sum': the sum of flows at 100 Pa in both sides.
# - `flow_150_sum': the sum of flows at 150 Pa in both sides.
# - `flow_100_dif': the difference of flows at 100 Pa (right minus left).
# - `flow_150_dif': the difference of flows at 150 Pa (right minus left).

d <- rio::import("data/OSAS.xls") %>% 
  filter(flow_150_r < 3000) %>% 
  mutate(flow_100_sum = flow_100_r + flow_100_l,
         flow_150_sum = flow_150_r + flow_150_l,
         flow_100_dif = flow_100_r - flow_100_l,
         flow_150_dif = flow_150_r - flow_150_l) %>% 
  select(contains("sum"), contains("dif"))


# Investigate the following relations:
# - sums at 100 and 150 Pa.
d %>% 
  gf_point(flow_150_sum ~ flow_100_sum)

# - differences at 100 and 150 Pa.
d %>% 
  gf_point(flow_150_dif ~ flow_100_dif)

# - sum and difference at 100 Pa.
d %>% 
  gf_point(flow_100_dif ~ flow_100_sum)

# - sum and difference at 150 Pa.
d %>% 
  gf_point(flow_150_dif ~ flow_150_sum)


# Produce a scatterplot matrix with all four vars.
d %>% 
  pairs(d)

# Produce a correlogram with all four vars, having points in the lower panel 
# and Pearson's correlations in the upper panel.
library(corrgram)
d %>% 
  corrgram(lower.panel=panel.pts, upper.panel=panel.cor, text.panel=panel.txt) 




