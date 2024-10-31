#' @title ca_SRM
#' @export ca_SRM

#' @examples
#' customertype1 <- c(3, 1, 5)
#' customertype2 <- c(12, 0, 3)
#' cust1 <- bigT_expand_via_apply(customertype1)
#' cust2 <- bigT_expand_via_apply(customertype2)
#' df_logistic <- rbind(cust1, cust2)
#' model <- ca_SRM(df_logistic)

#' @param df_logistic data frame containing the data for logistic regression

ca_SRM <- function(df_logistic) {
  #estimates retention rate using logistic regression and the simple regression model
  #SAS DESCENDING OPTION is one minus in R
  #Intercept only model
  #model <- stats::glm((1-cancel) ~ 1, family = "binomial", data = df_logistic)
  model <- stats::glm(cancel ~ 1, family = "binomial", data = df_logistic)
  intercept <- model$coefficients[1]
  r <- 1 - exp(intercept)[[1]]
  r <- round(r, 3)
  return(r)
  
}