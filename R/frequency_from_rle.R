#' @title RLE object to frequency count
#' @export frequency_from_rle
#' 
#' @param x rle object
#' 
#' @examples
#' # example code
#' x <- c(1,1,0,1,0,0,1,0,0,0)
#' x.rle <- rle(x)
#' frequency_from_rle(x.rle)


frequency_from_rle <- function(x) {
  
  l <- rev(x$lengths)
  v <- rev(x$values)
  
  return(sum(x$lengths[x$values == 1]))
  
}