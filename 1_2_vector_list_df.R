# Vectors, factors and lists

# Vectors ----

# vectors are the simplest (atomic) objects in R:
# ordered sets of elements (order matters!), of the same TYPE.
# three different TYPES:
# - numeric
# - character
# - logical


# You create a vector with function c()

c(1, 2, 3)                  # a numeric vector

c("one", "two", "3")        # a character vector

c(TRUE, TRUE, FALSE)        # a logical vector


# shortcut to create vector of consecutive integers

1:5


# Missing values:  NA (for Not Available)

x <- c(1, 2, NA)

y <- c("one", NA, "3", "four")  

z <- c(NA, TRUE, FALSE, FALSE, TRUE)

x
y
z


#  class() and length() of a vector
class(x)                    # type
class(y)
class(z)

length(x)                   # number of elements it contains
length(y)
length(z)


# Lists ----

# ordered collection of objects: can mix data type and object types.
# You create a list with function list():

x <- list("Albert", 
          c(1,2,3,4,5), 
          matrix(letters[1:20], nrow=4, ncol=5))
x

class(x)           # object type?
length(x)          # number of elements it contains


# List elements can be named

x <- list(first_name = "Albert", 
          some_numbers = c(1,2,3,4,5), 
          a_matrix = matrix(letters[1:20], nrow=4, ncol=5))

x

names(x)


# get any list element by prefixing its name with the list name and $ 

x$first_name

x$some_numbers

x$a_matrix


# Data frames ----

# a list of VECTORS of EQUAL length (often called VARIABLES)
# you can create a dataframe with function data.frame()

fab4 <- data.frame(first_name = c("John", "Paul", "George", "Ringo"),
                   age = c(NA, 80, NA, 82),
                   sex = rep("male", 4),
                   guitar = c(TRUE, FALSE, TRUE, FALSE),
                   bass = c(FALSE, TRUE, FALSE, FALSE),
                   drums = c(FALSE, FALSE, FALSE, TRUE))
fab4


# class, length and names of an object

class(fab4)        # the type of object  (a dataframe in this case)

length(fab4)       # the number of elements it contains (variables in this case)

names(fab4)        # the names of the elements (variables)


# get any dataframe variable by prefixing its name by the dataframe name and $

fab4$first_name

fab4$age

# when reading external datafiles, you get a dataframe.

d <- rio::import("data/hta.xlsx")

class(d)           # type of object

length(d)          # how many variables (columns)

names(d)           # variable names

nrow(d)            # how many cases (rows)


# Exercise

# 1. Create a character vector with the first names of three friends.
# 2. Create a numeric vector with their ages.
# 3. Create a logical vector indicating if they are older than you.
# 4. Create dataframe with these three vectors and call it 'friends'.





