## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(binomial)

## ------------------------------------------------------------------------
bin_choose(n = 5, k = 2)

## ------------------------------------------------------------------------
bin_probability(success = 2, trials = 5, prob = 0.5)

## ------------------------------------------------------------------------
dis1 <- bin_distribution(trials = 5, prob = 0.5)
dis1
plot(dis1)

## ------------------------------------------------------------------------
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
dis2
plot(dis2)

## ------------------------------------------------------------------------
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
binsum1 <- summary(bin1)
binsum1

