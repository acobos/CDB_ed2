library(tidyverse)
library(mosaic)

# reading the data
d <- rio::import("data/bta.xls")
head(d)

# BTA and reference standard (cystoscopy)
tally(bta ~ cystoscopy, data=d)
tally(bta ~ cystoscopy, data=d, format="percent")

# using function diagnostic() of package ThresholdROC
library(ThresholdROC)
?diagnostic

tally(fct_rev(bta) ~ fct_rev(cystoscopy), data=d) %>% diagnostic()

# Cytology and reference standard (cystoscopy)
tally(cytology ~ cystoscopy, data=d)
x <- tally(cytology ~ cystoscopy, data=d, format="percent")
x

tally(fct_rev(cytology) ~ fct_rev(cystoscopy), data=d) %>% diagnostic()


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

