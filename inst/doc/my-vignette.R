## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)





## ----setup, echo = FALSE------------------------------------------------------
library(CADF)
library(survival)

## -----------------------------------------------------------------------------

data(transactions)
transactions.filtered <- transactions[, c("ID", "PURCHASE_DATE")]
str(transactions.filtered)                             
                          

## -----------------------------------------------------------------------------

transactions.splitted <- split(transactions.filtered, transactions.filtered$ID)




## -----------------------------------------------------------------------------

cadf <- split.transaction.file_to_CADF(transactions.splitted, max(transactions$PURCHASE_DATE))



## -----------------------------------------------------------------------------

cadf["400"]



## -----------------------------------------------------------------------------

nth.purchase <- CADF_to_nth_purchase(cadf, 3)


## -----------------------------------------------------------------------------

nth.purchase.more <- CADF_to_nth_purchase_allrows(cadf,3)
head(nth.purchase.more)


## -----------------------------------------------------------------------------

cadf$`400`$purchase_string



## -----------------------------------------------------------------------------

cadf$`400`$purchase_string_as_matrix


## -----------------------------------------------------------------------------

t <- 1: length(cadf$`400`$purchase_string_as_matrix)
cadf$`400`$purchase_string_as_matrix
data.frame(t,cadf$`400`$purchase_string_as_matrix )

## -----------------------------------------------------------------------------

pslist <- lapply(cadf, function(x) x$purchase_string)


## -----------------------------------------------------------------------------
head(srm_summaries)




## -----------------------------------------------------------------------------
head(srm_data)

sum(srm_data$cancel) # num of cancellations

nrow(srm_data) # flips/attempts/opportunities to cancel

1 - (sum(srm_data$cancel)/ nrow(srm_data)) # simple retention rate


## -----------------------------------------------------------------------------
surv.obj <- Surv(srm_data$bigT, srm_data$cancel)
summary(survfit(surv.obj ~ 1))


## -----------------------------------------------------------------------------

logistic.srm = glm(cancel ~ 1 , family = binomial, data = srm_data )



## -----------------------------------------------------------------------------

#1 - (sum(lr$cancel) / nrow(lr))



## -----------------------------------------------------------------------------

#ah <- CADF::CADF_to_annualhalfing_data(cadf) 


## -----------------------------------------------------------------------------

#migrationmodel <- CADF::CADF_to_migration_model(cadf)


