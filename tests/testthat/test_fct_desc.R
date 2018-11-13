context("Changing factor levels to descending order")

test_that("Reordering numeric values", {
  num_v <- c(100, 50, 1000, 0, 70)
  expect_identical(fct_desc(num_v),
                   factor(num_v, levels = c(1000, 100, 70, 50, 0)))
})

test_that("Reordering strings", {
  str_v <- c("Albania", "USA", "Canada", "Russia", "China", "Brazil")
  expect_identical(fct_desc(str_v),
                   factor(str_v,
                          levels = c("USA", "Russia", "China", "Canada", "Brazil", "Albania")))
})

test_that("Reordering factors", {
  str_v <- c("Albania", "USA", "Canada", "Russia", "China", "Brazil")
  fct_str <- factor(str_v, levels = str_v)
  expect_identical(fct_desc(fct_str),
                   factor(str_v,
                          levels = c("USA", "Russia", "China", "Canada", "Brazil", "Albania")))
})

