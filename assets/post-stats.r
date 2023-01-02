## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

suppressPackageStartupMessages({                       # Ssshh!  Quiet in the library...
  ## NB: relative pathname works here because the launch script pushd's to this directory when loading
  toolsDir <- "../../tools"                            # Tools available from the author
  source(file.path(toolsDir, "pipeline-tools.r"))      # Pipeline construction tools
  source(file.path(toolsDir, "graphics-tools.r"))      # Various graphics tools

  library("plyr")                                      # For ldply()
  library("RCurl")                                     # For getURLContent()
  library("fitdistrplus")                              # For fitdist()
})                                                     #

##
## Collect stats on posts over time.
##
## We peruse the local snapshot of the repository, looking for post markdown files (_posts/*.md),
## then interrogating the hit count server for the coresponding post keys (api.countapi.xyz/get).
## We also delve into the _data/comments subdirectories, counting comments for each post.
##
## This carefully uses the get (rather than bump) interface, so it doesn't alter the counter values.
##

## Examples:
##
## > postData <- postStats()
##
## or, to make files for the year-in-review post:
##
## *** For 2022 l'etat du blog post; replace XXX.txt with transcript file based on post filename.
## > postData2022    <- postStats(year = 2022L, destDir = ".", txFile = "XXX.txt")
## > postDataOmnibus <- postStats(              destDir = ".", txFile = "XXX.txt")
##
## or, in an R session to prevent recomputation of earlier phases:
##
## > postData <- postStats(clear = c("postData", "postDataSaved", "plotDone")) # or a subset of those
##
## See also post-stats, an RScript file in this directory for use at the (Unix) command line:
## $ ./assets/post-stats
##

