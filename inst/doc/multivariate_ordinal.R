## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(poset)

## ----eval = FALSE-------------------------------------------------------------
#  wrtest(Y1, Y0, fun = wprod)

## ----eval = FALSE-------------------------------------------------------------
#  obj <- wreg(Y, Z, fun = wprod)

## -----------------------------------------------------------------------------
head(liver)

## -----------------------------------------------------------------------------
# lower score is better
Y1 <- 5 - liver[liver$AF, c("R1NASH", "R2NASH")] # advanced
Y0 <- 5 - liver[!liver$AF, c("R1NASH", "R2NASH")] # not advanced
obj <- wrtest(Y1, Y0)
obj

## -----------------------------------------------------------------------------
Y <- 5 - liver[, c("R1NASH", "R2NASH")] # lower score is better
Z <- cbind("Female" = liver$Sex == "F",
           liver[, c("AF", "Steatosis",   "SSF2",  "LSN")]) # covariates
obj <- wreg(Y, Z) # fit model
obj

## -----------------------------------------------------------------------------
summary(obj)

