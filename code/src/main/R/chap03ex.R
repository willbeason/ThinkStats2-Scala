# Exercises for Chapter 3 of ThinkStats in R.

source("code/src/main/R/lib.R")

# Again, I'll load the NSFG pregnancy file and select live births:

# Read NSFG data into a data.frame.
preg <- read.csv("data/2002FemPreg.csv")
live <- preg[preg[, "outcome"] == 1, ]

# Here's the histogram of birth weights:

