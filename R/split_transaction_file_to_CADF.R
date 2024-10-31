#' @title Create a CADF dataset from a dataframe
#' @export split.transaction.file_to_CADF
#' @param data data frame for a single customer id
#' @param today.study.cutoff separate analysis and holdout data
split.transaction.file_to_CADF <- function(data, today.study.cutoff) {
  a <- lapply(data, id_to_CADF, today.study.cutoff)
  return (a)
}