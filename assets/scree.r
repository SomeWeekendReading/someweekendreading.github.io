## Created on Tuesday, March 18, 2025 at 10:37am EDT by Weekend Editor on Weekend Editor Machine.
## UnCopyright (u) 2025, www.SomeWeekendReading.blog.  All rights reversed.  As if you care.

##
## Isolated from libraries to make it easily distributable.
##

plotScree <- function(evals,
                      main      = sprintf("Scree of %d SVD Eigenvalues", length(evals)),
                      xlab      = "SVD Factor Rank",
                      ylabLeft  = "SVD Eigenvalue",
                      ylabRight = "Cumulative % Variance Explained",
                      colors    = c("evals" = "blue", "pctsvar" = "red")) {

  withPars <- function(bodyFn, ...) {                  # Call bodyFn with graphics pars set
    oldParList <- NULL                                 # Capture old vals: params changed only
    tryCatch({ oldParList <- par(...); bodyFn() }, finally = par(oldParList))
  }                                                    # Guarantee old vals restored @ end

  rangeScale <- function(x) {                          # Scale by midpoint and range
    r <- range(x)                                      # So middle is 0, extrema +1/2, -1/2
    scale(x, center = c(mean(r)), scale = c(r[[2]] - r[[1]]))
  }                                                    #

  scaleLike <- function(scaledThing) {                 # Scale things like scaledThing was
    function(x) {                                      #  because scale() leaves a trail
      (x - attr(scaledThing, "scaled:center")) / attr(scaledThing, "scaled:scale")
    }                                                  #
  }                                                    #

  doAxis <- function(valsScaled, vals, nTicks, side, col, label) {
    prettyVals <- pretty(vals, n = nTicks)             # Values at tick marks (*** axTicks()?)
    axis(side = side,                                  # Draw axis on given side
         at = if (identical(valsScaled, NA))           #  put ticks at either
                prettyVals                             #    values if not scaled
              else                                     #  or scale them.  Then label axis.
                sapply(prettyVals, scaleLike(valsScaled)),
         labels = prettyVals, col = col, col.axis = col)
    mtext(label, side = side, las = 0, line = 2, col = col)
  }                                                    # Draw x axis, then left & right y axes

  doScreePlot <- function(evals, main, xlab, ylabLeft, ylabRight, colors) {
    nFactors    <- length(evals)                       # Num factors, cum % variance explained
    pcts        <- 100 * cumsum(evals * evals) / sum(evals * evals)
    evalsScaled <- rangeScale(evals)                   # Scale everything so it plots on
    pctsScaled  <- rangeScale(pcts)                    #  common device; unscale for axes
    symbols     <- c(21, 24)                           # Plot symbols
    colors      <- colors[c("evals", "pctsvar")]       # Ensure labels correct & in correct order

    matplot(x = 1 : nFactors, y = cbind(evalsScaled, pctsScaled),
            pch = symbols, col = colors, bg = colors,  # Plot scaled data; do axes below
            main = main, type = "b", lty = "dotted",   #
            xlab = NA, ylab = NA, axes = FALSE, frame.plot = FALSE)

    doAxis(NA,          1 : nFactors, nFactors / 10, 1, "black",             xlab)
    doAxis(evalsScaled, evals,        5,             2, colors[["evals"]],   ylabLeft)
    doAxis(pctsScaled,  pcts,         5,             4, colors[["pctsvar"]], ylabRight)

    legend(x = "right", inset = c(0.05, 0), bg = "antiquewhite",
           pch = symbols, col = colors, pt.bg = colors,# Legend explains points & colors
           legend = c(ylabLeft, ylabRight))            #
  }                                                    # Well, that was complicated...

  withPars(function () {                               # Guarantee graphics params restored
    doScreePlot(evals, main, xlab, ylabLeft, ylabRight, colors)
  }, "bg"    = "transparent",                          # Transparent for use in a paper
     "las"   = 1,                                      # Horizontal tick labels
     "mgp"   = c(1.5, 0.5, 0),                         # Spacing of axis title, labels, & line
     "mar"   = c(3, 3, 1, 3),                          # Margins: (bottom, left, top, right)
     "ps"    = 10)                                     # Type size in labels

  invisible(NA)                                        # Return nothing of interest
}                                                      #
