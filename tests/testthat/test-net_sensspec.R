context("net_sensspec")

suppressWarnings(library(Rfast))
library(utils)

test_that("proportions positive", {

  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = c(0.1,0.2,0.3,0.4),
                            spec = c(0.1,0.2,0.3,0.4)),
               list(net_sens = 0.2572, net_spec = 0.0428))

  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = c(0.1,0.2,0.3),
                            spec = c(0.1,0.2,0.3)),
               list(net_sens = 0.098, net_spec = 0.098))


  expect_equal(net_sensspec(pos_threshold = 2,
                            sens = c(0.1,0.2),
                            spec = c(0.1,0.2)),
               list(net_sens = 0.02, net_spec = 0.28))

})
