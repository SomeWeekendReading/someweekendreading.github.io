## Created on Friday, September  6, 2024 at 4:06pm EDT by WeekendEditor on WeekendEditorMachine.
## UnCopyright (u) 2024, SomeWeekendReading blog.  All rights reversed.  As if you care.

##
## Electoral college differences vs candidate age differences.
##

library("plotrix")                                     # For addtable2plot()

toolsDir <- "../../tools"
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphicsusua stuff

## > doit()
doit <- function(inDir         = ".",
                 ecAgeDataFile = "2024-09-06-politics-age-gaps-data.tsv",
                 txFile        = gsub("-data\\.tsv", "-transcript\\.txt", basename(ecAgeDataFile)),
                 resultsDir    = ".",
                 plotFile      = "2024-09-06-politics-age-gaps-since-%d-%d.png") {

  readData <- function(inDir, ecAgeDataFile, dropNA) { # Read data from the .tsv file
    f <- file.path(inDir, ecAgeDataFile)               # Complete pathname
    cat(sprintf("* Reading data from %s", f))          # Yack about what we're doing
    ecAgeData <- read.table(f, header = TRUE, sep = "\t", stringsAsFactors = TRUE)
    cat(sprintf("\n  - All cases: %d rows, %d cols", nrow(ecAgeData), ncol(ecAgeData)))

    if (dropNA) {                                      # If want only complete cases (usually!)
      ecAgeData <- subset(ecAgeData, subset = complete.cases(ecAgeData))
      cat(sprintf("\n  - Complete cases: %d rows, %d cols", nrow(ecAgeData), ncol(ecAgeData)))
    }                                                  #

    cat("\n"); print(head(ecAgeData, n = 4))           # Show first 4 rows to see what we've got
    ecAgeData                                          # Return the dataframe
  }                                                    #

  doPlot <- function(resultsDir, ecAgeData, plotFile) {# Make plot and do regression
    fitData <- transform(ecAgeData,                    #
                         AbsECDiff  = abs(ecAgeData$"D.EC.Diff"),
                         AbsAgeDiff = abs(ecAgeData$"Age.Diff"))
    fitData <- fitData[order(fitData$"AbsAgeDiff"),]   #

    yearRange <- range(fitData$"Election.Year")        # Get range of years for title & filename
    destFile  <- file.path(resultsDir,                 # Name of destination file
                           sprintf(plotFile, yearRange[[1]], yearRange[[2]]))
    cat(sprintf("\n* Plotting data from %d to %d to %s.\n",
                yearRange[[1]], yearRange[[2]], destFile))

    mdl     <- lm(AbsECDiff ~ AbsAgeDiff, data = fitData)
    mdlSum  <- summary(mdl)                            # More readable summary of model
    mdlCI   <- confint(mdl)                            # Confidence intervals on param estimates
    print(mdlSum)                                      # Capture model stats to transcript
    print(mdlCI)                                       #  and parameter confidence intervals

    withPNG(destFile, 700, 700, FALSE, function() {    # Capture graphics to a file
      withPars(function() {                            # Save/restore graphics parameters
        plot(x = NA, y = NA,                           # Put annotations 1st, points on top of it
             xlim = range(fitData$"AbsAgeDiff"), ylim = range(fitData$"AbsECDiff"),
             xlab = "|Age Difference|", ylab = "|EC Votes Diff|",
             main = sprintf("Electoral College Diff vs Age Diff: %d - %d",
                            yearRange[[1]], yearRange[[2]]))

        ## Slightly wrong: both variables are absolute values, so
        ## the error model should reflect that: lower limit always > 0,
        ## not a normal distribution around the regression line, etc.
        preds   <- as.data.frame(predict(mdl, interval = "prediction", newdata = fitData))
        polygon(rbind(data.frame(x = fitData$"AbsAgeDiff",      y = preds$"lwr"),
                      data.frame(x = rev(fitData$"AbsAgeDiff"), y = rev(preds$"upr"))),
                col = "lightGray")                     # Draw in prediction confidence limits
        abline(reg = mdl, col = "black")               # Draw in OLS regression line

        points(x    = fitData$"AbsAgeDiff",            # Draw in data points
               y    = fitData$"AbsECDiff",             #
               pch  = 21,                              #
               cex  = 2.0,                             #
               bg   = ifelse(fitData$"D.EC.Diff" > 0, "blue", "red"))
        text(x      = fitData$"AbsAgeDiff",            # Annotate data points by winner/year
             y      = fitData$"AbsECDiff",             #
             pos    = 1,                               #
             cex    = 0.8,                             #
             labels = sprintf("%s/%d",                 #
                              ifelse(fitData$"D.EC.Diff" > 0,
                                     as.character(fitData$"D.Candidate"),
                                     as.character(fitData$"R.Candidate")),
                              fitData$"Election.Year"))

        legend("topleft", bg = "antiquewhite", inset = c(0.01, 0.10),
               pch    = c(21,        21,          NA,          22,          NA),
               pt.bg  = c("blue",    "red",       NA, "lightGray",          NA),
               pt.cex = c(2.0,       2.0,         NA,         2.0,          NA),
               lty    = c(NA,        NA,     "solid",          NA,          NA),
               legend = c("Dem win", "Repub win", "OLS Regression Line", "Prediction 95% CL",
                          as.expression(bquote(        # Model's adjusted R^2 & F-stat p-value
                              paste(adj ~ italic(R)^2 %~%
                                      .(sprintf("%.1f%%", 100.0 * mdlSum$"adj.r.squared")), ", ",
                                      italic(p) %~% .(sprintf("%.2e", anova(mdl)$"Pr(>F)"[[1]])))))))

        padStrings <- function(strs) {                       # Find max len str and left pad all the
          sprintf("%*s", max(nchar(strs)), strs)             #  others w/space to be the same length
        }                                                    # Really hacky kludge for alignment!

        ## Add table of fitted coeffs, conf limits, and t-stat p-values
        tbl           <- signif(cbind(coef(mdlSum), mdlCI), digits = 3)
        tbl           <- tbl[, c("Estimate", "2.5 %", "97.5 %", "Pr(>|t|)")]
        colnames(tbl) <- c("Fit", "LCL", "UCL", "p")   # Better colnames to work with temporarily
        tbl           <- transform(as.data.frame(tbl), # Tranform to strings of same size each column
                                   Fit = padStrings(sprintf("%+5.2f", Fit)),
                                   LCL = padStrings(sprintf("%+4.1f", LCL)),
                                   UCL = padStrings(sprintf("%+4.1f", UCL)),
                                   p   = padStrings(sprintf("%5.2e",  p)))
        colnames(tbl) <- c("Fit", "2.5%", "97.5%", "p")    # Colnames we want to see on the plot
        rownames(tbl) <- c("Intercept", "Slope")           # Rownames we want to see on the plot
        addtable2plot(x = max(fitData$"AbsAgeDiff", na.rm = TRUE), xjust = 1,
                      y = min(fitData$"AbsECDiff",  na.rm = TRUE), yjust = 1,
                      table = tbl, bty = "o", bg = "antiquewhite",
                      display.rownames = TRUE, hlines = TRUE, vlines = TRUE)

      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })                                                 #
    TRUE                                               # Flag that plot has been done
  }                                                    #

  withTranscript(inDir = inDir, resultsDir = resultsDir, transcriptFile = txFile,
                 name = "EC Diff vs Age Diff", bodyFn = function() {

    heraldPhase("Reading dataset")                     # Load the data
    maybeAssign("ecAgeData", function() { readData(inDir, ecAgeDataFile, TRUE) })

    heraldPhase("Doing plot & regression for data since 1992 only")
    maybeAssign("plotDone1", function() {              # Use just 1992 - date
      doPlot(resultsDir, subset(ecAgeData, subset = Election.Year >= 1992), plotFile)
    })                                                 #

    heraldPhase("Doing plot & regression for all data")# Use all data
    maybeAssign("plotDone2", function() { doPlot(resultsDir, ecAgeData, plotFile) })

  })                                                   # Done!
}                                                      #
