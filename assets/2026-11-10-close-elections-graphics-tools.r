## Created on Thursday, June  6, 2019 at 2:46pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2020, SomeWeekendReading.  All rights reserved.  As if you care.

##
## Various graphics tools
##

addOuterLegend <- function(...) {                      # Legend in outer margin of multi-plot
  ## https://dr-k-lo.blogspot.com/2014/03/the-simplest-way-to-plot-legend-outside.html
  ## Basically overlay existing plot with new one, empty of content, then put legend.
  ## See example in tgfb/glp-tox-cytokines/tgfb-glp-tox-cytokines.r.
  withPars(function() {                                # Make an empty plot
    plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
    legend(...)                                        # Do legend in new empty plot
  }, ## *** klo put in xpd = TRUE, but doesn't seem to be necessary.
     fig = c(0, 1, 0, 1),                              # NDC coords: use ALL of figure region
     oma = c(0, 0, 0, 0),                              # Outer margins: none
     mar = c(0, 0, 0, 0),                              # Margins: none
     new = TRUE)                                       # "As if for new plot", i.e., use old!
}                                                      #

back2BackHistogram <- function(x, y, breaks = NULL,    # 2 histograms sharing common axis
                               probability = FALSE,    #
                               xlim = NULL, xlab = NULL, ylab = NULL,
                               xcol = "red", ycol = "blue",
                               xmgp = c(2, 1, 0), ymgp = c(3, 1, 0), ...) {
  ## How to make back-to-back histograms: sharing a common axis, showing 2 distributions.
  ## - discovered via an example in:
  ##   http://onertipaday.blogspot.com/2007/06/back-to-back-historgram.html
  ## - simplified down from the Hmisc package's histbackback()
  if (is.null(breaks))                                 # If breaks is NULL
    breaks <- hist(c(x, y), plot = FALSE)$breaks       #  then do whatever hist() does
  else if (length(breaks) == 1)                        # Else if # breaks, take hist() advice
    breaks <- hist(c(x, y), breaks = breaks, plot = FALSE)$breaks
  else { }                                             # Else explicit values for breaks
  ll <- hist(x, breaks = breaks, plot = FALSE)         # Compute left histogram
  rr <- hist(y, breaks = breaks, plot = FALSE)         #  and right histogram
  if (probability) {                                   #  if want probabilities (not counts)
    ll$counts <- ll$density                            #    then replace counts with probs
    rr$counts <- rr$density                            #
  }                                                    #
  if (length(xlim) != 2) {                             # If x limits not explicitly given,
    xlim <- pretty(range(c(-ll$counts, rr$counts)))    #  then make pretty tics over the range
    xlim <- c(xlim[1], xlim[length(xlim)])             #  and take the extrema
  }                                                    #
  if (length(ll$counts) > 0)                           # Plot the left histogram
    barplot(-ll$counts, xlim = xlim, space = 0, horiz = TRUE, axes = FALSE, col = xcol, ...)
  par(new = TRUE)                                      # "As if already on a new plot" (?!)
  if (length(rr$counts) > 0)                           # Plot the right histogram
    barplot(rr$counts,  xlim = xlim, space = 0, horiz = TRUE, axes = FALSE, col = ycol, ...)
  axis(1, at = pretty(xlim), labels = format(abs(pretty(xlim))), mgp = xmgp)
  del        <- (breaks[2] - breaks[1] - (breaks[3] - breaks[2]))/2 # *** ?
  breaks[1]  <- breaks[1]  + del                       # *** ?
  breaks[-1] <- breaks[-1] - del                       # *** ?
  axis(2, at = 0 : (length(breaks) - 1), labels = pretty(breaks, n = length(breaks)),
       mgp = ymgp)
  ## *** have to scale pretty(breaks) into breaks
  ##  ytics <- pretty(breaks); axis(2, at = 0 : (length(ytics) - 1), labels = ytics)
  title(xlab = xlab[1], adj = (-0.5 * xlim[1]) / (-xlim[1] + xlim[2]),
        mgp = xmgp)                                    # Title of left half
  title(xlab = xlab[2], adj = (-xlim[1] + 0.5 * xlim[2]) / (-xlim[1] + xlim[2]),
        mgp = xmgp)                                    # Title of right half
  if (!is.null(ylab)) title(ylab = ylab, mgp = ymgp)   # Title of vertical axis
  abline(v = 0)                                        # Vertical, common axis
  box()                                                # Box it all up; return invisible list
  invisible(list(left = ll$counts, right = rr$counts, breaks = breaks))
}                                                      #

