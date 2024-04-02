## Created on Thursday, March 21, 2024 at 12:02pm EDT by WeekendEditor on WeekendEditorMachine.
## UnCopyright (c) 2024, SomeWeekendReading.blog.  All rights reversed.  As if you care.

library("plyr")                                        # For ddply()
library("pwr")                                         # For ES.h()
source("../../tools/pipeline-tools.r")                 # Random pipeline stuff
source("../../tools/graphics-tools.r")                 # Random graphics stuff

##
## Is Republican partisanship associated with US federal government shutdowns, 1995-2024?
##

## > rm("shutdownData", "shutdownSignif", "shutdownStrength", "shutdownBayes"); doit()
doit <- function(dataStr = "Date	House	Senate	Presidency	Days
1995-Nov	R	R	D	5
1995-Dec	R	R	D	21
2013-Sep	R	D	D	16
2018-Jan	R	R	R	2
2018-Dec	R	R	R	34
2024-Mar	R	D	D	NA",
                 yatesCorrect = FALSE,                 # TRUE gives slightly less significance
                 dataFile     = "2024-03-21-springtime-for-shutdown-data.tsv",
                 resultsFile  = "2024-03-21-springtime-for-shutdown-results.tsv",
                 plotFile     = "2024-03-21-springtime-for-shutdown.png",
                 plotFile2    = "2024-03-21-springtime-for-shutdown-2.png",
                 txFile       = "2024-03-21-springtime-for-shutdown.txt") {

  makeData <- function(dataStr, dataFile) {            # Convert string to dataframe
    shutdownData <- read.table(text = dataStr, sep = "\t", header = TRUE, stringsAsFactors = TRUE)
    cat(sprintf("* Found: %d rows x %d columns (%s)\n",# Describe the data
                nrow(shutdownData), ncol(shutdownData),#  to the transcript
                paste(colnames(shutdownData), collapse = ", ")))
    print(shutdownData)                                #
    f <- file.path(".", dataFile)                      #
    saveDataframe(shutdownData, dataFile)              #
    cat(sprintf("\n* Saved to %s.\n", f))              #
    shutdownData                                       # Return the data
  }                                                    #

  doSignificance <- function(shutdownData, yatesCorrect) {
    cat(sprintf(paste("* Using test of proportion:",   #
                      "  - Yates correction: %s",      #
                      "  - Alternative: probability of Republicans in shutdown > 0.5\n\n",
                      sep = "\n"),                     #
                yatesCorrect))                         #
    foo <- subset(shutdownData, select = c(House, Senate, Presidency))
    N   <- nrow(foo)                                   #
    bar <- transform(ldply(colnames(foo), function(branch) {
      k <- sum(foo[, branch] == "R")                   # Number of shutdowns w/Republican in branch
      data.frame("Branch"      = branch,               #
                 "NShutdowns"  = N,                    #
                 "NRepublican" = k,                    #
                 ## Alternative: is the probability of Republican misrule > 0.5?
                 ## Turn off Yates continuity correction for such a small sample?
                 "p"           = round(prop.test(k, N, #
                                                 alternative = "greater",
                                                 correct = yatesCorrect)$"p.value",
                                       digits = 3))    #
    }), "FDR" = round(p.adjust(p, method = "BH"), digits = 3))
    bar <- bar[order(bar$"FDR"), ]                     # Sort by false discovery rate
    print(bar)                                         #
    bar                                                # Return significance matrix
  }                                                    #

  doStrength <- function(shutdownSignif) {             # Stength of effect
    ## See, for Cohen's h: https://en.wikipedia.org/wiki/Cohen%27s_h
    ## We're going to use Cohen's h, but very crudely.  We compare the observed proportion of
    ##   shutdowns under Republican rule vs the null hypohtesis of 0.5.
    ## h = 2 * (asin(sqrt(p)) - asin(sqrt(0.5)))
    ## This can range from -pi to +pi (or 0 to pi when nondirectional).
    ## Anything over 0.8 is large.
    cat(sprintf(paste("* Computing Cohen's h for strength of effect",
                      "  - Range of h is -pi to +pi",
                      "  - anything with absolute value over 0.8 is a large effect.\n\n",
                      sep = "\n")))                    #
    shutdownStrength <- transform(shutdownSignif,      #
                                  AbsCohenh = round(abs(ES.h(NRepublican / NShutdowns, 0.5)),
                                                    digits = 3))
    print(shutdownStrength)                            #
    shutdownStrength                                   #
  }                                                    #

  doBeta <- function(shutdownStrength, plotFile, resultsFile,
                     npoints = 1000,
                     colors  = c("House" = "red", "Senate" = "green", "Presidency" = "blue")) {
    cat(sprintf("* Doing Baysian posterior Beta distribution analysis."))
    ## Let p = probability of a shutdown for a party.
    ## Start with a uniform prior on p, which happens to be B(1, 1).
    ## After observing N shutdowns, of which k were with the party, we have B(N - k + 1, k + 1).
    f <- file.path(".", plotFile)                      # Where the plot goes
    withPNG(f, 700, 700, FALSE, function() {           # Capturing output to file
      withPars(function() {                            # Binding graphics parameters
        ## *** Why can't I think of a more elegant way to build this dataframe?!
        ps  <- seq(from = 0.0, to = 1.0, length.out = npoints)
        foo <- ddply(shutdownStrength, "Branch", function(branch) {
          stopifnot(nrow(branch) == 1)                 #
          n                  <- branch[[1, "NShutdowns"]]
          k                  <- branch[[1, "NRepublican"]]
          dbeta(ps, k + 1, n - k + 1)                  #
        })                                             #
        rownames(foo) <- foo[, "Branch"]; foo <- t(subset(foo, select = -Branch))
        bdf <- cbind(ps, foo); rownames(bdf) <- 1 : nrow(bdf)
        bdf <- bdf[, c("ps", names(colors))]           # Ensures column order is colors order

        matplot(x = bdf[, 1], y = bdf[, -1],           #
                type = "l", lty = "solid", lwd = 2, col = colors,
                xlab = "p", ylab = "Pr(Shutdown | Republicans in branch)",
                main = "Posterior Beta Densities: Shutdowns Given Republicans in Each Branch")
        legend("topleft", bg = "antiquewhite", inset = 0.01,
               lty = "solid", lwd = 2, col = colors, legend = names(colors))

      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })                                                 #
    cat(sprintf("* Bayesian Beta posterior plot to %s.\n", f))
    shutdownBayes <- transform(shutdownStrength,       #
                               MedianPr = round(qbeta(0.5,
                                                      NRepublican + 1,
                                                      NShutdowns - NRepublican + 1),
                                                digits = 3))
    print(shutdownBayes)                               # Show augmented results
    f <- file.path(".", resultsFile)                   #
    saveDataframe(shutdownBayes, resultsFile)          #
    cat(sprintf("\n* Saved to %s.\n", f))              #
    shutdownBayes                                      # Return augmented dataframe
  }                                                    #

  doBeta2 <- function(RepTerms, RepShutdowns, DemTerms, DemShutdowns, plotFile2,
                      nPoints = 1000,
                      colors  = c("Republican" = "red", "Democratic" = "blue")) {
    f <- file.path(".", plotFile2)                     #
    withPNG(f, 700, 700, FALSE, function() {           # Capture graphics to file
      withPars(function(){                             # Save/restore graphics parameters
        bdf <- transform(data.frame(ps = seq(from = 0.0, to = 1.0, length.out = nPoints)),
                         Republican = dbeta(ps, RepShutdowns + 1, RepTerms - RepShutdowns + 1),
                         Democratic = dbeta(ps, DemShutdowns + 1, DemTerms - DemShutdowns + 1))
        bdf <- bdf[, c("ps", names(colors))]           # Put cols in right order
        matplot(x = bdf[, 1], y = bdf[, -1],
                type = "l", lty = "solid", lwd = 2, col = colors,
                xlab = "p", ylab = "Pr(pShutdown | Party)",
                main = "Posterior Beta Density: Shutdown Probability by Party")
        legend("topright", bg = "antiquewhite", inset = 0.01,
               lty = "solid", lwd = 2, col = colors, legend = names(colors))

      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })                                                 #
    cat(sprintf("\n* Bayesian Beta postieror of p shutdowns to %s.", f))
  }

  withTranscript(inDir = ".", resultsDir = ".", transcriptFile = txFile,
                 name = "Republicans & Shutdowns", function() {
    heraldPhase("Building dataframe of data")          # Read from input string
    maybeAssign("shutdownData", function() { makeData(dataStr, dataFile) })

    heraldPhase("Assessing statistical significance")  # Assess statistical significance
    maybeAssign("shutdownSignif", function() { doSignificance(shutdownData, yatesCorrect) })

    heraldPhase("Assessing strength of effect")        # Assess strength of effect
    maybeAssign("shutdownStrength", function() { doStrength(shutdownSignif) })

    heraldPhase("Bayesian Posterior Beta Distributions")
    maybeAssign("shutdownBayes", function() { doBeta(shutdownStrength, plotFile, resultsFile) })

    ## Addendum: posterior beta of probability of shutdown for each party in House
    doBeta2(11, 6, 6, 0, plotFile2)

  })                                                   # Done
}                                                      #
