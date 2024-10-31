#' For each customer, return a modeling matrix that is utilized for logistic regression
#'
#' `f_CustomerModelingMatrix` inputs are cancellation_time.
#'
#' Description here
#' @examples
#' f_CustomerModelingMatrix(10)
#' @export f_CustomerModelingMatrix
#' @param cancellation_time = cancellation time
f_CustomerModelingMatrix = function(cancellation_time) {
  
  t_ELT = cancellation_time-1 #time_effective_last_transaction
  t_EA = cancellation_time #time_of_attrition.  This may be estimated based on XYZ setting.
  
  d <- matrix(data = NA, nrow = t_EA, ncol=2)
  
  d[,1] = 1:nrow(d)
  
  d[,2][1:t_ELT] = 0
  d[,2][t_EA] = 1
  return(d)
  
}