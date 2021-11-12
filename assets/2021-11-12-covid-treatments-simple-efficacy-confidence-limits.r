## Created on Friday, November 12, 2021 at 3:02pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

library("gsDesign")                                    # For ciBinomial()

##
## Simple-minded efficacy computation, with confidence limits using a scaled binomial model.
## (To be eventually replaced by my super-duper Beta ratios stuff with Gauss hypergeometric magic!)
##

## Molnupiravir example:
## > efficacyAndCL(384, 28, 376, 53)
##       LCL       Eff       UCL
## 0.2045387 0.4827044 0.6646596
##
## Paxlovid example:
## > efficacyAndCL(389, 3, 385, 27)
##       LCL       Eff       UCL
## 0.6632056 0.8900314 0.9643484
##
## Try the qBetaRatio() method here?  Are these numbers small enough for the naive implementation?
## > sapply(c("LCL" = 0.025, "Median" = 0.500, "UCL" = 0.975), function(q) { 1 - qBetaRatio(28 + 1, 384 - 28 + 1, 53 + 1, 377 - 53 + 1, q = q) })
efficacyAndCL <- function(Ntrt, Ktrt, Ncnt, Kcnt) {    # Treatment efficacy & 95% conf limit
  ## Ntrt = number of subjects in treatment arm
  ## Ktrt = number of sick in treatment arm
  ## Ncnt = number of subjects in control arm
  ## Kcnt = number of sick in control arm

  eff   <- 1 - (Ktrt / Ntrt) / (Kcnt / Ncnt)           # Point estimate
  effCL <- rev(1 - ciBinomial(Ktrt, Kcnt, Ntrt, Ncnt, scale = "RR"))

  c(LCL = effCL[[1]], Eff = eff, UCL = effCL[[2]])     # 3-vector of LCL, estimate, and UCL
}                                                      #
