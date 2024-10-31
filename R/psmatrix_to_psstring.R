
#' @title psmatrix_to_psstring
#' @param psmatrix purchase string of 1's and 0's in matrix format
#' @examples 

#' cadf.data.sample[[4]]$purchase_string_as_matrix

psmatrix_to_psstring <- function(psmatrix) {
  a <- apply(psmatrix, 1, paste, collapse="")
}