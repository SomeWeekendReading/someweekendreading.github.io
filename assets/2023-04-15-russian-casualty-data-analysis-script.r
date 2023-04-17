## Created on Wednesday, April 12, 2023 at 1:52pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2023, SomeWeekendReading.blog.  All rights reserved.  As if you care.

sourceTools <- function(lib) { source(file.path("~/Documents/laboratory/tools", lib)) }
sourceTools("graphics-tools.r")                        # Miscellaneous graphics hacks
sourceTools("pipeline-tools.r")                        # How to build analysis pipelines

library("PerformanceAnalytics")                        # For chart.Correlation()

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

##
## Prediction for the day of 200,000 Russian casualties:
##
## > uniroot(function(dn) { predict(mdl7, newdata = data.frame("x" = dn)) - 200000 })
## $root
## [1] 105.1125
##
## $f.root
## 1
## 0
##
## $iter
## [1] 1
##
## $init.it
## [1] NA
##
## $estim.prec
## [1] 44.88746
##
## Build a more human-friendly result, with prediction intervals:
##
## > foo <- data.frame(DayNum = 100:110, Date = as.Date("2023-01-22") + 99:109, predict(mdl7, newdata = data.frame(x = 100:110), interval = "prediction")); colnames(foo)[3:5] <- c("Soldiers", "LCL", "UCL"); foo
##    DayNum       Date Soldiers      LCL      UCL
## 1     100 2023-05-01 196141.4 194189.5 198093.3
## 2     101 2023-05-02 196896.1 194942.2 198850.1
## 3     102 2023-05-03 197650.9 195694.8 199606.9
## 4     103 2023-05-04 198405.6 196447.4 200363.7
## 5     104 2023-05-05 199160.3 197200.0 201120.6
## 6     105 2023-05-06 199915.1 197952.6 201877.5
## 7     106 2023-05-07 200669.8 198705.1 202634.4
## 8     107 2023-05-08 201424.5 199457.6 203391.4
## 9     108 2023-05-09 202179.3 200210.1 204148.4
## 10    109 2023-05-10 202934.0 200962.5 204905.5
## 11    110 2023-05-11 203688.7 201714.9 205662.5
##

doit <- function(## Inputs
                 dataDir  = "./data",
                 dataFile = "russian-casualties-in-ukraine.tsv",

                 ## Outputs
                 resultsDir  = "./results",
                 script      = "ukr-rus-casualties.r",
                 wabFile     = "warshipsAndBoats-useless.png",
                 regressFile = "regress-%s-on-%s.png",
                 biclFile    = "bicluster.png",
                 corrFile    = "correlation-chart.png") {

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

    cat(sprintf("\n  - Checking column types:"))       # Check types of columns
    ## DayNum is an integer from 1 to the number of rows.
    stopifnot(colnames(ukrRusCasualties)[[1]] == "DayNum"  &&
              class(ukrRusCasualties[, 1])    == "integer" &&
              all(ukrRusCasualties$"DayNum"   == 1 : nrow(ukrRusCasualties)))
    ## Date is a sequence of Dates, ascending by exactly 1 day as we go to the next row.
    stopifnot(colnames(ukrRusCasualties)[[2]] == "Date"    &&
              class(ukrRusCasualties[, 2])    == "Date"    &&
              all(ukrRusCasualties$"Date"     == seq(from = ukrRusCasualties[[1, "Date"]],
                                                     to   = ukrRusCasualties[[nrow(ukrRusCasualties),
                                                                              "Date"]],
                                                     by   = 1)))
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

      cat("\n")                                        #
      TRUE                                             # Flag that it's done
    })                                                 # End of analysis

  })                                                   # End transcript capture
}                                                      #
