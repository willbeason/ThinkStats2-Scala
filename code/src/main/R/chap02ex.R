# Exercises for Chapter 2 of ThinkStats in R.
library(effsize)

source("code/src/main/R/lib.R")

# First, I'll load the data from the pregnancy file and select the records for
# live births.

# Read NSFG data into a data.frame.
preg <- read.csv("data/2002FemPreg.csv")
live <- preg[preg[, "outcome"] == 1, ]

# Here's the histogram of birth weights in pounds. Notice that hist works with
# any numeric vector.
myhist(live[, "birthwgt_lb"], xlab="Birth weight (pounds)", ylab = "Count",
       main=NA, breaks=0:15)
legend("topright", "Live Births", fill=mycolors[1], border=mytints[1],
       bty="n")

# Before plotting the ages, I'll apply floor to round down.
myhist(live[, "agepreg"], breaks=10:45, xlab="Mother's Age (Years)", ylab="Count",
       main="Mother's Age at Baby's Birth")
legend("topright", "Live Births", fill=mycolors[1], border=mytints[1],
       bty="n")

# As an exercise, plot the histogram of pregnancy lengths (column prglngth).
myhist(live[, "prglngth"], breaks=0:50, xlab="Pregnancy Length (Weeks)",
       ylab="Count", main="Length of Pregnancy", xlim=c(27,45))
legend("topright", "Live Births", fill=mycolors[1], border=mytints[1],
       bty="n")

# R provides head(), which select the lowest values and their frequencies.
head(table(live[, "prglngth"]), n=10)

# R provides head(), which select the lowest values and their frequencies.
tail(table(live[, "prglngth"]), n=10)

# From live births, we can selection first babies and others using birthord,
# then compute histograms of pregnancy length for the two groups.
firsts = live[live[, "birthord"] == 1, ]
others = live[live[, "birthord"] != 1, ]

myhist(firsts[, "prglngth"], breaks=0:50, xlab="Pregnancy Length (Weeks)",
       ylab="Count", main="Length of Pregnancy", xlim=c(27,45))
legend("topright", "First Live Births", fill=mycolors[1], border=mytints[1],
       bty="n")

myhist(others[, "prglngth"], breaks=0:50, xlab="Pregnancy Length (Weeks)",
       ylab="Count", main="Length of Pregnancy", xlim=c(27,45))
legend("topright", "Other Live Births", fill=mycolors[1], border=mytints[1],
       bty="n")

# Methods to compute summary statistics:
mean(live[, "prglngth"])
var(live[, "prglngth"])
sd(live[, "prglngth"])

# As an exercise, confirm that std is the square root of var:
var(live[, "prglngth"]) == sd(live[, "prglngth"])^2

# Here's are the mean pregnancy lengths for first babies and others:
c(mean(firsts[, "prglngth"]), mean(others[, "prglngth"]))

# And here's the difference (in weeks):
mean(firsts[, "prglngth"]) - mean(others[, "prglngth"])

# This functon computes the Cohen effect size, which is the difference
# in means expressed in number of standard deviations:
cohen.d(firsts[, "prglngth"], others[, "prglngth"])

# Using the variable totalwgt_lb, investigate whether first babies are lighter
# or heavier than others.
# Compute Cohen’s effect size to quantify the difference between the groups.
# How does it compare to the difference in pregnancy length?
cohen.d(firsts[, "totalwgt_lb"], others[, "totalwgt_lb"], na.rm=TRUE)

# For the next few exercises, we'll load the respondent file:
resp <- read.csv("data/2002FemResp.csv")

# Make a histogram of totincr the total income for the respondent's family. To
# interpret the codes see the codebook.
myhist(resp[, "totincr"], xlab="Income Bracket", ylab="Count",
       main = "Income Bracket of Respondent")

# Make a histogram of age_r, the respondent's age at the time of interview.
myhist(resp[, "age_r"], xlab="Age", ylab="Count", breaks=14:45,
       main = "Age of Respondent")

# Make a histogram of numfmhh, the number of people in the respondent's
# household.
myhist(resp[, "numfmhh"], xlab="People in Household", ylab="Count",
       breaks=0:9, main = "Household Size")

# Make a histogram of parity, the number of children borne by the respondent.
# How would you describe this distribution?
myhist(resp[, "parity"], xlab="Number of Children", ylab="Count",
       breaks=0:22, main = NA)

# Use Hist.Largest to find the largest values of parity.
tail(table(resp[, "parity"]), n=10)

# Let's investigate whether people with higher income have higher parity. Keep
# in mind that in this study, we are observing different people at different
# times during their lives, so this data is not the best choice for answering
# this question. But for now let's take it at face value.
# Use totincr to select the respondents with the highest income (level 14).
# Plot the histogram of parity for just the high income respondents.
high_income = resp[resp[, "totincr"] == 14, ]
myhist(high_income[, "parity"], xlab="Number of Children", ylab="Count",
       breaks=0:8, main = "Number of Children in High Income Families")

low_income = resp[resp[, "totincr"] != 14, ]
c("High Income"=mean(high_income[, "parity"]),
  "Low Income"=mean(low_income[, "parity"]))

# Compute the Cohen effect size for this difference. How does it compare with
# the difference in pregnancy length for first babies and others?
cohen.d(high_income[, "parity"], low_income[, "parity"], na.rm=TRUE)
