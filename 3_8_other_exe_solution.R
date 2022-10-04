library(tidyverse)

# data 
d <- Titanic %>% 
  as_tibble() %>% 
  tidyr::uncount(n)

# mosaic plots
library(vcd)

# by se, age or class
mosaic(fct_rev(Survived) ~ Sex , data = d)
mosaic(fct_rev(Survived) ~ Age , data = d)
mosaic(fct_rev(Survived) ~ Class , data = d)

# by sex or age, given class
mosaic(fct_rev(Survived) ~ Sex | Class, data = d)
mosaic(fct_rev(Survived) ~ Age | Class, data = d)


# QQplots for time to event and BMI (predimed)

library(compareGroups)
data(predimed)

library(patchwork)
gf_qq(~toevent, data = predimed, title = "Time to event") %>% gf_qqline() +
  gf_density(~toevent, data = predimed) /
  gf_boxplot(~toevent, data = predimed)

gf_qq(~bmi, data = predimed, title = "Time to event") %>% gf_qqline()  +
  gf_density(~bmi, data = predimed) /
  gf_boxplot(~bmi, data = predimed)

