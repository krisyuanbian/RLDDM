#' Defective Density: P(T_j, A_j) for a Single Subject
#'
#' This function computes the defective density for a single subject.
#' @param DT A vector of response times.
#' @param A A vector of actions.
#' @param S A vector of states.
#' @param R A vector of rewards.
#' @param Q Initial Q-values matrix.
#' @param alpha DDM parameter.
#' @param b DDM parameter.
#' @param c DDM parameter.
#' @param tau DDM parameter.
#' @param beta Learning rate in RL.
#' @return A vector of probabilities for each trial.
fTA <- function(DT, A, S, R, Q, alpha, b, c, tau, beta) {
  J <- length(A)  # Number of trials
  probs <- numeric(J)  # Initialize probability vector
  
  for (j in 1:J) {
    a <- A[j]
    s <- S[j]
    r <- R[j]
    
    # Calculate the decision boundary
    z <- Q[2, s + 1] - Q[1, s + 1]
    
    # Compute the defective density using the Wiener DDM model
    probs[j] <- WienR::dWDM(t = DT[j], response = a + 1, a = alpha, v = c * z, 
                            w = b, t0 = tau)$value
    
    # Update Q-value for the next trial (if it's not the last one)
    if (j < J) {
      Q <- update_Q(a, s, r, Q, beta)
    }
  }
  return(probs)
}