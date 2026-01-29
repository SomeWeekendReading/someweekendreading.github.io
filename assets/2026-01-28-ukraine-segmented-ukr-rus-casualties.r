## Created on Wednesday, April 12, 2023 at 1:52pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2023, SomeWeekendReading.blog.  All rights reserved.  As if you care.

sourceTools <- function(lib) { source(file.path("~/Documents/laboratory/tools", lib)) }
sourceTools("graphics-tools.r")                        # Miscellaneous graphics hacks
sourceTools("pipeline-tools.r")                        # How to build analysis pipelines

library("PerformanceAnalytics")                        # For chart.Correlation()
library("plyr")                                        # For ldply()

##
## Look at the Russian casualty data that the Ukrainian MoD has been posting to Twitter.
##
## I could only get Twitter to take me back as far as 2023-Jan-22.  I'm almost certain
## they've been posting longer than that, but this is what Twitter is nowadays.
##
## NB: this is hypothesis FORMING research, not hypothesis TESTING.  We're just going to cast
## around for pairwise significant associations, by Pearson correlation and by regression
## (possibly transformed) with time.
##
## Some of it, frankly, is to look for artifacts that might indicate fudged data.  The incentives
## are high, and the authorities who know better are secretive.  Hence, this crude effort.
##

## To run on the whole dataset:
## > doit()
##
## To run on just the subset after day 60:
## > ukrRusCasualties <- subset(ukrRusCasualties, subset = DayNum >= 60); rm("analysisDone"); doit()
doit <- function(## Inputs
                 dataDir  = "./data",
                 dataFile = "russian-casualties-in-ukraine.tsv",

                 ## Outputs
                 resultsDir  = "./results",
                 script      = "ukr-rus-casualties.r",
                 wabFile     = "warshipsAndBoats-useless.png",
                 regressFile = "regress-%s-on-%s.png",
                 biclFile    = "bicluster.png",
                 corrFile    = "correlation-chart.png",
                 updatedData = "russian-casualties-in-ukraine-updated-%s.tsv") {

  loadAndQCData <- function(dataDir, dataFile) {       # Load the spreadsheet, check a few things

    colIsNondecreasingPositiveIntegers <- function(df, colname) {
      stopifnot(class(df[, colname]) == "integer" &&   # Are the elememnts of type integer?
                all(df[, colname] > 0)            &&   # Are they all positive?
                all(diff(df[, colname]) >= 0))         # Are they nondecreasing?
    }                                                  #

    cat(sprintf("* Loading and QCing data from spreadsheet"))

    dataPath <- file.path(dataDir, dataFile)           # Announce data source, for checking we've
    cat(sprintf("\n  - Input file: %s", dataPath))     #  got the right file on the transcript.

    ukrRusCasualties <- transform(read.table(dataPath, header = TRUE, sep = "\t"),
                                  Date = as.Date(as.character(Date), format = "%m/%d/%Y"))
    cat(sprintf("\n  - Got a %d-row dataframe of %d columns: ",
                nrow(ukrRusCasualties), ncol(ukrRusCasualties)))
    cat(sprintf("\n    %s", paste(colnames(ukrRusCasualties), collapse = ", ")))

    ukrRusCasualties <- subset(ukrRusCasualties, subset = complete.cases(ukrRusCasualties))
    cat(sprintf("\n  - %d rows had complete data", nrow(ukrRusCasualties)))

    cat(sprintf("\n  - Checking column types:"))       # Check types of columns
    ## DayNum is an integer from 1 to the number of rows.
    stopifnot(colnames(ukrRusCasualties)[[1]] == "DayNum"  &&
              class(ukrRusCasualties[, 1])    == "integer")
              ## Can't do this now that there are missing data rows
              ## && all(ukrRusCasualties$"DayNum"   == 1 : nrow(ukrRusCasualties)))
    ## Date is a sequence of Dates, ascending by exactly 1 day as we go to the next row.
    stopifnot(colnames(ukrRusCasualties)[[2]] == "Date"    &&
              class(ukrRusCasualties[, 2])    == "Date")
              ## Can't do this now that there are missing data rows
              ## && all(ukrRusCasualties$"Date"     == seq(from = ukrRusCasualties[[1, "Date"]],
              ##                                       to   = ukrRusCasualties[[nrow(ukrRusCasualties),
              ##                                                                "Date"]],
              ##                                       by   = 1)))
    cat(sprintf("\n    o DayNum and Date have appropriate sequence values"))

    ## All other rows are non-negative integers, and behavior w/time is monotone nondecreasing.
    ## (Soldiers are not, at present, resurrected from the dead.)
    sapply(colnames(ukrRusCasualties)[-(1:2)], function(colname) {
      colIsNondecreasingPositiveIntegers(ukrRusCasualties, colname)
    })                                                 #
    cat(sprintf("\n    o All other columns are nondecreasing positive integers\n"))

    ukrRusCasualties                                   # Return the data in a dataframe
  }                                                    #

  wabUseless <- function(df, resultsDir, wabFile) {    #
    f <- file.path(resultsDir, wabFile)                # Argument for removing WarshipsAndBoats
    cat(sprintf("* Summarizing argument of uselessness of WarshipsAndBoats to %s.\n", f))
    withPNG(f, 750, 375, FALSE, function() {           #
      withPars(function() {                            #
        plot(ukrRusCasualties$"DayNum", ukrRusCasualties$"WarshipsAndBoats",
             pch = 21, bg = "blue", type = "b", lty = "dashed", col = "black",
             xlab = "Day Number", ylab = "Warships/Boats",
             main = "WarshipsAndBoats is Uninformative")
      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0.0))                       #
    })                                                 #
  }                                                    #

  chartCorrelation <- function(mx, resultsDir, corrFile) {
    f <- file.path(resultsDir, corrFile)               #
    cat(sprintf("\n* Doing multivariate correlation chart to %s", f))
    withPNG(f, 1500, 1500, FALSE, function() {         #
      withPars(function() {                            # Gets some graphics param warnings?
        chart.Correlation(R = mx, histogram = TRUE, method = "pearson", pch = 19)
      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0.0))                       #
    })                                                 #
    cat("\n")                                          #
  }                                                    #

  plotCol1VsCol2 <- function(df, col1, col2, resultsDir, regressFile) {
    f <- file.path(resultsDir, sprintf(regressFile, col1, col2))
    cat(sprintf("\n* Analyzing %s vs %s", col1, col2)) #
    cat(sprintf("\n  - Regression plot to %s.", f))    #
    withPNG(f, 750, 750, FALSE, function() {           #
      withPars(function() {                            #
        ## Scatterplot with rug but no contours, and with regression line + conf/pred intervals
        mdl <- scatterplotWithDensities(xs = df[, col2], ys = df[, col1], bgs = "blue",
                                        xlab = col2, ylab = col1, kdeN = 0,
                                        main = sprintf("Russian Losses in Ukraine: %s vs %s",
                                                       col1, col2),
                                        regressionColor = "black")
        print(summary(mdl))                            #
        cat("\n")                                      #
        mdl                                            # Return the model
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # Silly bkgnd for web
         ps  = 16,                                     # Larger type size for file capture
         mar = c(3, 3, 2, 1),                          # Pull in on margins
         mgp = c(1.7, 0.5, 0.0))                       # Axis title, labels, ticks
    })                                                 # Restore params & end file capture
  }                                                    #

  correlationBicluster <- function(mx, resultsDir, biclFile, legendFrac = 0.10) {
    f <- file.path(resultsDir, biclFile)               #
    cat(sprintf("\n* Biclustering the correlation matrix to %s", f))
    withPNG(f, 750, 750, FALSE, function() {           #
      withPars(function() {                            #
        corrMx    <- cor(mx)                           # Correlation matrix of various casualty types
        corrRange <- range(corrMx)                     # Range of Pearson correlations.
        colors    <- makeSaturableHeatmapColorsBWR(256,
                                                   minObs = corrRange[[1]],
                                                   maxObs = corrRange[[2]],
                                                   minSat = corrRange[[1]]-0.01,
                                                   midSat = corrRange[[1]],
                                                   maxSat = corrRange[[2]])
        heatmap(corrMx, scale = "none", symm = TRUE, margins = c(15, 15), col = colors,
                main = "Russian Casualty Correlations", add.expr = box(which = "plot"))

        par("omd" = c(0, 1, 0, legendFrac), "pty" = "m", "mar" = c(3, 1, 1, 1), "new" = TRUE)
        maxx <- max(abs(corrRange))                    #
        image(x    = seq(from = corrRange[[1]], to = corrRange[[2]], along.with = colors),
              y    = 0,                                # Color bar legend: scale of enrichments
              z    = matrix(1 : length(colors), nrow = length(colors)),
              xlab = "Pearson Correlation", cex.axis = 0.8, mgp = c(1.7, 0.5, 0),
              xlim = c(-maxx, +maxx),                  # Show range of POSSIBLE enrichments
              col  = colors,                           # Same colors as in heatmap
              yaxt = "n", ylab = NA)                   # Irrelevant y axis & label
        ## abline(v = corrRange[[1]], lty = "solid", col= "black")# Show where colors
        ## abline(v = corrRange[[2]], lty = "solid", col= "black")#  saturate
        box(which = "plot")                            # Wrap it up in a pretty ribbon

      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 14,                                     #
         omd = c(legendFrac, 0.99, legendFrac, 0.99),  # Main title somewhat cut off
         mar = c(1, 1, 1, 1))                          #
    })                                                 #
  }                                                    #

  predict200kDay <- function(ukrRusCasualties, nCasualties, resultsDir, regressFile) {
    ## Predict day when casualties hit nCasualties (e.g., 200k)

    ## This isn't sufficient: custom xlim, and vertical line @ nCasualties
    ## plotCol1VsCol2(ukrRusCasualties, "DayNum", "Soldiers", resultsDir, regressFile)
    f <- file.path(resultsDir, sprintf(regressFile, "DayNum", "Soldiers"))
    withPNG(f, 750, 750, FALSE, function() {
      withPars(function() {
        scatterplotWithDensities(xs = ukrRusCasualties$"Soldiers",
                                 ys = ukrRusCasualties$"DayNum",
                                 bgs = "blue", xlab = "Soldiers", ylab = "DayNum",
                                 kdeN = 0, main = "Russian Losses in Ukraine: DayNum vs Soldiers",
                                 regressionColor = "black",
                                 xlim = c(min(ukrRusCasualties$"Soldiers"),
                                          max(max(ukrRusCasualties$"Soldiers"), nCasualties)))
        abline(v = nCasualties, col = "gray", lty = "dashed")
      }, pty = "m",
         bg  = "white",
         ps  = 16,
         mar = c(3, 3, 2, 1),
         mgp = c(1.7, 0.5, 0.0))})
    ## Estimate DayNum when have nCasualties with regression of DayNum on Soldiers
    mdl <- lm(DayNum ~ Soldiers, data = ukrRusCasualties)
    print(summary(mdl))
    print(transform(predict(mdl, newdata = data.frame("Soldiers" = nCasualties),
                            interval = "prediction"),
                    fit = fit + as.Date("2023-01-22"),
                    lwr = lwr + as.Date("2023-01-22"),
                    upr = upr + as.Date("2023-01-22")))
  }

  compare450kDay <- function(ukrRusCasualties, nCasualties, nDate, resultsDir, regressFile) {
    ## Plot soldiers vs time, show regression model using entire dataset, then add 1 new
    ## point at a much later date to see how the model has held up.
    f <- file.path(resultsDir, sprintf(regressFile, "DayNum450k", "Soldiers"))
    withPNG(f, 1000, 1000, FALSE, function() {         #
      withPars(function() {                            #
        minDay <- min(ukrRusCasualties$"DayNum")       # Original data + 1 much later point
        maxDay <- as.double(difftime(as.Date(nDate), min(ukrRusCasualties$"Date")), units = "days")
        scatterplotWithDensities(xs   = ukrRusCasualties$"DayNum",
                                 ys   = ukrRusCasualties$"Soldiers",
                                 bgs  = "blue", kdeN = 0,
                                 xlab = "DayNum", ylab = "Soldiers",
                                 main = "Russian Soldiers Lost in Ukraine",
                                 regressionColor = "black",
                                 xlim = c(minDay, maxDay),
                                 ylim = c(min(ukrRusCasualties$"Soldiers"),
                                          max(max(ukrRusCasualties$"Soldiers"), nCasualties)))
        points(x = maxDay, y = nCasualties, pch = 21, bg = "red")
      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0.0))                       #
    })                                                 #
  }                                                    #

  compareLateDay <- function(ukrRusCasualties, lateCasualties, fileSyllable, resultsDir, regressFile) {
    ## Plot soldiers vs time, show regression model using entire dataset, then add 2 new
    ## points @ 450k and 500k dead, to see how the model has held up.
    f <- file.path(resultsDir, sprintf(regressFile, fileSyllable, "Soldiers"))
    withPNG(f, 1000, 1000, FALSE, function() {         #
      withPars(function() {                            #
        minDay <- min(ukrRusCasualties$"DayNum")       # Original data + 1 much later point
        maxDay <- max(lateCasualties$"DayNum")         #
        scatterplotWithDensities(xs   = ukrRusCasualties$"DayNum",
                                 ys   = ukrRusCasualties$"Soldiers",
                                 bgs  = "blue", kdeN = 0,
                                 xlab = "DayNum", ylab = "Soldiers",
                                 main = "Russian Soldiers Lost in Ukraine",
                                 regressionColor = "black",
                                 xlim = c(minDay, maxDay),
                                 ylim = c(min(ukrRusCasualties$"Soldiers"),
                                          max(max(ukrRusCasualties$"Soldiers"),
                                              max(lateCasualties$"Soldiers"))),
                                 extendRange = TRUE)   #
        points(x = lateCasualties$"DayNum", y = lateCasualties$"Soldiers", pch = 21, bg = "red")
      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0.0))                       #
    })                                                 #
  }                                                    #

  ## Main body of analysis script begins here
  withTranscript(dataDir, resultsDir,                  # Capture stdout to transcript
                 sprintf("%s-transcript.txt", sub("^(.*)\\.r$", "\\1", basename(script))),
                 "Analysis of Russian Casualties in Ukraine", function() {

    heraldPhase("Archival of script and data")         # Archive data & script for peer review
    archiveAnalysisScript(resultsDir, file.path(dataDir, dataFile), file.path(".", script))

    heraldPhase("Loading and QC of data")              # Load from the hand-built spreadsheet
    maybeAssign("ukrRusCasualties", function() { loadAndQCData(dataDir, dataFile) })

    heraldPhase("Analysis of data")                    # Main analysis
    maybeAssign("analysisDone", function() {           #

      wabUseless(ukrRusCasualties, resultsDir, wabFile)# Near-constant, changes only on day 2
      mx <- as.matrix(subset(ukrRusCasualties, select = -c(DayNum, Date, WarshipsAndBoats)))
      cat("\n* Range of correlations:\n"); print(range(cor(mx)))

      ## Correlation and bicluster of reasonable columns
      chartCorrelation(mx, resultsDir, corrFile)       # Look at all pairwise correlations
      correlationBicluster(mx, resultsDir, biclFile)   # Correlation bicluster

      ## Top group: CruiseMissiles, Helicopters, MilitaryJets.  Do all pairwise correlations + time.
      mdl1 <<- plotCol1VsCol2(ukrRusCasualties, "CruiseMissiles", "Helicopters",
                              resultsDir, regressFile)
      mdl2 <<- plotCol1VsCol2(ukrRusCasualties, "CruiseMissiles", "MilitaryJets",
                              resultsDir, regressFile)
      mdl3 <<- plotCol1VsCol2(ukrRusCasualties, "Helicopters", "MilitaryJets",
                              resultsDir, regressFile)
      mdl4 <<- plotCol1VsCol2(ukrRusCasualties, "CruiseMissiles", "DayNum", resultsDir, regressFile)
      mdl5 <<- plotCol1VsCol2(ukrRusCasualties, "MilitaryJets", "DayNum", resultsDir, regressFile)
      mdl6 <<- plotCol1VsCol2(ukrRusCasualties, "Helicopters", "DayNum", resultsDir, regressFile)

      ## 2nd, larger group: so highly correlated, just do vs time
      mdl7 <<- plotCol1VsCol2(ukrRusCasualties, "Soldiers", "DayNum", resultsDir, regressFile)
      mdl8 <<- plotCol1VsCol2(ukrRusCasualties, "Tanks", "DayNum", resultsDir, regressFile)
      mdl9 <<- plotCol1VsCol2(ukrRusCasualties, "ArmoredCombatVehicles", "DayNum",
                              resultsDir, regressFile)
      mdl10 <<- plotCol1VsCol2(ukrRusCasualties, "Artillery", "DayNum", resultsDir, regressFile)
      mdl11 <<- plotCol1VsCol2(ukrRusCasualties, "MultipleLaunchRocketSystems", "DayNum",
                               resultsDir, regressFile)
      mdl12 <<- plotCol1VsCol2(ukrRusCasualties, "AirDefenceSystems", "DayNum",
                               resultsDir, regressFile)
      mdl13 <<- plotCol1VsCol2(ukrRusCasualties, "Drones", "DayNum", resultsDir, regressFile)
      mdl14 <<- plotCol1VsCol2(ukrRusCasualties, "VehiclesAndFuelTanks", "DayNum",
                               resultsDir, regressFile)
      mdl15 <<- plotCol1VsCol2(ukrRusCasualties, "SpecialEquipment", "DayNum",
                               resultsDir, regressFile)

      predict200kDay(ukrRusCasualties, 200000, resultsDir, regressFile)

      cat("\n")                                        #
      TRUE                                             # Flag that it's done
    })                                                 # End of analysis

    ## Addendum 2024-Apr-10: 450k casualties; how does that match the model?
    ## Using all the data, not just the post-day 60 data.
    ## *** Should use compareLateDay() to get uncertainties extended beyond training data?
    compare450kDay(ukrRusCasualties, 450080, "2024-04-10", resultsDir, regressFile)

    ## Addendum 2024-May-25: 500k casualties
    lateCasualties <- transform(data.frame(Date     = as.Date(c("2024-04-10", "2024-05-25")),
                                           Soldiers = c(450080,       500080)),
                                DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                             units = "days")))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum500k", resultsDir, regressFile)

    ## Addendum 2024-Aug-19: 600k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2024-08-19")),
                                                 Soldiers = c(600470)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum600k", resultsDir, regressFile)

    ## Addendum 2024-Nov-04: 700k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2024-11-04")),
                                                 Soldiers = c(700390)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum700k", resultsDir, regressFile)


    ## Addendum 2025-Jan-07: 800k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2025-01-07")),
                                                 Soldiers = c(800010)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum800k", resultsDir, regressFile)

    ## Addendum 2025-Mar-21: 900k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2025-03-21")),
                                                 Soldiers = c(900800)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum900k", resultsDir, regressFile)

    ## Addendum 2025-Jun-12: 1000k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2025-06-12")),
                                                 Soldiers = c(1000340)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum1000k", resultsDir, regressFile)

    ## Addendum 2025-Sep-22: 1100k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2025-09-20")),
                                                 Soldiers = c(1100600)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum1100k", resultsDir, regressFile)

    ## Addendum 2025-Dec-26: 1200k casualties
    lateCasualties <- rbind(lateCasualties,            #
                            transform(data.frame(Date     = as.Date(c("2025-12-26")),
                                                 Soldiers = c(1202070)),
                                      DayNum = as.integer(difftime(Date, min(ukrRusCasualties$"Date"),
                                                                   units = "days"))))
    compareLateDay(ukrRusCasualties, lateCasualties, "DayNum1200k", resultsDir, regressFile)

    updatedCols <- c("DayNum", "Date", "Soldiers")     # Save updated data for segmented analysis
    updatedFile <- file.path(resultsDir, sprintf(updatedData, Sys.Date()))
    updatedData <- rbind(subset(ukrRusCasualties, select = updatedCols),
                         subset(lateCasualties,   select = updatedCols))
    saveDataframe(updatedData, updatedFile)            #
    cat(sprintf("\n* Updated casualty data saved to %s\n", updatedFile))
  })                                                   # End transcript capture
}                                                      #

