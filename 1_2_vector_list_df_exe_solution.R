# 1. Create a character vector with the firstnames of three friends.

first_name <- c("Peter", "Paul",  "Mary")


# 2. Create a numeric vector with their ages.

age <- c(30, 29, 25)

  
# 3. Create a logical vector indicating if they are older than you.
# Assuming you are 29:

older <- c(TRUE, FALSE, FALSE) 

older <- age > 29               # a better way !


# 4. Create dataframe with these three vectors and call it 'friends'.

friends <- data.frame(first_name,
                      age,
                      older)

friends


