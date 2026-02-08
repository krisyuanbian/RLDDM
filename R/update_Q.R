## Mechanism for Updating Q: (Action x State Matrix)
#'
#' This function updates the Q-values (action-state value matrix) based on
#' the observed reward. The update follows the standard Q-learning rule, where
#' the Q-value for the selected action in the current state is adjusted
#' according to the received reward.
#'
#' @param a The action taken (0 or 1).
#' @param s The state (0 or 1).
#' @param R The observed reward for the action taken in the given state.
#' @param Q A 2x2 matrix of Q-values, representing the action-state values.
#' @param beta The learning rate.
#' @return The updated Q matrix.
update_Q <- function(a, s, R, Q, beta) {
  # Copy current Q-values to Q1
  Q1 <- Q

  # Update Q-value for the taken action and state
  Q1[a + 1, s + 1] <- Q[a + 1, s + 1] + beta * (R - Q[a + 1, s + 1])

  return(Q1)
}
