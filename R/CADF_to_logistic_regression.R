#' @title CADF to logistic regression
#' @description
#' Convert a CADF dataset to a dataset for logistic regression
#' 
#' @export CADF_to_logistic_regression
#' @param CADF CADF-formatted dataset
CADF_to_logistic_regression <- function(CADF) {
  a <- lapply(CADF, function(x) x$logistic_modeling_matrix)
  logistic.data <- do.call(rbind, a)
  logistic.data <- data.frame(logistic.data)
  colnames(logistic.data) <- c("T", "cancel")
  logistic.data
}