drawErrorBar <- function(x0, y0, x1, y1, col = "black", length = 0.1, lty = "solid") {
  ## *** Draws no error bar if limits are off-scale (log x-axis)?
  arrows(x0 = x0, y0 = y0, x1 = x1, y1 = y1, col = col, length = length, lty = lty,
         code = 3, angle = 90)                         # Draw error bars as double-ended arrows
}                                                      #  with short "arrowheads" of 90 degrees

##
## Heatmaps, but without forced x/y scaling
##

## From the source for heatmap(); altered so layout() is called with respect = FALSE.
## This makes one of our heatmaps take up most of the width available.
heatmapRespectFALSE <- function (x, Rowv = NULL, Colv = if (symm) "Rowv" else NULL,
    distfun = dist, hclustfun = hclust, reorderfun = function(d,
        w) reorder(d, w), add.expr, symm = FALSE, revC = identical(Colv,
        "Rowv"), scale = c("row", "column", "none"), na.rm = TRUE,
    margins = c(5, 5), ColSideColors, RowSideColors, cexRow = 0.2 +
        1/log10(nr), cexCol = 0.2 + 1/log10(nc), labRow = NULL,
    labCol = NULL, main = NULL, xlab = NULL, ylab = NULL, keep.dendro = FALSE,
    verbose = getOption("verbose"), ...)
{
    scale <- if (symm && missing(scale))
        "none"
    else match.arg(scale)
    if (length(di <- dim(x)) != 2 || !is.numeric(x))
        stop("'x' must be a numeric matrix")
    nr <- di[1L]
    nc <- di[2L]
    if (nr <= 1 || nc <= 1)
        stop("'x' must have at least 2 rows and 2 columns")
    if (!is.numeric(margins) || length(margins) != 2L)
        stop("'margins' must be a numeric vector of length 2")
    doRdend <- !identical(Rowv, NA)
    doCdend <- !identical(Colv, NA)
    if (!doRdend && identical(Colv, "Rowv"))
        doCdend <- FALSE
    if (is.null(Rowv))
        Rowv <- rowMeans(x, na.rm = na.rm)
    if (is.null(Colv))
        Colv <- colMeans(x, na.rm = na.rm)
    if (doRdend) {
        if (inherits(Rowv, "dendrogram"))
            ddr <- Rowv
        else {
            hcr <- hclustfun(distfun(x))
            ddr <- as.dendrogram(hcr)
            if (!is.logical(Rowv) || Rowv)
                ddr <- reorderfun(ddr, Rowv)
        }
        if (nr != length(rowInd <- order.dendrogram(ddr)))
            stop("row dendrogram ordering gave index of wrong length")
    }
    else rowInd <- 1L:nr
    if (doCdend) {
        if (inherits(Colv, "dendrogram"))
            ddc <- Colv
        else if (identical(Colv, "Rowv")) {
            if (nr != nc)
                stop("Colv = \"Rowv\" but nrow(x) != ncol(x)")
            ddc <- ddr
        }
        else {
            hcc <- hclustfun(distfun(if (symm)
                x
            else t(x)))
            ddc <- as.dendrogram(hcc)
            if (!is.logical(Colv) || Colv)
                ddc <- reorderfun(ddc, Colv)
        }
        if (nc != length(colInd <- order.dendrogram(ddc)))
            stop("column dendrogram ordering gave index of wrong length")
    }
    else colInd <- 1L:nc
    x <- x[rowInd, colInd]
    labRow <- if (is.null(labRow))
        if (is.null(rownames(x)))
            (1L:nr)[rowInd]
        else rownames(x)
    else labRow[rowInd]
    labCol <- if (is.null(labCol))
        if (is.null(colnames(x)))
            (1L:nc)[colInd]
        else colnames(x)
    else labCol[colInd]
    if (scale == "row") {
        x <- sweep(x, 1L, rowMeans(x, na.rm = na.rm), check.margin = FALSE)
        sx <- apply(x, 1L, sd, na.rm = na.rm)
        x <- sweep(x, 1L, sx, "/", check.margin = FALSE)
    }
    else if (scale == "column") {
        x <- sweep(x, 2L, colMeans(x, na.rm = na.rm), check.margin = FALSE)
        sx <- apply(x, 2L, sd, na.rm = na.rm)
        x <- sweep(x, 2L, sx, "/", check.margin = FALSE)
    }
    lmat <- rbind(c(NA, 3), 2:1)
    lwid <- c(if (doRdend) 1 else 0.05, 4)
    lhei <- c((if (doCdend) 1 else 0.05) + if (!is.null(main)) 0.2 else 0,
        4)
    if (!missing(ColSideColors)) {
        if (!is.character(ColSideColors) || length(ColSideColors) !=
            nc)
            stop("'ColSideColors' must be a character vector of length ncol(x)")
        lmat <- rbind(lmat[1, ] + 1, c(NA, 1), lmat[2, ] + 1)
        lhei <- c(lhei[1L], 0.2, lhei[2L])
    }
    if (!missing(RowSideColors)) {
        if (!is.character(RowSideColors) || length(RowSideColors) !=
            nr)
            stop("'RowSideColors' must be a character vector of length nrow(x)")
        lmat <- cbind(lmat[, 1] + 1, c(rep(NA, nrow(lmat) - 1),
            1), lmat[, 2] + 1)
        lwid <- c(lwid[1L], 0.2, lwid[2L])
    }
    lmat[is.na(lmat)] <- 0
    if (verbose) {
        cat("layout: widths = ", lwid, ", heights = ", lhei,
            "; lmat=\n")
        print(lmat)
    }
    dev.hold()
    on.exit(dev.flush())
    op <- par(no.readonly = TRUE)
    on.exit(par(op), add = TRUE)
    layout(lmat, widths = lwid, heights = lhei, respect = FALSE)
    if (!missing(RowSideColors)) {
        par(mar = c(margins[1L], 0, 0, 0.5))
        image(rbind(if (revC)
            nr:1L
        else 1L:nr), col = RowSideColors[rowInd], axes = FALSE)
    }
    if (!missing(ColSideColors)) {
        par(mar = c(0.5, 0, 0, margins[2L]))
        image(cbind(1L:nc), col = ColSideColors[colInd], axes = FALSE)
    }
    par(mar = c(margins[1L], 0, 0, margins[2L]))
    if (!symm || scale != "none")
        x <- t(x)
    if (revC) {
        iy <- nr:1
        if (doRdend)
            ddr <- rev(ddr)
        x <- x[, iy]
    }
    else iy <- 1L:nr
    image(1L:nc, 1L:nr, x, xlim = 0.5 + c(0, nc), ylim = 0.5 +
        c(0, nr), axes = FALSE, xlab = "", ylab = "", ...)
    axis(1, 1L:nc, labels = labCol, las = 2, line = -0.5, tick = 0,
        cex.axis = cexCol)
    if (!is.null(xlab))
        mtext(xlab, side = 1, line = margins[1L] - 1.25)
    axis(4, iy, labels = labRow, las = 2, line = -0.5, tick = 0,
        cex.axis = cexRow)
    if (!is.null(ylab))
        mtext(ylab, side = 4, line = margins[2L] - 1.25)
    if (!missing(add.expr))
        eval(substitute(add.expr))
    par(mar = c(margins[1L], 0, 0, 0))
    if (doRdend)
        plot(ddr, horiz = TRUE, axes = FALSE, yaxs = "i", leaflab = "none")
    else frame()
    par(mar = c(0, 0, if (!is.null(main)) 1 else 0, margins[2L]))
    if (doCdend)
        plot(ddc, axes = FALSE, xaxs = "i", leaflab = "none")
    else if (!is.null(main))
        frame()
    if (!is.null(main)) {
        par(xpd = NA)
        title(main, cex.main = 1.5 * op[["cex.main"]])
    }
    invisible(list(rowInd = rowInd, colInd = colInd, Rowv = if (keep.dendro &&
        doRdend) ddr, Colv = if (keep.dendro && doCdend) ddc))
}

