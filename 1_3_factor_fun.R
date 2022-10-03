# Factors and functions

# read data file 
d <- rio::import("data/hta.xlsx")


# Factors ----

# factors are used to represent CATEGORICAL variables
# particularly useful when these are encoded with numbers (as in d: region, sex,...)
# You create a factor with function factor()

factor(d$sex, levels = 1:2, labels = c("male", "female"))

# redefining d$sex as a factor

d$sex <- factor(d$sex, levels = 1:2, labels = c("male", "female"))

summary(d$sex)

class(d$sex)

levels(d$sex)


# Sometimes categorical variables are NOT encoded. Example:

d <- data.frame(first_name = c("Peter", "Paul",  "Mary"),
                age = c(30, 29, 25),
                sex = c("male", "male", "female"))
d

class(d$sex)

levels(d$sex)


# redefining d$sex as a factor

d$sex <- factor(d$sex)
d

class(d$sex)

levels(d$sex)           


# Still, we may want to change the descriptors of the levels

d <- data.frame(first_name = c("Peter", "Paul",  "Mary"),
                age = c(30, 29, 25),
                sex = c("m", "m", "f"))
d

# redefining d$sex as a factor, with better descriptors

d$sex <- factor(d$sex, levels = c("m", "f"), labels = c("male", "female"))
d

class(d$sex)

levels(d$sex) 


# Functions ----

# Functions perform some task and return a result. 
# The material we need to provide the function with, are the function ARGUMENTS.

# functions with just one argument   
log10(1000)

# functions with more than one argument (ALWAYS comma separated)
round(10/3, 2)

# functions with no arguments (still need to write the brackets)
Sys.Date()


# When a function takes more than one argument, they can be identified...

# by name (see Arguments in ?round)
round(x = 10/3, digits = 2)
round(digits = 2, x = 10/3)

# by position (see Arguments in ?round)
round(10/3, 2)

# some arguments may be optional, taking default values when not given
round(10/3, 2)
round(10/3)


# Exercise

d <- data.frame(id = 1:5,
                age = c(47, 28, 35, 64, 56),
                sex = c("male", "male", "female", "male", "female"),
                aht = c(0, 0, NA, 1, 1),
                dm2 = c(FALSE, FALSE, FALSE, TRUE, FALSE))
d

# 1. In the dataframe above, redefine categorical variables as factors, 
#    with appropriate levels (in aht, 0 = no, and 1 = yes).

# 2. Print d  and run again summary(d). Is the info for sex, hta, and dm2 more useful? 

# 3. Verify the class and the levels of each categorical variable in d

# 4. Look at the help of function seq() and use it to create a vector containing numbers 
#    from 10 to 100, by steps of 10 (10, 20, 30,..., 100).

