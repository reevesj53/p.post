#' Posterior probability of success
#'
#' The main function to calculate the number of success required, given number of subjects \eqn{n},
#'  to satisfy conditions for the posterior probability of the underlying success rate, p_post.
#'
#' @export
#' @param num Number of subjects.
#' @param rate Threshold for probability of success, \eqn{p_1}.
#' @param prob Threshold for posterior probability, \eqn{p_2}.
#' @return A data frame (tibble) with the following columns:
#'   \itemize{\item \strong{n}: Number of subjects
#'            \item \strong{res}: Number of responders
#'            \item \strong{prob}: Achieved posterior probability of success, \eqn{p_2}.
#'            }
#'
#' @details
#' [calc_post()] returns number successes required such that \eqn{P({\sf p\_post}>p_1) \ge p_2}.
#'
#' @examples
#' # Generate number of successes for up to 80 subjects.  Rate, p1, is 0.3.
#' # Posterior probability threshold ranges from 0.5 to 0.8.
#' p1 <- 0.3
#' p2 <- seq(0.5, 0.8, 0.1)
#' post_prob <- calc_post(80, p1, p2)
#' post_prob

calc_post <- function(num,rate,prob){

prob2 <- tidyr::expand_grid(prob,num=1:num)

calc_prob <- function(prob, num) {
  y <- 1:num
  shape1 <- 1+y
  shape2 <- 1+num-y
  post_prob <- stats::pbeta(rate, shape1, shape2, lower.tail = FALSE)
  ind <- which(post_prob>=prob)[1]
  probout <- NULL
  if(!is.na(ind)) probout <- tibble::tibble(n=num, prob=prob, res=ind, post_prob=post_prob[ind])
  probout
}

post_prob <- purrr::list_rbind(purrr::map2(prob2[["prob"]], prob2[["num"]], \(x,y) calc_prob(x,y)))
post_prob |> tibble::add_column(rate=rate, .before="prob")
}

