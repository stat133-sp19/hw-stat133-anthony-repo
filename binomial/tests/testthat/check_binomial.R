context("Check for binomial functions")

testthat("bin_choose with valid input", {

  expect_output(bin_choose(5, 2), 10)
  expect_length(bin_choose(2:3, 2), 2)
  expect_type(bin_choose(10, 2), "double")
})

testthat("bin_choose with invalid input", {

  expect_error(bin_choose(2, 5))
  expect_error(bin_choose(2:5, 4))
  expect_error(bin_choose(-2, 4))
})

testthat("bin_probability with valid input", {
  expect_output(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250))
})

testthat("bin_probability with invalid input", {

  expect_error(bin_probability(-1, 5, 0.5))
  expect_error(bin_probability(2, 2:5, 0.5))
  expect_error(bin_probability(3, 5, 2))
})

testthat("bin_distribution with valid input", {

  expect_type(bin_distribution(5, 0.5), "list")
  expect_s3_class(bin_distribution(5, 0.5), c("bindis", "data.frame"))
  expect_length(bin_distribution(5, 0.5), 2)
})

testthat("bin_cumulative with valid input", {
  expect_type(bin_cumulative(5, 0.5), "list")
  expect_s3_class(bin_cumulative(5, 0.5), c("bincum", "data.frame"))
  expect_length(bin_cumulative(5, 0.5), 3)
})
