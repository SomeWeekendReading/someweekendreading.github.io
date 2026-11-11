## Created on Friday, November  6, 2026 at 9:36pm EST by Weekend Editor on Weekend Editor Machine.
## Copyright (c) 2026, Some Weekend Reading blog.  All rights reserved.  As if you care.

toolsDir <- "../tools"                                 # My box of magic swords
source(file.path(toolsDir, "graphics-tools.r"))        # Graphix hax
source(file.path(toolsDir, "pipeline-tools.r"))        # Making an analysis pipeline

library("rgl")                                         # For 3d animated plot of the origin of the
library("magick")                                      #  ternary plot as a triangle in 3d space

## There are Dirichlet density functions ddirichlet() in gtools, DirichletReg, Boom, and MCMCpack:
## - Boom and MCMCpack are really centered around something else, so loading them would
##   involve lots of stuff I'm not using.
## - Initially I tried gtools, but the ternary plot found all 0's.  The probability is so
##   concentrated around the median that a reasonable grid got nothing.  So I needed to escape
##   to log-probability space, and gtools wouldn't do that but DirichletReg would.
library("DirichletReg")                                # For ddirichlet(), especially log-prob
library("Ternary")                                     # Ternary plot
library("PlotTools")                                   # For SpectrumLegend()a

##
## An election is a binomial (or multinomial, in case of multiple candidates) trial.
##
## Observing the vote counts, we'd like to think we're awarding office to the candidate
## who has the highest probability of attracting voters.
##
## Are we doing that, and how sure of that are we in the case of close elections?
##
## - For a 2-way election, the vote counts are binomially distributed, according to the
##   (unknown) probabilities p1, p2 = 1-p1 that each candidate has to attract votes.
##   o The conjugate prior of the binomial distribution is the Beta distribution.  If we
##     start, as most do, from Beta(1,1) = Uniform distributions on p1 and p2, then simple
##     vote counts tell us the posterior distribution for p1, p2, i.e., distributions that
##     tell us what we've learned from the election.
## - For a 3-way (or higher) election, the vote counts are multinomially distributed, according
##   to the (unknown) probabilities p1, ..., pM with p1 + ... + pM = 1 for M candidates.
##   o The conjugate prior of the multinomial distribution is the Dirichlet distribution.
##   o So that's what we use here.  Getting a 95% confidence region is much harder, since we're
##
## In other words,
## binomial : Beta :: multinomial : Dirichlet
##
## https://en.wikipedia.org/wiki/Dirichlet_distribution
##

