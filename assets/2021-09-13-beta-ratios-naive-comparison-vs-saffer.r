## Created on Wednesday, October  6, 2021 at 9:52pm EDT by sgr on Kryfthanima.Home.
## Copyright (c) 2021, nobody-in-particular.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Various tools available from author
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks

library("hypergeo")                                    # For hypergeo() and genhypergeo()

##
## Compare with the example Julian Saffer plots on his GitHub repository:
## https://github.com/jsaffer/beta_quotient_distribution
## - Numerator beta distribution: alpha1 = 3, beta1 = 6
## - Denominator beta distribution: alpha2 = 12, beta2 = 7
##
## This comparison is "naive" in the sense that I'm just using the hypergeo library functions
## without any caution for large values of the hypergeometric function's parameters.  E.g., for
## the Moderna/Pfizer COVID-19 vaccine clinical trials, those could be O(10k-20k).  We almost
## certainly need some recurrence relation or other to help out with that.
##
## But Saffer's example is doable with naive numerics.
##

doit <- function(alpha1 =  3, beta1 = 6,               # Numerator beta distribution
                 alpha2 = 12, beta2 = 7,               # Denominator beta distribution
                 nPoints  = 1000,
                 xmax     = 2.0,
                 ymax     = 3.75,
                 alpha    = 0.40,
                 cols     = c(numerator   = "blue",
                              denominator = "orange",
                              ratio       = "green",
                              ratioCDF    = "red"),
                 plotFile = "2021-09-13-beta-ratios-naive-comparison-vs-saffer.png") {

  betaRatioPDF <- function(alpha1, beta1, alpha2, beta2, R) {
    stopifnot(R >= 0)                                  # Don't be ridiculous
    if (R <= 1)                                        # Small values of R
      beta(alpha1 + alpha2, beta2) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
        R^(alpha1 - 1) *                               #
        hypergeo(alpha1 + alpha2, 1 - beta1, alpha1 + alpha2 + beta2, R)
    else                                               # Large values of R
      beta(alpha1 + alpha2, beta1) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
        R^(-(alpha2+1)) *                              #
        hypergeo(alpha1 + alpha2, 1 - beta2, alpha1 + alpha2 + beta1, 1/R)
  }                                                    #

  betaRatioCDF <- function(alpha1, beta1, alpha2, beta2, R) {
    stopifnot(R >= 0)                                  # Don't be ridiculous
    if (R <= 1)                                        # Small values of R
      beta(alpha1 + alpha2, beta2) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
        R^alpha1 / alpha1 *                            #
        genhypergeo(c(alpha1, alpha1 + alpha2, 1 - beta1), c(alpha1 + 1, alpha1 + alpha2 + beta2),
                    R)                                 #
    else                                               # Large values of R
     1 - beta(alpha1 + alpha2, beta1) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
       1 / (alpha2 * R^alpha2) *                       #
       genhypergeo(c(alpha2, alpha1 + alpha2, 1 - beta2), c(alpha2 + 1, alpha1 + alpha2 + beta1),
                   1/R)                                #
  }                                                    #

  betaRatioQuantile <- function(alpha1, beta1, alpha2, beta2, q, minR = 0, maxR = 10) {
    stopifnot(0 <= q && q <= 1.0)                      # Don't be ridiculous
    uniroot(function(R) {q - betaRatioCDF(alpha1, beta1, alpha2, beta2, R)}, c(minR, maxR))$"root"
  }                                                    #

  betaRatioMedian <- function(alpha1, beta1, alpha2, beta2, minR = 0, maxR = 10) {
    betaRatioQuantile(alpha1, beta1, alpha2, beta2, 0.50, minR, maxR)
  }                                                    # Real calculation uses incomplete Beta func

  betaRatioMean <- function(alpha1, beta1, alpha2, beta2) {
    alpha1 * (alpha2 + beta2 - 1) / ((alpha1 + beta1) * (alpha2 - 1))
  }                                                    # Mean has simple closed form

  colorCI <- function(cols, whichColor, alpha, xvals, yvals, x05, x95) {
    col <- col2rgb(cols[[whichColor]])                 # Base color to make transparent
    col <- rgb(col[[1]], col[[2]], col[[3]], max = 255, alpha = alpha * 255)
    foo <- subset(data.frame(x = xvals, pdf = yvals), subset = x05 <= x & x <= x95)
    polygon(x = c(rev(foo$"x"),                   foo$"x"),
            y = c(rep(0, length.out = nrow(foo)), foo$"pdf"),
            border = NA, col = col)                    # Filled in 90% credible interval
  }                                                    #

  ## Values where we numerically evaluate the distributions
  xvals    <- seq(from = 0, to = xmax, length.out = nPoints)

  ## Numerator beta distribution
  numPDF   <- dbeta(x = xvals, shape1 = alpha1, shape2 = beta1)
  numMean  <- alpha1 / (alpha1 + beta1)                # Mean of beta distribution
  num05    <- qbeta(p = 0.05, shape1 = alpha1, shape2 = beta1)
  num95    <- qbeta(p = 0.95, shape1 = alpha1, shape2 = beta1)

  ## Denominator bea distribution
  denomPDF  <- dbeta(x = xvals, shape1 = alpha2, shape2 = beta2)
  denomMean <- alpha2 / (alpha2 + beta2)               # Mean of beta distribution
  denom05   <- qbeta(p = 0.05, shape1 = alpha2, shape2 = beta2)
  denom95   <- qbeta(p = 0.95, shape1 = alpha2, shape2 = beta2)

  ## Ratiodistribution
  ratioPDF  <- sapply(xvals, function(R) { betaRatioPDF(alpha1, beta1, alpha2, beta2, R) })
  ratioCDF  <- sapply(xvals, function(R) { betaRatioCDF(alpha1, beta1, alpha2, beta2, R) })
  ratioMean <- betaRatioMean(alpha1, beta1, alpha2, beta2)
  ratio05   <- betaRatioQuantile(alpha1, beta1, alpha2, beta2, 0.05)
  ratio95   <- betaRatioQuantile(alpha1, beta1, alpha2, beta2, 0.95)

  ## Saffer: 1152 x 648 --> us: 400 x 225
  withPNG(file.path(".", plotFile), 400, 225, FALSE, function() {
    withPars(function() {                              # Save/restore graphics parameters

      matplot(x    = xvals,                            # Plot PDFs and ratio CDF
              y    = matrix(data = c(numPDF, denomPDF, ratioPDF, ratioCDF), nrow = nPoints),
              lty  = c("solid", "solid", "solid", "dotted"),
              col  = c(cols[["numerator"]], cols[["denominator"]],
                       cols[["ratio"]],     cols[["ratioCDF"]]),
              type = "l", lwd = 2,                     #
              xlim = c(0, xmax), ylim = c(0, ymax),    #
              xlab = "X", ylab = "Pr(X) or Pr(> X)",   #
              main = "Saffer's Example Beta Ratio")    #

      colorCI(cols, "numerator",   alpha, xvals, numPDF,   num05,   num95)
      colorCI(cols, "denominator", alpha, xvals, denomPDF, denom05, denom95)
      colorCI(cols, "ratio",       alpha, xvals, ratioPDF, ratio05, ratio95)

      abline(v   = c(numMean, denomMean, ratioMean),   # Vertical dashed lines at means
             col = c(cols[["numerator"]], cols[["denominator"]], cols[["ratio"]]),
             lty = "dashed", lwd = 2)                  #

      ## Grid lines
      abline(h = seq(from = 0, to = 3.5, by = 0.5), col = "gray")
      abline(v = seq(from = 0, to = 2.0, by = 0.5), col = "gray")

    }, pty = "m",                                      # Maximal plotting area
       bg  = "white",                                  # White background
       mar = c(3, 3, 2, 1),                            # Pull in on margins a bit
       mgp = c(1.7, 0.5, 0),                           # Axis title, labels, ticks
       las = 1,                                        # Always horizontal axis labels
       ps  = 16)                                       # Larger type size for file capture
  })                                                   #

  invisible(NA)                                        # Return nothing of interest, invisibly
}                                                      #