makeFDRColors <- function(numColors, maxFDRColored = 0.2, baseColor = "red") {
  ## Make colors that start out at 0 saturated baseColor, and go to pure white at 1.  But make
  ## it fade to white at a finite level before 1.  Appropriate for, e.g., FDR cutoffs.
  ## Saturation of baseColor @ 0, most significant point.  Fade out into white @ maxFDRColored,
  ## and white above that up to 1.

  numColors <- as.integer(numColors)                   # Really should signal if non-integer?
  stopifnot(is.integer(numColors) && numColors > 0)    # Don't be silly.
  stopifnot(0 <= maxFDRColored && maxFDRColored <= 1)  # At least not silly THAT way

  nFDRsColored <- maxFDRColored * numColors            # Number of FDRs that are nonwhite
  ramp         <- c(seq(from = 0, to = 1, length.out = nFDRsColored),
                    rep(1, times = numColors - nFDRsColored))

  switch(baseColor,
         "red"   = rgb(r = rep(1, numColors), g = ramp,              b = ramp),
         "green" = rgb(r = ramp,              g = rep(1, numColors), b = ramp),
         "blue"  = rgb(r = ramp,              g = ramp,              b = rep(1, numColors)),
         stop(sprintf("baseColor %s is not one of red, greeen, or blue?!", baseColor)))
}                                                      #  to make white @ maxFDRColored.

