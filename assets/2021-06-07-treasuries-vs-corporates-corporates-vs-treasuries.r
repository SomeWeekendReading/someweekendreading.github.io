## Created on Tuesday, June  1, 2021 at 8:06pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

toolsDir <- "../tools"                                 # Various tools available from author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks

library("glmnet")                                      # For glm()
library("plyr")                                        # For ddply()
library("PerformanceAnalytics")                        # For chart.Correlation()
library("psych")                                       # For paired.r()
library("animation")                                   # For saveGIF()
library("scatterplot3d")                               # For scatterplot3d()

##
## Research question: Should you diversify a stock portofolio with corporate bonds or
## with Treasury bonds?
##
## Some people look at low Treasury yields vs higher corporate yields, and pick the
## corporates.  I think this is wrong: a corporate bond is like a little bit of stock risk
## along with the (Treasury-like) bond risk.  You're trying to diversify away from stock
## risk by picking something that has stock risk, which is doomed to fail, or at least suboptimal!
##
## My theory of bonds is that I hold them for 2 reasons, in this priority order:
## (a) Risk (volatility) control & rebalancing: make my return's standard deviation lower,
##     and in case volatility shows up provide a store of value for rebalancing to/from stocks.
## (b) While you're waiting, try to earn some income.
##
## Given that I place a premium on (a), I sacrifice (b) and choose Treasuries.
##
## A test of this idea: can we take the return of a corporate bond index over a long time,
## and regress it on the stock market returns and Treasury returns over the same time?
##
##      CorpBondReturn = beta_0 + beta_1 * StockReturn + beta_2 * TreasuryReturn
##
## - Obviously, we mean corporates vs treasuries of approximately the same duration.
## - Also obviously, this is US-only, though it should apply elsewhere (e.g., gilts in the UK).
##
## Our strategy is (partially) supported if these (pre-specified!) things are true:
## (1) The Pearson correlation matrix shows lower Treasury/Stock correlation than
##     Corporate/Stock correlation.  (Can we quantify that with a Pearson test p-value?)
## (2) The regression, perhaps over limited time periods and perhaps for real (inflation-adjusted)
##     returns, overall has an F-statistic with a significant p-value, and a high enough
##     adjusted R^2.
## (3) The coefficient beta_1 for the stock market term has a t-statistic with a significant
##     p-value.  This indicates stock-like risk for the corporate bond, making it an inferior
##     diversifier for stock risk.
##

