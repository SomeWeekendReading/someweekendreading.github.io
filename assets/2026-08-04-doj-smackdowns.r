## Created on Tuesday, August  4, 2026 at 2:11pm EDT by Weekend Editor on Weeekend Editor Machine
## Copyright (c) 2026, Some Weekend Reading blog.  All rights reserved.  As if you care.

##
## Trump's Department of Justice demands state voter registration info, so it can purge voters it
## doesn't want, hypothesizing noncitizens, but probably targeting mostly Democrats/minorities/women.
##
## They've won 0 out of 20 times.
##
## What should we believe about their probability of winning, from these data?
##

source("../../tools/graphics-tools.r")                 # Randumb graphics hax

doit <- function(k = 0, N = 20, destDir = ".", plotFile = "2026-08-04-doj-smackdowns.png") {
  withPNG(file.path(destDir, plotFile), 800, 400, FALSE, function() {
    withPars(function() {                              # Capture graphics to file
      shape1 <- k + 1                                  # Sucess shape parameter
      shape2 <- N - k + 1                              # Failure shape parameter
      cls    <- qbeta(p = c(0.025, 0.500, 0.975), shape1 = shape1, shape2 = shape2)
      maxP   <- max(0.5, min(1.0, ceiling(10.0 * max(cls)) / 10.0))
      ps     <- seq(from = 0, to = maxP, length.out = 100)
      ds     <- dbeta(ps, shape1 = shape1, shape2 = shape2)

      plot(x = ps, y = ds,                             # Plot the posterior Beta density
           xlab = "Probability of DoJ Success", ylab = "Posterior Belief Beta Density",
           main = "Bayesian Posterior Density for DoJ Success",
           xlim = c(0, maxP), type = "l", lty = "solid", col = "blue", lwd = 2)
      abline(v = cls[[1]], lty = "dashed", col = "gray",  lwd = 2)
      abline(v = cls[[2]], lty = "dashed", col = "black", lwd = 2)
      abline(v = cls[[3]], lty = "dashed", col = "gray",  lwd = 2)

      text(x = cls + 0.005, y = 5.5, pos = 1, srt = 90,  # Magic numbers 0.005 & 5.5 from looking
           labels = c(sprintf("95%% LCL: %.3f", cls[[1]]),
                      sprintf("Median: %.3f",   cls[[2]]),
                      sprintf("95%% UCL: %.3f", cls[[3]])))

      legend("topright", inset = c(0.01, 0.01), bg = "antiquewhite",
             legend = c("Posterior Beta density", "Median", "95% Confidence Limits"),
             lty    = c("solid",                  "dashed", "dashed"),
             col    = c("blue",                   "black",  "gray"))

    }, pty = "m",                                      # Maximal plotting area
       bg  = "white",                                  # White background
       ps  = 16,                                       # Larger type size
       mar = c(3, 3, 2, 1),                            # Pull in on margins
       mgp = c(1.7, 0.5, 0.0))                         # Axis title, label, tick spacing
  })                                                   # Done with file capture
}                                                      #