makeRedColors <- function(numColors, from = 0, to = 1) {  # Red/black color ramp
  rgb(r = seq(from = from, to = to, length.out = numColors), g = 0, b = 0)
}

makeGreenColors <- function(numColors, from = 0, to = 1) {# Green/black color ramp
  rgb(r = 0, g = seq(from = from, to = to, length.out = numColors), b = 0)
}

makeBlueColors <- function(numColors, from = 0, to = 1) { # Blue/black color ramp
  rgb(r = 0, g = 0, b = seq(from = from, to = to, length.out = numColors))
}

makeGrayColors <- function(numColors, from = 0, to = 1) { # Black (small) -> white (big).  The
  gray(seq(from = from, to = to, length.out = numColors)) #  color gray.  Not Bob Gray, 'cause
}                                                         #  he writes his own R code. :-)

makeTransparentColor <- function(col, alpha01) {       # Avoiding adjustcolor() in grDevices
  rgbs <- col2rgb(col)                                 # *** use apply() or do.call() or something?
  rgb(red = rgbs[1, 1], green = rgbs[2, 1], blue = rgbs[3, 1],
      alpha = alpha01 * 255, maxColorValue = 255)      #
}                                                      #

makeZeroCenteredColors <- function(n, dataRange) {     # Not necessarily in [-1, +1]
  ## - first color corresponds to low end of range, last to high end of range
  ## - extreme: max absolute value of range
  ## - green corresponds to -extreme, black to 0, red to +extreme
  stopifnot(n >= 3)                                    # Must ask for at least 3 colors
  minObs <- dataRange[[1]]                             # Minimum in observed range
  maxObs <- dataRange[[2]]                             # Maximum in observed range
  stopifnot(minObs < 0 && 0 < maxObs)                  # Observations range across 0
  xs <- seq(from = minObs, to = maxObs, length.out = n)# Size n lattice in [minObs, maxObs]
  xt <- max(abs(minObs), maxObs)                       # Most extreme value
  rgb(r = ifelse(xs > 0, xs / xt, 0),                  # Red ramps up on positives
      g = ifelse(xs > 0,       0, -xs / xt),           # Green ramps down on negatives
      b = rep(0, times = n))                           # Blue stays always off
}                                                      # Return the sequence of colors

