#' CADF_to_migration_model converts CADF data to migration model data

#' @export CADF_to_migration_model

#' @description
#' Builds transition matrix for a migration model.
#' T is the maximum time cutoff which defaults to 5.   
#' The output will be a transition matrix.


#' @param cadf.data  Data in R list format processed by CADF functions
#' @param maxT If time is greater than maxT it will be converted into a + category

#' @examples
#' tmatrix <- CADF_to_migration_model(cadf.data.sample)


CADF_to_migration_model <- function(cadf.data, maxT = 5) {
  
  x <- lapply(cadf.data, function(x) c(x$recency_string_as_matrix))
  y <- lapply(x, function(x) ifelse(x > maxT, maxT, x))
  mcX<-markovchain::markovchainFit(y)$estimate
  
  return(mcX)
  
  
}