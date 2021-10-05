## Created on Sunday, August 29, 2021 at 11:17pm EDT by Weekend Editor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

library("gsDesign")                                    # For ciBinomial()
library("plyr")                                        # For ddply()

toolsDir <- "../../tools"                              # Various tools available from author
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks
source(file.path(toolsDir, "pipeline-tools.r"))        # Various graphics hacks

##
## Take summary data on Israeli population (vax, unvax, part vax) stratified by age.
## Compute efficacy and 95% confidence interval by posterior Beta function + Monte Carlo method.
##

doit <- function(## Inputs
                 dataDir  = ".",
                 dataFile = "2021-08-29-covid-simpson-Israeli_data_August_15_2021-vax-summary.tsv",

                 ## Outputs
                 resultsDir = ".",
                 txFile     = "2021-08-29-covid-simpson-ve-confidence-intervals-by-age.txt",
                 plotFile   = "2021-08-29-covid-simpson-ve-confidence-intervals-by-age.png") {

  loadData <- function(dataDir, dataFile) {            # Load the Israeli summary data of Morris
    f <- file.path(dataDir, dataFile)                  # Full pathname to data
    cat(sprintf("* Loading data from %s", f))          # Announce what we're doing
    vaxData <- read.table(f, header = TRUE, sep = "\t")# Read the data
    cat(sprintf("\n  - Found this dataframe:\n"))      # Capture what we got to the transcript
    print(vaxData)                                     # It's short enough that this is doable
    cat("\n")                                          # Final newline
    vaxData                                            # Return the dataframe
  }                                                    #

  addEfficacyAndCI <- function(vaxData) {              #

#    efficacyCI <- function(Ntrt, NtrtInf, Ncnt, NcntInf,
#                                  n = 1000000, probs = c(0.025, 0.500, 0.975)) {
#      ## *** This gets negative CI's when case counts are 0
#      ## Median as best guess, 2.5% and 97.5% as confidence limits
#      alphaNum   <- NtrtInf + 1                        # Numerator Beta distribution, alpha
#      betaNum    <- Ntrt - NtrtInf + 1                 #  and beta parameters (treatment)
#      alphaDenom <- NcntInf + 1                        # Denominator Beta distribution, alpha
#      betaDenom  <- Ncnt - NcntInf + 1                 #  and beta parameters (control)
#      effs       <- 100.0 * (1 - rbeta(n, alphaNum, betaNum) / rbeta(n, alphaDenom, betaDenom))
#      round(quantile(effs, probs = probs), digits = 1) # Get just the quantiles requested
#    }                                                  #

    efficacyCI <- function(Ntrt, NtrtInf, Ncnt, NcntInf, probs = c(0.025, 0.500, 0.975)) {
      ## Frequentist method: risk rates are scaled binomial, so we use the binomial
      ## confidence interval function in the gsDesign package.
      ci <- 100.0 * (1 - rev(ciBinomial(NtrtInf, NcntInf, Ntrt, Ncnt, scale = "RR")))
      c("2.5%"  = ci[[1]],                             #
        "ve"    = 100.0 * (1 - (NtrtInf / Ntrt) / (NcntInf / Ncnt)),
        "97.5%" = ci[[2]])                             #
    }                                                  #

    cat(sprintf("* Adding vaccine efficacies and 95%% confidence limits"))

    vaxDataEffs <- merge(vaxData,                      #
                         ddply(vaxData, "Age.Cohort", function(acdf) {
                           stopifnot(nrow(acdf) == 1)  # Defensive programming: unique age cohorts?
                           ves  <- efficacyCI(acdf[1, "Vax.Popln"],
                                              acdf[1, "Vax.Severe"],
                                              acdf[1, "Unvax.Popln"],
                                              acdf[1, "Unvax.Severe"])
                           pves <- efficacyCI(acdf[1, "Part.Vax.Popln"],
                                              acdf[1, "Part.Vax.Severe"],
                                              acdf[1, "Unvax.Popln"],
                                              acdf[1, "Unvax.Severe"])
                           data.frame(## Efficacy for the fully vaccinated
                                      VE      = ves[["ve"]],
                                      VE.LCL  = ves[["2.5%"]],
                                      VE.UCL  = ves[["97.5%"]],
                                      ## Efficacy for the partly vaccinated
                                      PVE     = pves[["ve"]],
                                      PVE.LCL = pves[["2.5%"]],
                                      PVE.UCL = pves[["97.5%"]])
                         }),                           #
                         by = "Age.Cohort")            #

    cat("\n")                                          # Final newline
    vaxDataEffs                                        # Return augmented dataframe
  }                                                    #

  plotVEs <- function(vaxDataEffs, resultsDir, plotFile) {
    f <- file.path(resultsDir, plotFile)               #
    withPNG(f, 400, 400, FALSE, function() {           #
      withPars(function() {                            #
        cols <- c("blue", "green")
        matplot(x = 1 : nrow(vaxDataEffs),
                y = subset(vaxDataEffs, select = c(VE)), #, PVE)),
                type = "b", pch = 21, col = "black", bg = cols,
                xaxt = "n", xlab = NA, ylab = "Vaccine Efficacy (%)", ylim = c(0, 100),
                main = "Vaccine efficacy by age cohort")
        sapply(1 : nrow(vaxDataEffs), function(rn) {
          drawErrorBar(x0 = rn,
                       y0 = vaxDataEffs[[rn, "VE.LCL"]],
                       x1 = rn,
                       y1 = vaxDataEffs[[rn, "VE.UCL"]],
                       col = "blue")
#          drawErrorBar(x0 = rn,
#                       y0 = vaxDataEffs[[rn, "PVE.LCL"]],
#                       x1 = rn,
#                       y1 = vaxDataEffs[[rn, "PVE.UCL"]],
#                       col = "green")
        })
#        legend("bottomright", inset = 0.05, bg = "antiquewhite",
#               pch = 21, pt.bg = cols, legend = c("Fully vaccinated", "Partially vaccinated"))
        axis(side = 1, at = 1 : nrow(vaxDataEffs), labels = as.character(vaxDataEffs$"Age.Cohort"))
        title(xlab = "Age Cohort", line = 3.5)         # Horizontal axis title
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(5, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, label, tick
         las = 2,                                      # Axis labels perp to axis
         ps  = 16)                                     # Larger type size for file capture
    })                                                 #
    cat(sprintf("* Plotted to %s\n", f))               # Capture to transcript
    TRUE                                               # Flag that it's done
  }                                                    #

  withTranscript(dataDir, resultsDir, txFile, "Israeli COVID-19 VE Stratified by Age", function() {

    heraldPhase("Loading Data")                        #
    maybeAssign("vaxData", function() { loadData(dataDir, dataFile) })

    heraldPhase("Computing efficacies and confidence interval")
    maybeAssign("vaxDataEffs", function() { addEfficacyAndCI(vaxData) })

    cat("\n"); print(vaxDataEffs) # ***

    heraldPhase("Making plot")                         #
    maybeAssign("plotDone", function() { plotVEs(vaxDataEffs, resultsDir, plotFile) })

    invisible(NA)                                      # Return nothing of interest
  })                                                   # Done with transcript capture
}                                                      # Done overall