makeCorrelationColors <- function(n, corrRange) {      # Colors for correlation: in [-1, +1]
  ## - first color corresponds to low end of range, last to high end of range
  ## - pure green corresponds to -1, pure black to 0, pure red to +1
  stopifnot(n >= 3)                                    # Must ask for at least 3 colors
  minObs <- corrRange[[1]]                             # Minimum in observed range
  maxObs <- corrRange[[2]]                             # Maximum in observed range
  stopifnot(-1 <= minObs && minObs <= +1)              # Correlations between -1 and +1
  stopifnot(-1 <= maxObs && maxObs <= +1)              # Correlations between -1 and +1
  stopifnot(minObs < maxObs)                           # Observation values must be in order
  xs <- seq(from = minObs, to = maxObs, length.out = n)# Size n lattice in [minObs, maxObs]
  rgb(r = ifelse(xs > 0, xs,   0),                     # Red ramps up on positives
      g = ifelse(xs > 0,  0, -xs),                     # Green ramps down on negatives
      b = rep(0, times = n))                           # Blue stays always off
}                                                      # Return the sequence of colors

makeHeatmapColors <- function(numColors) {             # Green (small) -> black -> red (big)
  halfZeros <- rep(0, numColors %/% 2)                 # 0's and ramp for half range each
  halfSteps <- seq(from = 0, to = 1, length.out = numColors - length(halfZeros))
  rgb(g = c(rev(halfSteps), halfZeros),                # Green: ramp down followed by 0's
      r = c(halfZeros,      halfSteps),                # Red:   0's followed by ramp up
      b = c(halfZeros,      halfZeros))                # Blue:  0's everywhere
}                                                      #

makeSaturableHeatmapColorsBWR <- function(n,            # Blue (small) -> white -> red (big)
                                          minObs = -1,  #
                                          maxObs = +1,  #
                                          minSat = minObs,
                                          midSat = (minObs + maxObs)/2,
                                          maxSat = maxObs) {
  ## - first color corresponds to minObs, last color to maxObs.
  ## - colors outside [minSat, maxSat] saturate at either 0 or 1.
  ## n:                      the number of colors to make
  ## minSat, midSat, maxSat: low, mid, and high values for color saturation
  ## minObs, maxObs:         the min and max values to be plotted
  stopifnot(minSat <  midSat && midSat < maxSat)       # Saturation values must be in order
  stopifnot(minObs < maxObs)                           # Observation values must be in order
  stopifnot(minObs < maxSat && minSat < maxObs)        # Observations must overlap colors
  stopifnot(n >= 3)                                    # Must ask for at least 3 colors
  xs <- seq(from = minObs, to = maxObs, length.out = n)# Size n lattice in [minObs, maxObs]
  ## Red:   0 below minSat, ramp up to 1 @ midSat, then 1's
  ## Green: 0 below minSat, ramp up to 1 @ midSat, the ramp back down to 0 @ maxSat, then 0's
  ## Blue:  1 below midSat, ramp down to 0 @ maxSat, then 0's
  rgb(r = pmax(0, pmin(1, (xs - minSat)/(midSat - minSat))),
      g = pmax(0, pmin(1, (xs - minSat)/(midSat - minSat), (maxSat - xs)/(maxSat - midSat))),
      b = pmax(0, pmin(1, (maxSat - xs)/(maxSat - midSat))))
}                                                      # Return the sequence of colors

