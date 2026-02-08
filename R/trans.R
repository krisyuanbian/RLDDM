#' Transformation of Parameters
#'
#' This function applies a transformation to the model parameters to ensure valid ranges.
#' @param x A vector of model parameters.
#' @param minRT Minimum response time.
#' @return A transformed parameter vector.
trans <- function(x, minRT) {
  result <- rep(NA, 5)
  result[1] <- exp(x[1])  # Alpha (positive, log-scale)
  result[2] <- 1 / (1 + exp(-x[2]))  # B (bounded between 0 and 1)
  result[3] <- x[3]  # No transformation for c
  result[4] <- minRT / (1 + exp(-x[4]))  # Tau (bounded between 0 and minRT)
  result[5] <- 1 / (1 + exp(-x[5]))  # beta (bounded between 0 and 1)
  return(result)
}