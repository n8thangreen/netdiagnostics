context("net_sensspec")

suppressWarnings(library(Rfast))
library(utils)
library(assertthat)


test_that("different numbeer of tests", {

  # 4 tests
  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = c(0.1,0.2,0.3,0.4),
                            spec = c(0.1,0.2,0.3,0.4)),
               list(net_sens = 0.2572, net_spec = 0.0428))

  # 3 tests
  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = c(0.1,0.2,0.3),
                            spec = c(0.1,0.2,0.3)),
               list(net_sens = 0.098, net_spec = 0.098))

  # 2 tests
  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = c(0.1,0.2),
                            spec = c(0.1,0.2)),
               list(net_sens = 0.02, net_spec = 0.28))
})

test_that("edge cases", {

  expect_equal(net_sensspec(pos_threshold = 1,
                            sens = 0.1,
                            spec = 0.2),
               list(net_sens = 0.1, net_spec = 0.2))

  expect_equal(net_sensspec(pos_threshold = 0,
                            sens = 0.1,
                            spec = 0.2),
               list(net_sens = 1, net_spec = 0))

  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = 0.1,
                            spec = 0.2),
               list(net_sens = 0, net_spec = 1))
})

test_that("errors and warnings", {

  expect_error(net_sensspec(pos_threshold = 1,
                            sens = 0.1,
                            spec = 2))
  expect_error(net_sensspec(pos_threshold = 1,
                            sens = 2,
                            spec = 0.2))
  expect_error(net_sensspec(pos_threshold = -1,
                            sens = 0.1,
                            spec = 0.2))
  expect_message(net_sensspec(pos_threshold = 1.2,
                              sens = 0.1,
                              spec = 0.2))
})
