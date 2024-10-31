#' @title bigT_expand_via_apply

#' @export bigT_expand_via_apply
#' @param x vector containing bigT, cancel and count
#' 
#' @examples
#' x <- c(3, 1, 5)
#' bigT_expand_via_apply(x)
bigT_expand_via_apply <- function(x) {
  
  bigT <- x[1]
  cancel <- x[2]
  count <- x[3]
  
  t.vec <- 1:bigT
  cancel.vec <- rep(0, bigT)
  cancel.vec[bigT] <- cancel
  
  df <- data.frame("bigT" = t.vec, "cancel" = cancel.vec)
  df2 <- do.call("rbind", replicate(count, df, simplify = FALSE))
  df2
}