## *** Do regression in left half of image, splice in heatmap image in right half of image?
## *** Something like tobit regression of comments on hits?
## *** Other stats: # images for each post, byte count including images for each post, ...
## *** Graphics: quarterly boxplot of hits/comments, byte counts vs time, ...
## *** Show histogram sideways up against the y axis of the scatterplot?  (Log scale!)
##     See: https://www.r-bloggers.com/2012/09/example-10-3-enhanced-scatterplot-with-marginal-histograms/
postStats <- function(## Inputs
                      year          = NA,
                      clearVars     = c("postData", "postDataSaved", "plotDone", "summaryDone"),
                      ## Most of the time, these defaults are what you want
                      blogRoot      = "~/Documents/laboratory/someweekendreading.github.io",
                      postsDir      = file.path(blogRoot, "_posts"),
                      commentsDir   = file.path(blogRoot, "_data/comments"),
                      ## 2 capture groups: (1) for the post date, (2) for the post name in counters
                      postPatt      = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                      commentPatt   = "^.*entry([0-9]+)\\.yml$",
                      ## 1 capture group: get the integer value from the JSON returned
                      jsonRegexp    = "^\\{.*\"value\":([0-9]+).*\\}$",
                      blogName      = "www.someweekendreading.blog",
                      countURL      = sprintf("https://api.countapi.xyz/get/%s", blogName),
                      ## 2022-Jan-14: SSL certificate is expired; emailed author
                      ## 2022-Feb-21: still expired; need command-line test case with curl?
                      ## 2022-Mar-02: still expired; wrote author again with curl examples:
                      ## $ curl --get https://api.countapi.xyz/get/www.someweekendreading.blog/.moderna-monkey-trial.
                      ## $ curl --insecure --get https://api.countapi.xyz/get/www.someweekendreading.blog/.moderna-monkey-trial.
                      ## Appears to be fixed as of 2022-Mar-27.
                      sslVerify     = TRUE, #FALSE,
                      hitStartDate  = as.Date("2021-Jul-15", format = "%Y-%b-%d"),
                      postStartDate = as.Date("2020-Jul-01", format = "%Y-%b-%d"),
                      today         = Sys.Date(),      # Today is when hits get measured
                      plotWidth     = 800,             # Shape of hits/comments vs time plot
                      plotHeight    = plotWidth,       # 2x2 array of plots, so why not square?
                      clGray        = gray(level = 0.80, alpha = 0.50),

                      ## Outputs (mostly, these defaults are what you want, except txFile and destDir)
                      destDir  = file.path(blogRoot, "_drafts"),
                      txFile   = sprintf("post-stats-%s.txt", format(today, format = "%Y-%b-%d")),
                      dataFile = if (is.null(txFile))  # If no transcript file
                                   NULL                # Then no data file
                                 else                  # Else derive data file from transcript file
                                   sub("^(.*)\\.txt$", "\\1.tsv", txFile),
                      plotFile = if (is.null(txFile))  # If no transcript file
                                   NULL                # Then no plot file
                                 else                  # Else derive plot file from transcript file
                                   sub("^(.*)\\.txt$", "\\1-1.png", txFile)) {

  dateYear    <- function(d) { as.integer(format(d, format = "%Y"))                           }
  dateYearEnd <- function(d) { as.Date(sprintf("%d-12-31", dateYear(d)), format = "%Y-%m-%d") }

  getPostData <- function(postStartDate, hitStartDate, today, postsDir, postPatt, jsonRegexp,
                          countURL, commentsDir, commentPatt, year) {
    cat(sprintf(paste("* Dates:",                      # First report date when counting started
                      "\n  - Date posts started:        %s",
                      "\n  - Date hit counting started: %s",
                      "\n  - Today:                     %s\n",
                      sep = ""),                       #  and today, so measuring blog hits btw dates
                format(postStartDate, format = "%Y-%b-%d"),
                format(hitStartDate, format = "%Y-%b-%d"),
                format(today,     format = "%Y-%b-%d")))
    postFiles <- list.files(path = postsDir, pattern = postPatt)
    cat(sprintf("\n* Found %d posts to check for hit counts.\n", length(postFiles)))
    postData <- ldply(postFiles, function(postFile) {  # Map over postFiles
      ## What the analytics page does:
      ## https://api.countapi.xyz/get/www.someweekendreading.blog/{{ page.url | escape | replace: "/", "." }}
      ##
      ## NB: page.url returns a string like "/name/", so this escapes and puts periods
      ## BOTH before AND after: ".name." -- a historical accident, but let's stick with it,
      ## since all our counters at countapi.xyz have that in them now.
      postRoot     <- sub(postPatt, "\\2", postFile)   # Extract root of post filename
      postComments <- file.path(commentsDir, postRoot) # Where comments are, if any
      data.frame(PostFile     = postFile,              # Construct dataframe row for this postFile
                 PostDate     = as.Date(sub(postPatt, "\\1", postFile), format = "%Y-%m-%d"),
                 PostComments = if (dir.exists(postComments))
                                  length(list.files(path = postComments, pattern = commentPatt))
                                else                   # Count comment files for this post
                                  0,                   #   most of the time there are none
                 PostHits     = as.integer(            # Interrogate hit server for this post
                                  sub(jsonRegexp, "\\1",
                                      ## I wish we could batch these, not slowly 1 by 1!
                                      getURLContent(sprintf("%s/%s",
                                                            countURL,
                                                            gsub("/", "\\.",
                                                                 URLencode(sprintf("/%s/",
                                                                                   postRoot)))),
                                                    .opts = RCurl::curlOptions(
                                                              ssl.verifypeer = sslVerify)))),
                 HitsStart    = hitStartDate,          # Keep track of when we started counting,
                 HitsEnd      = today)                 #  and today.  Counts are in that interval.
    }, .progress = progress_text())                    # Takes a minute; might as well show progress

    ## Yes, it would be faster to do this filter in the ldply() loop above, downloading only
    ## the counts in which we're interested.  On the other hand, the server will GC counts that
    ## haven't been accessed in 6 months, so doing it this way keeps all the keys current.
    ## (https://countapi.xyz says it must be "updated" every 6 months; I'm not sure if access via
    ## "get" constitutes "update"?)
    if (!is.na(year)) {                                # Wants to restrict to a single year
      stopifnot(is.integer(year)                &&     # Check the year is a reasonable number
                dateYear(postStartDate) <= year &&     #
                year                    <= dateYear(Sys.Date()))
      cat(sprintf("\n* Restricting data to just the year %d", year))
      minDate <- as.Date(sprintf("%d-Jan-01", year), format = "%Y-%b-%d")
      maxDate <- as.Date(sprintf("%d-Dec-31", year), format = "%Y-%b-%d")
      postData <- subset(postData, subset = minDate <= PostDate & PostDate <= maxDate)
    }                                                  # postData is now just for that year

    cat(sprintf("\n  - Result: %d rows (posts) of data:\n", nrow(postData)))
    showDataframeHeadTail(postData)                    # Show first few and last few rows

    postData                                           # Return data for posts
  }                                                    #

  savePostData <- function(destDir, dataFile, postData) {
    if (!is.null(dataFile)) {                          # If specified destination file
      f <- file.path(destDir, dataFile)                #  make full pathname
      saveDataframe(postData, f)                       #   then save results
      cat(sprintf("* Saved to %s.\n", f))              #   report it
      TRUE                                             #   and flag that it was done
    } else {                                           # Else doesn't want report saved
      cat(sprintf("* Results not saved.\n"))           #   so don't do that
      FALSE                                            #   and flag that it was NOT done
    }                                                  #
  }                                                    #

  plotDataVsTime <- function(postData, blogName, clGray, plotWidth, plotHeight, destDir, plotFile) {

    scatterplotWithLOESS <- function(postData, colName, clGray, log, doLegend, histBreaks,
                                     barPlot = FALSE) {#
      withPars(function() {                            # Set label orientation & add space @ bottom
        xlim      <- range(postData$"PostDate")        # Range of dates having posts
        xlim[[2]] <- dateYearEnd(xlim[[2]]) + 1        #  Pull up to year end of last post
        plot(panel.first = {                           # First do LOESS plot & 95%CL
          ## LOESS fit and 95% confidence interval as a function of time.  Imitated from example at:
          ## https://stackoverflow.com/questions/22717930/how-to-get-the-confidence-intervals-for-lowess-fit-using-r
          plx       <- predict(loess(as.formula(sprintf("%s ~ PostDays", colName)),
                                     data = transform(postData,
                                                      PostDays = as.numeric(
                                                          PostDate - min(postData$"PostDate")))),
                               se = TRUE)              # Get predictions and standard errors
          ucl       <- plx$"fit" + qt(0.975, plx$"df") * plx$"se"
          lcl       <- plx$"fit" - qt(0.975, plx$"df") * plx$"se"
          minPosLCL <- min(subset(lcl, subset = lcl > 0))
          lcl       <- pmax(lcl, minPosLCL)            # Clip negatives up to min pos (log scale!)
          polygon(x = c(postData$"PostDate", rev(postData$"PostDate")),
                  y = c(lcl, rev(ucl)),                # Polygon with shade of confidence limits
                  col = clGray, border = NA)           # Then LOESS line and CL borders (dashed)
          lines(postData$"PostDate", plx$"fit", lwd = 2)
          lines(postData$"PostDate", ucl,       lty = "dashed")
          lines(postData$"PostDate", lcl,       lty = "dashed")
        },                                             # Preliminaries done; now rest of plot:
        x = postData$"PostDate", y = postData[, colName], pch = 21, bg = "blue",
        xlim = xlim, ## ylim = c(1, max(postData[, colName])),
        main = sprintf("%s vs Time", colName), log = log, xaxt = "n", xlab = NA, #
        ylab = sprintf("%s (%s scale)", colName, if (nchar(log) > 0) "log" else "linear"))

        withPars(function() {                          # Horiz axis only: extra space for date labels
          minPostDate <- min(postData$"PostDate")      # Get date range to be covered,
          maxPostDate <- max(postData$"PostDate")      #   make 1st day of month for each
          axis.Date(side = 1, format = "%Y-%b-%d", labels = TRUE,
                    at = seq(from = minPostDate - as.integer(getDay(minPostDate)) + 1, #1st day
                             to   = maxPostDate - as.integer(getDay(maxPostDate)) + 1, # of month
                             by   = "2 months"))       # seq.Date() is pretty clever
          ## Don't really need horizontal axis label, since dates make it obvious it's the post date
        }, mgp = c(7.5, 0.5, 0))                       # Horizontal axis only: title, label, tick

        rug(postData$"PostDate", side = 1, col = "gray") # Poor man's marginal histograms
        rug(postData[, colName], side = 2, col = "gray") #  done as rug plots

        sapply(seq(from = dateYear(xlim[[1]]), to = dateYear(xlim[[2]])), function(yr) {
          abline(v = as.Date(sprintf("%4d-Jan-01", yr), format = "%Y-%b-%d"),
                 lty = "solid", col = "gray")          # Draw vertical gray line @ Jan 01 of each year
        })                                             #  between min post date and max post date
        ## Vertical dashed line when hit-counting was turned on (mid-2021)
        abline(v = postData[1, "HitsStart"], col = "gray", lty = "dashed")

        if (doLegend)                                  # Want to do legend?
          legend("topleft", bg = "antiquewhite", inset = c(0.01, 0.01), # 0.03 if on left, for y rug
                 pch    = c(21,                NA,                    22,        NA,       NA),
                 pt.bg  = c("blue",            NA,                    clGray,    NA,       NA),
                 pt.cex = c(1.5,               NA,                    3,         NA,       NA),
                 col    = c("black",           "black",               clGray,    "gray",   "gray"),
                 lty    = c(NA,                "solid",               "dashed",  "solid",  "dashed"),
                 lwd    = c(NA,                2,                     NA,        1,        1),
                 legend = c("Individual post", "LOESS central trend", "LOESS 95% CI",
                            "Year boundary", sprintf("Hits since: %s",
                                                     postData[1, "HitsStart"])))

      }, las = 3,                                      # Always vertical labels, both axes
         mar = c(7.5, 3, 2, 1))                        # Extra margin @ bottom for date labels

      if (barPlot)                                     # Barplot if too few vals to histogram
        barplot(height = table(postData[, colName]), col = "blue", space = 0,
                xlab = colName, ylab = sprintf("Freq(%s)", colName),
                main = sprintf("%s Distribution", colName))
      else {                                           # Else ordinary histogram

        hist(x = postData[, colName], col = "blue", breaks = histBreaks, prob = TRUE,
             xlab = colName, ylab = sprintf("Prob(%s)", colName),
             main = sprintf("%s Distribution", colName))
        vals <- round(seq(from = 1, to = max(postData[, colName]), length.out = 1000)) # NB: ints!

        ## Distributions: https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Distributions.html
        ##
        ## We want a distribution which is:
        ## (a) univariate,
        ## (b) unimodal,
        ## (c) bdd below @ 0, and
        ## (d) has a heavy right tail
        ##
        ## lnorm, gamma, negbinomial, weibull, poisson all look sort of like candidates and
        ## initial tomfoolery with fitdist() reveals they converge to an estimate pretty readily.
        ##
        ## Other choices to try, from the common univariate distributions available in R:
        ##  beta, binom, cauchy, chisq, exp, f, geom, hyper, norm, t, unif
        ##
        ## Rule out based on (a): unif
        ## Rule out based on (c) and (d): cauchy, norm, t
        ## Rule out geom as it is special case of negbinom
        ## Rule out exp based on observed shape (no decrease to left of peak)
        ## Rule out beta, because values have to be in [0, 1]
        ## Rule out binomial: needs starting guess, and for large numbers it's essentially poisson
        ##  anyway, so asymptotically this has been tested.  (Confirmed numerically; the curves are
        ##  right on top of each other, but the binomial parameters are absurd, like N ~ 10^4.)
        ##
        ## So we have 8 candidates: lnorm, gamma, negbinomial, weibull, poisson
        ## to which we've added chisq, f, hyper
        ##
        ## Pick distribution(s) fitted with lowest BIC

        ## *** get hyper to converge by choosing "sensible" initial values
        ## Just thrashing here, attempting to guess parameter values:
        ##
        ## Must have k in 0..(m+n).
        ##
        ## Range of x is 0..k.  So k = max(postData[,"PostHits"]).
        ##
        ## p = m / (m + n)
        ## E[x]   = k p
        ## Var[x] = k p (1 - p) * (m+n-k)/(m+n-1)
        ##
        ## p <- 1/2                                # Arbitrary; implies m = n
        ## k <- mean(postData[, "PostHits"]) / p   # Gets mean right
        ##
        ## fithyper <<- fitdist(data = postData[, "PostHits"], distr = "hyper", method = "mle", start = list("m" = k/2, "n" = k/2, "k" = 2 * k))

        fitlnorm <<- fitdist(data = postData[, colName] + 1, distr = "lnorm", method = "mle")
        cat(sprintf("\n- Lognormal:\n")); print(fitlnorm)
        lines(x = vals, y = dlnorm(vals,               #
                                   meanlog = coef(fitlnorm)[["meanlog"]],
                                   sdlog   = coef(fitlnorm)[["sdlog"]]),
              lty = "solid", lwd = 2, col = "red")     #

        legend("topright", bg = "antiquewhite", inset = 0.01,
               pch    = c(22,      NA),
               pt.bg  = c("blue",  NA),
               pt.cex = c(2,       NA),
               lty    = c(NA,      "solid"),
               lwd    = c(NA,      2),
               col    = c("black", "red"),
               ## *** Put logmean and sdmean (with sd's) in legend too, or in a separate legend
               legend = c("Observations", sprintf("Lognormal BIC = %7.1f", fitlnorm$"bic")))

#        fitgamma <<- fitdist(data = postData[, colName], distr = "gamma", method = "mle")
#        cat(sprintf("\n- Gamma:\n")); print(coef(fitgamma))
#        lines(x = vals, y = dgamma(vals,               #
#                                   shape = coef(fitgamma)[["shape"]],
#                                   rate  = coef(fitgamma)[["rate"]]),
#              lty = "solid", lwd = 2, col = "green")   #

#        fitnbinom <<- fitdist(data = postData[, colName], distr = "nbinom", method = "mle")
#        cat(sprintf("\n- Negbinomial:\n")); print(coef(fitnbinom))
#        lines(x = vals, y = dnbinom(vals,              #
#                                    size = coef(fitnbinom)[["size"]],
#                                    mu   = coef(fitnbinom)[["mu"]]),
#              lty = "solid", lwd = 2, col = "black")   #

#        fitweibull <<- fitdist(data = postData[, colName], distr = "weibull", method = "mle")
#        cat(sprintf("\n- Weibull:\n")); print(coef(fitweibull))
#        lines(x = vals, y = dweibull(vals,             #
#                                     shape = coef(fitweibull)[["shape"]],
#                                     scale = coef(fitweibull)[["scale"]]),
#              lty = "solid", lwd = 2, col = "gray")    #

#        fitf     <<- fitdist(data = postData[, colName], distr = "f",     method = "mle",
#                             ## Again, a random stab in the dark at the number of degress of freedom
#                             ##  both being the number of posts.  It converges to df1 being a bit more,
#                             ##  and pushes df2 down to between 0 and 1.
#                             ## However, if you cut the initial guesses, the outcome changes wildly.
#                             ##  So it's much more sensitive to my weird guesses at initial conditions
#                             ##  than chisquare!
#                             start = list("df1" = nrow(postData), "df2" = nrow(postData)))
#        cat(sprintf("\n- F:\n")); print(coef(fitf))
#        lines(x = vals, y = df(vals, df1 = coef(fitf)[["df1"]], df2 = coef(fitf)[["df2"]]),
#              lty = "solid", lwd = 2, col = "yellow")    #

#       fitchisq <<- fitdist(data = postData[, colName], distr = "chisq", method = "mle",
#                             ## Just took a guess @ number of degrees of freedom = number of posts.
#                             ##   It ends up fitting to a lot less than that.  Just for robustness
#                             ##   testing, tried HALF the number of posts; converged to same answer.
#                             ## Ignoring the non-centrality parameter; should figre it out!  Took a
#                             ##   couple guesses, e.g., mean number of hits.  Never converged.
#                             ## *** NB: special case of Gamma; why doesn't it do as well?
#                             start = list("df" = nrow(postData)))
#        cat(sprintf("\n- Chi squared:\n")); print(coef(fitchisq))
#        lines(x = vals, y = dchisq(vals, df = coef(fitchisq)[["df"]]),
#              lty = "solid", lwd = 2, col = "blue")    #

#        fitpois <<- fitdist(data = postData[, colName], distr = "pois", method = "mle")
#        cat(sprintf("\n- Poisson:\n")); print(coef(fitpois))
#        lines(x = vals, y = dpois(vals, lambda  = coef(fitpois)[["lambda"]]),
#              lty = "solid", lwd = 2, col = "orange")  #

#        legend("topright", bg = "antiquewhite", inset = 0.01,
#               pch    = c(22,      NA,      NA,      NA,      NA,      NA,       NA, NA),
#               pt.bg  = c("blue",  NA,      NA,      NA,      NA,      NA,       NA, NA),
#               pt.cex = c(2,       NA,      NA,      NA,      NA,      NA,       NA, NA),
#               lty    = c(NA,      "solid", "solid", "solid", "solid", "solid",  "solid", "solid"),
#               lwd    = c(NA,      2,       2,       2,       2,       2,        2, 2),
#               col    = c("black", "red",   "green", "black",  "gray", "yellow", "blue", "orange"),
#               legend = c("Observations",              #
#                          sprintf("Lognormal    BIC =  %7.1f",        fitlnorm$"bic"),
#                          sprintf("Gamma        BIC =  %7.1f",        fitgamma$"bic"),
#                          sprintf("Negbinomial BIC =  %7.1f",         fitnbinom$"bic"),
#                          sprintf("Weibull         BIC =  %7.1f",     fitweibull$"bic"),
#                          sprintf("F                  BIC  =  %7.1f", fitf$"bic"),
#                          sprintf("Chi squared BIC =   %7.1f",        fitchisq$"bic"),
#                          sprintf("Poisson        BIC = %7.1f",       fitpois$"bic")))
#
#       bics <- data.frame(Distribution = c("Lognormal", "Gamma", "Weibull", "Negbinomial", "Poisson",
#                                            "Chi Squared", "F"),
#                           BIC          = c(fitlnorm$"bic", fitgamma$"bic", fitweibull$"bic",
#                                            fitnbinom$"bic", fitpois$"bic", fitchisq$"bic",
#                                            fitf$"bic"))
#        bics <- bics[order(bics$"BIC"), ]              # Sort so best is at top of table
#        cat(sprintf("\n* Bayes information criteria for distribution of %s:\n", colName))
#        print(bics)                                    # Show table to transcript

        cat("\n")                                      #

      }                                                #
    }                                                  #

    f <- if (is.null(plotFile)) NULL else file.path(destDir, plotFile)
    withPNG(f, plotWidth, plotHeight, FALSE, function() {
      withPars(function() {                            # Save/restore graphics parameters

        scatterplotWithLOESS(postData, "PostHits",     clGray, "y", FALSE, 20)
        scatterplotWithLOESS(postData, "PostComments", clGray, "",  TRUE,  NULL, barPlot = TRUE)

        title(main = sprintf("%s Hits & Comments %s: %d posts",
                             blogName,                 # Overall title of all plots
                             format(postData[1, "HitsEnd"], format = "%Y-%b-%d"),
                             nrow(postData)),          # Include number of posts
              outer = TRUE, cex.main = 1.5)            # It's in the top outer margin

      }, pty   = "m",                                  # Maximal plotting area
         bg    = "white",                              # Background
         ps    = 16,                                   # Larger type size for file capture
         mfrow = c(2, 2),                              # 2 x 2 array of plots
         oma   = c(0, 0, 1, 0),                        # Outer margin @ top for overall title
         mar   = c(3, 3, 2, 1),                        # Pull in on margins
         mgp   = c(1.7, 0.5, 0))                       # Axis title, label, tick
    })                                                 # Done with file capture
    cat(sprintf("* Data vs time plot: %s.", f))        # Capture filename to transcript

    qs  <- quantile(postData$"PostHits", probs = seq(from = 0.00, to = 1.00, by = 0.10))
    foo <- transform(postData,                         # Original data with hit quantile column
                     PostHitsDecile = cut(postData$"PostHits",
                                          breaks         = qs,
                                          labels         = names(qs)[-11],
                                          include.lowest = TRUE,
                                          ordered_result = TRUE))
    tbl <- table(foo$"PostComments", foo$"PostHitsDecile")
    cat(sprintf("\n  - Table of number of comments/post(rows) vs number of hits/post (cols):\n"))
    print(tbl)                                         # Table of comments x hits, for bicluster

    f2  <- if (is.null(f)) NULL else sub("^(.*)-1\\.png$", "\\1-2.png", f)
    withPNG(f2, plotWidth / 2, plotHeight / 2, FALSE, function() {
      legendFrac <- 0.20                               # How much space on left for color legend
      withPars(function() {                            # Save/restore graphics parameters
        ctRange <- range(tbl)                          # Range of counts in table
        nColors <- min(diff(ctRange) + 1, 256)         # Colors used in bicluster
        colors  <- rev(makeFDRColors(nColors, maxFDRColored = 1.0, baseColor = "blue"))

        heatmapRespectFALSE(tbl, scale = "none", col = colors,
                            ## 2ndary sort key by comment # on rows and by decile on cols
                            Rowv = -as.integer(rownames(tbl)),
                            Colv = -as.integer(gsub("^([0-9]*)%$", "\\1", colnames(tbl))),
                            margins = c(1.5 * max(nchar(colnames(tbl))),
                                        2.5 * max(nchar(rownames(tbl)))),
                            main = "Comment/Hit Bicluster", xlab = "Hit Decile", ylab = "Comments",
                            add.expr = {box(which = "plot")})

        par(omd = c(0, legendFrac, 0, 1), pty = "m", mar = c(1, 3, 1, 1), new = TRUE)
        image(x    = 0,                                # draw the color bar
              y    = seq(from = ctRange[[1]], to = ctRange[[2]], along.with = colors),
              z    = matrix(1 : length(colors), ncol = length(colors)),
              cex.axis = 0.9,                          # Smaller labels
              ylim = ctRange,                          # Show range of POSSIBLE correlations
              col  = colors,                           # Heatmap colors
              xaxt = "n", ylab = "Number of Posts", xlab = NA)
        box(which = "plot")                            # Box around the color legend

      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         omd = c(legendFrac, 1, 0, 0.99),              # Leave room for color bar legend
         ps  = 16,                                     # Larger type for file capture
         mar = c(1, 1, 0.9, 1),                        # Margins: title inexplicably cropped @ top?
         mgp = c(1.7, 0.5, 0))                         # Axis title, label, tick
    })                                                 #
    cat(sprintf("\n\n* Bicluster: %s\n", f2))          # Capture dest file to transcript

    cat(sprintf("\n\n* Correlation test between hits and comments:\n"))
    print(cor.test(postData$"PostHits", postData$"PostComments", method = "pearson"))
    ## Spearman exact = FALSE to avoid warning: "Cannot compute exact p-value with ties"
    print(cor.test(postData$"PostHits", postData$"PostComments", method = "spearman", exact = FALSE))

    f3 <- if (is.null(f)) NULL else sub("^(.*)\\-1.png$", "\\1-3.png", f)
    withPNG(f3, plotWidth / 2, plotHeight / 2, FALSE, function() {
      ys <- postData$"PostComments"                    # Regression of comments on hits in
      withPars(function() {                            #  scatterplot of comments vs hits
        scatterplotWithDensities(xs = postData$"PostHits",
                                 ys = ys,              #
                                 xlab = "PostHits (log scale)", ylab = "PostComments",
                                 main = "Hits vs Comments",
                                 bg = "blue", log = "x", nLevels = 20, kdeN = 100,
                                 ## Too few comment levels, so give comment bandwidth manually;
                                 ## heuristic derived from bandwidth.nrd()
                                 kdeH = c(bandwidth.nrd(postData$"PostHits"),
                                          4 * 1.06 * sqrt(var(ys)) * length(ys)^(-1/5)),
                                 regressionColor = NULL) ## Figure out how to handle log scale

        mdl    <- lm(PostComments ~ log(PostHits), data = postData)
        mdlSum <- summary(mdl)                         # Extract details of regression results
        cat("\n\n"); print(mdlSum)                     # Show regression stats
        ## *** Figure out untf arg, make scatterPlotWithDensities() do this right
        ## > abline(reg = mdl, lty = "dashed", col = "red", lwd = 2, untf = TRUE)
        ## > abline(reg = mdl, lty = "dashed", col = "red", lwd = 2, untf = FALSE)
        foo <- data.frame(x = postData$"PostHits", y = predict(mdl))
        foo <- foo[order(foo$"x"), ]                   # Plot log-linear fit
        lines(x = foo$"x", y = foo$"y", lty = "dashed", lwd = 2, col = "red")
        coefData <- coef(mdlSum)                       # Extract coeffs & p-values from model
        legend("topleft", bg = "antiquewhite", inset = 0.01, title = "Regression", cex = 0.8,
               legend = c(sprintf("Slope = %.2f (t-stat p ~ %.1e)",
                                  coefData[["log(PostHits)", "Estimate"]],
                                  coefData[["log(PostHits)", "Pr(>|t|)"]]),
                          sprintf("F-stat p ~ %.1e, Adj R^2 ~ %.1f%%",
                                  pf(mdlSum$"fstatistic"[[1]],
                                     mdlSum$"fstatistic"[[2]],
                                     mdlSum$"fstatistic"[[3]],
                                     lower.tail = FALSE),
                                  100.0 * mdlSum$"adj.r.squared")))

      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0))                         #
    })                                                 #
    cat(sprintf("\n\n* Scatterplot: %s.\n", f3))       # Capture filename to transcript

    TRUE                                               # Flag that it was done
  }                                                    #

  ## *** Add capability for summary by quarters instead of years
  ## *** Add number of comments not from me for each year
  ## *** Add number of comments from me for each year
  ## *** Total unique commenters for each year (and hand-collapse known spelling variations,
  ##     compare with unique MD5 hashes of emails)
  summarizePostFrequency <- function(postData, commentsDir, commentPatt) {
    ## Returns a dataframe summarizing post frequency by year and overall, e.g.:
    ##    Year NPosts NDays NComments DaysPerPost DaysPerComment CommentsPerPost
    ## 1  2020     41   184        21        4.49           8.76            0.51
    ## 2  2021    111   365        58        3.29           6.29            0.52
    ## 3  2022     22    51        17        2.32           3.00            0.77
    ## 4 Total    174   600        96        3.45           6.25            0.55

    commentYears <- function(commentsDir, commentPatt) {

      unixTimestampYear <- function(ts) { dateYear(as.Date(as.POSIXct(ts, origin = "1970-01-01"))) }

      ## NB: Timestamps are 13-digit integers, apparently msec since Unix epoch 1970-01-01.
      ##     (It would be more traditional to do it in seconds, and have a 10-digit integer,
      ##     which would fit into a 32-bit word, but we have some non-traditionalists here.)
      ##
      ##     So we convert to double-float via as.numeric(), divide by 1000msec/sec to get the
      ##     seconds elapsed, then convert THAT to integer via as.integer().  Then convert THAT
      ##     to a Date and extract the year.  Phew!
      sapply(list.files(path = commentsDir, patt = commentPatt, recursive = TRUE), function(cf) {
        unixTimestampYear(as.integer(as.numeric(sub(commentPatt, "\\1", cf)) / 1000))
      })                                               #
    }                                                  #

    blogDays <- function(yr, blogStartYr = 2020) {     # How many blogging days in a given year?

      isLeapYear <- function(yr) {                     # Is this year a leap year?
        ## Gregorian calendar leap year iff:
        ## - divisible by 4 and NOT by 100, or
        ## - divisible by 4 AND by 100 AND by 400
        yr <- as.integer(yr)                           # Defensive programming: convert to integer
        stopifnot(is.integer(yr) && yr >= 1583)        # First full year of Gregorian calendar
        (yr %% 4 == 0) && (!(yr %% 100 == 0) || (yr %% 400 == 0))
      }                                                # Returns TRUE if yr is a leap year

      currDate <- Sys.Date()                           # Current date
      currYr   <- as.integer(format(currDate, "%Y"))   # Current year and
      stopifnot(blogStartYr <= yr && yr <= currYr)     # Signal if year is too far back, or future

      if (yr == blogStartYr)                           # If first year of blogging: Jul 01 to Dec 31
        184                                            #  was 184 days
      else if (yr < currYr) {                          # Elseif between then & now, days in year:
        if (isLeapYear(yr)) 366 else 365               #  take account of leap year
      } else                                           # Else it's the current year
        as.integer(strftime(currDate, "%j"))           #  so return number of days so far
    }                                                  #

    yearComments <- table(commentYears(commentsDir, commentPatt))
    yearComments <- data.frame(Year      = as.integer(dimnames(yearComments)[[1]]),
                               NComments = as.vector(yearComments))
    foo <- transform(transform(merge(ddply(transform(postData,
                                                     Year = as.integer(
                                                              sprintf("%s", dateYear(PostDate)))),
                                           "Year",     # Map over year subsets of the data
                                           function(ydf) {
                                             data.frame(NPosts = nrow(ydf),
                                                        NDays  = blogDays(ydf[[1, "Year"]]))
                                           }),         #
                                     yearComments, by = "Year", all = TRUE),
                               NComments = ifelse(is.na(NComments), 0, NComments)),
                     DaysPerPost     = round(NDays     / NPosts,    digits = 2),
                     DaysPerComment  = round(NDays     / NComments, digits = 2),
                     CommentsPerPost = round(NComments / NPosts,    digits = 2))
    rbind(foo,                                         # Add another row at the bottom, which has
          transform(data.frame(Year      = "Total",    #  totals of posts & days, & overall days/post
                               NPosts    = sum(foo$"NPosts"),
                               NDays     = sum(foo$"NDays"),
                               NComments = sum(foo$"NComments")),
                    DaysPerPost     = round(NDays / NPosts,     digits = 2),
                    DaysPerComment  = round(NDays / NComments,  digits = 2),
                    CommentsPerPost = round(NComments / NPosts, digits = 2)))
  }                                                    #

  withTranscript(postsDir, destDir, txFile, "Blog Post Hit Counts", function() {

    if (!is.null(clearVars)) {                         # Wants completely virgin calculation?
      heraldPhase("Clearing out previous results")     # Delete globals holding previous results
      removePreviousResults(clearVars)                 # Remove the requested globals
    }                                                  #

    heraldPhase("Getting hit count for each post")     # Announce what we're doing
    maybeAssign("postData", function() {               # Collect hit count for each post
      getPostData(postStartDate, hitStartDate, today, postsDir, postPatt, jsonRegexp, countURL,
                  commentsDir, commentPatt, year)      #
    })                                                 # Done retrieving counts

    heraldPhase("Saving results")                      # Save the results, maybe
    maybeAssign("postDataSaved", function() { savePostData(destDir, dataFile, postData) })

    heraldPhase("Plotting hits vs time")               # Plot hits vs time and probability
    maybeAssign("plotDone", function() {               #   distribution of hits
      plotDataVsTime(postData, blogName, clGray, plotWidth, plotHeight, destDir, plotFile)
    })                                                 #

    heraldPhase("Summarizing Post Data")               # Summarize post/comment/hit counts
    maybeAssign("summaryDone", function() {            #  in a table of stats by year
      print(summarizePostFrequency(postData, commentsDir, commentPatt))
      TRUE                                             # Flag that it was done
    })                                                 #

    invisible(postData)                                # Return results invisibly (also in global var)

  })                                                   # End withTranscript()
}                                                      #
