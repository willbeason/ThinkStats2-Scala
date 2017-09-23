# Exercises for Chapter 3 of ThinkStats in R.

source("code/src/main/R/lib.R")

# Again, I'll load the NSFG pregnancy file and select live births:

# Read NSFG data into a data.frame.
preg <- read.csv("data/2002FemPreg.csv")
live <- preg[preg[, "outcome"] == 1, ]

# Here's the histogram of birth weights:
myhist(live[, "birthwgt_lb"], xlab="Weight at Birth")
mylegend("Live Births")

# To normalize the disrtibution, we could use the probability option.
# The result is a Probability Mass Function (PMF).
myhist(live[, "birthwgt_lb"], xlab="Weight at Birth", probability=TRUE,
       ylab=NA)


