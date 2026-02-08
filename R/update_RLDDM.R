#' Update for RL-DDM
#'
#' This function optimizes the parameters of the RL-DDM model by minimizing the negative log-likelihood.
#' @param pars Initial parameter values.
#' @param T_mat A matrix of response times.
#' @param A_mat A matrix of actions.
#' @param S_mat A matrix of states.
#' @param R_mat A matrix of rewards.
#' @param Q A matrix representing Q-values for the RL model.
#' @param cores Number of cores for parallel processing.
#' @return Optimized parameter values.
update_RLDDM <- function(pars, T_mat, A_mat, S_mat, R_mat, Q, cores) {
  # Perform optimization
  opt <- optim(par = pars, fn = obj_RLDDM,
               method = "BFGS",
               T_mat = T_mat, A_mat = A_mat, S_mat = S_mat, R_mat = R_mat, 
               Q = Q, cores = cores)
  
  # Return the optimized parameters
  pars1 <- opt$par
  return(pars1)
}