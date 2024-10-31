#' CADF_to_nth_purchase_allrows inputs CADF data and the desired purchase number that you want to count the nth result of.

#' @param n the nth purchase
#' @param cadf.data  Data in R list format processed by CADF functions


#' @export CADF_to_nth_purchase_allrows
CADF_to_nth_purchase_allrows <- function(cadf.data, n) {                                                                   
  #extract the nth purchase
  rows_for_analysis <- lapply(cadf.data, function(x) x$data[x$data$purchase.num == n,])
  rows_for_analysis2 <- do.call(rbind, rows_for_analysis)
}