library("MASS")                                        # For kde2d()
library("colorspace")                                  # For lighten()
scatterplotWithDensities <- function(xs, ys, bgs, xlab, ylab, main, sub = NULL,
                                     regressionColor = "black",
                                     cex = 1, col = "black",
                                     densityCol = "gray", kdeN = 100,
                                     kdeH = c(bandwidth.nrd(xs), bandwidth.nrd(ys)),
                                     nLevels = 10,
                                     xlim = range(xs), ylim = range(ys), log = "",
                                     extendRange = FALSE,
                                     legendPos = "topleft") {
  plot(x = NA, y = NA, log = log,                      # Empty plot of right sizet
       xlim = xlim, ylim = ylim, xlab = xlab, ylab = ylab, main = main, sub = sub)

  rug(xs, side = 1, col = densityCol)                  # Rugs on each axis indicate the
  rug(ys, side = 2, col = densityCol)                  #  marginal univariate densities

  confColor <- if (is.null(regressionColor)) NA else lighten(regressionColor, 0.70, method = "absolute")
  mdl <- if (!is.null(regressionColor)) {              # If we want a regression line
           ## *** If log-transformed plot, then model should have corresponding logs!
           mdl   <- lm(y ~ x, data = data.frame(x = xs, y = ys))

           xs2 <- xs                                   # Extend range of conf/pred interval
           if (extendRange) {                          #  beyond training data to plot limits?
             if (xs2[[1]]           != min(xlim)) xs2 <- c(min(xlim), xs2)
             if (xs2[[length(xs2)]] != max(xlim)) xs2 <- c(xs2, max(xlim))
           }                                           # Otherwise just use training data
           newData <- data.frame(x = xs2)              # For predict.lm(), below

           ## Prediction interval: using the model to predict 1 new point
           ## NB: prediction intervals always seem to cause an overly-cautious
           ## warning; see documentation for predict.lm().
           predColor <- lighten(regressionColor, 0.90, method = "absolute")
           preds     <- as.data.frame(predict(mdl, interval = "prediction", newdata = newData))

           polygon(rbind(data.frame(x = xs2,      pred = preds$"lwr"),
                         data.frame(x = rev(xs2), pred = rev(preds$"upr"))),
                   col = predColor)                    #

           ## Confidence interval: how sure we are about where the line is (think s.e. of mean)
           confs     <- as.data.frame(predict(mdl, interval = "confidence", newdata = newData))
           polygon(rbind(data.frame(x = xs2,      conf = confs$"lwr"),
                         data.frame(x = rev(xs2), conf = rev(confs$"upr"))),
                   col = confColor)                    #

           abline(reg = mdl, col= regressionColor, lty = "dashed", lwd = 2, untf = log != "")

           ## *** Also put regression tbl in plot?
           mdl
         } else NULL                                   # No model being fit

  if (kdeN > 0)                                        # If we're doing contours
    contour(kde2d(xs, ys, n = kdeN, h = kdeH),         # Contours for joint bivariate density
            nlevels = nLevels, drawlabels = FALSE, col = densityCol, add = TRUE)

  ## Data points ON TOP OF contours, regression stuff, conf limits
  points(x = xs, y = ys, pch = 21, bg = bgs, cex = cex, col = col)

  legend(legendPos, inset = 0.01, bg = "antiquewhite", # Explain the colors and such
         legend = c("Data",   "Linear Fit", "95% Conf Limit", "95% Pred Limit"),
         pch    = c(21,       NA,           22,               22),
         lty    = c(NA,       "dashed",     NA,               NA),
         pt.bg  = c(bgs[[1]], NA,           confColor,        predColor),
         col    = c("black",  "black",      "black",          "black"),
         pt.cex = 2)                                   #

  mdl                                                  # Return regression model
}                                                      #

scientificExpression <- function(x, places = 2) {      # Expression for sci notation of float
  ## Convert a floating point number to an expression object, suitable for putting on
  ## a plot.  The expression does scientific notation with raised exponent and all that.
  ## It uses sprintf/%e to convert first, so it makes all the approximations of decimal
  ## conversions implied by that, but no more.
  sx   <- sprintf(sprintf("%%.%de", places), x)        # sprintf %e to converts to decimal str
  patt <- "^(.*)e(.*)$"                                # Pattern for "mantissa" & exponent
  bquote(.(gsub(patt, "\\1", sx)) %*% 10^.(gsub(patt, "\\2", sx)))
}                                                      # Return the expression

