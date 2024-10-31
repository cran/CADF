#' @export modeling.annualhalfing.likelihood
#' 
#' @title Likelihood function for annual halfing model
#' 
#' @param grid2 Modeling parameters
#' @param rec recency
#' @param freq frequency
#' @param targetBuy indicator if purchase was made in holdout period

modeling.annualhalfing.likelihood<- function(grid2, rec, freq, targetBuy) {
  
  
  pi0 <- grid2[2] + grid2[4] * exp(-grid2[3] * freq)
  
  k <- grid2[1]
  y0 <- grid2[2]
  y1 <- grid2[3]
  y2 <- grid2[4]
  
  LLalt = (targetBuy * log(pi0 * (grid2[1]^rec))) + ((1-targetBuy) * log(1-pi0*(grid2[1]^rec)))
  LLalt = as.numeric(LLalt)
  return(sum(LLalt))
  
}
