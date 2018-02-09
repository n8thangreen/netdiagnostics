
#' prob_test_outcome_combination
#'
#' @param prob
#' @param n_choose
#'
#' @return
#' @export
#'
#' @examples
prob_test_outcome_combination <- function(prob,
                                          n_choose) {

  p_comb <- combn(x = prob, m = n_choose)
  n_comb <- combn(x = 1 - prob, m = length(prob) - n_choose)

  p_probs <- colprods(p_comb)
  n_probs <- colprods(n_comb)

  return(p_probs %*% rev(n_probs))
}
