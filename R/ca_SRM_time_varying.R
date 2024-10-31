#' Time varying Simple retention model

#' Estimates retention rate using logistic regression and the simple regression model

#' Mostly used for contractual models where there are clear opportunities for cancellation.  
#' Could be used in non-contractional
#' situations although the cancellation opportunities should be defined.  Not recommended
#' for use with services that consumers use rotating-door style.  Use the migration model there.

#'@export ca_SRM_time_varying
#'@param df_logistic  A data frame, formatted for logistic regression.  
#'1 row for each customer id/timeperiod.  1/0 for purchase.  
#'
#'@param reference_level  All coefficients will be judged relevant to the reference level.  It defaults to 
#'time period 12.  (Note interpretation will change based on how T is formulated.)
#'
#'@param maxT  The number of timeperiods to build.



#'@return Returns logistic model results (the glm model)


#' @examples
#' library(stats)
#' x <- c(3, 1, 5)
#' df_logistic <- bigT_expand_via_apply(x)
#' model <- ca_SRM_time_varying(df_logistic, reference_level = 3)

ca_SRM_time_varying <- function(df_logistic, reference_level = 12, maxT = 12) {
  
  #assumes df_logistic first column is T, second column is cancel 0/1 indicator
  
  df_logistic$T <- factor(df_logistic[, 1])
  df_logistic$T <- relevel(df_logistic$T, ref = reference_level)
  
  model <- glm(cancel ~ T, family = stats::binomial(link = "logit"), data = df_logistic)
  
}
