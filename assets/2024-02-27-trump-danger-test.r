## Created on Tuesday, February 27, 2024 at 12:01pm CDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2024, SomeWeekendReading.blog.  All rights reserved.  As if you care.

library("effectsize")                                  # For cohens_d()
source("../../tools/pipeline-tools.r")                 # Random pipeline stuff
source("../../tools/graphics-tools.r")                 # Random graphics stuff

## > threatData <- doit()
doit <- function(threatDataString = "Year	NThreats	NDAThreats
2022	483	1
2023	577	89",
                 txFile   = "2024-02-27-trump-danger-test.txt",
                 plotFile = "../images/2024-02-27-trump-danger-test.png",
                 pMax     = 0.25,
                 tickHt   = 2) {

  withTranscript(inDir = ".", resultsDir = ".", transcriptFile = txFile, name = "Trump DA Threats",
                 function() {
    ## No need for makeDirectory() of the results dir, since it's here.
    ## Also no need for archiveAnalysisScript(), since it's here, too.

    heraldPhase("Building dataframe of data")          # Read from input string
    r4 <- function(x) { round(x, digits = 4) }         # Round probabilities to 4 decimal places
    threatData <- transform(read.table(text = threatDataString,
                                       header = TRUE, sep = "\t", stringsAsFactors = TRUE),
                            pDAThreat    = r4(NDAThreats / NThreats),
                            ## Assuming a uniform prior, add posterior beta quantiles for pDAThreat:
                            ## median and 95% cl (2.5%, 97.5%)
                            MedpDAThreat = r4(qbeta(0.500, NDAThreats + 1, NThreats - NDAThreats + 1)),
                            LCLpDAThreat = r4(qbeta(0.025, NDAThreats + 1, NThreats - NDAThreats + 1)),
                            UCLpDAThreat = r4(qbeta(0.975, NDAThreats + 1, NThreats - NDAThreats + 1)),
                            Color        = c("blue", "red"))
    cat(sprintf("* Threat data for years %d - %d, and subset directed at DA:\n\n",
                min(threatData$"Year"), max(threatData$"Year")))
    print(threatData)                                  # Show the evidence

    heraldPhase("Test of proportion that threats went up:")
    tst <- prop.test(x = threatData$"NDAThreats", n = threatData$"NThreats", alternative = "less")
    print(tst)                                         # Show test of proportion results
    cat(sprintf("* Actual p = %.2g\n\n", tst$"p.value"))

    heraldPhase("Test of strength of effect (difference of proportions) with Cohen's h:")
    cat(sprintf("* Scale of Cohen's h: 0.2 ~ small, 0.5 ~ medium, 0.8 ~ large\n\n"))
    ## Cohen's h for strength of effect in proportions
    ## See: https://en.wikipedia.org/wiki/Cohen%27s_h
    ## NB: cohens_h() wants control & treatment counts, not total and treatment.
    ##     In our case, that means supplying non-DA threats and DA threats, hence the subtraction
    print(cohens_h(x = t(transform(subset(threatData, select = c(NThreats, NDAThreats)),
                                   NThreats = NThreats - NDAThreats))))

    heraldPhase("Uniform prior, Beta posterior distribution for probability of DA threat:")
    ## Posterior Beta distribution of Pr(DA Threat) for both years (assumes uniform prior, i.e.,
    ##  a maximally noncommittal prior).
    withPNG(plotFile, 800, 800, FALSE, function() {    # Save plot to file
      withPars(function() {                            # Save/restore graphics parameters
        bdf <<- transform(data.frame(ps = seq(from = 0, to = pMax, length.out = 1000)),
                         betaPreTrump = sapply(ps, function(p) {
                           dbeta(p,                    #
                                 threatData[[1, "NDAThreats"]] + 1,
                                 threatData[[1, "NThreats"]] - threatData[[1, "NDAThreats"]] + 1)
                         }),                           #
                         betaPostTrump = sapply(ps, function(p) {
                           dbeta(p,                    #
                                 threatData[[2, "NDAThreats"]] + 1,
                                 threatData[[2, "NThreats"]] - threatData[[2, "NDAThreats"]] + 1)
                         }))                           #
        matplot(x = bdf[, 1], y = bdf[, -1],           #
                type = "l", col = as.character(threatData$"Color"), lty = "solid", xlim = c(0, pMax),
                xlab = "Probability p that a threat is to the DA", ylab = "Beta density",
                main = "Bayesian Posterior Beta of p (Uniform Prior)")
        sapply(1 : nrow(threatData), function(r) {     # Draw ticks @ LCL, median, and UCL
          lines(x = c(threatData[[r, "LCLpDAThreat"]], threatData[[r, "LCLpDAThreat"]], NA,
                      threatData[[r, "MedpDAThreat"]], threatData[[r, "MedpDAThreat"]], NA,
                      threatData[[r, "UCLpDAThreat"]], threatData[[r, "UCLpDAThreat"]]),
                y = c(0, tickHt, NA, 0, tickHt, NA, 0, tickHt),
                col = as.character(threatData[[r, "Color"]]))
        })                                             #
        legend("top", bg = "antiquewhite", inset = 0.01,
               lty = "solid", lwd = 2, col = as.character(threatData$"Color"),
               legend = sapply(1:nrow(threatData), function(r) {
                 sprintf("Year %d: Median %.3f (CL: %.3f - %.3f)",
                         threatData[[r, "Year"]],      #
                         threatData[[r, "MedpDAThreat"]],
                         threatData[[r, "LCLpDAThreat"]],
                         threatData[[r, "UCLpDAThreat"]])
               }))                                     #
      }, pty = "m",                                    # Maximal plotting area
       bg  = "white",                                  # White background
       mar = c(3, 3, 2, 1),                            # Pull in on margins a bit
       mgp = c(1.7, 0.5, 0),                           # Axis title, labels, ticks
       ps  = 16)                                       # Larger type size for file capture
    })                                                 #
    cat(sprintf("\n* Plot written to %s\n", plotFile)) # Document where it went

    invisible(threatData)                              # Return the data, invisibly

  })                                                   #
}                                                      #
