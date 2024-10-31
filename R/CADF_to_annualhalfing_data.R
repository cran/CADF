#' @title Convert CADF dataset into annualhalfing model dataset
#' @export CADF_to_annualhalfing_data
#' 
#' @param cadf.data CADF dataset
#' @description
#' Converts CADF output to dataset for annual halfing model
#' 
CADF_to_annualhalfing_data <- function(cadf.data) {
  dta <- lapply(cadf.data, function(x) utils::tail(x$data, 1))
  dta <- do.call(rbind, dta)
  return(dta)
  
}