library("segmented")                                   # Segmented regression (line with kink)

## > rm("updatedData", "crossvalidatedSegmentFits"); doit2("russian-casualties-in-ukraine-updated-2026-01-27.tsv")
doit2 <- function(## Inputs
                 dataFile,                             # Give updated data filename written by doit()
                 dataDir   = "./results",              # Uses results of previous function
                 kFolds    = 3,                        # Very few points on 2nd segment, so few folds
                 updateDay = 444,                      # When the (sparse) updated data starts

                 ## Outputs
                 script      = "ukr-rus-casualties.r", # To name transcript file
                 resultsDir  = "./results",            # Where results go
                 regressFile = "segmented-regress-%s-on-%s.png") {

  rmse <- function(mdl, testData, colName) {           # Root-mean-squared prediction error
    sqrt(mean((predict(mdl, newdata = testData) - testData[, colName])^2))
  }                                                    #

  plotSegmentedFit <- function(updatedData, updateDay, davies, segmentedFit, rmseLinear, rmseSegmented,
                               resultsDir, regressFile) {
    f <- file.path(resultsDir, sprintf(regressFile, "Soldiers", "DayNum"))
    withPNG(f, 1000, 1000, FALSE, function() {         #
      withPars(function() {                            #
        startDate <- as.Date(subset(updatedData,       # Date for start of data collection
                                    subset = DayNum == min(DayNum),
                                    select = Date,     #
                                    drop   = TRUE))    #
        ## Empty plot with axes, titles, and rugs
        plot(x = NA, y = NA, xlim = range(updatedData$"DayNum"), ylim = range(updatedData$"Soldiers"),
             xlab = "Day Number", ylab = "Soldiers",
             main = sprintf("Russian Losses in Ukraine: Soldiers vs Day Number since %s",
                            format(startDate, "%Y-%b-%d")))
        rug(x = updatedData$"DayNum",   side = 1, col = "gray")
        rug(x = updatedData$"Soldiers", side = 2, col = "gray")

        ## Prediction confidence limits (to predict 1 more point)
        dayRange <- range(updatedData$"DayNum")
        dayPreds <- data.frame("DayNum" = seq(from = dayRange[[1]], to = dayRange[[2]],
                                              length.out = 100))
        confs    <- as.data.frame(predict(segmentedFit, interval = "prediction", newdata = dayPreds))
        polygon(rbind(data.frame(x = dayPreds$"DayNum",      pred = confs$"lwr"),
                      data.frame(x = rev(dayPreds$"DayNum"), pred = rev(confs$"upr"))),
                col = "lightgray")                     #

        ## Data points on top of that
        points(x = updatedData$"DayNum", y = updatedData$"Soldiers", pch = 21,
               col = ifelse(updatedData$"DayNum" < updateDay, "blue", "red"),
               bg  = ifelse(updatedData$"DayNum" < updateDay, "blue", "red"))

        ## Segmented fit lines on top of that, incl showing where 1st line WOULD have gone
        abline(a = intercept(segmentedFit)$"DayNum"[[1, "Est."]],
               b = slope(segmentedFit)$"DayNum"[["slope1", "Est."]],
               col = "black", lty = "dotted")
        plot(segmentedFit, add = TRUE, col = "black", lwd = 2)

        kinkCI   <- confint(segmentedFit)              # Show where the kink is, w/95% CL
        abline(v = kinkCI[[1, "Est."]],        col = "gray", lty = "solid",  lwd = 2)
        abline(v = kinkCI[[1, "CI(95%).low"]], col = "gray", lty = "dashed", lwd = 2)
        abline(v = kinkCI[[1, "CI(95%).up"]],  col = "gray", lty = "dashed", lwd = 2)
        text(x = kinkCI[[1, "Est."]], y = mean(range(updatedData$"Soldiers")),
             labels = sprintf("%s (95%% CL: %s to %s)",#
                              format(startDate + round(kinkCI[[1, "Est."       ]]), "%Y-%b-%d"),
                              format(startDate + round(kinkCI[[1, "CI(95%).low"]]), "%Y-%b-%d"),
                              format(startDate + round(kinkCI[[1, "CI(95%).up" ]]), "%Y-%b-%d")),
             pos = 3, srt = 90)                        #

        slopes <- slope(segmentedFit)
        legend("bottomright", inset = c(0.01, 0.05), bg = "antiquewhite",
               legend = c(as.expression(bquote(paste(
                              "Davies Test for Kink:       ",
                              italic(p) %~% .(scientificExpression(davies$"p.value"))))),
                          "",
                          sprintf("Slope before kink:             %.2f soldiers/day (95%% CL:   %.2f -   %.2f)",
                                  slopes$"DayNum"[["slope1", "Est."]],
                                  slopes$"DayNum"[["slope1", "CI(95%).l"]],
                                  slopes$"DayNum"[["slope1", "CI(95%).u"]]),
                          sprintf("Slope after kink:              %.2f soldiers/day (95%% CL: %.2f - %.2f)",
                                  slopes$"DayNum"[["slope2", "Est."]],
                                  slopes$"DayNum"[["slope2", "CI(95%).l"]],
                                  slopes$"DayNum"[["slope2", "CI(95%).u"]]),
                          "",
                          sprintf("RMS error without kink: %.2f soldiers",     rmseLinear),
                          sprintf("RMS error with kink:        %.2f soldiers", rmseSegmented)))

        legend("topleft", inset = c(0.05, 0.01), bg = "antiquewhite",
               legend = c("Early Data", "Late Data", "", "Kink",  "Kink 95% CL", "", "Fit Line(s)", "Fit early data only", "Fit CL (prediction)"),
               pch    = c(21,           21,          NA, NA,      NA,            NA, NA,            NA,                    22),
               lty    = c(NA,           NA,          NA, "solid", "dashed",      NA, "solid",       "dotted",              NA),
               lwd    = c(NA,           NA,          NA, 2,       2,             NA, 2,             2,                     NA),
               pt.bg  = c("blue",       "red",       NA, NA,      NA,            NA, NA,            NA,                    "lightgray"),
               col    = c("blue",       "red",       NA, "gray",  "gray",        NA, "black",       "black",               "black"),
               pt.cex = c(2,            2,           NA, NA,      NA,            NA, NA,            NA,                    3))

      }, pty = "m",                                    # Maxiimal plotting area
         bg  = "white",                                # White background
         ps  = 16,                                     # Larger type size
         mar = c(3, 3, 2, 1),                          # Pull in on margins
         mgp = c(1.7, 0.5, 0.0))                       # Axis title, label, tick spacing
    })                                                 #
  }                                                    #

  doSegmentedFit <- function(updatedData, testFold, resultsDir, regressFile) {
    cat(sprintf("\n  - Segmented fit, testFold = %d", testFold))
    if (!is.na(testFold)) {                            # If doing crossvalidation
      trainData <- subset(updatedData, subset = Fold != testFold)
      testData  <- subset(updatedData, subset = Fold == testFold)
    } else {                                           # Else training on whole dataset
      trainData <- updatedData                         #
      testData  <- updatedData                         #
    }                                                  #
    cat(sprintf("\n    o Train data: %d points", nrow(trainData)))
    cat(sprintf("\n    o Test data:  %d points", nrow(testData)))

    cat(sprintf("\n    o Simple linear fit, no kinks:"))
    linearFit <- lm(Soldiers ~ DayNum, data = trainData)
    print(summary(linearFit))                          # How well can we get away with being naive?

    cat(sprintf("\n    o Davies test for need of kink:"))
    davies <<- davies.test(linearFit, k = 10)          # Save for plot
    print(davies)                                      # Will a segmented model do us any good?

    cat(sprintf("\n    o Segmented fit:"))             # Fit a segmented model
    segmentedFit <- segmented(linearFit)               # Make it estimate the kink point
    print(summary(segmentedFit))                       #
    print(confint(segmentedFit))                       #
    print(slope(segmentedFit))                         #
    ## print(intercept(segmentedFit))                  # Don't care; DayNum == 1 isn't start of war

    rmseLinear    <- rmse(linearFit,    testData, "Soldiers")
    rmseSegmented <- rmse(segmentedFit, testData, "Soldiers")

    if (is.na(testFold))                               # If fitting whole dataset, make plot
      plotSegmentedFit(updatedData, updateDay, davies, segmentedFit, rmseLinear, rmseSegmented,
                       resultsDir, regressFile)        #

    slopes <- slope(segmentedFit)[[1]]                 # Only 1 covariate (predictor): DayNum
    data.frame("TestFold"   = testFold,                #
               "Kink"       = segmentedFit$"psi"[[1, "Est."]],
               "sd(Kink)"   = segmentedFit$"psi"[[1, "St.Err"]], # No, not with a period
               "Slope1"     = slopes[["slope1", "Est."]],
               "sd(Slope1)" = slopes[["slope1", "St.Err."]],     # Yes, with a period
               "Slope2"     = slopes[["slope2", "Est."]],
               "sd(Slope2)" = slopes[["slope2", "St.Err."]],     # Yes, with a period
               "lm.Adj.R2"  = summary(linearFit)$adj.r.squared,
               "Adj.R2"     = summary(segmentedFit)$adj.r.squared,
               "lm.RMSE"    = rmseLinear,              #
               "RMSE"       = rmseSegmented)           #
  }                                                    #

  ## Main body of analysis script begins here
  withTranscript(dataDir, resultsDir,                  # Capture stdout to transcript
                 sprintf("segmented-%s-transcript.txt", sub("^(.*)\\.r$", "\\1", basename(script))),
                 "Segmented Analysis of Russian Casualties in Ukraine", function() {

    ## Script &c have already been archived by doit()

    heraldPhase("Loading updated data")                # Load the updated dataset generated by doit()
    maybeAssign("updatedData",                         #  should have 3 columns:
                function() {                           #  DayNum, Date, Soldiers
                  f <- file.path(dataDir, dataFile)    #
                  cat(sprintf("\n* Updated data file: %s", f))

                  updatedData <- read.table(f, header = TRUE, sep = "\t")
                  cat(sprintf("\n  - Found %d rows x %d columns:\n  - Columns: %s\n",
                              nrow(updatedData), ncol(updatedData),
                              paste(colnames(updatedData), collapse = ", ")))
                  stopifnot(ncol(updatedData)         == 3 &&
                            all(colnames(updatedData) == c("DayNum", "Date", "Soldiers")))

                  updatedData <-                       # Assign crossvalidation folds
                    rbind(transform(subset(updatedData, subset = DayNum <  updateDay),
                                    Fold = 1 : kFolds),# Every kFolds points to consecutive folds
                          transform(subset(updatedData, subset = DayNum >= updateDay),
                                    Fold = 1 : kFolds))# Every kFolds points to consecutive folds

                  updatedData                          # Return the dataframe of updated data
                })                                     #  with crossvalidation fold assignments

    heraldPhase(sprintf("Doing %d-fold crossvalidated segmented fits", kFolds))
    maybeAssign("crossvalidatedSegmentFits", function() {
      tbl <- round(ldply(c(1 : kFolds, NA), function(testFold) {
        doSegmentedFit(updatedData, testFold, resultsDir, regressFile)
      }), digits = 3)                                  #
      cat(sprintf("\n* Crossvalidation and final whole-dataset fit results:\n\n"))
      print(tbl)                                       # Print table to transcript
      tbl                                              # Return table to be captured in global var
    })                                                 #
  })                                                   #
}                                                      #
