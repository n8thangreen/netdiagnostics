
test_preformance <-
  list(
    test1 = c(sens = 0.1,
              spec = 0.2),
    test2 = c(sens = 0.3,
              spec = 0.4))

sens_alltest <- purrr::map_dbl(test_preformance, "sens")
spec_alltest <- purrr::map_dbl(test_preformance, "spec")


save(test_preformance, file = "data/test_performance.RData")
