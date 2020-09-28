---
layout: post
title: Code for &quot;What&apos;s that stupid avatar?&quot;
tags: SomebodyAskedMe About R
date: 2020-08-07
comments: false
---

Here's the script `root-fractal.r` for the post:

```R
## Created on Thursday, March 10, 2010 at 10:10pm EST by WeekendEditor on WeekendEditorMachine.
## UnCopyright (u) 2020, WeekendEditor.  All rights reversed.  As if you care.

##
## Pretty pictures of fractal "boundary" of convergence in Newton's method for solving a cubic
## in the complex plane.  See Strogatz's NYT column:
## http://opinionator.blogs.nytimes.com/2010/03/07/finding-your-roots/
##
## "boundary" in quotes: wherever you think 2 colors have a boundary, the 3rd interposes!
##

doit <- function(xlim = c(-1, +1), ylim = c(-1, +1), npix = 500, doExact = FALSE, ask = TRUE) {
  ## Cyclotomic cubic z^3 - 1 has 3 roots in complex z plane, to which we assign colors.
  ## Other points are colored by the speed with which Newton's algorithm converges to a root.
  ## Plot a subset of the complex plane as described by xlim & ylim, npix per side.

  roots       <- (function(angle) { complex(mod = 1, arg = angle) })(c(0, 2*pi/3, 4*pi/3))
  nearestRoot <- function(x, y) { which.min(abs(complex(real = x, imag = y) - roots)) }
  findRoot    <- function(z, nIter = 0, eps = 1.0e-3) {# Which root by Newton & num iterations
    if (Re(z) == 0 && Im(z) == 0)                      # If at origin, then step away
      z <- complex(real = Re(z) + jitter(Re(z)), imag = Im(z) + jitter(Im(z)))
    flags <- abs(z - roots) < eps                      # Diffs from roots: only 1 can converge
    if (any(flags))                                    # If any root has converged (uniquely!)
      c("rootNum" = which(flags), "nIter" = nIter)     #  then return root # and # iterations
    else                                               # Else unconverged so far
      ## Newton's method in general for finding roots of f(z) = 0:
      ##   z[i+1] = z[i] - f(z[i]) / f'(z[i])
      ## Here, f(z) = z^3 - 1, hence f'(z) = 3 z^2, so:
      ##   z[i+1] = z[i] - (z[i]^3 - 1) / (3 z[i]^2) = 2/3 z[i] + 1/(3 z[i]^2)
      findRoot(2/3 * z + 1 / (3 * z^2), nIter + 1)     # Take Newton step, bump iteration 
  }                                                    #  count, and try again

  plotRootFractal <- function(df, col, wrd) {          # Plot expected/actual fractals
    oldParList <- NULL                                 # Capture graphics param changes
    tryCatch({                                         # Guarantee restoring graphics params
      oldParList <- par("mgp" = c(1.5, 0.5, 0),        # Spacing of axis title, labels, & line
                        "mar" = c(2.5, 2.5, 2.5, 1.0), # Margins: (bottom, left, top, right))
                        "ps"  = 10,                    # Point size type in labels
                        "las" = 1,                     # Always horizontal labels
                        "ask" = ask,                   # Ask before replotting
                        "pty" = "m")                   # Maximal plotting area
      image(x = sort(unique(df$"x")),                  # Color by which root a point converges
            y = sort(unique(df$"y")),                  #   to, and how fast
            z = t(matrix(df[, col], nrow = npix, ncol = npix, byrow = TRUE)),
            xlim = xlim, ylim = ylim, xlab = "Re(z)", ylab = "Im(z)",
            main = sprintf("%s Convergence of Newton's Algorithm on Cube Roots of Unity", wrd),
            col = c(rgb(red = 0:255, green = 0,     blue = 0,     maxColorValue = 255),
                    rgb(red = 0,     green = 0:255, blue = 0,     maxColorValue = 255),
                    rgb(red = 0,     green = 0,     blue = 0:255, maxColorValue = 255)))
      box(which = "plot")                              # Put it in a box with a ribbon on it
    }, finally = par(oldParList))                      # Restore graphics parameters
  }                                                    #
  
  ## (1) Start with skeleton of (x, y) pairs in the complex plane
  ## (2) Add on which root it converged to, and in how many iterations
  ## (3) Encode color in a funny way by root number and number of iterations
  df   <- expand.grid(x = seq(from = xlim[[1]], to = xlim[[2]], length.out = npix),
                      y = seq(from = ylim[[1]], to = ylim[[2]], length.out = npix))
  df   <- cbind(df,                                    # Adjoin onto skeleton 2 new columns:
                t(apply(df, 1, function(dfr) { findRoot(complex(real = dfr[[1]],
                                                                imag = dfr[[2]])) })))
  maxN <- max(df$"nIter")                              # Scale color by max # of iterations
  df   <- transform(df, color = rootNum - nIter/maxN)  # Clunky color encoding
  plotRootFractal(df, "color", "Actual")               # Plot the observed fractal

  if (doExact) {                                       # If also plot expectations (exact root)
    df <- transform(transform(df, exactRootNum = Vectorize(nearestRoot)(x, y)),
                    exactRootDist = abs(complex(real = x, imag = y) - roots[exactRootNum]))
    maxDist = max(df$"exactRootDist")                  # Color by distance from nearest root
    df <- transform(df, exactColor = exactRootNum - exactRootDist / maxDist)
    plotRootFractal(df, "exactColor", "Expected")      # Plot the expected "fractal"
  }                                                    #
  
  invisible(df)                                        # Return large dataframe, but invisibly
}                                                      #

##
## Usage
##

## > system.time(foo <- doit(npix = 10), gcFirst = TRUE)
##    user  system elapsed 
##    0.05    0.01    0.07 
## > system.time(foo <- doit(npix = 20), gcFirst = TRUE)
##    user  system elapsed 
##    0.16    0.01    0.16 
## > system.time(foo <- doit(npix = 50), gcFirst = TRUE)
##    user  system elapsed 
##    0.50    0.05    0.58 
## > system.time(foo <- doit(npix = 100), gcFirst = TRUE)
##    user  system elapsed 
##    1.80    0.17    2.12 
## > system.time(foo <- doit(npix = 200), gcFirst = TRUE)
##    user  system elapsed 
##    7.49    0.76    8.69 
## > system.time(foo <- doit(npix = 500), gcFirst = TRUE)
##    user  system elapsed 
##   51.97    4.35   57.99 
## > system.time(foo <- doit(npix = 1000), gcFirst = TRUE)
##    user  system elapsed 
##  225.70   19.19  255.33

## > png(filename = "root-fractal-2000.png", width = 2200, height = 2200, bg = "transparent"); doit(npix = 2000, ask = FALSE); dev.off()

## Test our hypothesis that time required scales quadratically with npix:
##
## > data <- data.frame(n = c(10, 20, 50, 100, 200, 500, 1000), t = c(0.07, 0.16, 0.58, 2.12, 8.69, 57.99, 255.33))
##
## > model <- lm(t ~ 1 + n + I(n^2), data = data); summary(model); transform(data.frame(data, tPred = predict(model, newdata = subset(data, select = "n"))), pctDiff = 100 * (t - tPred) / t)
##
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  9.410e-01  5.374e-01   1.751  0.15483    
## n           -2.233e-02  4.068e-03  -5.490  0.00536 ** 
## I(n^2)       2.765e-04  4.009e-06  68.984 2.65e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 0.9065 on 4 degrees of freedom
## Multiple R-squared: 0.9999,  Adjusted R-squared: 0.9999 
## F-statistic: 3.258e+04 on 2 and 4 DF,  p-value: 3.767e-09 
## 
##      n      t       tPred       pctDiff
## 1   10   0.07   0.7453594 -964.79907826
## 2   20   0.16   0.6050261 -278.14134139
## 3   50   0.58   0.5158754   11.05597205
## 4  100   2.12   1.4734535   30.49747513
## 5  200   8.69   7.5367204   13.27134203
## 6  500  57.99  58.9114051   -1.58890341
## 7 1000 255.33 255.1521601    0.06965098
##
## Model p-value from F-statistic is 2 orders of magnitude better if we drop the constant term:
##
## > model2 <- lm(t ~ 0 + n + I(n^2), data = data); summary(model2); transform(data.frame(data, tPred = predict(model2, newdata = subset(data, select = "n"))), pctDiff = 100 * (t - tPred) / t)
##
## Coefficients:
##          Estimate Std. Error t value Pr(>|t|)    
## n      -1.743e-02  3.508e-03  -4.968  0.00422 ** 
## I(n^2)  2.725e-04  3.882e-06  70.185 1.11e-08 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 1.078 on 5 degrees of freedom
## Multiple R-squared: 0.9999,  Adjusted R-squared: 0.9999 
## F-statistic: 2.955e+04 on 2 and 5 DF,  p-value: 6.582e-11 
## 
##      n      t       tPred     pctDiff
## 1   10   0.07  -0.1470371 310.0530241
## 2   20   0.16  -0.2395803 249.7376874
## 3   50   0.58  -0.1902462 132.8010768
## 4  100   2.12   0.9818559  53.6860445
## 5  200   8.69   7.4131051  14.6938423
## 6  500  57.99  59.4032132  -2.4369946
## 7 1000 255.33 255.0412611   0.1130846
##

```
