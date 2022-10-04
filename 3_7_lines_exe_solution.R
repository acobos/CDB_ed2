library(tidyverse)
library(ggformula)

k <- rio::import("data/labs.xlsx") %>% 
  filter(var == "K" & !is.na(value))

# Produce a similar plot for potassium (reference range from 2.5 to 5.5 mEq/l)

# identify patients with values out of the reference range
pwe <- k %>% filter(value < 2.5 | value > 5.5) %>% 
  pull(subject_id) %>% 
  unique()

# compute indicator of out-of-range (oor)
k <-  k %>% 
  mutate(oor = ifelse(subject_id %in% pwe, "yes", "no")) 

# find last visit for cases with oor values
k %>% 
  filter(oor == "yes") %>% 
  group_by(subject_id) %>% 
  summarise(visit = last(visit)) %>% 
  ungroup() %>% 
  left_join(k) -> last_visits

# produce plot
gf_line(value ~ visit | treatment, group = ~ subject_id, col = ~ fct_rev(oor),
        data = k, ylab = "K (mEq/l)") %>% 
  gf_hline(yintercept = c(2.5, 5.5), lty=3, lwd=0.5) %>% 
  gf_facet_grid(site ~ treatment) %>% gf_theme(legend.position = "none") %>% 
  gf_text(data = last_visits, label = ~ subject_id, 
          show.legend = FALSE)

# now using gf_label() intead of gf_text()
gf_line(value ~ visit | treatment, group = ~ subject_id, col = ~ fct_rev(oor),
        data = k, ylab = "K (mEq/l)") %>% 
  gf_hline(yintercept = c(2.5, 5.5), lty=3, lwd=0.5) %>% 
  gf_facet_grid(site ~ treatment) %>% gf_theme(legend.position = "none") %>% 
  gf_label(data = last_visits, label = ~ subject_id, show.legend = FALSE)

# same, with package ggrepel::geom_label_repel()
gf_line(value ~ visit | treatment, group = ~ subject_id, col = ~ fct_rev(oor),
        data = k, ylab = "K (mEq/l)") %>% 
  gf_hline(yintercept = c(2.5, 5.5), lty=3, lwd=0.5) %>% 
  gf_facet_grid(site ~ treatment) %>% gf_theme(legend.position = "none") %>% 
  gf_refine(ggrepel::geom_label_repel(data = last_visits, aes(label = subject_id)))
