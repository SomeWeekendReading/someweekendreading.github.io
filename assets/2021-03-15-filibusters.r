## Created on Sunday, March 14, 2021 at 5:49pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2020, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Various tools available from author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Graphics tools

library("plyr")                                        # For ddply()

##
## Does one party filibuster more than the other, since 1970?
## - Can't measure filibuster, since that's a behavior, not a formal motion.
## - Can measure cloture motions, which respond to filibusters, though.
## - When one party is in power, are there more filibusters/clotures?
##

doit <- function(## Inputs
                 clotureFile  = "./2021-03-15-filibusters-cloture.tsv",
                 partiesFile  = "./2021-03-15-filibusters-parties.tsv",
                 dropSessions = c(107, 117),

                 ## Outputs
                 txFile         = "./2021-03-15-filibusters.txt",
                 plotFile       = "../images/2021-03-15-filibusters.png",
                 filibusterFile = "./2021-03-15-filibusters.tsv") {

  loadFilibusterData <- function(partiesFile, clotureFile, dropSessions, filibusterFile) {

    isPositiveInteger <- function(x) { !is.na(x) && is.integer(x) && x >= 0 }

    isParty           <- function(x) { is.na(x) || x %in% c("D", "R") }

    findMajority      <- function(dems, repubs, pres) {# How to find the senate majority
      ifelse(dems > repubs,                            # If dems outnumber repubs,
             "D",                                      #  then it's dems
             ifelse(repubs > dems,                     # Else if repubs outnumber dems,
                    "R",                               #  then repubs
                    as.character(pres)))               # Else it's a tie which vice president breaks
    }                                                  # Will be NA if pres needed & not supplied

    loadClotureData <- function(clotureFile) {         #
      clotureData <- read.table(clotureFile, sep = "\t", header = TRUE, comment = "#")
      stopifnot(colnames(clotureData) == c("Congress", "Years", "Motions.Filed",
                                           "Votes.on.Cloture", "Cloture.Invoked"))
      clotureData <- subset(clotureData, select = c(Congress, Motions.Filed))
      with(clotureData, {                              #
        stopifnot(all(isPositiveInteger(Congress)))    #
        stopifnot(all(isPositiveInteger(Motions.Filed)))
      })                                               #
      clotureData                                      #
    }                                                  #

    loadPartiesData <- function(partiesFile) {         #
      partiesData <- read.table(partiesFile, sep = "\t", header = TRUE, comment = "#", na = "")
      stopifnot(colnames(partiesData) == c("Congress", "Years", "Republicans", "Democrats",
                                           "Presidency", "Majority"))
      partiesData <- subset(partiesData, select = -Years)
      with(partiesData, {                              #
        stopifnot(all(isPositiveInteger(Congress)))    #
        stopifnot(all(isPositiveInteger(Republicans))) #
        stopifnot(all(isPositiveInteger(Democrats)))   #
        stopifnot(all(Republicans + Democrats == 100)) #
        stopifnot(all(isParty(Presidency)))            #
        stopifnot(all(isParty(Majority)))              #
        stopifnot(all(!is.na(Majority)))               #
        stopifnot(all(as.character(Majority) == findMajority(Democrats, Republicans, Presidency)))
      })                                               #

      subset(partiesData, select = -Presidency)        #
    }                                                  #

    filibusterData <- subset(merge(loadPartiesData(partiesFile), loadClotureData(clotureFile),
                                   by = "Congress", all = FALSE),
                             subset = !(Congress %in% dropSessions))
    saveDataframe(filibusterData, filibusterFile)      #
    filibusterData                                     #
  }                                                    #

  showFilibustersByMajority <- function(filibusterData) {
    cat(sprintf("\n* Filibusters broken down by majority party:\n"))
    tbl <- ddply(filibusterData, "Majority", function(df) {
      data.frame(Motions.Filed.Mean = round(mean(df$"Motions.Filed"), digits = 1),
                 Motions.Filed.Sd   = round(sd(df$"Motions.Filed"),   digits = 1),
                 Years              = 2 * nrow(df))    #
    })                                                 #
    print(tbl); cat("\n")                              #
  }                                                    #

  plotFilibusters <- function(filibusterData, plotFile) {
    withPNG(plotFile, 400, 600, FALSE, function() {    #
      withPars(function() {                            #
        plot(x = filibusterData$"Congress", y = filibusterData$"Motions.Filed",
             pch = 21, col = "black", bg = ifelse(filibusterData$"Majority" == "D", "blue", "red"),
             type = "b", lty = "dotted",               #
             xlab = "Congressional Session", ylab = "Cloture Motions",
             main = "Cloture Motions vs Time (starting 1970)")
        legend("topleft", bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.bg = c("blue", "red"), pt.cex = 2,
               legend = c("Democratic Majority", "Republican Majority"))
        boxplot(Motions.Filed ~ Majority, data = filibusterData,
                xlab = "Senate Majority", ylab = "Cloture Motions",
                range = 0, col = c("blue", "red"))     #
      }, pty = "m",                                    #
         bg  = "white",                                #
         mfrow = c(2, 1),
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0))                         #
    })                                                 #
  }                                                    #

  withTranscript(".", ".", txFile, "Filibuster Analysis", function() {

    heraldPhase("Data loading and inner joins")        # Load data for majorities and cloture
    maybeAssign("filibusterData", function() {         #  motions for last 50 years (since 1970)
      loadFilibusterData(partiesFile, clotureFile, dropSessions, filibusterFile)
    })                                                 #

    heraldPhase("Exploratory analysis")                # Get general shape of data
    plotFilibusters(filibusterData, plotFile)          #
    showFilibustersByMajority(filibusterData)          #

    heraldPhase("Statistial significance tests")       #
    print(t.test(Motions.Filed ~ Majority, data = filibusterData))

  })                                                   #
}                                                      #
