#' Annual Halfing Model
#' 
#' @description
#' A recency-frequency model used in non-contractual situations.
#' Model assumptions:
#' 1.) Increasing recency leads to higher probability of quitting.
#' 2.) Frequency is related to exponential learning curves
#' Reference: Segmentation and Lifetime Value Modeling in SAS (Edward Malthouse)

#' @examples
#' dta <- lapply(CADF::cadf.data.sample, function(x) tail(x$data, 1))
#' dta <- do.call(rbind, dta)
#' starting.values <- c(.5,.9,.2,-.9)
#' annualhalfingmodel(cadf.data.sample, starting.values)

#' @param cadf.data cadf-formatted dataset
#' @param starting.values parameter starting values for model

#'@return Returns model parameters
#' @export annualhalfingmodel

annualhalfingmodel <- function(cadf.data, starting.values) {
  dta <- lapply(cadf.data, function(x) tail(x$data, 1))
  dta <- do.call(rbind, dta)
  
  rec = as.numeric(dta$diff.years)
  freq = dta$Frequency.baseperiod
  targetBuy = dta$target.buy
  
  dta <- data.frame(rec, freq, targetBuy)
  
  m <- optim(starting.values, annualhalfing_LL, dta = dta)
  
  return(m)
  
}