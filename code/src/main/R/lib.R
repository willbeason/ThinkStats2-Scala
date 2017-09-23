# Methods I use because they're pretty.

mycolors <- c("#70a845", "#8161cc")
mytints <- c("#9CCD76", "#A388E0")

myhist <- function(x, ...) {
  hist(x, col=mycolors[1], border=mytints[1], right=FALSE, ...)
}

mybarplot <- function(x, ...) {
  num_rows <- dim(x)[1]
  barplot(x, col=mycolors[1:num_rows], border=mytints[1:num_rows],
          space=c(0,1), beside=TRUE, ...)
}
