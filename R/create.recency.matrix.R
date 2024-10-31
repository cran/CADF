#' @title create_recency_string

#' @export create.recency.string
#' @param x vector of zeros and ones
#' @description
#' Tracks cumulative recency
#' 
#' @examples

#'head(cadf.data.sample)
#; x <- cadf.data.sample[[4]]$purchase_string_as_matrix

create.recency.string <- function(x) {
  
  v <- ifelse(x == 1, 0, 1)
  v <- ave(v, cumsum(v == 0), FUN = cumsum)
  return(v)
  
}