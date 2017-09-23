# Exercises for Chapter 2 of ThinkStats in R.
setwd("data")

mycolors <- c("#70a845", "#8161cc")
mytints <- c("#9CCD76", "#A388E0")

myhist <- function(x, ...) {
  hist(x, col=mycolors[1], border=mytints[1], ...)
}

mybarplot <- function(x, ...) {
  num_rows <- dim(x)[1]
  barplot(x, col=mycolors[1:num_rows], border=mytints[1:num_rows],
          space=c(0,1), beside=TRUE, ...)
}

# First, I'll load the data from the pregnancy file and select the records for
# live births.

# Read NSFG data into a data.frame.
preg <- read.csv("2002FemPreg.csv")
live <- preg[preg[, "outcome"] == 1, ]
dead <- preg[preg[, "outcome"] != 1, ]

# Here's the histogram of birth weights in pounds. Notice that hist works with
# any numeric vector.
myhist(live[, "birthwgt_lb"], xlab="Birth weight (pounds)", ylab = "Count",
       main=NA)
legend("topright", "Live Births", fill=mycolors[1], border=mytints[1],
       bty="n")

# Before plotting the ages, I'll apply floor to round down:
liveages <- table(floor(live[, "agepreg"]))
deadages <- table(floor(dead[, "agepreg"]))
ages <- rbind(liveages, deadages[match(rownames(liveages), rownames(deadages))])
ages[is.na(ages)] <- 0
mybarplot(ages, main="Counts by Age")
