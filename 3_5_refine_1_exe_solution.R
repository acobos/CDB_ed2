library(tidyverse)
library(ggformula)


# With the `predimed` data in package `compareGroups`, reproduce the graphic:
library(compareGroups)
data(predimed)

set.seed(123)
p <- gf_jitter(age ~ group , data = predimed, alpha = 0.2, color = ~sex,
                          title = "Age at enrollment by randomized treatment",
                          subtitle = "Predimed trial (n = 6324)",
                          xlab = "",
                          ylab = "Age (years)") %>% 
  gf_violin(fill = NA, col = "black") %>% 
  gf_refine(coord_flip())

p


# Apply the `theme_minimal()` theme to the previous graphic
p %>% 
  gf_theme(theme_minimal())


# Use gf_hline() to draw reference lines for the allowed age range (55 or 60 to 80)
p %>% 
  gf_theme(theme_minimal()) %>% 
  gf_hline(yintercept = c(55, 60, 80), linetype = 2)

