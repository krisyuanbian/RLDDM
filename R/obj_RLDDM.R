#' Objective Function for RL-DDM Model
#'
#' This function computes the negative log-likelihood for the RL-DDM model given parameters.
#' @param pars A vector of model parameters.
#' @param T_mat A matrix of response times.
#' @param A_mat A matrix of actions.
#' @param S_mat A matrix of states.
#' @param R_mat A matrix of rewards.
#' @param Q A matrix representing Q-values for the RL model.
#' @param cores Number of cores for parallel processing.
#' @return The negative log-likelihood.
obj_RLDDM <- function(pars, T_mat, A_mat, S_mat, R_mat, Q, cores) {
  # Find minimum response time
  minRT <- min(T_mat)
  
  # Transform the parameters to ensure they are within bounds
  pars1 <- trans(pars, minRT)
  
  # Bound parameters to valid ranges
  alpha <- max(min(pars1[1], 100000), 0.001)
  b <- max(min(pars1[2], 0.999), 0.001)
  c <- pars1[3]
  tau <- pars1[4]
  beta <- pars1[5]
  
  # Calculate the probability matrix
  p <- fTA_mat(T_mat, A_mat, S_mat, R_mat, Q, alpha, b, c, tau, 
               beta, cores)
  
  # Compute negative log-likelihood
  out <- -sum(log(p))
  return(out)
}