#' PDF probability function for gamma distribution
#' @export pdf_gamma
#' @param x between 0 and 1 for pdf
#' @param r shape parameter
#' @param a scale parameter

#k > 0 shape
#θ > 0 scale

#r = shape
#a = scale
pdf_gamma <- function(x, r, a) {
  #formula source http://www.brucehardie.com/talks/supp_mats00.pdf
  
  f <- ((a^r) * (x^(r-1)) * exp(-a * x))/gamma(r)
  return(f)
}
