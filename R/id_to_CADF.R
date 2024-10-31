#' Convert to CADF for a single customer id
#'
#' `id_to_CADF` inputs is coming from a lapply operation on a split customer dataset.  If variable a is the split customer dataset then a$`1` is customer with ID 1
#'
#' Description here
#'@export id_to_CADF
#'@param data Transactional Data for one customerid
#'@param today.study.cutoff Separate data an holdout
id_to_CADF <- function(data, today.study.cutoff) {
  t <- Customer$new(data, today.study.cutoff)
  return(t)
}