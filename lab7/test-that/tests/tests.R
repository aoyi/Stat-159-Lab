source("../functions/functions.R")
context("Test for range value")

test_that("range works as expected", {
	x <- c(1, 2, 3, 4, 5)
	expect_equal(range_value(x), 4)
	expect_length(range_value(x), 1)
	expect_type(range_value(x), 'double')
	})

test_that("range works with NA", {
	y <- c(1, 2, 3, 4, NA)
	expect_length(range_value(y), 1)
	expect_equal(range_value(y), NA_real_)
	expect_equal(range_value(y, na.rm = TRUE), 3)
	})

test_that("range works with boolean values", {
	z <- c(TRUE, FALSE, TRUE)
	expect_length(range_value(z), 1)
	expect_type(range_value(z), 'integer')
	})

test_that("range errors when works with text characters", {
	w <- letters[1:5]
	expect_error(range_value(w), "non-numeric argument to binary operator")
	})

context("Test for missing value")

test_that("missing value works as expected", {
  p <- c(1, 2, 3, 4, NA)
  expect_length(missing_values(p), 1)
  expect_type(missing_values(p), "double")
  expect_gte(missing_values(p), 1)
})



