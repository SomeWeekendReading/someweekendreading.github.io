---
layout: post
title: Code for &quot;Wastewater coronavirus RNA vs medical loads&quot;
tags: COVID MathInTheNews R
date: 2020-11-04
comments: false
---

Here's the script `mwra-covid.r` for the post:  
```R
## Created on Monday, November  2, 2020 at 10:38pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2020, SomeWeekendReading.  All rights reserved.  As if you care.

##
## Research question: Does the MWRA's metagenomic measurement of SARS-COV-2 RNA in
## wastewater predict later hospitalization or death rates or positive test rates?
##
## Hypotheses: hospitalization & death rates might work; positive test rates probably
## won't, due to changes in test availability, test type, and testing policy.
##
## Data sources (2020-Nov-02):
## - Mass COVID hospitalization/death rates from:
##   https://covidtracking.com/data/state/massachusetts
## - MWRA metagenomics painfully extracted, almost by hand, from a PDF at:
##   http://www.mwra.com/biobot/biobotdata.htm
##
## Did not consider test positivity rates, since testing has changed from basically unavailable
## to somewhat available, and the reporting has been spotty enough to make the numbers useless.
##
## *** NB: on 2020-09-02 and -07, in hosp/death dataset, hospIncr is NEGATIVE!  This is in
## the orignal data, where hospitalizedIncrease on 2020-09-02 is -91, for some reason.
##

toolsDir <- "../tools"                                 # Various tools available from author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks

library("lubridate")                                   # For round_date()
library("zoo")                                         # For rollmean()

doit <- function(## Inputs
                 dataDir          = "./data",
                 mwraDataFile     = "MWRAData20201027-NSdata.tsv",
                 covidDataFile    = "massachusetts-history.csv",
                 covidDataEmpties = c("inIcuCumulative",

                                      "negativeTestsAntibody", "negativeTestsPeopleAntibody",
                                      "negativeTestsViral",

                                      "onVentilatorCumulative",

                                      "positiveTestsAntibody", "positiveTestsAntigen",
                                      "positiveTestsPeopleAntibody", "positiveTestsPeopleAntigen",

                                      "totalTestEncountersViral", "totalTestsAntibody",
                                      "totalTestsAntigen"),
                 waveDate         = as.Date("2020-07-01", format = "%Y-%m-%d"),

                 ## Outputs
                 resultsDir    = "./results",
                 txFile        = "mwra-covid-transcript.txt",
                 jointDataFile = "mwra-covid-joint-data.tsv",
                 nsPlotFile    = "plot-north-south.png",
                 medPlotFile   = "plot-med-loads-vs-RNA.png") {

  reportStructure <- function(df) {                    # Report structure of a dataframe
    cat(sprintf("\n  - Structure:\n    o %d rows\n    o %d columns: %s",
                nrow(df), ncol(df), paste(colnames(df), collapse = ", ")))
  }                                                    # Basically shape + column names

  loadMWRAData <- function(dataDir, mwraDataFile) {    # Load the MWRA's metagenomic data
    f  <- file.path(dataDir, mwraDataFile)             # Painfully hand-extracted from a PDF
    cat(sprintf("* Reading MWRA wastewater RNA data from %s", f))
    df <- subset(transform(read.table(f, sep = "\t", header = TRUE, comment.char = "#"),
                           Sample.Date = as.Date(as.character(Sample.Date), format = "%m/%d/%Y")),
                 select = c(Sample.Date, Southern.7.sample.avg, Northern.7.sample.avg))
    colnames(df)[1:3] <- c("Date", "South.7", "North.7")

    reportStructure(df)                                # See what fish we caught
    df                                                 # Return the data
  }                                                    #

  loadCOVIDData <- function(dataDir, covidDataFile, covidDataEmpties) {
    f  <- file.path(dataDir, covidDataFile)            #
    cat(sprintf("\n* Reading Mass COVID data from %s", f))
    df <- transform(read.table(f, sep = ",", header = TRUE),
                    date = as.Date(as.character(date), format = "%Y-%m-%d"))
    sapply(covidDataEmpties, function(emptyCol) { stopifnot(all(is.na(df[, emptyCol]))) })
    df <- subset(df, select = c(date, deathIncrease, hospitalizedIncrease))
    df <- df[order(df$"date"), ]                       # Sort by date, shorten column names
    colnames(df)[1:3] <- c("Date", "deadIncr", "hospIncr")

    weekMeanNDec <- function(x, n) { round(rollmean(x, 7, NA, align = "right"), digits = n) }
    stopifnot(all(diff(df$"Date") == 1))               # Check no missing dates
    df <- subset(transform(df,                         # 7 day rolling mean, exploit no missing dates
                           deadIncr.7 = weekMeanNDec(deadIncr, 1),
                           hospIncr.7 = weekMeanNDec(hospIncr, 1)),
                select = -c(deadIncr, hospIncr))       #

    reportStructure(df)                                # See what we caught
    df                                                 # Return the data
  }                                                    #

  makeJointData <- function(mwraData, covidData, resultsDir, jointDataFile) {
    cat("\n* Constructing inner join on dates")        # Combine RNA and medical load data
    df <- merge(mwraData, covidData, by = "Date", all = FALSE)
    df <- df[order(df$"Date"), ]                       # Sort it by date
    df <- subset(df, subset = complete.cases(df))      # Drop initial 6 rows (no 7 day average)
    cat("\n  - Complete cases only, to drop the initial 6 rows w/o 7 day trailing means")
    ## Combine North & South districts by mean to get overall RNA measure
    df <- transform(df, RNA.7 = round((North.7 + South.7) / 2.0, digits = 1))
    df <- df[, c("Date", "North.7", "South.7", "RNA.7", "hospIncr.7", "deadIncr.7")]

    f  <- file.path(resultsDir, jointDataFile)         # Save it away for peer review
    saveDataframe(df, f)                               #
    cat(sprintf("\n  - Saved to %s", f))               #

    reportStructure(df)                                # See what we caught
    df                                                 # Return the data
  }                                                    #

  plotNorthSouth <- function(jointData, resultsDir, nsPlotFile) {
    dateRange <- c(floor_date(min(jointData$"Date"), "month"),
                   ceiling_date(max(jointData$"Date"), "month"))
    f <- file.path(resultsDir, nsPlotFile)             #
    withPNG(f, 850, 400, FALSE, function() {           #
      withPars(function() {                            #
        rnaCols  <- c("blue",  "gray")                 #
        rnaNames <- c("North", "South")                #
        matplot(x = jointData$"Date",                  # North & south RNA vs time
                y = subset(jointData, select = sapply(rnaNames, function(c) { sprintf("%s.7", c) })),
                type = "p", pch = 21, col = "black", bg = rnaCols, log = "y", cex = 1.5,
                xaxt = "n", xlab = NA, ylab = "RNA (wk avg, log scale)",
                main = "RNA Levels vs Time")           #
        axis.Date(1, x = dateRange, format = "%Y-%m-%d")
        legend("topright", bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.bg = rnaCols, pt.cex = 2, legend = rnaNames)

        scatterplotWithDensities(xs = jointData$"South.7", ys = jointData$"North.7",
                                 bgs = "steelblue", cex = 1.5, log = "xy",
                                 regressionColor = NULL, # doesn't work on log scale
                                 xlab = "South RNA (log scale)", ylab = "North RNA (log scale)",
                                 main = as.expression(bquote(bold(paste(
                                     "RNA Correlation: ",
                                     bolditalic(R)^2 == .(
                                       sprintf("%.0f", #
                                               100.0 * cor(jointData$"North.7",
                                                           jointData$"South.7")^2)),
                                     "%")))))          #

        title(main = "MWRA Wastewater RNA: North vs South", outer = TRUE)

      }, pty   = "m",                                  # Maximal plotting area
         bg    = "transparent",                        # Transparent background
         mar   = c(7, 4, 2, 1),                        # Margins (e.g., to hold date labels)
         mgp   = c(2.5, 0.5, 0),                       # Axis title, label, tick
         mfrow = c(1, 2),                              # 1x2 array of plots
         oma   = c(0, 0, 1, 0),                        # Make room at top for overall title
         ps    = 16,                                   # Larget type size for file capture
         las   = 2)                                    # Labels perpendicular to axes
    })                                                 # End file capture
    cat(sprintf("* Plot of north vs south RNA to %s", f))
    TRUE                                               # Flag that it was done
  }                                                    #

  plotMedLoadsVsRNA <- function(jointData, waveDate, resultsDir, medPlotFile) {
    dateRange <- c(floor_date(min(jointData$"Date"), "month"),
                   ceiling_date(max(jointData$"Date"), "month"))
    f         <- file.path(resultsDir, medPlotFile)    #
    withPNG(f, 850, 400, FALSE, function() {           #
      withPars(function() {                            #
        medNames <- c("hospIncr.7", "deadIncr.7")      #
        medCols  <- c("green", "red")                  #
        matplot(x = jointData$"Date",                  # Mean RNA, hospitalizations, deaths vs time
                y = subset(jointData, select = c("RNA.7", medNames)),
                type = "p", pch = 21, col = "black", bg = c("steelblue", medCols), cex = 1.5,
                xaxt = "n", xlab = NA, ylab = "Medical Loads & RNA",
                main = "Medical Loads & RNA vs Time")  #
        axis.Date(1, x = dateRange, format = "%Y-%m-%d")
        abline(v = waveDate, lty = "dashed", col = "black")
        text(x      = c(as.Date("2020-06-01", format = "%Y-%m-%d"),
                        as.Date("2020-08-01", format = "%Y-%m-%d")),
             y      = c(200, 200),                     #
             adj    = c(0.5, 0.5),                     #
             labels = c("Wave 1", "Wave 2"))           #
        text(x      = c(as.Date("2020-06-01", format = "%Y-%m-%d"),
                        as.Date("2020-09-01", format = "%Y-%m-%d")),
             y      = c(175, 175),                     #
             adj    = c(0.5, 0.5),                     #
             labels = c("Tracks RNA", "Does NOT Track RNA"))
        legend("topright", bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.bg = c("steelblue", medCols), pt.cex = 2,
               legend = c("RNA", "Hospitalized", "Dead"))

        wave1Data <- subset(jointData, subset = Date <= waveDate)
        wave2Data <- subset(jointData, subset = Date >  waveDate)
        matplot(x = wave1Data$"RNA.7",                 # Hospitalizations, deaths, vs mean RNA
                y = subset(wave1Data, select = medNames),
                pch = 21, type = "p", col = "black", bg = medCols, cex = 1.5,
                xlim = range(jointData$"RNA.7"),       #
                ylim = range(subset(jointData, select = medNames)),
                xlab = "RNA (wk avg)", ylab = "Medical Load (wk avg)",
                main = "Medical Loads vs RNA")         #
        points(x = wave2Data$"RNA.7", y = wave2Data$"hospIncr.7",
               pch = 22, type = "p", col = "black", bg = "lightgreen", cex = 1.5)
        points(x = wave2Data$"RNA.7", y = wave2Data$"deadIncr.7",
               pch = 22, type = "p", col = "black", bg = "pink", cex = 1.5)
        text(x =  50, y = 150, labels = "Wave 1: Tracks RNA",        srt = 45)
        text(x = 160, y =   0, labels = "Wave 2: Does NOT Track RNA")
        legend("topleft", bg = "antiquewhite", inset = 0.01, ncol = 2, pt.cex = 2,
               pch    = c(21,      21,    22,      22),#
               pt.bg  = c(medCols, "lightgreen", "pink"),
               legend = c("Wave 1 Hospitalized", "Wave 1 Dead",
                          "Wave 2 Hospitalized", "Wave 2 Dead"))

        title(main = "MWRA Wastewater RNA and Medical Loads", outer = TRUE)

      }, pty   = "m",                                  # Maximal plotting area
         bg    = "transparent",                        # Transparent background
         mar   = c(7, 4, 2, 1),                        # Margins (e.g., to hold date labels)
         mgp   = c(2.5, 0.5, 0),                       # Axis title, label, tick
         mfrow = c(1, 2),                              # 1x2 array of plots
         oma   = c(0, 0, 1, 0),                        # Make room at top for overall title
         ps    = 16,                                   # Larget type size for file capture
         las   = 2)                                    # Labels perpendicular to axes
    })                                                 # End file capture
    cat(sprintf("\n* Plot of medical loads vs RNA to %s", f))
    TRUE                                               # Flag that it was done
  }                                                    #

  showWaveCorrelations <- function(jointData, waveDate) {

    cat("\n* Correlations, using all data:\n")         # Correlation matrix for all times
    print(round(cor(subset(jointData, select = -Date)), digits = 2))

    cat("\n* Correlations, first wave data:\n")        # Correlation matrix for first wave only
    print(round(cor(subset(jointData, subset = Date <= waveDate, select = -Date)), digits = 2))

    cat("\n* Correlations, second wave data:\n")       # Correlation matrix for second wave only
    print(round(cor(subset(jointData, subset = Date > waveDate, select = -Date)), digits = 2))
  }                                                    #

  withTranscript(dataDir, resultsDir, txFile, "MWRA COVID Analysis", function() {

    heraldPhase("Archival")                            # For peer review
    archiveAnalysisScript(resultsDir, "./mwra-covid.r")#

    heraldPhase("Loading datasets and constructing joint dataset")
    maybeAssign("mwraData",  function() { loadMWRAData(dataDir, mwraDataFile) })
    maybeAssign("covidData", function() { loadCOVIDData(dataDir, covidDataFile, covidDataEmpties) })
    maybeAssign("jointData", function() {              # Assemble via inner join on dates
      makeJointData(mwraData, covidData, resultsDir, jointDataFile)
    })                                                 #
    cat("\n")                                          #
    ## *** NB: missing dates, due to missing dates in MWRA RNA data:
    ## > diff(jointData$"Date")

    heraldPhase("Exploratory plots")                   # See the general shape of the data
    maybeAssign("nsPlotDone",  function() { plotNorthSouth(jointData, resultsDir, nsPlotFile) })
    maybeAssign("medPlotDone", function() {            #
      plotMedLoadsVsRNA(jointData, waveDate, resultsDir, medPlotFile)
    })                                                 #
    showWaveCorrelations(jointData, waveDate)          # Look @ change in correlations?!
    cat("\n")                                          #

    ## We would do something like this, except the data is clearly telling us we don't understand it!
    ## *** cross-correlation with time lags up to 21 days
    ## *** regressions
    ## *** time series MA(q) models

  })                                                   # End of transcript capture
}                                                      #
```
