# R as a calculator 

# - Arithmetic operators (usual symbols and precedence rules):
(8 + 10 / 2 - 3) * 5^2

# - Mathematical functions:
sqrt(25) + log10(1000)
round(10/3, 4)               # two (comma separated) arguments 


# Creating objects: the assignment operator `<-`      

me <- "Albert"                      # this is fine

my_age <- 2022 - 1958               # this is fine too

me                                  # prints its value

my_age                              # prints its value



# Object names CANNOT contain blank spaces 

# - This gives an error:
my age <- 24       

# The assignment operator CANNOT contain blank spaces. 
# No error is issued here ... why?
my_age < - 24                    # because this means "my_age is less than -24"


# Case sensitivity:

a <- 10             # creates object a
A <- 20             # creates object A 

a                   # prints the contents of a
A                   # prints the contents of A

Round(1/3,4)



# Exercise:
# - Create object `weight` with your weight in kg.
# - Create object `height` with your weight in cm.
# - From these objects, compute your body mass index (kg/m^2).
# - Same, but rounded to the first decimal.
# - Same, but save the result into object `bmi`.
