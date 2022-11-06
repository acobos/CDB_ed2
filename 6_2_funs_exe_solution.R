library(mosaic)
data(Births78)
head(Births78)

# a particular case: what needs to be changed if copy paste?
gf_boxplot(births ~ wday, data = Births78) +
  stat_summary(fun=mean, geom="point", color="red") + 
  coord_flip()

# name the parts to change and replace
the_formula <- births ~ wday
the_dataframe <- Births78

gf_boxplot(the_formula, data = the_dataframe) +
  stat_summary(fun=mean, geom="point", color="red") + 
  coord_flip()

# wrap inside a function, with arguments
box_with_mean <- function (the_formula, the_dataframe){
  
  gf_boxplot(the_formula, data = the_dataframe) +
    stat_summary(fun=mean, geom="point", color="red") + 
    coord_flip()
  
}

# test
box_with_mean(births ~ wday, Births78)

# test with another variable: month
# convert month to a factor
d <- Births78 %>% 
  mutate(month = factor(month))

box_with_mean(births ~ month, d)

# test with another dataframe
library(compareGroups)
data(predimed)
head(predimed)

box_with_mean(age ~ smoke, predimed)
box_with_mean(bmi ~ smoke, predimed)



