#' Defective Density: P(T_j, A_j) for All Subjects
#'
#' This function computes defective densities for all subjects in parallel.
#' @param T_mat A matrix of response times.
#' @param A_mat A matrix of actions.
#' @param S_mat A matrix of states.
#' @param R_mat A matrix of rewards.
#' @param Q0 Initial Q-values matrix.
#' @param alpha Parameter for DDM.
#' @param b Parameter for DDM.
#' @param c Parameter for DDM.
#' @param tau Parameter for DDM.
#' @param beta Learning rate in RL.
#' @param cores Number of cores for parallel processing.
#' @return A matrix of probabilities for all subjects.
fTA_mat <- function(T_mat, A_mat, S_mat, R_mat, Q0, alpha, b, c, tau, beta, cores) {
  n <- nrow(A_mat)  # Number of subjects
  
  # Parallel computation for each subject using mclapply
  probs_list <- parallel::mclapply(1:n, FUN = function(i) {
    fTA(T_mat[i,], A_mat[i,], S_mat[i,], R_mat[i,], Q0, alpha, b, c, tau, beta)
  }, mc.cores = cores)
  
  # Combine the results into a matrix
  probs_mat <- do.call(rbind, probs_list)
  return(probs_mat)
}