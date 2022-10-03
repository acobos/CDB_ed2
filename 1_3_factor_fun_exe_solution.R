d <- data.frame(id = 1:5,
                age = c(47, 28, 35, 64, 56),
                sex = c("male", "male", "female", "male", "female"),
                aht = c(0, 0, 0, 1, 1),
                dm2 = c(FALSE, FALSE, FALSE, TRUE, FALSE))
d

summary(d)


# 1. In the dataframe above, redefine categorical variables as factors 
# with appropriate levels (in aht, 0 = no, and 1 = yes).

d$sex <- factor(d$sex)

d$aht <- factor(d$aht, 0:1, c("no", "yes"))

d$dm2 <- factor(d$dm2, c(FALSE, TRUE), c("no", "yes"))


# 2. Print d  and run again summary(d). Is the info for sex, hta, and dm2 more useful?  
d
summary(d)

# 3. Verify the class and the levels of each categorical variable in d

class(d$sex)
levels(d$sex)

class(d$aht)
levels(d$aht)

class(d$dm2)
levels(d$dm2)

# 4. Look at the help of function seq() and use it to create a vector containing numbers 
#    from 10 to 100, by steps of 10 (10, 20, 30,..., 100).

seq(from = 10, to=100, by=10)    # args identified by name
seq(10, 100, 10)                 # args identified by position
