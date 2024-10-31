#' @title Likelihood maximization for annual halfing customer retention model


#'@export annualhalfing_LL
 

#'@return Annual halfing Likelihood in optimization routine
#'
#'@param grid model parameters
#'@param dta dataset


annualhalfing_LL <- function(grid, dta) {
  
  freq <- dta$freq
  rec <- dta$rec
  targetBuy <- as.numeric(dta$targetBuy)
  
  k <- grid[1]
  y0 <- grid[2]
  y1 <- grid[3]
  y2 <- grid[4]
  
  LLalt = targetBuy * log((y0 + y2 * exp(-1 * y1 * freq)) * k ^ rec) + (1 - targetBuy) * log(1 - (y0 + y2 * exp(-1 * y1 * freq)) * k ^ rec)
  LLalt = sum(as.numeric(LLalt))
  return(LLalt)
  
}