## Created on Thursday, September  2, 2021 at 3:18pm EDT by Weekend Editor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Random tools available from the author
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics tools

doit <- function(k = 15100000, N = 438000000, pmin = 0.03440, pmax = 0.03455, clps = c(0.025, 0.975),
                 plotFile = "./2021-09-02-vaccine-waste.png") {
  withPNG(plotFile, 400, 400, FALSE, function() {      # Capture graphics to a file
    withPars(function() {                              # Save/restore graphics parameters
      ps        <- seq(from = pmin, to = pmax, length.out = 1000)
      betaProbs <- sapply(ps, function(p) { dbeta(p, k + 1, N - k + 1) })
      plot(x = ps, y = betaProbs, type = "l", col = "blue",
           xlim = c(pmin, pmax), xlab = "p", ylab = "Posterior Beta",
           main = "Bayesian Posterior: Waste Probability")
      sapply(clps, function(p) {                       # Draw lines at 95% confidence limits
        cl <- qbeta(p, k + 1, N - k + 1)               # Next confidence limit
        abline(v = qbeta(p, k + 1, N - k + 1), lty = "dashed")
        text(x = cl, y = 0.5 * max(betaProbs), srt = 90, pos = 1,
             labels = sprintf("%.1f%% CL: %.5f", 100.0 * p, cl))
      })                                               #
    }, pty = "m",                                      # Maximal plotting area
       bg  = "white",                                  # White background
       mar = c(3, 3, 2, 1),                            # Pull in on margins a bit
       mgp = c(1.7, 0.5, 0),                           # Axis title, labels, ticks
       ps  = 16)                                       # Larger type size for file capture
  })                                                   #
  invisible(NA)                                        # Return nothing of interest
}                                                      #
