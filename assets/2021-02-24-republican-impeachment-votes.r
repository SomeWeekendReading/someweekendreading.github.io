## Created on Monday, February 15, 2021 at 7:45pm CDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

source("~/Documents/laboratory/tools/graphics-tools.r")# Various graphics tools
source("~/Documents/laboratory/tools/pipeline-tools.r")# Pipeline building tools

library("glmnet")                                      #
library("plyr")                                        # For ldply()
library("pscl")                                        # For pR2()

##
## Can we predict Republican senators' votes on the 2nd Trump impeachment?
##

doit <- function(## Inputs

                 ## Where the data lives
                 dataDir                = ".",

                 ## Votes on final verdict
                 ## Source: rearranged in Emacs from
                 ## https://www.senate.gov/legislative/LIS/roll_call_lists/roll_call_vote_cfm.cfm?congress=117&session=1&vote=00059
                 senateVotesVerdictFile = "2021-02-24-republican-impeachment-votes-verdict.tsv",

                 ## Also votes on constitutionality of impeachment procedure
                 ## Source: rearranged in Emacs from
                 ## https://www.senate.gov/legislative/LIS/roll_call_lists/roll_call_vote_cfm.cfm?congress=117&session=1&vote=00057
                 sentVotesConstFile     = "2021-02-24-republican-impeachment-votes-const.tsv",

                 ## Popular vote margin in each state
                 ## https://en.wikipedia.org/wiki/2020_United_States_presidential_election#Results_by_state
                 stateVotesFile         = "2021-02-24-republican-impeachment-votes-states.tsv",

                 ## When each senator is up for re-election
                 ## Sources for re-election dates ("unless they were appointed"?  who?):
                 ## https://www.senate.gov/senators/Class_I.htm
                 ## https://www.senate.gov/senators/Class_II.htm
                 ## https://www.senate.gov/senators/Class_III.htm
                 ## And retirements from:
                 ## https://fivethirtyeight.com/features/what-all-those-gop-retirements-mean-for-the-2022-senate-map/
                 ## https://www.cnn.com/2021/01/26/politics/retirements-republicans-2022/index.html
                 senatorElectionFile    = "2021-02-24-republican-impeachment-votes-reelection.tsv",

                 ## Outputs
                 txFile                 = "2021-02-24-republican-impeachment-votes-transcript.txt",
                 omnibusFile            = "2021-02-24-republican-impeachment-votes-omnibus.tsv",
                 corrFile               = "2021-02-24-republican-impeachment-votes-correlations.png",
                 rocFile                = "2021-02-24-republican-impeachment-votes-roc.png",
                 cvPlotFile             = "2021-02-24-republican-impeachment-votes-cv.png") {

  ##
  ## Functions used in the main body of the script
  ##

  readVerdictVotes <- function(dataDir, senateVotesVerdictFile) {
    ## Read in the senate votes for the impeachment verdict.  This is the "backbone"
    ## dataframe, with each state, senator name, party, and verdict vote.  Other datasets
    ## will be merged into here by an outer join on either senator name or state name.
    f <- file.path(dataDir, senateVotesVerdictFile)    #
    cat(sprintf("\n  - Backbone dataframe of verdict votes from %s", f))
    votesVerdict <- read.table(f, sep = "\t", header = TRUE)
    stopifnot(colnames(votesVerdict)             == c("State", "Senator", "Party", "VoteVerdict"))
    stopifnot(levels(votesVerdict$"Party")       == c("D", "I", "R"))
    stopifnot(levels(votesVerdict$"VoteVerdict") == c("Guilty", "NotGuilty"))
    stopifnot(all(complete.cases(votesVerdict)))       # No missing values
    transform(votesVerdict, VoteVerdict = ordered(VoteVerdict, levels = c("Guilty", "NotGuilty")))
  }                                                    #

  readConstVotes <- function(dataDir, senateVotesVerdictFile) {
    ## Read the senate votes on constitutionality of the impeachment proceeding.  This is
    ## much simpler, with just the senator name and the vote.  It is outer joined onto the
    ## votes dataframe by senator name.
    f <- file.path(dataDir, sentVotesConstFile)        #
    cat(sprintf("\n  - Constitutionality votes from %s", f))
    votesConst <- read.table(f, sep = "\t", header = TRUE)
    stopifnot(colnames(votesConst)           == c("Senator", "VoteConst"))
    stopifnot(levels(votesConst$"VoteConst") == c("Nay", "Yea"))
    stopifnot(all(complete.cases(votesConst)))         # No missing values
    transform(votesConst, VoteConst   = ordered(VoteConst, levels = c("Yea", "Nay")))
  }                                                    #

  readPopularVotes <- function(dataDir, stateVotesFile) {
    ## Read the popular votes for each state: state name, Biden percent, and Trump
    ## percent.  This is outer joined on to the votes dataframe by state name.
    f <- file.path(dataDir, stateVotesFile)            #
    cat(sprintf("\n  - State popular vote percentages from %s", f))
    votesPopular <- read.table(f, sep = "\t", header = TRUE)
    stopifnot(colnames(votesPopular)        == c("State", "BidenPct", "TrumpPct"))
    stopifnot(mode(votesPopular$"BidenPct") == "numeric")
    stopifnot(mode(votesPopular$"TrumpPct") == "numeric")
    stopifnot(all(complete.cases(votesPopular)))       # No missing values
    subset(transform(votesPopular, TrumpMargin = round(TrumpPct - BidenPct, digits = 2)),
           select = -c(TrumpPct, BidenPct))            # Just the Trump margin
  }                                                    #

  readReelections <- function(dataDir, senatorElectionFile) {
    ## Read the data on each senator's class, which dictates the reelection date.
    ## ("unless they took their seat through appointment or special election", and I have
    ## no idea how to find that out, so I'm pretending the class determines everything.)
    ##
    ## Also, retirements & possible retirements known at the time of the impeachment vote,
    ## per 538 and CNN.
    f <- file.path(dataDir, senatorElectionFile)       #
    cat(sprintf("\n  - Reelection/retirement data from %s", f))
    reelections <- read.table(f, sep = "\t", header = TRUE)
    stopifnot(colnames(reelections) == c("Senator", "NextElection", "Retiring"))
    stopifnot(all(reelections$"NextElection" %in% c(2022, 2024, 2026)))
    stopifnot(levels(reelections$"Retiring") == c("Maybe", "No", "Yes"))
    transform(reelections, Retiring = ordered(Retiring, levels = c("Yes", "Maybe", "No")))
  }                                                    #

  makeOmnibusVotes <- function(votesVerdict, votesConst, votesPopular, reelections,
                               dataDir, omnibusFile) { #
    ## Do outer joins to merge those datasets into 1 omnibus dataset.
    votes <- merge(merge(merge(votesVerdict, votesConst,
                               by = "Senator", all = TRUE),
                         votesPopular,                 # All outer joins
                         by = "State", all = TRUE),    #
                   reelections,                        #
                   by = "Senator", all = TRUE)         #
    stopifnot(all(complete.cases(votes)))              # Check all state & senator names matched
    stopifnot(colnames(votes) == c("Senator", "State", "Party", "VoteVerdict", "VoteConst",
                                   "TrumpMargin", "NextElection", "Retiring"))
    stopifnot(length(levels(votes$"Senator")) == 100)  # Should be 100 unique senators
    stopifnot(length(levels(votes$"State"))   ==  50)  # Should be 50 unique states
    stopifnot(levels(votes$"Party") == c("D", "I", "R"))
    stopifnot(levels(votes$"VoteVerdict") == c("Guilty", "NotGuilty"))
    stopifnot(levels(votes$"VoteConst")   == c("Yea", "Nay"))
    stopifnot(all(is.numeric(votes$"TrumpMargin")))    #
    stopifnot(all(votes$"NextElection" %in% c(2022, 2024, 2026)))
    stopifnot(levels(votes$"Retiring") == c("Yes", "Maybe", "No"))
    f <- file.path(dataDir, omnibusFile)               # Save the omnibus data file
    saveDataframe(votes, f)                            #
    cat(sprintf("\n  - Saved to %s", f))               #
    votes                                              # Return the omnibus data
  }                                                    #

  doCrosstabulations <- function(votes) {              #
    cat(sprintf("\n* Crosstabulations to generate hypotheses:\n"))
    print(xtabs(~ VoteConst    + Party,        data = votes))
    print(xtabs(~ VoteVerdict  + Party,        data = votes))
    print(xtabs(~ VoteVerdict  + VoteConst,    data = votes))
    print(subset(votes, subset = VoteConst == "Nay" & VoteVerdict == "Guilty")) # Burr
    print(xtabs(~ VoteVerdict  + NextElection, data = votes))
    print(xtabs(~ VoteVerdict  + Retiring,     data = votes))
    print(xtabs(~ NextElection + Party,        data = votes))
    TRUE                                               # Flag that it was done
  }                                                    #

  biclusterPredictorCorrelations <- function(predictors, dataDir, corrFile,
                                             legendFrac = 0.15, nColors = 256) {
    predictorsCorr <- cor(predictors)                  # Pearson correlation matrix
    f          <- file.path(dataDir, corrFile)         # Where the plot goes
    withPNG(f, 400, 300, FALSE, function() {           # Capture graphics to file
      withPars(function() {                            # Save/restore par() parameters
        corrRange  <- range(predictorsCorr)            # Range of correlations (inside [-1, +1])
        colors     <- makeSaturableHeatmapColorsBWR(nColors, corrRange[[1]], corrRange[[2]],
                                                    minSat = -1, midSat = 0, maxSat = +1)
        maxLabLen  <- max(nchar(rownames(predictorsCorr)))
        heatmap(predictorsCorr,                        #
                symm = TRUE, revC = TRUE, scale = "none", col = colors,
                margins = 0.70 * c(maxLabLen, maxLabLen),
                main = "Verdict Predictors: Pearson Correlations",
                add.expr = { box(which = "plot") })    #
        par(omd = c(0.02, legendFrac, 0, 1), pty = "m", new = TRUE)
        image(x    = 0,                                # draw the color bar
              y    = seq(from = corrRange[[1]], to = corrRange[[2]], along.with = colors),
              z    = matrix(1 : length(colors), ncol = length(colors)),
              cex.axis = 0.9,                          # Smaller labels
              las  = 1,                                # Label positioning
              ylim = c(-1, +1),                        # Show range of POSSIBLE correlations
              col  = colors,                           # Heatmap colors
              xaxt = "n", ylab = NA, xlab = NA)        #
        box(which = "plot")                            #
      }, pty = "m",                                    # Maximal plotting area
      bg  = "transparent",                             # Transparent background
      ps  = 10,                                        # Larger type size for file capture
      omd = c(legendFrac, 1, 0, 1),                    # Leave room for color bar legend
      mar = c(1, 2, 1, 1))                             # Pull in on margins
    })                                                 # Done capturing graphics to file
    cat(sprintf("\n* Correlation bicluster of predictors to %s", f))
    TRUE                                               # Flag that it's been done
  }                                                    #

  makeRegressionDataframe <- function(votes) {         # Reduce everything to boolean or numeric
    cat(sprintf("* Making boolean/numeric dataframe for regression"))

    ## Assign folds to Democrats: they all look pretty similar, so we just consecutively
    ## number them 1, 2, 3.
    votesDI  <- subset(votes, subset = Party != "R")
    votesDI  <- transform(votesDI, FoldID = rep(1:3, length.out = nrow(votesDI)))

    ## Assign folds to Republicans: make sure the rare Guilty votes are evenly
    ## divided among the folds.
    votesRG  <- subset(votes, subset = Party == "R" & VoteVerdict == "Guilty")
    votesRG  <- transform(votesRG, FoldID = rep(1:3, length.out = nrow(votesRG)))
    votesRNG <- subset(votes, subset = Party == "R" & VoteVerdict == "NotGuilty")
    votesRNG <- transform(votesRNG, FoldID = rep(1:3, length.out = nrow(votesRNG)))

    ## Assemble back with FoldID column.  (Though rows are in different order from votes.)
    votesF <- rbind(votesDI, votesRG, votesRNG)

    data.frame(State           = votesF$"State",       # Retain to identify cases, not
               Senator         = votesF$"Senator",     #  for regressions.
               FoldID          = votesF$"FoldID",      #
               VotedNotGuilty  = votesF$"VoteVerdict"  == "NotGuilty",
               PartyRepublican = votesF$"Party"        == "R",
               VotedUnconst    = votesF$"VoteConst"    == "Nay",
               TrumpMargin     = votesF$"TrumpMargin", # Already numeric
               Running2022     = votesF$"NextElection" == 2022,
               NotRetiring     = votesF$"Retiring"     == "No")
  }                                                    #

  exploreFeatures <- function(votesRegression) {       # Feature p-values by univariate regression

    featurePVal <- function(mdl) {                     # Coefficient p-value or NA if
      coeffs <- coef(summary(mdl))                     #  somehow didn't converge
      if (nrow(coeffs) >= 2) coeffs[2, "Pr(>|z|)"] else NA
    }                                                  #

    cat(sprintf("\n* Measuring feature predictivity by univariate logistic regresssions\n"))
    votesRegressionRepublican <- subset(votesRegression, subset = PartyRepublican)
    featureTable <- ldply(setdiff(colnames(votesRegression), "VotedNotGuilty"), function(predictor) {
      form          <- as.formula(sprintf("VotedNotGuilty ~ %s", predictor))
      mdl           <- glm(form, family = "binomial", data = votesRegression)
      mdlRepublican <- glm(form, family = "binomial", data = votesRegressionRepublican)
      data.frame(Predictor   = predictor,              #
                 p           = featurePVal(mdl),       #
                 pRepublican = featurePVal(mdlRepublican))
    })                                                 #
    featureTable <- transform(featureTable,            #
                              FDR           = p.adjust(featureTable$"p", method = "BH"),
                              FDRRepublican = p.adjust(featureTable$"pRepublican", method = "BH"))
    print(featureTable)                                #
    featureTable                                       #
  }                                                    #

#  confusionMatrix <- function(votesRegression, votedNotGuiltyPredictions) {
#    xtabs(~ VotedNotGuilty + VotedNotGuiltyPred,       #
#          data = data.frame(VotedNotGuilty     = votesRegression$"VotedNotGuilty",
#                            VotedNotGuiltyPred = votedNotGuiltyPredictions))
#  }                                                    #

#  regressTrumpMargin <- function(predictors, votesRegression) {
#    ## Simple-minded regression model on TrumpMargin only, not crossvalidated
#    cat(sprintf("* Trying simple-minded univariate regression on TrumpMargin"))
#    mdlTrumpMargin <- glm(VotedNotGuilty ~ TrumpMargin, family = "binomial", data = votesRegression)
#    print(summary(mdlTrumpMargin))
#    print(confint(mdlTrumpMargin))
#    print(pR2(mdlTrumpMargin)[["McFadden"]])
#    print(confusionMatrix(votesRegression, predict(mdlTrumpMargin, type = "response") > 0.5))
#    mdlTrumpMargin
#  }

  ##
  ## Main body of script begins here
  ##

  withTranscript(dataDir, dataDir, txFile, "Republican impeachment vote analysis", function() {

    heraldPhase("Data loading and marshalling into omnibus form")
    cat(sprintf("* Loading datasets:"))                #
    maybeAssign("votesVerdict", function() { readVerdictVotes(dataDir, senateVotesVerdictFile) })
    maybeAssign("votesConst",   function() { readConstVotes(dataDir, senateVotesConstFile)     })
    maybeAssign("votesPopular", function() { readPopularVotes(dataDir, stateVotesFile)         })
    maybeAssign("reelections",  function() { readReelections(dataDir, senatorElectionFile)     })
    cat(sprintf("\n\n* Using outer joins to make omnibus dataset"))
    maybeAssign("votes", function() {                  # Combine those w/joins on State or Senator
      makeOmnibusVotes(votesVerdict, votesConst, votesPopular, reelections, dataDir, omnibusFile)
    })                                                 # Saved to omnibus file
    cat("\n")                                          #

    heraldPhase("Exploratory statistics")              #
    maybeAssign("xtabsDone",       function() { doCrosstabulations(votes) })
    maybeAssign("votesRegression", function() { makeRegressionDataframe(votes) })
    maybeAssign("predictors",      function() {        # Amenable to coercion to numeric matrix
      as.matrix(subset(votesRegression, select = -c(State, Senator, FoldID, VotedNotGuilty)))
    })                                                 #
    maybeAssign("biclusterDone", function() {          #
      biclusterPredictorCorrelations(predictors, dataDir, corrFile)
    })                                                 #
    maybeAssign("featureTable",    function() {        #
      exploreFeatures(subset(votesRegression, select = -c(State, Senator, FoldID)))
    })                                                 #

    heraldPhase("Supervised classifier to predict VoteVerdict")
    ## *** CHECK: Removing VotedUnconst goes strict party lines, getting 7 Repub guilty votes wrong
    ## predictors <<- predictors[, setdiff(colnames(predictors), c("VotedUnconst"))]
    cv.mdl <<- cv.glmnet(x            = predictors,
                         y            = votesRegression$"VotedNotGuilty",
                         foldid       = votesRegression$"FoldID",
                         family       = "binomial",
                         type.measure = "deviance",
                         keep         = TRUE,
                         alpha        = 1)

    print(coef(cv.mdl, s = "lambda.min"))
    print(coef(cv.mdl, s = "lambda.1se"))
    withPNG(file.path(dataDir, cvPlotFile), 400, 400, FALSE, function() {
      withPars(function() {
        plot(cv.mdl, main = "Crossvalidation: Error vs Model Complexity")
      }, pty = "m",
         mar = c(3, 3, 4, 1),
         mgp = c(1.7, 0.5, 0),
         ps  = 14)
    })

    print(confusion.glmnet(cv.mdl,
                           newx   = predictors,
                           newy   = votesRegression$"VotedNotGuilty",
                           family = "binomial",
                           s      = cv.mdl$"lambda.min")) # same result for lambda.1se

    print(assess.glmnet(cv.mdl$"fit.preval",
                        newy   = votesRegression$"VotedNotGuilty",
                        family = "binomial",
                        s      = cv.mdl$"lambda.min")[c("deviance", "class", "auc")])

    withPNG(file.path(dataDir, rocFile), 400, 400, FALSE, function() {
      withPars(function() {
        rocs <- roc.glmnet(cv.mdl$"fit.preval", newy = votesRegression$"VotedNotGuilty")
        best <- which(cv.mdl$"lambda" == cv.mdl$"lambda.min") # cv.mdl$"index"["min",]
        plot(rocs[[best]], type = "l", main = "Impeachment Vote ROC")
        invisible(sapply(rocs, lines, col = "gray"))
        lines(rocs[[best]], lwd = 2, col = "red")
        legend("bottomright", bg = "antiquewhite", inset = 0.01,
               lty = "solid", lwd = 2,
               col    = c("red",              "gray"),
               legend = c("Best LASSO model", "Other LASSO models"))
      }, pty = "m",
         mar = c(3, 3, 2, 1),
         mgp = c(1.7, 0.5, 0),
         ps  = 14)
    })

  })                                                   #
}                                                      #
