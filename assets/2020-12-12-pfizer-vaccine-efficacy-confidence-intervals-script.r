## -*- Mode: ESS[S] -*-
## Created on Saturday, December 12, 2020 at 9:33pm EST by WeekendEditor on WeekendEditorMachine.
## UnCopyright (c) 2020, nobody-in-particular.  All rights reversed.  As if you care.

library("plyr")                                        # For ddply()
source("~/Documents/laboratory/tools/graphics-tools.r")# Various graphics hacks

##
## Re-estimate efficacy and confidence intervals on Pfizer vaccine data.
##
## See: https://www.fda.gov/media/144245/download, especially Table 8, p 26.
##
## Also analyzed by Gary Cornell:
## https://garycornell.com/2020/12/09/statistics-in-the-pfizer-data-how-good-is-the-vaccine/
##

doit <- function(plotDir           = "../images",
                 posteriorPlotFile = "2020-12-12-pfizer-vaccine-efficacy-confidence-intervals-posterior-betas.png") {

  efficacy <- function(Ntrt, Ntrtinf, Ncnt, Ncntinf) { # Vaccine efficacy point estimate
    100.0 * (1 - (Ntrtinf / Ntrt) / (Ncntinf / Ncnt))  # 1 - Pr(inf | trt) / Pr(inf | control)
  }                                                    #

  ## Create table of patient counts by treatment arm & infection status, then add
  ## a point estimate of the efficacy to compare with Pfizer:
  tbl <- transform(data.frame(Subgroup = c("Overall", "16-17", "18-64", "65-74", ">= 75"),
                              Ntrt     = c(    18559,      58,   14443,    3239,     805),
                              Ntrtinf  = c(        9,       0,       8,       1,       0),
                              Ncnt     = c(    18708,      61,   14566,    3255,     812),
                              Ncntinf  = c(      169,       1,     149,      14,       5)),
                   Subgroup = factor(Subgroup,
                                     levels = c("Overall", "16-17", "18-64", "65-74", ">= 75")),
                   VE        = round(efficacy(Ntrt, Ntrtinf, Ncnt, Ncntinf), digits = 1))
  cat(sprintf("Age groups, patient counts, and point estimates of efficacy:\n"))
  print(tbl)                                           # Show the data table

  ## Make plots of the posterior Beta distributions for the probability of infection in
  ## treatment and control arms, assuming a uniform prior.  Do it for each age cohort.
  ps <- seq(from = 0.0, to = 0.05, length.out = 1000)  # Values of p (horizontal axis)n
  f  <- file.path(plotDir, posteriorPlotFile)          # Plot destination pathname
  withPNG(f, 600, 1500, FALSE, function() {            # Start file capture
    withPars(function() {                              # Save/restore graphics params
      ddply(tbl, "Subgroup", function(df) {            # Do for each age cohort
        stopifnot(nrow(df) == 1)                       # 1 row only per age cohort
        with(df, {
          pinftrts    <- dbeta(ps, shape1 = Ntrtinf + 1, shape2 = Ntrt - Ntrtinf + 1)
          pinftrtsMAP <- ps[which.max(pinftrts)]
          pinftrtsCL  <- quantile(rbeta(1000, shape1 = Ntrtinf + 1, shape2 = Ntrt - Ntrtinf + 1),
                                  probs = c(0.025, 0.975))

          pinfcnts    <- dbeta(ps, shape1 = Ncntinf + 1, shape2 = Ncnt - Ncntinf + 1)
          pinfcntsMAP <- ps[which.max(pinfcnts)]
          pinfcntsCL  <- quantile(rbeta(1000, shape1 = Ncntinf + 1, shape2 = Ncnt - Ncntinf + 1),
                                  probs = c(0.025, 0.975))

          matplot(x = ps, y = cbind(pinftrts, pinfcnts),
                  type = "l", lty = "solid", col = c("blue", "black"),
                  ylab = "Density", xlab = "p", main = sprintf("%s Cohort", as.character(Subgroup)))
          legend("topright", inset = 0.01, bg = "antiquewhite",
                 col = c("blue", "black"), lty = "solid",
                 legend = c(sprintf("Treatment MAP: %.4f [%.4f - %.4f]",
                                    pinftrtsMAP, pinftrtsCL[[1]], pinftrtsCL[[2]]),
                            sprintf("Control MAP:     %.4f [%.4f - %.4f]",
                                    pinfcntsMAP, pinfcntsCL[[1]], pinfcntsCL[[2]])))
          abline(v = c(pinftrtsCL), col = "blue",  lty = "dashed")
          abline(v = c(pinfcntsCL), col = "black", lty = "dashed")
        })                                             # Close with()
        NULL                                           # So ddply() will return nothing of interest
      })                                               # Close ddply()
    }, pty = "m",                                      # Maximal plotting area
       bg  = "transparent",                            # Transparent background
       ps  = 16,                                       # Larger type size for file capture
       mgp = c(1.7, 0.5, 0),                           # Axis title, label, tick
       mar = c(3, 3, 2, 1),                            # Pull in on margins a bit
       mfrow = c(length(levels(tbl$"Subgroup")), 1))   # 1 column of plots for each age cohort
  })                                                   # End file capture
  cat(sprintf("\n\nPosterior beta distributions plotted to %s.", f))

  ## *** Estimate efficacies, explain problem with sampling

  cat("\n")                                            # Final newline
  invisible(tbl)                                       # Return data table, invisibly
}                                                      #
