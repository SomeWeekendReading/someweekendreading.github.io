## Created on Saturday, May 15, 2021 at 5:16pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

##
## Research question: Does the MWRA's metagenomic measurement of SARS-COV-2 RNA in
## wastewater predict later hospitalization or death rates or positive test rates?
##
## Hypotheses: hospitalization & death rates might work; positive test rates probably
## won't, due to changes in test availability, test type, and testing policy.
##
## Data sources (2021-May-15):
## - Mass COVID hospitalization/death rates from: (ends 2021-Mar-07, with shutdown of COVID
##   tracking project, when the federal government started functioning again)
##   https://covidtracking.com/data/state/massachusetts
## - MWRA metagenomics painfully extracted from a PDF at:
##   http://www.mwra.com/biobot/biobotdata.htm
##   NB: It makes a hash of copy/paste if you try to paste directly to a text file for .tsv format.
##   But importing into a Google Sheets doc mostly works, modulo some fussing with the last page.
##   THEN you can export that to text.
##
## Did not consider test positivity rates, since testing has changed from basically unavailable
## to somewhat available, and the reporting has been spotty enough to make the numbers useless.
##
## Should consider forcing intercept to 0 in linear models, for 0 COVID deaths when there's
## 0 SARS-CoV2 RNA present.  Might improve some of the fits, from the look of it.
##
## Note also that the Wave1 and Wave2 have different structures, with higher medical loads
## from less RNA in the first wave.  Maybe treatment got better?  Should probably explore
## a classifier rather than a regression in that case: from RNA, predict if we're in a wave or not.
##
## Also, none of this is crossvalidated!  With only 2 waves, not much to be done there.
##

toolsDir <- "../../tools"                              # Various tools available from author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks

library("plyr")                                        # For ddply()
library("lubridate")                                   # For floor_date(), ceiling_date()
library("PerformanceAnalytics")                        # For chart.Correlation()

