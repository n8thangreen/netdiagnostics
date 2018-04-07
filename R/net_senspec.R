
#' Net test sensitivity and specificity.
#'
#' Combines multiple test into a de facto single test.
#'
#' Assuming each test performance is completely defined by it sensitivity and
#' specificity, various set intercept probabilities are calculated and combined,
#' similar to the inclusion-exclusion formula in probability theory
#' \url{https://en.m.wikipedia.org/wiki/Inclusion-exclusion_principle}.
#'
#' @section Serial vs parallel: It's assumed that the tests are done in parallel
#'   but in some cases a parallel diagnostic pathway is equivalent.
#'
#' @param pos_threshold Minimum number of positive required for overall
#'   positive.
#' @param sens,spec Model performance statistics (vector).
#'
#' @return Net sensitivity and specificity (list).
#' @export
#' @family diagnostic performance functions
#' @seealso \code{\link{prob_test_outcome_combination}} for how the
#'   probabilities are combined.
#' @aliases net_specsens
#' @keywords math
#'
#' @examples
#' NA
#' \dontrun{
#' #causes an error
#' }
net_sensspec <- function(pos_threshold,
                         sens,
                         spec) {

  if (length(sens) != length(spec))
    stop("Length of sens and spec must be the same.")

  assert_that(all(sens >= 0))
  assert_that(all(sens <= 1))
  assert_that(all(spec >= 0))
  assert_that(all(spec <= 1))

  assert_that(pos_threshold >= 0)
  if (floor(pos_threshold) != pos_threshold) message("using integer part of pos_threshold value")


  N <- length(sens)
  net_sens <- net_spec <- 0

  for (j in seq(0, N)) {

    if (j >= pos_threshold) {

      net_sens <- net_sens + prob_test_outcome_combination(sens, j)
    }
    if (j > N - pos_threshold) {

      net_spec <- net_spec + prob_test_outcome_combination(spec, j)
    }
  }

  list(net_sens = c(net_sens),
       net_spec = c(net_spec))
}

