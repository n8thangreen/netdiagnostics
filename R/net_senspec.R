
#' net_sensspec
#'
#' @param pos_threshold
#' @param sens
#' @param spec
#'
#' @return
#' @export
#'
#' @examples
net_sensspec <- function(pos_threshold,
                         sens,
                         spec) {

  if (length(sens) != length(spec))
    stop("Length of sens and spec must be the same.")

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

