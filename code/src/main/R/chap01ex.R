# Exercises for Chapter 1 of ThinkStats in R.
setwd("data")

# Read NSFG data into a data.frame.
preg <- read.csv("2002FemPreg.csv")

# Print the column names.
colnames(preg)

# Select a single column name.
colnames(preg)[3]

# Select a column and check what type it is.
class(preg[, 3])

# Print a column.
preg[, "pregordr"]

# Select a single element from a column.
preg[2, "pregordr"]

# Select a slice from a column.
preg[3:5, "pregordr"]

# Count the number of times each value occurs.
table(preg[, "outcome"])

# Check the values of another variable.
table(preg[, "birthwgt_lb"])

# Select the birthord column, print the value counts, and compare to results 
# published in the codebook. We can also use useNA to count the number of NAs.
table(preg[, "birthord"], useNA="always")

# Select the prglngth column, print the value counts, and compare to results
# published in the codebook.
table(preg[, "prglngth"])

# To compute the mean of a column, you can invoke the mean method on a vector.
# For example, here is the mean birthweight in pounds.
mean(preg[, "totalwgt_lb"], na.rm=TRUE)

# Create a new column named totalwgt_kg that contains birth weight in
# kilograms. Compute its mean.
preg[, "totalwgt_kg"] <- preg[, "totalwgt_lb"] * 0.453592
mean(preg[, "totalwgt_kg"], na.rm=TRUE)

# Read  the female respondents file into a data.frame.
resp <- read.csv("2002FemResp.csv")

# Select the age_r column from resp and print the value counts. How old are
# the youngest and oldest respondents?
table(resp[, "age_r"])
min(resp[, "age_r"])
max(resp[, "age_r"])

# We can use the caseid to match up rows from resp and preg. For example, we
# can select the row from resp for caseid 2298 like this:
resp[resp[, "caseid"] == 2298, 1:5]

# And we can get the corresponding rows from preg like this:
preg[preg[, "caseid"] == 2298, 1:5]

# How old is the respondent with caseid 1?
resp[resp[, "caseid"] == 1, "age_r"]

# What are the pregnancy lengths for the respondent with caseid 2298?
preg[preg[, "caseid"] == 2298, "prglngth"]

# What was the birthweight of the first baby born to the respondent with caseid
# 5012?
preg[preg[, "caseid"] == 5012, "totalwgt_lb"]