doit <- function(## Inputs
                 dataDir           = "./data",
                 tsmIttItcDataFile = "tsm-itt-itc-data.tsv",
                 minYear           = 1871,
                 maxYear           = 2020,
                 modernYear        = 1980,
                 minModernYear     = 1970,
                 maxModernYear     = 1990,

                 ## Outputs
                 resultsDir    = "./results",
                 txFile        = "corporates-vs-treasuries-transcript.txt",
                 corrChartFile = "correlation-chart-%s.png",
                 scattFile     = "scatterplot-3d-%s.gif",
                 cvPlotFile    = "cv-lasso-regression-%s.png",
                 startYrFile   = "start-year-dependency.png") {

  loadData <- function(dataDir, tsmIttItcDataFile, minYear, maxYear) {
    cat(sprintf("* Loading stock market, treasury, and corporate returns data"))
    f <- file.path(dataDir, tsmIttItcDataFile)         # Where the data lives
    cat(sprintf("\n  - Input file %s", f))             # Announce we're loading it
    tsmIttItcData <- read.table(f, sep = "\t", header = TRUE)
    cat(sprintf("\n  - Structure of data found:\n"))   # Show what fish we caught
    str(tsmIttItcData)                                 #

    stopifnot(colnames(tsmIttItcData) == c("Year",     # Check column names & types
                                           "TSM.Nominal", "ITT.Nominal", "ITC.Nominal",
                                           "TSM.Real",    "ITT.Real",    "ITC.Real"))
    stopifnot(class(tsmIttItcData$"Year")        == "integer" &&
              class(tsmIttItcData$"TSM.Nominal") == "numeric" &&
              class(tsmIttItcData$"ITT.Nominal") == "numeric" &&
              class(tsmIttItcData$"ITC.Nominal") == "numeric" &&
              class(tsmIttItcData$"TSM.Real")    == "numeric" &&
              class(tsmIttItcData$"ITT.Real")    == "numeric" &&
              class(tsmIttItcData$"ITC.Real")    == "numeric")
    cat(sprintf("  - Column names and types check out"))

    stopifnot(all(complete.cases(tsmIttItcData)))      # All data present?
    cat(sprintf("\n  - No missing data"))              #

    stopifnot(all(minYear <= tsmIttItcData$"Year" & tsmIttItcData$"Year" <= maxYear))
    cat(sprintf("\n  - Year range check passed: %d - %d", minYear, maxYear))

    cat("\n")                                          # Final newline

    tsmIttItcData                                      # Return the data
  }                                                    #

  correlationDifferenceSignificance <- function(df) {#
    stopifnot(ncol(df) == 3)                         # 3 columns: stock market first,
    stopifnot(grepl("^TSM\\..*$", colnames(df)[[1]]))#  then 2 bonds
    ## Does a Fisher Z-transform to get a more or less normally distributed score
    ## from the difference of the correlations, then getting the normal p-value.
    cor1 <- cor(df[, 1], df[, 2])                    #
    cor2 <- cor(df[, 1], df[, 3])                    #
    tst  <- paired.r(cor1, cor2, n = nrow(df), n2 = nrow(df), twotailed = FALSE)
    cat(sprintf("\n  - Significance of difference of correlations %.2f and %.2f (%d points):",
                cor1, cor2, nrow(df)))               #
    cat(sprintf("\n    Z = %.2f, p = %.2g", tst$"z", tst$"p"))
    tst$"p"                                          # Return the p-value
  }                                                  #

  plotCorrelations <- function(df, resultsDir, corrChartFile, scattFile, type) {

    f <- file.path(resultsDir, sprintf(corrChartFile, type))
    withPNG(f, 500, 500, FALSE, function() { chart.Correlation(df, histogram = TRUE, pch = 19) })
    cat(sprintf("\n  - Correlation chart of %s to %s", paste(colnames(df), collapse = ", "), f))
    correlationDifferenceSignificance(df)              #

    f <- file.path(resultsDir, sprintf(scattFile, type))
    saveGIF(expr = {                                   #
      withPars(function() {                            #
        ## It really wants there to be 50 frames, and not @ 0/360 degrees.
        ## We want a forward rotation, and then reverse course back to the start.
        ## Let's say we're rotating nDeg degrees and back.
        nDeg       <- 80                               #
        deltaAngle <- nDeg / 25                        #
        angles     <- seq(from = deltaAngle, to = nDeg, length.out = 25)
        angles     <- c(angles, rev(angles))           # Rotate forward then backward
        sapply(angles, function(angle) {               # Plot for each angle
          scatterplot3d(x = df[, 2], y = df[, 3], z = df[, 1],
                        type = "p", pch = 21, bg = "blue",
                        main  = sprintf("US Stocks, Treasuries, & Corporates: %s", type),
                        xlab  = colnames(df)[[2]],     # Arranges TSM on the real z axis!
                        ylab  = colnames(df)[[3]],     #
                        zlab  = colnames(df)[[1]],     #
                        mar   = c(3, 3, 3, 3),         #
                        mgp   = c(1.7, 0.5, 0),        # Gets ignored?
                        angle = angle)                 #
        })                                             #
      }, pty = "m",                                    #
         bg  = "white",                                #
         mgp = c(1.7, 0.5, 0))                         # Gets ignored?
      ## Had to throw out directory on dest file here, since it was causing
      ## bizarre errors in this very fragile software.
    }, movie.name = basename(f), interval = 0.1, ani.width = 400, ani.height = 400)
    cat(sprintf("\n  - Also, 3d scatterplot to %s\n", f))

    TRUE                                               # Flag that it was done
  }                                                    #

  doRegression <- function(df, resultsDir, cvPlotFile, type) {
    stopifnot(length(colnames(df)) == 4)               # Check that we have 4 columns of data
    stopifnot("Year" == colnames(df)[[1]])             # And that they're what we think they are
    stopifnot(grepl("^TSM\\..*$", colnames(df)[[2]]))  #
    stopifnot(grepl("^ITT\\..*$", colnames(df)[[3]]))  #
    stopifnot(grepl("^ITC\\..*$", colnames(df)[[4]]))  #

    df <- transform(df, Fold = (Year %% 3) + 1)        # Add crossvalidation fold number
    cvMdl <- cv.glmnet(x      = as.matrix(df[, c(2, 3)]),
                       y      = df[, 4, drop = TRUE],  #
                       foldid = df$"Fold",             #
                       alpha  = 1, family = "gaussian", type.measure = "mse")
    print(cvMdl)                                       #
    print(coef(cvMdl, s = "lambda.min"))               #
    f <- file.path(resultsDir, sprintf(cvPlotFile, type))
    withPNG(f, 400, 400, FALSE, function() {           #
      withPars(function() {                            #
        plot(cvMdl)                                    #
      }, pty = "m",                                    #
         bg  = "white",                                #
         mgp = c(1.7, 0.5, 0),                         #
         mar = c(3, 3, 2, 1))                          #
    })                                                 #

    mdl <- lm(as.formula(sprintf("%s ~ %s + %s",       #
                                 colnames(df)[[4]], colnames(df)[[2]], colnames(df)[[3]])),
              data = df)                               #
    print(summary(mdl))                                #
    list("cvMdl" = cvMdl, "mdl" = mdl)                 #
  }                                                    #

  startYearSensitivity <- function(tsmIttItcData, minModernYear, maxModernYear,
                                   resultsDir, startYrFile) {
    cat(sprintf("* Examining sensitivity of Treas/Corp real corr diff with start year:"))
    cat(sprintf("\n  - Start year: %d - %d", minModernYear, maxModernYear))
    cat(sprintf("\n  - End year: %d", max(tsmIttItcData$"Year")))
    expt      <- subset(tsmIttItcData,                 #
                        subset = Year >= minModernYear,#
                        select = c(Year, TSM.Real, ITT.Real, ITC.Real))
    corrPVals <<- ldply(minModernYear : maxModernYear, function(startYear) {
      foo <- subset(expt, subset = Year >= startYear, select = -Year)
      data.frame(StartYear = startYear, p = correlationDifferenceSignificance(foo))
    })                                                 #
    f <- file.path(resultsDir, startYrFile)            #
    withPNG(f, 400, 400, FALSE, function() {           #
      withPars(function() {                            #
        plot(x = corrPVals$"StartYear", y = corrPVals$"p",
             type = "b", pch = 21, bg = "blue", lty = "dotted",
             xlab = "Start Year", ylab = "Correlation Difference p-value",
             ylim = c(0.0, max(corrPVals$"p")),        #
             main = "Treas/Corp Real Correlation Diff vs Start Year")
      }, pty = "m",                                    #
         bg  = "white",                                #
         mgp = c(1.7, 0.5, 0),                         #
         mar = c(3, 3, 2, 1))                          #
    })                                                 #
    cat(sprintf("\n  - Results plotted to %s\n", f))   #
    TRUE                                               #
  }                                                    #

  ## Main body of script begins here
  withTranscript(dataDir, resultsDir, txFile, "Corporates vs Treasuries Analysis", function() {

    heraldPhase("Script Archival")                     # For peer review
    archiveAnalysisScript(resultsDir, "./corporates-vs-treasuries.r")

    heraldPhase("Loading datasets")                    # Load the dataset
    maybeAssign("tsmIttItcData", function() {          #  and sanity-check it a bit
      loadData(dataDir, tsmIttItcDataFile, minYear, maxYear)
    })                                                 #

    heraldPhase("Exploratory correlations")            #
    maybeAssign("realCorrelations", function() {       #
      cat(sprintf("* Real correlations:"))             #
      plotCorrelations(subset(tsmIttItcData, select = c(TSM.Real, ITT.Real, ITC.Real)),
                       resultsDir, corrChartFile, scattFile, "Real")
    })                                                 #
    maybeAssign("nominalCorrelations", function() {    #
      cat(sprintf("\n* Nominal correlations:"))        #
      plotCorrelations(subset(tsmIttItcData, select = c(TSM.Nominal, ITT.Nominal, ITC.Nominal)),
                       resultsDir, corrChartFile, scattFile, "Nominal")
    })                                                 #

    maybeAssign("realRegression", function() {         #
      doRegression(subset(tsmIttItcData, select = c(Year, TSM.Real, ITT.Real, ITC.Real)),
                   resultsDir, cvPlotFile, "Real")     #
    })                                                 #

    heraldPhase("Just modernity, thanks...")           # Drop distant past, different from now
    maybeAssign("tsmIttItcDataModern", function() {    # Just the recent past
      subset(tsmIttItcData, subset = Year >= modernYear)
    })                                                 #
    maybeAssign("realCorrelationsModern", function() { #
      cat(sprintf("* Real correlations:"))             #
      plotCorrelations(subset(tsmIttItcDataModern, select = c(TSM.Real, ITT.Real, ITC.Real)),
                       resultsDir, corrChartFile, scattFile, "Real 1980-2020")
    })                                                 #
    maybeAssign("realRegressionModern", function() {   #
      doRegression(subset(tsmIttItcDataModern, select = c(Year, TSM.Real, ITT.Real, ITC.Real)),
                   resultsDir, cvPlotFile,             #
                   sprintf("Real %d - %d",             #
                           min(tsmIttItcDataModern$"Year"), max(tsmIttItcDataModern$"Year")))
    })                                                 #

    heraldPhase("Start year sensitivity")              #
    maybeAssign("startYrSensDone", function() {        #
      startYearSensitivity(tsmIttItcData, minModernYear, maxModernYear, resultsDir, startYrFile)
    })                                                 #

  })                                                   #
}                                                      #
