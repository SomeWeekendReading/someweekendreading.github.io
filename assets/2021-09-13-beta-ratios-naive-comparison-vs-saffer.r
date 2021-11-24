## Created on Wednesday, October  6, 2021 at 9:52pm EDT by Weekend Editor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

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
## But Saffer's example is doable with naive numerics, as th largest parameter is only 12.
##
## IWBNI we also did the Monte Carlo version for comparison: take pairs of random draws
## from the numerator and denominator distributions then calculate pairwise ratios (as
## done by rBetaRatio(), q.v.), and histogram the probability density of the ratio.
## Compare with theoretical distribution by something like a Kolmogorov-Smirnov test?
##

doit <- function(alpha1 =  3, beta1 = 6,               # Numerator beta distribution
                 alpha2 = 12, beta2 = 7,               # Denominator beta distribution
                 nPoints  = 1000,                      # Number of points on each curve
                 xmax     = 2.0,                       # Limit on horizontal axis from Saffer
                 ymax     = 3.75,                      # Limit on vertical axis from Saffer
                 alpha    = 0.40,                      # Transparency level of fill colors (0 to 1)
                 cols     = c(numerator   = "blue",    # Colors for various curves
                              denominator = "orange",  #  and the fill for them inside
                              ratio       = "green",   #  their 90% credible intervals
                              ratioCDF    = "red"),    # Finally, destination for plot
                 plotFile = "2021-09-13-beta-ratios-naive-comparison-vs-saffer.png") {

  ##
  ## The 4 functions for the Beta ratio distribution that are analogous to the corresponding
  ## functions for the normal distribution: PDF dnorm(), CDF pnorm(), quantile qnorm(), and
  ## RNG rnorm().
  ##

  dBetaRatio <- function(R, alpha1, beta1, alpha2, beta2, log.d = FALSE) {
    ## Beta ratio PDF
    ##
    ## NB: This WILL NOT WORK when alpha, beta ~ O(10^4), as for Pfizer & Moderna clinical trial!
    ##     Either get NaN + i NaN or, worse, just wildly wrong numbers.

    stopifnot(is.numeric(R) && R >= 0 && is.logical(log.d))

    probDens <-                                        # Compute the probability density
      if (R <= 1)                                      # Small values of R
        beta(alpha1 + alpha2, beta2) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
          R^(alpha1 - 1) *                             #
          hypergeo(alpha1 + alpha2, 1 - beta1, alpha1 + alpha2 + beta2, R)
      else                                             # Large values of R
        beta(alpha1 + alpha2, beta1) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
          (1 / R)^(alpha2 + 1) *                       #
          hypergeo(alpha1 + alpha2, 1 - beta2, alpha1 + alpha2 + beta1, 1 / R)

    if (log.d) log(probDens) else probDens             # Return either density or its log
  }                                                    #

  pBetaRatio <- function(R0, alpha1, beta1, alpha2, beta2, lower.tail = TRUE, log.p = FALSE) {
    ## Beta ratio CDF (cumulative distribution function): Pr(R <= R0)
    ##
    ## NB: This WILL NOT WORK when alpha, beta ~ O(10^4), as for Pfizer & Moderna clinical trial!
    ##     Either get NaN + i NaN or, worse, just wildly wrong numbers.

    stopifnot(is.numeric(R0) && R0 >= 0 &&             #
              is.logical(lower.tail) && is.logical(log.p))

    cumProb <-                                         #
      if (R0 <= 1)                                     # Small values of R0
        beta(alpha1 + alpha2, beta2) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
          R0^alpha1 / alpha1 *                         #
          genhypergeo(c(alpha1, alpha1 + alpha2, 1 - beta1),
                      c(alpha1 + 1, alpha1 + alpha2 + beta2),
                      R0)                              #
      else                                             # Large values of R0
        1 - beta(alpha1 + alpha2, beta1) / (beta(alpha1, beta1) * beta(alpha2, beta2)) *
              1 / (alpha2 * R0^alpha2) *               #
              genhypergeo(c(alpha2, alpha1 + alpha2, 1 - beta2),
                          c(alpha2 + 1, alpha1 + alpha2 + beta1),
                          1 / R0)                      #

    if (!lower.tail) cumProb <- 1 - cumProb            # If want upper tail instead, reverse it
    if (log.p) log(cumProb) else cumProb               # Return either cum prob or its log
  }                                                    #

  qBetaRatio <- function(p, alpha1, beta1, alpha2, beta2, # *** lower.tail = TRUE, log.p = FALSE
                         minR = 0, maxR = 10, tol = .Machine$double.eps^0.25) {
    ## Beta ratio quantile (numeric solution via CDF): find R0 such that Pr(R <= R0) = p.
    ##   It is the functional inverse of pBetaRatio().
    ## tol is the default tolerance for uniroot()
    ##
    ## NB: This WILL NOT WORK when alpha, beta ~ O(10^4), as for Pfizer & Moderna clinical trial!
    ##     Either get NaN + i NaN or, worse, just wildly wrong numbers.

    stopifnot(is.numeric(p) && is.numeric(minR) && is.numeric(maxR) && is.numeric(tol))
    stopifnot(0 <= p && p <= 1.0)                      # Don't be ridiculous
    stopifnot(0 <= minR && 0 <= maxR && minR < maxR)   # Really: don't be ridiculous
    stopifnot(tol > 0)                                 # C'mon, I mean it: no ridiculousness!

    uniroot(function(R) {p - pBetaRatio(R, alpha1, beta1, alpha2, beta2)},
            interval = c(minR, maxR), tol = tol)$"root"#
  }                                                    #

  rBetaRatio <- function(n, alpha1, beta1, alpha2, beta2) {
    ## Separately generate numerator and denominator series, and return the pairwise ratios

    stopifnot(is.integer(n) && n > 0)                  # Generate n random numbers,

    rbeta(n, alpha1, beta1) / rbeta(n, alpha2, beta2)  # distributed like dBetaRatio()
  }                                                    #  with these parameters

  ##
  ## Computing the Beta ratio distribution's mean and median (and median's confidence limits)
  ##

  meanBetaRatio <- function(alpha1, beta1, alpha2, beta2) {
    alpha1 * (alpha2 + beta2 - 1) / ((alpha1 + beta1) * (alpha2 - 1))
  }                                                    # Mean has simple closed form

  medianBetaRatio <- function(alpha1, beta1, alpha2, beta2,
                              minR = 0, maxR = 10, tol = .Machine$double.eps^0.25) {
    ## Usually more interesting than the mean, due to skewness.  (Or so I think.)
    ## NB: This WILL NOT WORK when alpha, beta ~ O(10^4), as for Pfizer & Moderna clinical trial!
    qBetaRatio(0.50, alpha1, beta1, alpha2, beta2, minR, maxR, tol)
  }                                                    # Analytic version uses incomplete Beta func

  medianCLBetaRatio <- function(alpha1, beta1, alpha2, beta2, alpha = 0.05,
                                minR = 0, maxR = 10, tol = .Machine$double.eps^0.25) {
    sapply(c(LCL = alpha / 2, Median = 0.5, UCL = 1 - alpha / 2), function(p) {
      ## NB: This WILL NOT WORK when alpha, beta ~ O(10^4), as for Pfizer & Moderna clinical trial!
      qBetaRatio(p, alpha1, beta1, alpha2, beta2, minR, maxR, tol)
    })                                                 # Return LCL, median, UCL.  alpha here is
  }                                                    #  tail probs, i.e., 0.05 for 95% cl's.

  meanBeta <- function(alpha, beta) { alpha / (alpha + beta) }

  ## Values where we numerically evaluate the distributions
  xvals    <- seq(from = 0, to = xmax, length.out = nPoints)

  ## Numerator beta distribution
  numPDF   <- dbeta(x = xvals, shape1 = alpha1, shape2 = beta1)
  numMean  <- meanBeta(alpha1, beta1)                  # Mean of numerator beta distribution
  num05    <- qbeta(p = 0.05, shape1 = alpha1, shape2 = beta1)
  num95    <- qbeta(p = 0.95, shape1 = alpha1, shape2 = beta1)

  ## Denominator beta distribution
  denomPDF  <- dbeta(x = xvals, shape1 = alpha2, shape2 = beta2)
  denomMean <- meanBeta(alpha2, beta2)                 # Mean of denominator beta distribution
  denom05   <- qbeta(p = 0.05, shape1 = alpha2, shape2 = beta2)
  denom95   <- qbeta(p = 0.95, shape1 = alpha2, shape2 = beta2)

  ## Beta ratio distribution
  ratioPDF       <- sapply(xvals, function(R) { dBetaRatio(R, alpha1, beta1, alpha2, beta2) })
  ratioCDF       <- sapply(xvals, function(R) { pBetaRatio(R, alpha1, beta1, alpha2, beta2) })
  ratioMean      <- meanBetaRatio(alpha1, beta1, alpha2, beta2)
  ratioQuantiles <- medianCLBetaRatio(alpha1, beta1, alpha2, beta2, alpha = 0.10, tol = 1.0e-3)
  ratio05        <- ratioQuantiles[["LCL"]]
  ratio95        <- ratioQuantiles[["UCL"]]

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

      colorCI <- function(col, alpha, xvals, yvals, x05, x95) {
        col <- col2rgb(col)                            # Base color to make transparent
        col <- rgb(col[[1]], col[[2]], col[[3]], max = 255, alpha = alpha * 255)
        foo <- subset(data.frame(x = xvals, pdf = yvals), subset = x05 <= x & x <= x95)
        polygon(x = c(rev(foo$"x"),                   foo$"x"),
                y = c(rep(0, length.out = nrow(foo)), foo$"pdf"),
                border = NA, col = col)                # Filled in 90% credible interval
      }                                                #

      colorCI(cols[["numerator"]],   alpha, xvals, numPDF,   num05,   num95)
      colorCI(cols[["denominator"]], alpha, xvals, denomPDF, denom05, denom95)
      colorCI(cols[["ratio"]],       alpha, xvals, ratioPDF, ratio05, ratio95)

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
