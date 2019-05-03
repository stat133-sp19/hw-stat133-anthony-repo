#' @title bin_distribution
#' @description calculates the distribution for a binomial variable
#' @param trials number of trials
#' @param prob the probability value of the binomial variable
#' @return a dataframe with probability distribution: success in first column, probability in the second column
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob) {
  binom_dist <- data.frame(success = 0:trials, probability = bin_probability(0:trials, trials, prob))
  class(binom_dist) <- c("bindis", "data.frame")
  binom_dist
}

#' @export
plot.bindis <- function(x, ...) {
  library(ggplot2)
  ggplot(x, aes(x = success, y = probability)) +
    geom_histogram(stat = "identity") +
    theme_classic()
}
