#' @title Simple Migration
#' @export simple_migration
#' 
#' 
#' 
#' @description Function used for simulation and scenario planning
#' 
#' @examples
#' simple_migration(200, .80, .20, 12)
#' 
#' @param num.customers Number of customers for the simulation.
#' @param pct.buy.buy percentage of customers that buy in the nxt period
#' @param pct.nobuy.buy percentage of non buyers that convert over to buyers
#' @param n.periods number of periods
simple_migration <- function(num.customers, pct.buy.buy, pct.nobuy.buy, n.periods) {
  
  n <- num.customers
  period <- matrix(0:n.periods - 1)
  buy <- rep(0, n.periods)
  nobuy <- rep(0, n.periods)
  
  for (x in 1:n.periods) {
    if(x == 1) {
      buy[x] <- n
      nobuy[x] <- 0
      next
    }
    buy[x] <- (buy[x-1] * pct.buy.buy) + (nobuy[x-1] * pct.nobuy.buy)
    
    nobuy[x] <- n - buy[x]
  }
  
  ret <- data.frame(buy,nobuy)
  row.names(ret) <- 0:(n.periods-1)
  ret
}

