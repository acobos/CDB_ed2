library(dplyr)

# Create dataframe demo with variables pid, region, sex, age, smoke, height and weight
demo <- rio::import("data/hta.xlsx", sheet = "data") %>% 
  select(pid, region, sex, age, smoke, height, weight) %>% 
  
  # compute the body mass index, rounded to first decimal
  mutate(bmi = round(weight / height^2, 1),
         
         #  logical indicator for obesity
         obesity = if_else(bmi >= 30, TRUE, FALSE),
         
         # create variable age_group
         age_group = cut(age, 
                         breaks = c(0, 40, 65, Inf),
                         right = FALSE,
                         labels = c("young", "mature", "old")),
         
         # redefine smoke to merge current and ex-smokers
         smoke = if_else(smoke %in% c(1,3), 13, smoke),
         
         # define factors for all categorical variables
         smoke = factor(smoke, 
                        levels = c(13, 2, 4),
                        labels = c("current or ex-smoker", "never smoker", "unknown")),
         
         sex = factor(sex, levels = 1:2, labels = c("male", "female")),
         
         region = factor(region, 
                         levels = 1:17, 
                         labels = c("Andalucía", "Aragón", "Asturias",
                                    "Baleares", "Canarias", "Cantabria",
                                    "Castilla-La Mancha", "Castilla-León",
                                    "Catalunya", "Extremadura", "Galicia", 
                                    "La Rioja", "Madrid", "Murcia", "Navarra",
                                    "País Vasco", "Valencia"))) %>% 
  
  # to specify the order of columns in the resulting dataframe
  select(pid:age, age_group, sex, smoke, height:obesity)
  

         
  