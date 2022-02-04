## Created on Friday, January 28, 2022 at 6:08pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2022, SomeWeekendReading.blog.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              #
source(file.path(toolsDir, "pipeline-tools.r"))        #
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks

library("lubridate")                                   # For floor_date(), ceiling_date()
library("PerformanceAnalytics")                        # For chart.Correlation()
library("plyr")                                        # For ddply()

##
## Research question: Does the MWRA's metagenomic measurement of SARS-COV-2 RNA in
## wastewater predict later hospitalization or death rates or positive test rates?
##
## Hypotheses: hospitalization & death rates might work; positive test rates probably
## won't, due to changes in test availability, test type, and testing policy.
##
## Did not consider test positivity rates, since testing has changed from basically unavailable
## to somewhat available, and the reporting has been spotty enough to make the numbers useless.
##
## Should consider forcing intercept to 0 in linear models, for 0 COVID deaths when there's
## 0 SARS-CoV2 RNA present.  Might improve some of the fits, from the look of it.
##
## This time we're using US county-level data from the New York Times (updated daily?):
##   https://github.com/nytimes/covid-19-data
##   The file we want is us-counties.csv, at top level.
##
## See also the covdata package, which incorporates several data sources (now out of date):
##   https://kjhealy.github.io/covdata/
##
## CDC on wastewater surveillance:
##   https://twitter.com/CDCgov/status/1436074326437019651
##   https://www.cdc.gov/mmwr/volumes/70/wr/mm7036a2.htm?s_cid=mm7036a2_w
##   https://www.cdc.gov/mmwr/volumes/70/wr/pdfs/mm7036a2-H.pdf
##
## Biobot.io suggests:
##   https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/
##
## MWRA on viral RNA levels in wastewater:
##   https://www.mwra.com/biobot/biobotdata.htm
##
## But going to biobot.io finds this repository:
##   https://github.com/biobotanalytics/covid19-wastewater-data
##
##   See: wastewater_by_county.csv and cases_by_county.csv
##
##   However, it doesn't contain data for Norfolk county MA, and has very different
##   numbers (hence the use of the word "normalized"?).  I don't understand it, so I'm
##   going to stick with the direct-from-the-MWRA data.
##
## Getting the MWRA data out of PDF hell (latest was MWRAData20220128-data.pdf):
##
## - Just pasting it into a text file or even a spreadsheet is a bit of a nightmare, where the
##   values never QUITE go where you want.
## - We used the method in https://productivityspot.com/convert-pdf-to-google-sheets/:
##   o Download the MWRA PDF file to our local machine, then upload to Google Drive.
##   o In Google Drive, open the PDF file with Google Docs (not a PDF viewer).
##   o Select the table (not the whole document, which has header lines &c).  E.g., click
##     on topmost, leftmost cell then command-click (control-click) on the bottommost, rightmost
##     cell at the bottom of the file.  Then copy.
##   o Open a new Google Sheets spreadsheet, select A1, and paste.
##   o Download it as a .tsv file, spot-check against the .pdf, then gzip compress it.
## No idea why that works whereas copying from PDF preview to any other spreadsheet just
## gives chaos.  Possibly because it's seamless Google tools from end to end?
##
## Anyway, spot-checking the result against the original confirms that it's likely right, at
## least in the 20-30 places we checked.
##

