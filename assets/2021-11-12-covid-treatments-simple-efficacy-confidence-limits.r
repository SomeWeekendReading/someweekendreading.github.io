## Created on Friday, November 12, 2021 at 3:02pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

library("gsDesign")                                    # For ciBinomial()

##
## Simple-minded efficacy computation, with confidence limits using a scaled binomial model.
## (To be eventually replaced by my super-duper Beta ratios stuff with Gauss hypergeometric magic!)
##

## Molnupiravir example, hospitalizations:
## > signif(efficacyAndCL(384, 28, 376, 53), digits = 3)
##   LCL   Eff   UCL
## 0.205 0.483 0.665
##
## Paxlovid example, hospitalizations:
## > signif(efficacyAndCL(389, 3, 385, 27), digits = 3)
##   LCL   Eff   UCL
## 0.663 0.890 0.964
##
## Paxlovid example, deaths:
## > signif(efficacyAndCL(389, 0, 385, 7), digits = 3)
##  LCL  Eff  UCL
## 0.46 1.00 1.00
##
## Try the qBetaRatio() method here?  Are these numbers small enough for the naive implementation?
## For molnumpiravir
## > 1 - medianCLBetaRatio(28 + 1, 384 - 28 + 1, 53 + 1, 376 - 53 + 1, 0.05, 0, 10)
efficacyAndCL <- function(Ntrt, Ktrt, Ncnt, Kcnt) {    # Treatment efficacy & 95% conf limit
  ## Ntrt = number of subjects in treatment arm
  ## Ktrt = number of sick in treatment arm
  ## Ncnt = number of subjects in control arm
  ## Kcnt = number of sick in control arm
  eff   <- 1 - (Ktrt / Ntrt) / (Kcnt / Ncnt)           # Point estimate, then confidence limits
  effCL <- rev(1 - ciBinomial(Ktrt, Kcnt, Ntrt, Ncnt, scale = "RR"))
  c(LCL = effCL[[1]], Eff = eff, UCL = effCL[[2]])     # Return 3-vector of LCL, estimate, and UCL
}                                                      #
