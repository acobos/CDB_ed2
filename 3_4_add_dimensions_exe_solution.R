library(tidyverse)
library(ggformula)
library(compareGroups)

data(predimed) 
levels(predimed$group) <- c("Control", "MD+nuts", "MD+VOO") # shorter levels

# Produce a jitter plot of age by group using alpha = 0.2):
# - Are all cases within the allowed age range?
# - Is the distribution of age similar in all three groups?
# - Any feature of the age distribution?
gf_jitter(age ~ group, data = predimed, alpha = 0.2)

# Repeat adding info on `sex` using `shape` or `color`. Which do you prefer?
gf_jitter(age ~ group, data = predimed, alpha = 0.2, shape = ~sex)
gf_jitter(age ~ group, data = predimed, alpha = 0.2, color = ~sex)

# Produce a scatterplot of waist and bmi faceting by group and using color for sex:
# - Any difference between groups?
# - Any difference between men and women?
gf_point(waist ~ bmi | group, data = predimed, alpha = 0.2, col = ~sex)

# Repeat using gf_density_2d()
# - Any difference between men and women?
gf_density_2d(waist ~ bmi | group, data = predimed, col = ~sex)