volcanoPlot <- function(volcanoData, logFCCol, signifCol, hitCol, nameCol, labelCol,
                        logFCCutoff, signifCutoff, xlab, ylab, main,
                        hitMissColors = c("Hit" = "red", "Miss" = "blue")) {
  withPars(function() {                                # Save/restore graphics parameters
    plot(x = volcanoData[, logFCCol], y = -log10(volcanoData[, signifCol]),
         pch = 21, bg = ifelse(volcanoData[, hitCol], hitMissColors[[1]], hitMissColors[[2]]),
         cex = 1.5, xlab = xlab, ylab = ylab, main = main)
    rangeLogStrength <- range(volcanoData[, logFCCol]) #
    maxMLog10Signif  <- max(-log10(volcanoData[, signifCol]))
    lines(x = c(rangeLogStrength[[1]], -logFCCutoff,         -logFCCutoff),
          y = c(-log10(signifCutoff),  -log10(signifCutoff), maxMLog10Signif),
          lty = "dashed", col = "black")               # Negative log abs fold change, significant points
    lines(x = c(rangeLogStrength[[2]], +logFCCutoff,         +logFCCutoff),
          y = c(-log10(signifCutoff),  -log10(signifCutoff), maxMLog10Signif),
          lty = "dashed", col = "black")               # Positive log abs fold change, significant points
    legend("bottomright", inset = 0.01, bg = "antiquewhite",
           legend = names(hitMissColors), pch = 21, pt.cex = 2, pt.bg = hitMissColors)
    if (!is.null(labelCol))                            # Labels are being done
      ddply(subset(volcanoData, subset = volcanoData[, labelCol]), nameCol,
            function(qdf) {                            # Label a few genes w/extreme effect sizes
              label <- as.character(qdf[1, nameCol])   #
              x     <- qdf[1, logFCCol]                #
              y     <- -log10(qdf[1, signifCol])       # To right if negative, to left if positive,
              text(x = x, y = y, labels = label, pos = if (x < 0) 4 else 2)
            })                                         #  i.e., label ways toward the interior from pt
  }, pty = "m",                                        # Maximal plotting area
     bg  = "transparent",                              # Background color
     ps  = 18,                                         # Larger type for file capture
     mar = c(3, 3, 2, 1),                              # Pull in on margins
     mgp = c(1.7, 0.5, 0))                             # Axis title, labels, tick
  invisible(NA)                                        # Return nothing of interest
}                                                      #

##
## Save and restore graphics parameters
##

withPars <- function(bodyFn, ...) {                    # Call bodyFn with graphics pars set
  oldParList <- NULL                                   # Capture old vals: params changed only
  tryCatch({ oldParList <- par(...); bodyFn() }, finally = par(oldParList))
}                                                      # Guarantee old vals restored @ end

##
## Do graphics with output to a .png file (and now, other formats too).
##

library("grDevices")                                   # Where graphics devices live
withGraphicsToImageFile <- function(file, width, height, ask, deviceFn, bodyFn) {
  if (is.null(file)) {                                 # If no file, then execute directly
    pixelsPerInch <- par("cra") / par("cin")           #   px/in horiz & vertical; new device
    dev.off()                                          #   on screen wants size in inches!
    dev.new(width = width / pixelsPerInch[[1]], height = height / pixelsPerInch[[2]])
    withPars(bodyFn, "ask" = ask)                      #   plotting goes to screen device
  } else                                               # Else there is a file, so execute
    tryCatch({                                         #  w/graphics redirected to a file
      deviceFn(file, width = width, height = height, bg = "transparent")
      withPars(bodyFn, "ask" = FALSE)                  # No asking, just go ahead and plot
    }, finally = dev.off())                            # Guarantee closure of the file device
}                                                      #

withJPG <- function(file, width, height, ask, bodyFn) {# Capture graphics to .jpg file
  ## withGraphicsToImageFile(file, width, height, ask,
  ##                         function(...) { jpeg(quality = "100", ...) }, bodyFn)
  withGraphicsToImageFile(file, width, height, ask, jpeg, bodyFn)
}                                                      #

withPDF <- function(file, width, height, ask, bodyFn) {# Capture graphics to .pdf file
  withGraphicsToImageFile(file, width, height, ask, pdf, bodyFn)
}                                                      #

withPNG <- function(file, width, height, ask, bodyFn) {# Capture graphics to .png file
  withGraphicsToImageFile(file, width, height, ask, png, bodyFn)
}                                                      #

withSVG <- function(file, width, height, ask, bodyFn) {# Capture graphics to .svg file
  withGraphicsToImageFile(file, width, height, ask, svg, bodyFn)
}                                                      #

withTIFF <- function(file, width, height, ask, bodyFn) {# Capture graphics to .tiff file
  withGraphicsToImageFile(file, width, height, ask, tiff, bodyFn)
}                                                      #
