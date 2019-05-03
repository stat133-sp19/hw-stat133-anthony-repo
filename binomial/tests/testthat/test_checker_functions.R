context("Check for checker functions")

test_that("check_prob with valid prob value", {

  expect_true(check_prob(0.5))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
})

test_that("check_prob with invalid prob value", {

  expect_error(check_prob(-1))
  expect_error(check_prob("a"))
  expect_error(check_prob(2))
  expect_error(check_prob(c(1, 2)))
})

test_that("check_trials with valid number of trials", {

  expect_true(check_trials(10))
  expect_true(check_trials(1))
})

test_that("check_trials with invalid number of trials", {

  expect_error(check_trials(-1))
  expect_error(check_trials(0))
  expect_error(check_trials("a"))
  expect_error(check_trials(c(1, 2)))
})

test_that("check_success with valid number of success and trials", {

  expect_true(check_success(0, 2))
  expect_true(check_success(2:4, 5))
})

test_that("check_success with invalid number of success and trials", {

  expect_error(check_success(2, 1))
  expect_error(check_success(-1, 2))
  expect_error(check_success(1, -1))
  expect_error(check_success(2:4, 3))
  expect_error(check_success(1.5, 3))
})
