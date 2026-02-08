#' RL-DDM Algorithm
#'
#' This function runs the RL-DDM algorithm.
#' @param T_mat A matrix of response times.
#' @param A_mat A matrix of actions.
#' @param S_mat A matrix of states.
#' @param R_mat A matrix of rewards.
#' @param q0 Initial Q-value.
#' @param alpha0 Initial alpha value.
#' @param b0 Initial b value.
#' @param c0 Initial c value.
#' @param tau0 Initial tau value.
#' @param beta0 Initial beta value.
#' @param tol Tolerance for convergence (default is 1e-4).
#' @param cores Number of cores for parallel processing (default is 4).
#' @return A list of optimized parameters (alpha, b, c, tau, beta).
#' @export
RL_DDM <- function(T_mat, A_mat, S_mat, R_mat, q0, alpha0, b0, c0, tau0, beta0, 
                   tol = 1e-4, cores = 4) {
  # Initialize Q matrix (2x2)
  Q <- matrix(c(q0, 0, 0, q0), 2, 2)
  minRT <- min(T_mat)
  
  # Transform initial parameters
  init <- inv_trans(c(alpha0, b0, c0, tau0, beta0), minRT)
  
  # Update parameters using the RL-DDM update function
  transpars1 <- update_RLDDM(init, T_mat, A_mat, S_mat, R_mat, Q, cores)
  
  # Inverse transformation of the updated parameters
  pars1 <- trans(transpars1, minRT)
  
  # Return optimized parameters as a list
  alpha1 <- pars1[1]
  b1 <- pars1[2]
  c1 <- pars1[3]
  tau1 <- pars1[4]
  beta1 <- pars1[5]
  
  return(list(alpha = alpha1, b = b1, c = c1, tau = tau1, beta = beta1))
}