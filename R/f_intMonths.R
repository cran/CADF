#' Compute the months between two purchase dates
#'
#' @param a starting date
#' @param b ending date
#'
#' Description here
f_intMonths = function(a, b) {
  i <- lubridate::interval(a,b) %/% months(1)
  return(i + 1)}
