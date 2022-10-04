# reading the data
d <- rio::import("data/bta.xls")
head(d)

library(mosaic)

# BTA and reference standard (cystoscopy)
tally(bta ~ cystoscopy, data=d)
tally(bta ~ cystoscopy, data=d, format="percent")


# Cytology and reference standard (cystoscopy)
tally(cytology ~ cystoscopy, data=d)
x <- tally(cytology ~ cystoscopy, data=d, format="percent")
x

# get just the requested values
x[2,2]  # sensitivity
x[1,1]  # specificity

# compare sensitivities
x <- tally(bta ~ cytology, data=d, subset = cystoscopy == "Positive")
x
mcnemar.test(x)

# compare specificities
x <- tally(bta ~ cytology, data=d, subset = cystoscopy == "Negative")
x
mcnemar.test(x)

# agreement
x <- tally(bta ~ cystoscopy, data=d)
x

library(epiR)
epi.kappa(x)$prop.agree
epi.kappa(x)$kappa

