# Create objects weight and height
weight <- 90
height <-  180

# compute body mass index
weight / (height/100)^2


# same, rounded to 1st decimal
round(weight / (height/100)^2, 1)


# same, saving into 'bmi'
bmi <- round(weight / (height/100)^2, 1)