## > rm("candidatesAndVotes", "candidatesAndVotesDirichlet", "candidatesAndVotesBeta"); doit()
##
## Then force the movie to loop, despite instructions below, using ImageMagick @ command line:
##
## $ convert -loop 0 close-3-way-election-dirichlet.gif close-3-way-election-dirichlet-loop.gif
##
## NB: This command is now deprecated in the version of ImageMagick I have installed.
## So until I learn the new-fangled way, I beg pardon for my old-fangled magick.
## These days, I'm grateful to be fangled at all.
doit <- function(## Inputs
                 dataDir       = "./data",             # Where the data lives
                 dataFile      = "candidates-and-votes.tsv",
                 ## if dropCandidate is NA, then don't do the 2-way comparison
                 dropCandidate = "Pinkins",            # Drop to do a 2-way analysis w/95% cl's
                 confLim       = 0.05,                 # Alpha for confidence limits
                 cand1Color    = "blue",               # Color for 1st candidate
                 cand2Color    = "red",                # Color for 2nd candidate
                 cand3Color    = "black",              # Color for 3rd candidate
                 plim          = c(0.495, 0.505),      # p range for posterior density plot
                 nPoints       = 1000,                 # Number of points to plot
                 theta         = pi/10,                # For the 3d animation of the triangle
                 phi           = -pi/4,                #  origin in ternary plots
                 rotn          = -pi,                  #
                 duration      = 5,                    #

                 ## Outputs
                 resultsDir    = "./results",          # Where results go
                 txFile        = "close-3-way-election-transcript.txt",
                 saveFile      = "close-3-way-election-%s.tsv") {

  readData <- function(dataDir, dataFile) {            # Read in election counts so far
    f <- file.path(dataDir, dataFile)                  # Full pathname to data
    cat(sprintf("* Reading data from %s", f))          # Read as tab-sep file, # comment gives source
    candidatesAndVotes <- read.table(f, sep = "\t", header = TRUE, comment.char = "#")
    stopifnot(nrow(candidatesAndVotes) == 3 &&         # Check number of rows is right
              ncol(candidatesAndVotes) == 2 &&         # Check number of cols is right & right names
              all(colnames(candidatesAndVotes) == c("Candidate", "Votes")))
    cat(sprintf("\n  - Found the expected %d rows of %d columns: %s",
                nrow(candidatesAndVotes), ncol(candidatesAndVotes),
                paste(colnames(candidatesAndVotes), collapse = ", ")))

    totalVotes <- sum(candidatesAndVotes[, "Votes"])   # Report total votes, use for crude fractions
    cat(sprintf("\n  - Total votes: %d\n\n", totalVotes))
    candidatesAndVotes <- transform(candidatesAndVotes, FracTotal = Votes / totalVotes)

    print(candidatesAndVotes)                          # Show off the fish we caught
    candidatesAndVotes                                 # Return the data
  }                                                    #

  dirichletAnalysis <- function(candidatesAndVotes, cand1Color, cand2Color, cand3Color,
                                resultsDir, saveFile) {

    addDirichletMAP <- function(candidatesAndVotes) {  # Mode of posterior (Max A-posteriori Prob)

      dirichletMAP <- function(ks) { (ks - 1) / (sum(ks) - 3) }

      candidatesAndVotesDirichlet <- transform(candidatesAndVotes, DirichletMode = dirichletMAP(Votes))
      stopifnot(abs(sum(candidatesAndVotesDirichlet$"DirichletMode") - 1) <= 1.0e-6)
      cat(sprintf("* MAP estimates (modes) for each candidate's probability to attract a vote:\n\n"))
      print(candidatesAndVotesDirichlet)               # Show mode of posterior distr (a 3-vector)
      candidatesAndVotesDirichlet                      # Return augmented dataframe
    }                                                  #

    makeDirichletTrianglePlotFile <- function(resultsDir, saveFile) {

      plot3dTriangle <- function(theta, phi) {
        ## rotate to the spherical coordinates position (theta, phi). (Here w/standard meanings.)
        ## *** I completely don't understand this, since it appears to contradict the documentation.
        ##     But a certain amount of fiddling around made it look sorta ok.
        view3d(userMatrix =                            # Initially y goes up & x goes right?
                 rotationMatrix(-pi/2, 1, 0, 0)        # Rotate about x to put xy @ bottom, z up
                 %*% rotationMatrix(theta, 1, 0, 0)    # Rotate about x to position theta
                 %*% rotationMatrix(phi,   0, 0, 1))   # Rotate about z to position phi
        plot3d(x = c(1, 0, 0), y = c(0, 1, 0), z = c(0, 0, 1),
               xlim = c(0, 2.5), ylim = c(0, 2.5), zlim = c(0, 2.5),
               type = "s", col = "blue", size = 2, box = FALSE, axes = FALSE, decorate = FALSE)
        arrow3d(p0 = c(0, 0, 0), p1 = c(2, 0, 0), type = "lines", barblen = 0.1)
        arrow3d(p0 = c(0, 0, 0), p1 = c(0, 2, 0), type = "lines", barblen = 0.1)
        arrow3d(p0 = c(0, 0, 0), p1 = c(0, 0, 2), type = "lines", barblen = 0.1)
        text3d(2.5, 0,   0,   "p1")                    # Hand-drawn axis arrows & names
        text3d(0,   2.5, 0,   "p2")                    #  because the default keeps getting redrawn
        text3d(0,   0,   2.5, "p3")                    #  as we rotate!
        polygon3d(x = c(1, 0, 0), y = c(0, 1, 0), z = c(0, 0, 1), fill = TRUE, col = "lightblue")
      }

      makeMovie <- function(firstFrameFn, rotn, duration, resultsDir, movieFile) {
        ## Sometimes, when using withPNG() to capture graphics to a file as above, we leave
        ## the world in too weird a state for this code to cope.  So get a new graphics device.
        ## *** should use rgl.open() instead?  open3d()?
        ## *** also, how to set margins for plot so it all stays visible while rotating?
        graphics.off(); dev.new()                      # Opens bogus graphics window?
        firstFrameFn()                                 # Draw first frame
        umx    <- par3d("userMatrix")                  #
        interp <- par3dinterp(times       = c(0, duration/2),
                              userMatrix  = list(umx,  # Rotate about z axis by rotn halfway through
                                                 umx %*% rotationMatrix(rotn, 0, 0, 1)),
                              ## This made a nice GIF, but despite this "oscillate" instruction
                              ## both Chrome and Firefox (on MacOS) did NOT loop.  So I had to use
                              ## this (deprecated?!) ImageMagick command to force creation of
                              ## a looping GIF.
                              ## > convert -loop 0 close-3-way-election-dirichlet.gif close-3-way-election-dirichlet-loop.gif
                              extrapolate = "oscillate")
        movie3d(interp, duration, movie = movieFile, dir = resultsDir, verbose = TRUE)
      }                                                #

      ## NB: No directory & no .gif suffix; the movie3d() will take care of that for us.
      f <- gsub("^(.*)\\.tsv$", "\\1", sprintf(saveFile, "dirichlet"))
      makeMovie(function() { plot3dTriangle(theta, phi) }, rotn, duration, resultsDir, f)
      cat(sprintf("\n* Movie of unit triangle written to %s.\n",
                  file.path(resultsDir, sprintf("%s.gif", f))))
    }                                                  #

    makeDirichletPlotFile <- function(candidatesAndVotesDirichlet, resultsDir, saveFile) {
      f <- file.path(resultsDir, gsub("^(.*)\\.tsv$", "\\1.png", sprintf(saveFile, "dirichlet")))
      withPNG(f, 1000, 1000, FALSE, function() {
        withPars(function() {

          ## See:
          ## https://cran.r-project.org/web/packages/Ternary/vignettes/interpolation.html
          ## https://cran.r-project.org/web/packages/Ternary/vignettes/Ternary.html (contours section)
          alphas <- candidatesAndVotesDirichlet[, "Votes"] + 1
          contourFn <- Vectorize(function(a, b, c) {   # NB: arg names MUST BE a, b, c!
            ## a - c + (4 * a * b) + (27 * a * b * c) # Example from docs to see it really works
            ##
            ## ddirichlet() returns all 0's: peak is *so* concentrated that a reasonable sampling
            ## grid doesn't see it.  So, denser grid and escape to log space.  Had to switch
            ## to DirichletReg package, since gtools:ddirichlet() didn't support logs.
            ddirichlet(matrix(data = c(a, b, c), nrow = 1, byrow = TRUE), alphas, log = TRUE)
          }, vectorize.args = c("a", "b", "c"))        #
          values <<- TernaryPointValues(contourFn, resolution = 96)

          TernaryPlot(alab        = sprintf("%s \U2192", candidatesAndVotesDirichlet[1, "Candidate"]),
                      blab        = sprintf("%s \U2192", candidatesAndVotesDirichlet[2, "Candidate"]),
                      clab        = sprintf("\U2190 %s", candidatesAndVotesDirichlet[3, "Candidate"]),
                      axis.cex    = 2,                 #
                      lab.col     = c(cand1Color, cand2Color, cand3Color),
                      lab.cex     = 2,                 #
                      lab.offset  = 0.10,              #
                      panel.first = {                  # Opaque colors UNDER the ternary grid lines
                        ColourTernary(values, spectrum = hcl.colors(256))
                      },                               #
                      panel.last   = {                 # Main title of plot, pulled in a bit
                        title(main     = sprintf("%s: Log Posterior Dirichlet to Attract Votes",
                                                 paste(candidatesAndVotesDirichlet[, "Candidate"],
                                                       collapse = ", ")),
                              line     = -4,           # Pulled in... a lot?
                              cex.main = 1.75)         # Expand font
                        TernaryPoints(candidatesAndVotesDirichlet[, "DirichletMode"],
                                      pch = 4, cex = 2, lwd = 2)
                      })                               # Also label MAP (mode)
          TernaryContour(contourFn, resolution = 96, nlevels = 25, zlim = c(-2.0e+6, 0),
                         legend = TRUE, legend... = list(x = "right", bty = "n"))

          ## *** 95% contour bolder, if somehow identified?

        }, pty = "m",                                  # Maximal plotting area
           bg  = "white",                              # White background
           ps  = 16,                                   # Larger type size
           mar = c(0.5, 0.5, 0.5, 0.5))                # Pull in on margins
      })                                               # Done with file capture
      cat(sprintf("\n* Ternary plot of Dirichlet contours written to %s.\n", f))
    }                                                  #

    saveDirichletData <- function(candidatesAndVotesDirichlet, resultsDir, saveFile) {
      f <- file.path(resultsDir, sprintf(saveFile, "dirichlet"))
      saveDataframe(candidatesAndVotesDirichlet, f)    # Save results in tab-sep file
      cat(sprintf("\n* Spreadsheet saved to %s.\n", f))#
    }                                                  #

    candidatesAndVotesDirichlet <- addDirichletMAP(candidatesAndVotes)
    makeDirichletTrianglePlotFile(resultsDir, saveFile)# Make animation showing where triangle is
    makeDirichletPlotFile(candidatesAndVotesDirichlet, resultsDir, saveFile)
    saveDirichletData(candidatesAndVotesDirichlet, resultsDir, saveFile)
    candidatesAndVotesDirichlet                        # Return input dataframe, decorated with MAP
  }                                                    #  estimators of probablity for each candidate

  betaAnalysis <- function(candidatesAndVotes, dropCandidate, confLim,
                           resultsDir, saveFile, cand1Color, cand2Color, plim, nPoints) {

    trimDataTo2Candidates <- function(candidatesAndVotes) {
      candidatesAndVotesBeta <- subset(candidatesAndVotes,
                                       subset = Candidate != dropCandidate,
                                       ## FracTotal's "total" here included the candidate we're
                                       ##  dropping, thus misleading in a 2-candidate analysis.
                                       ## Recompute it below for just the 2 remaining candidates.
                                       select = -FracTotal)
      totalVotes             <- sum(candidatesAndVotesBeta$"Votes")
      candidatesAndVotesBeta <- transform(candidatesAndVotesBeta, FracTotal = Votes / totalVotes)
      stopifnot(ncol(candidatesAndVotesBeta) == 3 & nrow(candidatesAndVotesBeta) == 2)
      candidatesAndVotesBeta                           # Return trimmed dataset
    }

    addBetaPosteriorEstimates <- function(candidatesAndVotesBeta, ps, N, k) {
      betaEsts           <- rbind(qbeta(p = ps, shape1 = k + 1,     shape2 = N - k + 1),
                                  qbeta(p = ps, shape1 = N - k + 1, shape2 = k + 1))
      ## There is no constraint corresponding to the Dirichlet one, that medians add up to 1 here?
      colnames(betaEsts) <- c("BetaLCL", "BetaMedian", "BetaUCL")
      cbind(candidatesAndVotesBeta, betaEsts)          # Add Beta estimates as new columns
    }                                                  #

    reportBetaResults <- function(candidatesAndVotesBeta, confLim, ps, N, k, cands, failProbPct) {
      cat(sprintf("* Median & %d%% CL's for top 2 candidate's probability of attracting a vote:",
                  round(100.0 * (1.0 - confLim))))     # Report/interpret probability results
      cat(sprintf("\n  - %d%% confidence limits set at probabilities %.3f - %.3f.",
                  round(100.0 * (1.0 - confLim)), ps[[1]], ps[[3]]))
      cat(sprintf("\n  - The percent chance that %s got below 50%% is %.2f%%.",
                  cands[[1]], failProbPct))            # Probabiity apparent winner actually below 50%
      cat(sprintf("\n  - The winner LCL and the loser UCL are separated by %+.3f%%.\n\n",
                  ## This code assumes candidate 1 was the winner
                  100.0 * (candidatesAndVotesBeta[1, "BetaLCL"] -
                           candidatesAndVotesBeta[2, "BetaUCL"])))
      print(candidatesAndVotesBeta)                    # Show results to transcript
    }                                                  #

    makeBetaPlotFile <- function(candidatesAndVotesBeta,
                                 N, k, failProbPct, nPoints, plim, cand1Color, cand2Color, cands,
                                 resultsDir, saveFile) {
      f <- file.path(resultsDir, gsub("^(.*)\\.tsv$", "\\1.png", sprintf(saveFile, "beta")))
      withPNG(f, 1000, 500, FALSE, function() {        # Capture graphics to file
        withPars(function() {                          # Save/restore graphics parameters
          densities <- transform(data.frame(p = seq(from = plim[[1]], to = plim[[2]],
                                                    length.out = nPoints)),
                                 d1 = dbeta(p, shape1 = k + 1,     shape2 = N - k + 1),
                                 d2 = dbeta(p, shape1 = N - k + 1, shape2 = k + 1))
          matplot(x = densities[, "p"], y = densities[, c("d1", "d2")],
                  type = "l", lty = "solid", col = c(cand1Color, cand2Color), xlim = plim,
                  xlab = "p", ylab = "Posterior Beta density for p",
                  main = sprintf("%s vs %s Posterior Beta Probability of Attracting a Vote",
                                 cands[[1]], cands[[2]]))
          abline(v = unlist(candidatesAndVotesBeta[1, c("BetaLCL", "BetaUCL")]),
                 lty = "dashed", col = cand1Color)     # Upper/lower conf limits for candidate 1
          abline(v = unlist(candidatesAndVotesBeta[2, c("BetaLCL", "BetaUCL")]),
                 lty = "dashed", col = cand2Color)     # Upper/lower conf limits for candidate 2
          tailColor   <- makeTransparentColor(cand1Color, 0.2)
          tailDensity <- subset(densities, subset = p <= 0.5)
          polygon(x = c(tailDensity$"p", 0.5), y = c(tailDensity$"d1", 0.0),
                  col = tailColor, border = NA)        # Polygon to fill in left tail below 0.5
          legend("topright", inset = c(0.005, 0.01), bg = "antiquewhite",
                 legend = c(sprintf("%s density of p",           cands[[1]]),
                            sprintf("%s %d%% confidence limits",
                                    cands[[1]], round(100.0 * (1.0 - confLim))),
                            sprintf("Pr(%s < 0.5) = %.2f%%",     cands[[1]], failProbPct),
                            NA,                        # Spacer line in legend
                            sprintf("%s density of p",           cands[[2]]),
                            sprintf("%s %d%% confidence limits",
                                    cands[[2]], round(100.0 * (1.0 - confLim)))),
                 ## Next 3 rows give a filled square with tailColor, large enough to see, no border
                 pch    = c(NA,         NA,         22,        NA, NA,         NA),
                 pt.cex = c(NA,         NA,         3,         NA, NA,         NA),
                 pt.bg  = c(NA,         NA,         tailColor, NA, NA,         NA),
                 col    = c(cand1Color, cand1Color, tailColor, NA, cand2Color, cand2Color),
                 lty    = c("solid",    "dashed",   NA,        NA, "solid",    "dashed"))
        }, pty = "m",                                  # Maximal plotting area
           bg  = "white",                              # White background
           ps  = 16,                                   # Larger type size
           mar = c(3, 3, 2, 1),                        # Pull in on margins
           mgp = c(1.7, 0.5, 0.0))                     # Axis title, label, tick spacing
      })                                               # Done with file capture
      cat(sprintf("\n* Posterior Beta densities plotted to %s\n", f))
    }

    saveBetaData <- function(candidatesAndVotesBeta, resultsDir, saveFile) {
      f <- file.path(resultsDir, sprintf(saveFile, "beta"))
      saveDataframe(candidatesAndVotesBeta, f)         # Save results in tab-sep file
      cat(sprintf("\n* Spreadsheet saved to %s.\n", f))#
    }                                                  #

    candidatesAndVotesBeta <- trimDataTo2Candidates(candidatesAndVotes)

    ps    <- c(confLim / 2.0, 0.500, 1 - confLim / 2.0)# Beta posterior median & conf limits
    N     <- sum(candidatesAndVotesBeta$"Votes")       # Number of total (2-candidate) votes
    k     <- candidatesAndVotesBeta[1, "Votes"]        # Number of votes for 1st candidate
    candidatesAndVotesBeta <- addBetaPosteriorEstimates(candidatesAndVotesBeta, ps, N, k)

    ## Numerical estimate of Pr(p1 - p2 > 0)?
    ##
    ## Distr of diff btw 2 Beta-distributed vars is not simple; Pham-Gia did it in terms
    ## of Appel-form hypergeometic F1's.  But that's just hair-splitting; it's a close election!
    ## Also, these are NOT INDEPENDENT Beta variables!  So I kinda dunno how to test this?
    ##
    ## Crudely, we could test the prob that the winner in the 2-way is over 50%?  Today we are crude.
    failProbPct <- 100.0 * pbeta(0.5, shape1 = k + 1, shape2 = N - k + 1, lower.tail = TRUE)
    cands       <- candidatesAndVotesBeta[, "Candidate"]
    reportBetaResults(candidatesAndVotesBeta, confLim, ps, N, k, cands, failProbPct)

    makeBetaPlotFile(candidatesAndVotesBeta, N, k, failProbPct, nPoints, plim,
                     cand1Color, cand2Color, cands, resultsDir, saveFile)

    saveBetaData(candidatesAndVotesBeta, resultsDir, saveFile)

    candidatesAndVotesBeta                             # Return augmented data
  }                                                    #

  withTranscript(dataDir, resultsDir, txFile, "Close 3-way Election", function() {

    heraldPhase("Archiving analysis scripts")          # Always save exact version for these results
    archiveAnalysisScript(resultsDir, "./close-3-way-election.r",
                          "../tools/graphics-tools.r", "../tools/pipeline-tools.r")

    heraldPhase("Reading candidates and votes")        # Go get the vote counts from a file
    maybeAssign("candidatesAndVotes", function() { readData(dataDir, dataFile) })

    heraldPhase("Dirichlet analysis")                  # Bayesian posterior prob is Dirichlet
    maybeAssign("candidatesAndVotesDirichlet", function() {
      dirichletAnalysis(candidatesAndVotes, cand1Color, cand2Color, cand3Color, resultsDir, saveFile)
    })                                                 #

    if (!is.na(dropCandidate)) {                       # If dropping 1 candidate to get a binary
      heraldPhase("Beta analysis")                     #  analysis with posterior Beta distribution
      maybeAssign("candidatesAndVotesBeta", function() {
        betaAnalysis(candidatesAndVotes, dropCandidate, confLim,
                     resultsDir, saveFile, cand1Color, cand2Color, plim, nPoints)
      })                                               #
    }                                                  #

  })                                                   # Done!
}                                                      #

