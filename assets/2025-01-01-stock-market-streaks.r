## Created on Monday, December 30, 2024 at 4:36pm EST by Weekend Editor on Weekend Editor Machine.
## Copyright (c) 2024, Some Weekend Reading blog.  All rights reserved.  As if you care.

##
## Is a streak of 11 daily losses in the stock market meaningful?
## https://www.youtube.com/watch?v=1O1omBG3CcU
##
## Data on price and dividend history of VTI (Vanguard Total US Stock Market Index Fund)
## from Yahoo Finance:
## https://finance.yahoo.com/quote/VTI/history/?ncid=100001727&guccounter=1&period1=1577737796&period2=1735590556
##

toolsDir <- "../../tools"                              # Random tools
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphics things
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff

library("plyr")                                        # For ddply() et al.

## > rm("vtiData", "riseP", "streaks"); doit()
doit <- function(## Inputs
                 dataDir     = ".",
                 vtiDataFile = "2025-01-01-stock-market-streaks-vti-price-history.tsv",

                 ## Outputs
                 resultsDir   = ".",
                 txFile       = "2025-01-01-stock-market-streaks.txt",
                 betaPlotFile = "2025-01-01-stock-market-streaks-posterior-beta.png",
                 barplotsFile = "2025-01-01-stock-market-streaks-barplots-%s.png") {

  loadVTIData <- function(dataDir, vtiDataFile) {      # Load and adjust the price series for VTI
    f <- file.path(dataDir, vtiDataFile)               # Pathname to the data file
    cat(sprintf("* Loading VTI daily price time series from %s.", f))
    vtiData <- transform(read.table(f, header = TRUE, sep = "\t", stringsAsFactors = TRUE),
                         Date = as.Date(as.character(Date), format = "%Y-%b-%d"))
    vtiData <- vtiData[order(vtiData$"Date"), ]        # Sort in increasing order of date
    vtiData <- transform(vtiData, Adj.Rise = c(NA, diff(Adj.Close) > 0))
    vtiData <- subset(vtiData, subset = complete.cases(vtiData))
    dateRange <- range(vtiData$"Date")                 # Get range of dates after removing initial NA
    cat(sprintf("\n  - Date range: %s - %s.", dateRange[[1]], dateRange[[2]]))
    cat(sprintf("\n  - We thus have %d trading days for which the day change is computable.", nrow(vtiData)))
    cat("\n")                                          #
    vtiData                                            # Return the data
  }                                                    #

  betaPosterior <- function(ns, ks, destDir, plotFile,
                            reportQs = c("LCL" = 0.025, "Central" = 0.500, "UCL" = 0.975),
                            doPlot = TRUE, npoints = 1000, plim = c(0.0, 1.0), cols = c("blue"),
                            legendLoc = "topleft",
                            muzzled = FALSE) {
    ## Baysian estimate & credibility interval for p parameter of binomial distribution
    ##
    ## Let p = probability of event
    ## Start with a uniform prior on p, which happens to be B(1, 1).
    ## After n observations, of which k were events, we have p ~ B(n - k + 1, k + 1).
    ##
    ## if ns and ks are vectors of equal length, the elements are processed in a loop.
    ##
    ## Returns a dataframe of n, k, pLCL, pCentral, and pUCL.  Optionally does plot of densities.

    stopifnot(length(ns) == length(ks) && is.numeric(ns) && is.numeric(ks))
    if (length(ns) > 1) stopifnot(length(ns) == length(cols))

    maybeCat <- function(str, muzzled) { if (!muzzled) cat(str) }
    betaQDF  <- function(q, n, k) { qbeta(q, k + 1, n - k + 1)  }
    betaPDF  <- function(p, n, k) { dbeta(p, k + 1, n - k + 1)  }

    maybeCat("\n* Doing Baysian posterior Beta distribution analysis", muzzled)
    bayesProbs <- ddply(data.frame(N = ns, K = ks), c("N", "K"), function(nk) {
      n <- nk[[1, 1]]                                  # Next value of n
      k <- nk[[1, 2]]                                  # Next value of k
      maybeCat(sprintf("\n  - Case n = %d, k = %d.", n, k), muzzled)
      data.frame(N        = n,                         # Build dataframe of central estimate of p
                 K        = k,                         #  and its credibility interval
                 pLCL     = betaQDF(reportQs[["LCL"]],     n, k),
                 pCentral = betaQDF(reportQs[["Central"]], n, k),
                 pUCL     = betaQDF(reportQs[["UCL"]],     n, k))
    })                                                 #

    if (!muzzled) { cat("\n"); print(bayesProbs) }     # Show off the fish we caught
    if (doPlot) {                                      # If doing the plot
      bdf <- data.frame(p = seq(from = plim[[1]], to = plim[[2]], length.out = npoints))
      ddply(bayesProbs, c("N", "K", "pLCL", "pCentral", "pUCL"), function(df) {
        n <- df[1, "N"]                                #
        k <- df[1, "K"]                                #
        bdf <<- cbind(bdf, data.frame(X = betaPDF(bdf$"p", n, k)))
        colnames(bdf)[ncol(bdf)] <<- sprintf("Density.%d.%d", n, k)
        NULL                                           # Called for side-effect on bdf, not for value
      })                                               #
      f <- file.path(destDir, plotFile)                # Where the plot goes
      withPNG(f, 700, 700, FALSE, function() {         # Capturing output to file
        withPars(function() {                          # Binding graphics parameters
          matplot(x = bdf[, 1], y = bdf[, -1],         #
                  type = "l", lty = "solid", lwd = 2, col = cols,
                  xlab = "p", ylab = "Pr(p)",          #
                  main = "Posterior Beta Densities: Infection p, Given Treatment")
          legend(legendLoc, bg = "antiquewhite", inset = 0.01,
                 lty = "solid", lwd = 2, col = cols,   #
                 legend = dlply(bayesProbs, c("N", "K", "pLCL", "pCentral", "pUCL"), function(df) {
                   sprintf("n = %d, k = %d, p = %.2f (%.2f - %.2f)",
                           df[1,"N"], df[1, "K"], df[1, "pCentral"], df[1, "pLCL"], df[1, "pUCL"])
                 }))                                   #
        }, pty = "m",                                  # Maximal plotting area
        bg  = "white",                              # White background
        mar = c(3, 3, 2, 1),                        # Pull in on margins a bit
        mgp = c(1.7, 0.5, 0),                       # Axis title, labels, ticks
        ps  = 16)                                   # Larger type size for file capture
      })                                               #
      maybeCat(sprintf("\n\n* Bayesian Beta posterior plot to %s.", f), muzzled)
    }                                                  # Done with the plot
    bayesProbs                                         # Return table of estimates
  }                                                    #

  estimateRiseProbability <- function(vtiData, resultsDir, betaPlotFile) {
    cat(sprintf("\n* Estimating probability stock market rises on any single day"))
    cat(sprintf("\n  - Naive estimate: of our %d trading days, the rise (true)/fall (false) days were:",
                nrow(vtiData)))                        #
    riseTbl <- table(vtiData$"Adj.Rise")               #
    print(riseTbl)                                     #
    naiveP <- riseTbl[["TRUE"]] / (sum(riseTbl))       #
    cat(sprintf("  - Naive probability stock market rises on a given day p = %.2f%%", 100.0 * naiveP))

    bayesianP <- betaPosterior(sum(riseTbl), riseTbl[["TRUE"]], resultsDir, betaPlotFile, muzzled = TRUE)
    cat(sprintf("\n  - Bayesian posterior Beta estimate (95%% credibility interval): p = %.2f%% (%.2f%% - %.2f%%)",
                100.0 * bayesianP[1, "pCentral"],      #
                100.0 * bayesianP[1, "pLCL"], 100.0 * bayesianP[1, "pUCL"]))
    cat(sprintf("\n  - Density plot to %s\n", file.path(resultsDir, betaPlotFile)))
    bayesianP                                          #
  }                                                    #

  findStreaks <- function(vtiData, resultsDir, barplotsFile) { # *** parameter in file name: up/down

    processStreakType <- function(streaks, type, typeName, resultsDir, barplotsFile) {
      streaksTable <- table(streaks$"lengths"[streaks$"values" == type])

      f <- file.path(resultsDir, sprintf(barplotsFile, typeName))
      withPNG(f, 700, 700, FALSE, function() {         # Capturing output to file
        withPars(function() {                          # Binding graphics parameters
          barplot(streaksTable, col = "blue",
                  main = sprintf("Frequency of '%s' Streaks", typeName),
                  xlab = "Streak Length (days)",
                  ylab = sprintf("Number of Streaks (in %d trading days)", nrow(vtiData)))
        }, pty = "m",                                  # Maximal plotting area
           bg  = "white",                              # White background
           mar = c(3, 3, 2, 1),                        # Pull in on margins a bit
           mgp = c(1.7, 0.5, 0),                       # Axis title, labels, ticks
           ps  = 16)                                   # Larger type size for file capture
      })                                               #
      cat(sprintf("\n  - For %s streaks (plot to %s):", typeName, f))
      print(streaksTable)
      streaksTable
    }

    cat(sprintf("* Analyzing streaks with run-length encoding"))
    streaks <- rle(vtiData$"Adj.Rise")                 # Run Length Encoding does the job
    list("down" = processStreakType(streaks, FALSE, "down", resultsDir, barplotsFile),
         "up"   = processStreakType(streaks, TRUE,  "up",   resultsDir, barplotsFile))
  }                                                    #

  runProbability <- function(n, m, p) {
    ## https://math.stackexchange.com/questions/2480924/if-i-flip-a-biased-coin-n-times-what-is-the-probability-that-i-get-a-streak-o/2480931#2480931
    ## https://math.stackexchange.com/questions/59738/probability-for-the-length-of-the-longest-run-in-n-bernoulli-trials/59749#59749
    sum(sapply(1 : floor(n/m), function(j) {           # Sum over j from 1 to floor(n/m)
      ## *** Values are alternating, become very large then go to 0.
      ##     for j = 166 - 609, result is NaN, thereafter +0 or -0.
      ## Is choose() blowing up?  Yes, basically choose is infinite for those terms.  5921 trials is a lot!
#      (-1)^(j+1) * (p + ((n-j*m+1)/j)*(1-p)) * choose(n-j*m, j-1) * p^(j*m) * (1-p)*(j-1)
      ## Use lchoose() to get log of combinatoric, do the multiply in log space, then exponentiate
      ## This is a NUMERICALLY TERRIBLE idea; the chance this is stable is almost nil.
      (-1)^(j+1) * (p + ((n-j*m+1)/j)*(1-p)) * exp(lchoose(n-j*m, j-1) + (j*m)*log(p) + (j-1)*log(1-p))
    }))                                                #
  }                                                    #

  ## Main body of script begins here
  withTranscript(dataDir, resultsDir, txFile, "Stock Market Streaks", function() {

    heraldPhase("Loading data")                        # Load the data
    maybeAssign("vtiData", function() { loadVTIData(dataDir, vtiDataFile) })

    heraldPhase("Estimating probability of 1-day rise")# Estimate prob stock market rises on a given day
    maybeAssign("riseP", function() { estimateRiseProbability(vtiData, resultsDir, betaPlotFile) })

    heraldPhase("Characterizing streaks")              #
    maybeAssign("streaks", function() { findStreaks(vtiData, resultsDir, barplotsFile) })

    ## Compute probability of streaks of various lenghts; binomially how often in this many trading days.
    ##
    ## Turns out that's hard!
    ##
    ## https://math.stackexchange.com/questions/2480924/if-i-flip-a-biased-coin-n-times-what-is-the-probability-that-i-get-a-streak-o
    ## https://www.askamathematician.com/2010/07/q-whats-the-chance-of-getting-a-run-of-k-successes-in-n-bernoulli-trials-why-use-approximations-when-the-exact-answer-is-known/
    ## https://math.stackexchange.com/questions/59738/probability-for-the-length-of-the-longest-run-in-n-bernoulli-trials/59749#59749
    ## https://www.csun.edu/~hcmth031/tlroh.pdf
    cat(sprintf("\n* For %d trading days, probability of decline of %.2f%%, run length = %d days:",
                nrow(vtiData),                         #
                100.0 * (1- riseP[1, "pCentral"]),     #
                as.integer(max(names(streaks$"down")))))
    cat(sprintf("\n  - The probability is %f.\n",      #
                runProbability(nrow(vtiData),          #
                               as.integer(max(names(streaks$"down"))),
                               1 - riseP[1, "pCentral"])))
  })                                                   # Done!
}                                                      #
