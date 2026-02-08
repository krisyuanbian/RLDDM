#' Inverse Transformation of Parameters
#'
#' This function applies the inverse transformation to the model parameters.
#' @param x A vector of transformed parameters.
#' @param minRT Minimum response time.
#' @return A vector of inverse-transformed parameters.
inv_trans <- function(x, minRT) {
  result <- rep(NA, 5)
  result[1] <- log(x[1])  # Inverse of alpha
  result[2] <- log(x[2] / (1 - x[2]))  # Inverse of b
  result[3] <- x[3]  # No transformation for c
  result[4] <- log(x[4] / (minRT - x[4]))  # Inverse of tau
  result[5] <- log(x[5] / (1 - x[5]))  # Inverse of beta
  return(result)
}