doit <- function(## Inputs
                 dataDir          = "./data",
                 ## *** NB: On 2021-01-25, the South RNA was 3772, which looks like an
                 ##     outlier, even after averaging with the North.
                 mwraDataFile     = "MWRAData20220201-data.tsv.gz",
                 covidDataFile    = "us-counties.csv.gz",
                 state            = "Massachusetts",
                 counties         = c("Suffolk", "Middlesex", "Norfolk"),

                 ## Outputs
                 resultsDir    = "./results",
                 txFile        = "mwra-covid-transcript.txt",
                 jointDataFile = "mwra-covid-joint-data.tsv",
                 nsPlotFile    = "plot-north-south.png",
                 predSetFile   = "mwra-covid-joint-data-prediction-set.tsv",
                 corrPlotFile1 = "plot-med-loads-vs-RNA-1.png",
                 corrPlotFile2 = "plot-med-loads-vs-RNA-2.png",
                 lagPlotFile   = "plot-RNA-%s-lags.png",
                 regPlotFile   = "plot-RNA-%s-regression.png",
                 regStatsFile  = "finalRegressionsTable.tsv") {

  reportStructure <- function(df) {                    # Report structure of a dataframe
    cat(sprintf("\n  - Structure:\n    o %d rows\n    o %d columns: %s\n",
                nrow(df), ncol(df), paste(colnames(df), collapse = ", ")))
    showDataframeHeadTail(df)                          # Show first few & last few rows
  }                                                    # Basically shape + column names

  isNonNegativeIntOrNA <- function(x) { is.na(x) | (is.integer(x) & x >= 0) }

  loadCOVIDData <- function(dataDir, covidDataFile, theState, counties) {
    f  <- file.path(dataDir, covidDataFile)            # Where the data lives
    cat(sprintf("* Reading US county-level COVID data from %s", f))
    covidData <- transform(subset(loadCompressedDataframe(f, sep = ",", header = TRUE, quote = ""),
                                  subset = state == theState & county %in% counties),
                           date   = as.Date(as.character(date), format = "%Y-%m-%d"),
                           county = factor(county))    # Drop unused levels
    covidData <- covidData[order(covidData$"date"), ]  # Sort by date; insist dates increment by 1
    ddply(covidData, "county", function(cdf) { stopifnot(all(diff(cdf$"date") == 1)); NULL })

    empties <- c("state", "fips", names(which(sapply(covidData, function(c) { all(is.na(c)) }))))
    cat(sprintf("\n  - Dropping %d columns for being empty or for being state & fips: %s",
                length(empties), paste(empties, collapse = ", ")))
    covidData <- subset(covidData, select = setdiff(colnames(covidData), c(empties)))

    stopifnot(colnames(covidData) == c("date", "county", "cases", "deaths"))
    colnames(covidData) <- c("Date", "County", "Cases", "Deaths")

    ## Sanity check, because not everybody is sane.  At least, not all the time
    stopifnot(all(isNonNegativeIntOrNA(covidData$"Cases")))
    stopifnot(all(isNonNegativeIntOrNA(covidData$"Deaths")))

    cat(sprintf("\n  - Differentiating cumulative cases & deaths to get daily increments"))
    covidData <- ddply(covidData, "County", function(cdf) {
      cbind(cdf,                                       # Initial value from cumulant, diff after
            data.frame(Cases.New  = c(cdf[1, "Cases"],  diff(cdf$"Cases")),
                       Deaths.New = c(cdf[1, "Deaths"], diff(cdf$"Deaths"))))
    })                                                 #

    reportStructure(covidData)                         # See what we caught
    covidData                                          # Return the data
  }                                                    #

  loadMWRAData <- function(dataDir, mwraDataFile) {    # Load the MWRA's metagenomic data
    f  <- file.path(dataDir, mwraDataFile)             # Painfully hand-extracted from a PDF
    cat(sprintf("\n* Reading MWRA wastewater RNA data from %s", f))
    mwraData <- transform(loadCompressedDataframe(f, sep = "\t", header = TRUE,
                                                  na.strings = c("ND", "")),
                          Sample.Date = as.Date(as.character(Sample.Date), format = "%m/%d/%Y"))
    colnames(mwraData)[1:11] <- c("Date", "South", "North", "South.7", "North.7",
                                  "South.LCL", "South.UCL", "North.LCL", "North.UCL",
                                  "South.Variant", "North.Variant")

    ## *** UCL & LCL columns make no sense: they don't bracket the data or its 7 day average?
    mwraData <- subset(mwraData,                       # Drop cols we don't understand & can't use
                       select = -c(South.Variant, North.Variant,
                                   South.LCL,     North.LCL,
                                   South.UCL,     North.UCL))
    stopifnot(colnames(mwraData) == c("Date", "South", "North", "South.7", "North.7"))

    mwraData <- subset(mwraData,                       # Keep only rows w/ at least 1 datum
                       subset = !is.na(South) | !is.na(North) | !is.na(South.7) | !is.na(North.7))

    ## Sanity check, because not everybody is sane.  At least, not all the time
    stopifnot(all(isNonNegativeIntOrNA(mwraData$"South")))
    stopifnot(all(isNonNegativeIntOrNA(mwraData$"North")))
    stopifnot(all(isNonNegativeIntOrNA(mwraData$"South.7")))
    stopifnot(all(isNonNegativeIntOrNA(mwraData$"North.7")))
    ## stopifnot(all(diff(mwraData$"Date") == 1))         # Missing data 2020-05-12 thru 2020-05-20

    reportStructure(mwraData)                          # See what fish we caught
    mwraData                                           # Return the data
  }                                                    #

  makeJointData <- function(mwraData, covidData, resultsDir, jointDataFile) {
    ## NB: MWRA data is copied for each county in this slightly crazy representation!
    cat("\n\n* Constructing joint dataset by inner join on dates")
    jointData <- merge(mwraData, covidData, by = "Date", all = FALSE)
    jointData <- jointData[order(jointData$"Date"), ]  # Sort it by date

    f  <- file.path(resultsDir, jointDataFile)         # Save it away for peer review
    saveDataframe(jointData, f)                        #
    cat(sprintf("\n  - Saved to %s", f))               #

    reportStructure(jointData)                         # See what we caught
    cat("\n")                                          #
    jointData                                          # Return the data
  }                                                    #

  plotNorthSouth <- function(jointData, resultsDir, nsPlotFile) {
    jointData <- unique(subset(jointData, select = c(Date, North, South)))
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
                               by   = "2 months"),     # Kind of miraculous this works at all
                  format = "%Y-%b-%d")                 #  it's really seq.Date()
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
                                       sprintf("%.0f%%",
                                               100.0 * cor(jointData$"North",
                                                           jointData$"South")^2)))))))

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

  makePredictionSet <- function(jointData, resultsDir, predSetFile) {
    cat(sprintf("* Making prediction set:"))           # Data used in regressions (with lags)

    cat(sprintf("\n  - Averaging North and South daily mRNA measurements"))
    rnaData <- subset(transform(unique(subset(jointData, select = c(Date, South, North))),
                                RNA = ifelse(is.na(South),
                                             North,    #
                                             ifelse(is.na(North),
                                                    South,
                                                    (South + North) / 2.0))),
                      select = c(Date, RNA))           #

    cat(sprintf("\n  - For each day, summing cases and deaths over counties"))
    medData <- ddply(unique(subset(jointData, select = c(Date, County, Cases.New, Deaths.New))),
                     "Date",                           #
                     function(ddf) {                   #
                       data.frame(Cases = sum(ddf$"Cases.New"), Deaths = sum(ddf$"Deaths.New"))
                     })                                #

    cat(sprintf("\n  - Outer joining RNA data and medical data"))
    predictionSet <- merge(rnaData, medData, by = "Date", all = TRUE)
#    stopifnot(all(diff(predictionSet$"Date") == 1))    # Missing data 2021-May-12 thru 2021-May-20
    reportStructure(predictionSet)                     #

    f <- file.path(resultsDir, predSetFile)            # Save results for peer review
    saveDataframe(predictionSet, f)                    #
    cat(sprintf("\n  - Saved to %s.\n", f))            #

    predictionSet                                      # Return the prediction set
  }                                                    #

  plotCorrelations <- function(predictionSet, resultsDir, corrPlotFile1, corrPlotFile2) {

    timeFile <- file.path(resultsDir, corrPlotFile1)   #
    withPNG(timeFile, 600, 600, FALSE, function() {    #
      withPars(function() {                            #
        matplot(x = predictionSet$"Date",              #
                ## *** Z-scoring is a bit of a hack here, making the values harder to
                ## interpret.  But it DOES get them all on the same scale so we can see
                ## the structure in the plot.  If there were only 2 vars, I'd do a second
                ## y axis on the right; but as there are 5...
                y = scale(as.matrix(predictionSet[, c("RNA", "Cases", "Deaths")])),
                xaxt = "n", xlab = NA, ylab = "Z-scored RNA & med vars",
                main = "RNA & Medical Vars vs Time",  #
                pch = 21, col = "black", bg = 1 : (2 + 1))
        axis.Date(1,                                   # *** Get dates to print more regularly?
                  at     = seq(from = floor_date(min(jointData$"Date"), "month"),
                               to   = ceiling_date(max(jointData$"Date"), "month"),
                               by   = "month"),        # Kind of miraculous this works at all
                  format = "%Y-%b-%d")                 #
        legend("top", , bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.bg = 1 : (2 + 1), legend = c("RNA", "Cases", "Deaths"))
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

  plotLaggedRegressions <- function(waveName, regressionLags, resultsDir, lagPlotFile) {
    cat(sprintf("\n* Scatterplotting significance & strength vs RNA lag"))
    ddply(regressionLags, "MedVar", function(mvdf) {   #
      f <- file.path(resultsDir, sprintf(lagPlotFile, as.character(mvdf[1, "MedVar"])))

      withPNG(f, 400, 400, FALSE, function() {
        withPars(function() {                          # Plot -log10(p) & Adj R2 (diff y axes)
          plot(x = mvdf$"Lag", y = jitter(-log10(mvdf$"p")),
               pch = 21, col = "black", bg = "black", xlab = "Lag", ylab = "-log10(p)",
               main = sprintf("%s %s: Effect of Lag", waveName, as.character(mvdf[1, "MedVar"])))
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

  finalRegressions <- function(waveName, optimalLags, predictionSet, resultsDir, regPlotFile) {
    cat("* Trying some regressions at the optimal lag for each variable:")
    ddply(optimalLags, "MedVar", function(df) {        #
      mv  <- as.character(df[1, "MedVar"])             #
      lag <- df[1, "Lag"]                              #
      cat(sprintf("\n  - Regressing %s on RNA at lag %d days:", mv, lag))

      mdl <- lm(as.formula(sprintf("%s ~ RNA", mv)),  #
                data = transform(predictionSet, RNA = lagVector(predictionSet[, "RNA"], lag)))
      mdlSum <- summary(mdl)
      mdlCI  <- confint(mdl)
      print(summary(mdl))                              #
      print(mdlCI)                                     #

      p      <- lmp(mdl)                               #
      adj.R2 <- summary(mdl)$"adj.r.squared"           #

      f <- file.path(resultsDir, sprintf(regPlotFile, mv))
      withPNG(f, 400, 400, FALSE, function() {         #
        withPars(function() {                          #
          ## Confidence intervals: 95% ci of mean at that input
          ## Prediction intervals: 95% ci of single prediction at that input
          ## PI always wider than CI, for same reason that sd is wider than se of mean by sqrt(N)
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
               main = sprintf("%s %s vs RNA", waveName, mv))
          mtext(as.expression(bquote(                  # Report regression stats at bottom
                     paste(italic(p) %~% .(scientificExpression(p, places = 1)), ", adjusted ",
                           italic(R)^2 %~% .(sprintf("%.1f%%", 100.0 * adj.R2)))
                )), side = 1, line = 3.2)              #
          abline(reg = mdl, col = "black", lwd = 2)    #

          lightBlue   <- rgb(0, 0, 1, alpha = 0.2)     # Conf interval of mean in light color
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
      cat(sprintf("\n    o Plot to %s\n", f))          #

      data.frame(MedVar      = mv,
                 Wave        = waveName,
                 Lag.Days    = lag,
                 p           = signif(p, digits = 2),
                 AdjR2Pct    = signif(100.0 * adj.R2, digits = 1),
                 Intercept   = signif(coef(mdl)[["(Intercept)"]], digits = 2),
                 InterceptCL = sprintf("%+.2f - %+.2f",
                                       mdlCI["(Intercept)", "2.5 %"], mdlCI["(Intercept)", "97.5 %"]),
                 Slope       = signif(coef(mdl)[["RNA"]], digits = 2),
                 SlopeCL     = sprintf("%+.2f - %+.2f",
                                       mdlCI["RNA", "2.5 %"], mdlCI["RNA", "97.5 %"]))
    })                                                 #
  }                                                    #

  ## Main body of script begins here
  withTranscript(dataDir, resultsDir, txFile, "MWRA COVID Analysis", function() {

    heraldPhase("Archival")                            # For peer review
    archiveAnalysisScript(resultsDir, "./mwra-covid-3.r")

    heraldPhase("Loading datasets and constructing joint dataset")
    maybeAssign("covidData", function() { loadCOVIDData(dataDir, covidDataFile, state, counties) })
    maybeAssign("mwraData",  function() { loadMWRAData(dataDir, mwraDataFile)   })
    maybeAssign("jointData", function() {              # Assemble via inner join on dates
      makeJointData(mwraData, covidData, resultsDir, jointDataFile)
    })                                                 #

    heraldPhase("Exploratory plots")                   # See the general shape of the data
    maybeAssign("nsPlotDone",  function() { plotNorthSouth(jointData, resultsDir, nsPlotFile) })

    heraldPhase("Prediction set")                      # Make dataset used by regressions: average
    maybeAssign("predictionSet", function() {          #  RNA over north/south, sum deaths/cases
      makePredictionSet(jointData, resultsDir, predSetFile)
    })                                                 #  over counties

    heraldPhase("Correlation plots")                   #
    maybeAssign("corrPlotsDone", function() {          #
      plotCorrelations(predictionSet, resultsDir, corrPlotFile1, corrPlotFile2)
    })                                                 #

    heraldPhase("Lagged regressions")                  #
    ## *** NB: The right way to do this is with an ARIMA time series model.  I'm being
    ## lazy here, examining univariate prediction from RNA, with various lags.  This is
    ## also not the right way as far as multiple hypothesis test correction (22 lags
    ## checked), and of course there's no crossvalidation since we only have 2 real waves in MA.
    maybeAssign("regressionLags", function() {         #
      cat(sprintf("* Regressing medical vars on RNA at various lags to test predictive power"))
      rbind(laggedRegressions(predictionSet, "Cases",  "RNA", 0:21),
            laggedRegressions(predictionSet, "Deaths", "RNA", 0:21))
    })                                                 #
    maybeAssign("lrPlotsDone", function() {            #
      plotLaggedRegressions("All", regressionLags, resultsDir, lagPlotFile)
    })                                                 #
    maybeAssign("optimalLags", function() { findOptimalLags(regressionLags) })

    heraldPhase("Final regressions")                   #
    maybeAssign("finalRegressionsTable", function() {  #
      finalRegressions("All", optimalLags, predictionSet, resultsDir, regPlotFile)
    })                                                 #
    print(finalRegressionsTable)

    ## Redo separately for each of the 3 waves:
    ## > plot(x = predictionSet$"Date", y = predictionSet$"RNA", log = "y", las = 3, xlab = "Time", ylab = "Cases")
    ##
    ## Wave1: 2020-03-01 to 2020-07-01
    ## Wave2: 2020-10-01 to 2021-06-01
    ## Wave2.5: 2021-06-01 to 2021-11-01 (Delta)
    ## Wave3: 2021-11-01 to 2022-02-01   (Omicron starts on top of Delta)
    predictionSetWave1   <<- subset(predictionSet,     #
                                    subset = "2020-03-01" <= Date & Date <= "2020-07-01")
    predictionSetWave2   <<- subset(predictionSet,     #
                                    subset = "2020-10-01" <= Date & Date <= "2021-06-01")
    predictionSetWave2.5 <<- subset(predictionSet,     #
                                    subset = "2021-06-01" <= Date & Date <= "2021-11-01")
    predictionSetWave3   <<- subset(predictionSet,     #
                                    subset = "2021-11-01" <= Date & Date <= "2022-02-01")

    doWave <- function(waveName, predictionSet) {      #
      print(waveName)                                  #
      resultsDir <- file.path(resultsDir, waveName)    #
      makeDirectory(resultsDir)                        #
      regressionLags <- rbind(laggedRegressions(predictionSet, "Cases",  "RNA", 0:21),
                              laggedRegressions(predictionSet, "Deaths", "RNA", 0:21))
      plotLaggedRegressions(waveName, regressionLags, resultsDir,
                            sprintf("%s-%s", waveName, lagPlotFile))
      optimalLags <- findOptimalLags(regressionLags)   #
      finalRegressionsTable <<- rbind(finalRegressionsTable,
                                     finalRegressions(waveName, optimalLags, predictionSet,
                                                      resultsDir, sprintf("%s-%s",
                                                                          waveName, regPlotFile)))
    }                                                  #

    doWave("Wave1",   predictionSetWave1)              #
    doWave("Wave2",   predictionSetWave2)              #
    doWave("Wave2.5", predictionSetWave2.5)            #
    doWave("Wave3",   predictionSetWave3)              #

    finalRegressionsTable <<- finalRegressionsTable[order(finalRegressionsTable$"MedVar",
                                                          finalRegressionsTable$"Wave"), ]
    saveDataframe(finalRegressionsTable, file.path(resultsDir, regStatsFile))
    print(finalRegressionsTable)                       # Capture to transcript

  })                                                   # End of transcript capture
}                                                      #