doit <- function(## Inputs
                 dataDir          = "./data",
                 ## *** NB: On 2021-01-25, the South RNA was 3772, which looks like an
                 ##     outlier, even after averaging with the North.
                 mwraDataFile     = "MWRAData20210514-data.tsv",
                 covidDataFile    = "massachusetts-history.csv",
                 ## *** NB: medical data seems to be state-wide, whereas MWRA data is for Boston
                 ##     metro area.
                 ## *** NB: on 2020-06-30 and 2020-09-02, deathIncrease is NEGATIVE,
                 ##     i.e., 41 and 4 dead people were resurrected on those days.  Sort of.
                 medVars          = c("deathIncrease", "hospitalizedCurrently",
                                      "inIcuCurrently", "onVentilatorCurrently"),

                 ## Outputs
                 resultsDir    = "./results",
                 txFile        = "mwra-covid-transcript.txt",
                 jointDataFile = "mwra-covid-joint-data.tsv",
                 nsPlotFile    = "plot-north-south.png",
                 corrPlotFile1 = "plot-med-loads-vs-RNA-1.png",
                 corrPlotFile2 = "plot-med-loads-vs-RNA-2.png",
                 lagPlotFile   = "plot-RNA-%s-lags.png",
                 regPlotFile   = "plot-RNA-%s-regression.png") {

  reportStructure <- function(df) {                    # Report structure of a dataframe
    cat(sprintf("\n  - Structure:\n    o %d rows\n    o %d columns: %s",
                nrow(df), ncol(df), paste(colnames(df), collapse = ", ")))
  }                                                    # Basically shape + column names

  isNonNegativeIntOrNA <- function(x) { is.na(x) | (is.integer(x) & x >= 0) }

  loadMWRAData <- function(dataDir, mwraDataFile) {    # Load the MWRA's metagenomic data
    f  <- file.path(dataDir, mwraDataFile)             # Painfully hand-extracted from a PDF
    cat(sprintf("* Reading MWRA wastewater RNA data from %s", f))
    df <- transform(read.table(f, sep = "\t", header = TRUE, comment.char = "#"),
                    Sample.Date = as.Date(as.character(Sample.Date), format = "%m/%d/%Y"))
    colnames(df)[1:11] <- c("Date", "South", "South.LCL", "South.UCL",
                            "North", "North.LCL", "North.UCL",
                            "South.7", "North.7", "North.Variant", "South.Variant")

    stopifnot(all(isNonNegativeIntOrNA(df$"South")))   # Always sanity-check the data!
    stopifnot(all(isNonNegativeIntOrNA(df$"South.LCL")))
    stopifnot(all(isNonNegativeIntOrNA(df$"South.UCL")))

    stopifnot(all(isNonNegativeIntOrNA(df$"North")))   # Because not everybody is sane.
    stopifnot(all(isNonNegativeIntOrNA(df$"North.LCL")))
    stopifnot(all(isNonNegativeIntOrNA(df$"North.UCL")))

    stopifnot(all(isNonNegativeIntOrNA(df$"North.7"))) # At leaast, not sane all the time.
    stopifnot(all(isNonNegativeIntOrNA(df$"North.7"))) #

    ## *** Could also check that LCL < val < UCL?  (False; I don't understand their uncertainties!)

    reportStructure(df)                                # See what fish we caught
    df                                                 # Return the data
  }                                                    #

  loadCOVIDData <- function(dataDir, covidDataFile) {  #
    f  <- file.path(dataDir, covidDataFile)            # Where the data lives
    cat(sprintf("\n\n* Reading Mass COVID data from %s", f))
    df <- transform(read.table(f, sep = ",", header = TRUE),
                    date = as.Date(as.character(date), format = "%Y-%m-%d"))
    colnames(df)[[1]] <- "Date"                        # Canonicalize capitalization
    df <- df[order(df$"Date"), ]                       # Sort by date
    stopifnot(all(diff(df$"Date") == 1))               # Check no missing, i.e., date incrs by 1
    empties <- c("state", names(which(sapply(df, function(c) { all(is.na(c)) }))))
    cat(sprintf("\n  - Dropping %d empty columns (and state): %s",
                length(empties), paste(empties, collapse = ", ")))
    df <- subset(df, select = setdiff(colnames(df), c(empties)))

    reportStructure(df)                                # See what we caught
    df                                                 # Return the data
  }                                                    #

  makeJointData <- function(mwraData, covidData, resultsDir, jointDataFile) {
    cat("\n\n* Constructing joint dataset by inner join on dates")
    df <- merge(mwraData, covidData, by = "Date", all = FALSE)
    df <- df[order(df$"Date"), ]                       # Sort it by date

    f  <- file.path(resultsDir, jointDataFile)         # Save it away for peer review
    saveDataframe(df, f)                               #
    cat(sprintf("\n  - Saved to %s", f))               #

    reportStructure(df)                                # See what we caught
    cat("\n")                                          #
    df                                                 # Return the data
  }                                                    #

  plotNorthSouth <- function(jointData, resultsDir, nsPlotFile) {
    jointData <- subset(jointData, select = c(Date, North, South))
    jointData <- subset(jointData, subset = complete.cases(jointData))
    f <- file.path(resultsDir, nsPlotFile)             #
    withPNG(f, 850, 425, FALSE, function() {           #
      withPars(function() {                            #
        rnaCols  <- c("North" = "blue", "South" = "gray")
        matplot(x = jointData$"Date",                  # North & south RNA vs time
                y = subset(jointData, select = names(rnaCols)),
                type = "p", pch = 21, col = "black", bg = rnaCols, log = "y",
                xaxt = "n", xlab = NA, ylab = "RNA (copies/ml, log scale)",
                main = "RNA Levels vs Time")           #
        axis.Date(1,                                   #
                  at     = seq(from = floor_date(min(jointData$"Date"), "month"),
                               to   = ceiling_date(max(jointData$"Date"), "month"),
                               by   = "month"),        # Kind of miraculous this works at all
                  format = "%Y-%m-%d")                 #
        legend("topleft", bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.bg = rnaCols, pt.cex = 1.5, legend = names(rnaCols))

        jointRange <- c(5, max(jointData$"North", jointData$"South", na.rm = TRUE))
        scatterplotWithDensities(xs = jointData$"South", ys = jointData$"North",
                                 bgs = "steelblue", log = "xy",
                                 regressionColor = NULL,# doesn't work on log scale
                                 xlab = "South RNA (copies/ml, log scale)",
                                 ylab = "North RNA (copies/ml, log scale)",
                                 xlim = jointRange, ylim = jointRange,
                                 main = as.expression(bquote(bold(paste(
                                     "North/South Correlation: ",
                                     bolditalic(R)^2 == .(
                                       sprintf("%.0f", #
                                               100.0 * cor(jointData$"North",
                                                           jointData$"South")^2)),
                                     "%")))))          #

        title(main = "MWRA Wastewater SARS-CoV2 RNA: North vs South", outer = TRUE)

      }, pty   = "m",                                  # Maximal plotting area
         bg    = "white",                              # Background
         mar   = c(7, 4, 2, 1),                        # Margins (e.g., to hold date labels)
         mgp   = c(3.00, 0.5, 0),                      # Axis title, label, tick
         mfrow = c(1, 2),                              # 1x2 array of plots
         oma   = c(0, 0, 1, 0),                        # Make room at top for overall title
         ps    = 16,                                   # Larget type size for file capture
         las   = 2)                                    # Labels perpendicular to axes
    })                                                 # End file capture
    cat(sprintf("* Plot of north vs south RNA to %s\n", f))
    TRUE                                               # Flag that it was done
  }                                                    #

  makePredictionSet <- function(jointData, medNames) { # Average RNA and collect with medical vars
    cat(sprintf("* Making prediction set:"))           #
    cat(sprintf("\n  - Using %d medical vars from COVID Tracking Project: %s",
                length(medNames), paste(medNames, collapse = ", ")))
    cat(sprintf("\n  - Averaging North & South RNA daily measurements"))
    predictionSet <- subset(transform(jointData, RNA = (North + South) / 2.0),
                            select = c("Date", "RNA", medNames))#
    cat(sprintf("\n  - Result: %d rows x %d columns\n", nrow(predictionSet), ncol(predictionSet)))
    stopifnot(all(diff(predictionSet$"Date") == 1))    # NB: not all rows have complete data
    predictionSet                                      #
  }                                                    #

  plotCorrelations <- function(predictionSet, medVars, resultsDir, corrPlotFile1, corrPlotFile2) {

    timeFile <- file.path(resultsDir, corrPlotFile1)   #
    withPNG(timeFile, 600, 600, FALSE, function() {    #
      withPars(function() {                            #
        matplot(x = predictionSet$"Date",              #
                ## *** Z-scoring is a bit of a hack here, making the values harder to
                ## interpret.  But it DOES get them all on the same scale so we can see
                ## the structure in the plot.  If there were only 2 vars, I'd do a second
                ## y axis on the right; but as there are 5...
                y = scale(as.matrix(predictionSet[, c("RNA", medVars)])),
                xaxt = "n", xlab = NA, ylab = "Z-scored RNA & med vars",
                main = "RNA & Medical Vars vs Time",  #
                pch = 21, col = "black", bg = 1 : (length(medVars) + 1))
        axis.Date(1,                                   #
                  at     = seq(from = floor_date(min(jointData$"Date"), "month"),
                               to   = ceiling_date(max(jointData$"Date"), "month"),
                               by   = "month"),        # Kind of miraculous this works at all
                  format = "%Y-%m-%d")                 #
        legend("top", , bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.bg = 1 : (length(medVars) + 1), legend = c("RNA", medVars))
      }, pty   = "m",                                  # Maximal plotting area
         bg    = "white",                              # Background
         mar   = c(7, 3, 2, 1),                        # Margins (e.g., to hold date labels)
         mgp   = c(1.75, 0.5, 0),                      # Axis title, label, tick
         ps    = 16,                                   # Larget type size for file capture
         las   = 2)                                    # Labels perpendicular to axes
    })                                                 #
    cat(sprintf("* Correlation time courses plotted to %s", timeFile))

    chartFile <- file.path(resultsDir, corrPlotFile2)  #
    withPNG(chartFile, 600, 600, FALSE, function() {   #
      chart.Correlation(subset(predictionSet, select = -Date), histogram = TRUE, pch = 19)
    })                                                 #
    cat(sprintf("\n* Correlation chart plotted to %s\n", chartFile))

    TRUE                                               # Flag that it has been done
  }                                                    #

  lagVector <- function(x, k) {                        # Put k NA's @ front, drop last k values
    if (k < 0)                                         # Don't be silly
      stop(sprintf("lagVector() can't handle negative k = %d?!", k))
    else if (k > length(x))                            # Really: don't be silly
      stop(sprintf("lagVector() can't handle k = %d, > length of vector %d?!", k, length(x)))
    else if (k == 0)                                   # Ok, this is only a LITTLE silly
      x                                                #  lag of 0 means no change
    else                                               # Otherwise reasonable lag: put k NA's on
      c(rep(NA, k), head(x, -k))                       #  the front, drop the last k elements
  }                                                    #

  lmp <- function (mdl) { anova(mdl)$"Pr(>F)"[[1]] }   # Why isn't this cached in the model?!

  laggedRegressions <- function(predictionSet, depVar, indepVar, lags) {

    ldply(lags, function(lag) {                        # For each lag, construct dataset with
      mdl <- lm(as.formula(sprintf("%s ~ %s", depVar, "indepVar.lag")),
                data = transform(predictionSet,        #  RNA lagged, extract p-value and adj R2
                                 indepVar.lag = lagVector(predictionSet[, indepVar], lag)))
      data.frame(MedVar = depVar, Lag = lag, p = lmp(mdl), Adj.R2 = summary(mdl)$"adj.r.squared")
    })                                                 # We'll use this to find the best lags
  }                                                    #  for each medical load variable

  plotLaggedRegressions <- function(regressionLags, resultsDir, lagPlotFile) {
    cat(sprintf("\n* Scatterplotting significance & strength vs RNA lag"))
    ddply(regressionLags, "MedVar", function(mvdf) {   #
      f <- file.path(resultsDir, sprintf(lagPlotFile, as.character(mvdf[1, "MedVar"])))

      withPNG(f, 400, 400, FALSE, function() {
        withPars(function() {                          # Plot -log10(p) and Adj R2 (different y axes)
          plot(x = mvdf$"Lag", y = jitter(-log10(mvdf$"p")),
               pch = 21, col = "black", bg = "black", xlab = "Lag", ylab = "-log10(p)",
               main = sprintf("%s: Effect of Lag", as.character(mvdf[1, "MedVar"])))
          par(new = TRUE)                              # "as if for a new plot"... sheesh
          plot(x = mvdf$"Lag", y = mvdf$"Adj.R2",      # Other y axis (different scale)
               pch = 21, col = "blue", bg = "blue", ylim = range(mvdf$"Adj.R2"),
               xaxt = "n", yaxt = "n", xlab = NA, ylab = NA, main = NA)
          axis(4, col = "blue", col.ticks = "blue", col.axis = "blue")
          mtext("Adjusted R2", side = 4, col = "blue", line = 2)
        }, pty   = "m",                                # Maximal plotting area
           bg    = "white",                            # Background
           mar   = c(3, 3, 2, 3),                      # Margins (e.g., to hold date labels)
           mgp   = c(1.7, 0.5, 0),                     # Axis title, label, tick
           ps    = 16)                                 # Larget type size for file capture
      })

      cat(sprintf("\n  - %s", f))                      #
      NULL                                             #
    })                                                 #
    cat("\n")                                          #

    TRUE                                               #
  }                                                    #

  findOptimalLags <- function(regressionLags) {        # Find best by p-value (same as R^2)
    cat("\n* Optimal lags for each medical variable:\n")
    optimalLags <- ddply(regressionLags, "MedVar", function(df) {
      minp <- min(df$"p")                              #
      subset(df, subset = p == minp)                   #
    })                                                 #
    print(optimalLags)                                 #
    optimalLags                                        #
  }                                                    #

  finalRegressions <- function(optimalLags, predictionSet, resultsDir, regPlotFile) {
    cat("* Trying some regressions at the optimal lag for each variable:")
    ddply(optimalLags, "MedVar", function(df) {        #
      mv  <- as.character(df[1, "MedVar"])             #
      lag <- df[1, "Lag"]                              #
      cat(sprintf("\n  - Regressing %s on RNA at lag %d days:", mv, lag))

      mdl <- lm(as.formula(sprintf("%s ~ RNA", mv)),  #
                data = transform(predictionSet, RNA = lagVector(predictionSet[, "RNA"], lag)))

      print(summary(mdl))                              #
      print(confint(mdl))                              #
      p      <- lmp(mdl)                               #
      adj.R2 <- summary(mdl)$"adj.r.squared"           #

      f <- file.path(resultsDir, sprintf(regPlotFile, mv))
      withPNG(f, 400, 400, FALSE, function() {         #
        withPars(function() {                          #
          ## Confidence intervals: 95% ci of mean at that input
          ## Prediction intervals: 95% ci of single prediction at that input
          ## PI is always wider than CI, for same reason that sd is wider than se of mean by sqrt(N)
          RNARange      <- range(predictionSet$"RNA", na.rm = TRUE)
          predictFrom   <- data.frame("RNA" = seq(from = RNARange[[1]], to = RNARange[[2]],
                                                  length.out = 100))
          mdlPredictsCI <- cbind(predictFrom, predict(mdl, newdata = predictFrom,
                                                      interval = "confidence"))
          mdlPredictsPI <- cbind(predictFrom, predict(mdl, newdata = predictFrom,
                                                      interval = "prediction"))

          plot(x = lagVector(predictionSet$"RNA", lag), y = predictionSet[, mv],
               pch = 21, bg = "blue",                  #
               xlab = sprintf("RNA (copies/ml, %d days lag)", lag), ylab = mv,
               main = sprintf("%s vs RNA", mv))        #
          mtext(as.expression(bquote(                  # Report regression stats at bottom
                     paste(italic(p) %~% .(scientificExpression(p, places = 1)), ", adjusted ",
                           italic(R)^2 %~% .(sprintf("%.1f%%", 100.0 * adj.R2)))
                )), side = 1, line = 3.2)              #
          abline(reg = mdl, col = "black", lwd = 2)    #

          lightBlue   <- rgb(0, 0, 1, alpha = 0.2)     # Confidence interval of mean in light color
          polygon(x = c(mdlPredictsCI[,"RNA"], rev(mdlPredictsCI[, "RNA"])),
                  y = c(mdlPredictsCI[, "lwr"], rev(mdlPredictsCI[, "upr"])),
                  col = lightBlue, border = NA)        #

          lighterBlue <- rgb(0, 0, 1, alpha = 0.1)     # Prediction interval in even lighter color
          polygon(x = c(mdlPredictsPI[,"RNA"], rev(mdlPredictsPI[, "RNA"])),
                  y = c(mdlPredictsPI[, "lwr"], rev(mdlPredictsPI[, "upr"])),
                  col = lighterBlue, border = NA)      #

        }, pty   = "m",                                # Maximal plotting area
           bg    = "white",                            # Background
           mar   = c(4, 3, 2, 1),                      # Margins (e.g., to hold date labels)
           mgp   = c(1.7, 0.5, 0),                     # Axis title, label, tick
           ps    = 16)                                 # Larger type size for file capture
      })                                               #
      cat(sprintf("\n    o Plot to %s", f))            #

      NULL                                             # Return nothing of interest for ddply()
    })                                                 #
    cat("\n")                                          #

    TRUE                                               # Flag that it's been done
  }                                                    #

  ## Main body of script begins here
  withTranscript(dataDir, resultsDir, txFile, "MWRA COVID Analysis", function() {

    heraldPhase("Archival")                            # For peer review
    archiveAnalysisScript(resultsDir, "./mwra-covid-2.r")

    heraldPhase("Loading datasets and constructing joint dataset")
    ## *** NB: the confidence limits make no sense; they don't bracket the value itself?!
    maybeAssign("mwraData",  function() { loadMWRAData(dataDir, mwraDataFile)   })
    ## *** NB: COVID Tracking Project stopped collecting data March 2021, when federal
    ##     government started working again.
    maybeAssign("covidData", function() { loadCOVIDData(dataDir, covidDataFile) })
    maybeAssign("jointData", function() {              # Assemble via inner join on dates
      makeJointData(mwraData, covidData, resultsDir, jointDataFile)
    })                                                 #

    heraldPhase("Exploratory plots")                   # See the general shape of the data
    maybeAssign("nsPlotDone",  function() { plotNorthSouth(jointData, resultsDir, nsPlotFile) })

    heraldPhase("Prediction set")                      #
    maybeAssign("predictionSet", function() { makePredictionSet(jointData, medVars) })

    heraldPhase("Correlation plots")                   #
    maybeAssign("corrPlotsDone", function() {          #
      plotCorrelations(predictionSet, medVars, resultsDir, corrPlotFile1, corrPlotFile2)
    })                                                 #

    heraldPhase("Lagged regressions")                  #
    ## *** NB: The right way to do this is with an ARIMA time series model.  I'm being
    ## lazy here, examining univariate prediction from RNA, with various lags.  This is
    ## also not the right way as far as multiple hypothesis test correction (22 lags
    ## checked), and of course there's no crossvalidation since we only have 2 real waves in MA.
    maybeAssign("regressionLags", function() {         #
      cat(sprintf("* Regressing medical vars on RNA at various lags to test predictive power"))
      rbind(laggedRegressions(predictionSet, "hospitalizedCurrently", "RNA", 0:21),
            laggedRegressions(predictionSet, "inIcuCurrently",        "RNA", 0:21),
            laggedRegressions(predictionSet, "onVentilatorCurrently", "RNA", 0:21),
            laggedRegressions(predictionSet, "deathIncrease",         "RNA", 0:21))
    })                                                 #
    maybeAssign("lrPlotsDone", function() {            #
      plotLaggedRegressions(regressionLags, resultsDir, lagPlotFile)
    })                                                 #
    maybeAssign("optimalLags", function() { findOptimalLags(regressionLags) })

    heraldPhase("Final regressions")                   #
    maybeAssign("finalRegressionsDone", function() {   #
      finalRegressions(optimalLags, predictionSet, resultsDir, regPlotFile)
    })                                                 #

  })                                                   # End of transcript capture
}                                                      #
