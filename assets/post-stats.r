## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

suppressPackageStartupMessages({                       # Ssshh!  Quiet in the library...
  ## NB: relative pathname works here because the launch script pushd's to this directory when loading
  toolsDir <- "../../tools"                            # Tools available from the author
  source(file.path(toolsDir, "pipeline-tools.r"))      # Pipeline construction tools
  source(file.path(toolsDir, "graphics-tools.r"))      # Various graphics tools

  library("plyr")                                      # For ldply()
  library("RCurl")                                     # For getURLContent()
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
## *** Done for 2020 year-end post; do not repeat without editing!  (Add 2022 year-end version,
##     do 2022 and omnibus, re-use previous files when posting.)
## > postData2020    <- postStats(year = 2020L, destDir = ".", txFile = "2022-01-01-letat-du-blog-2021-post-stats-2020-yearend.txt")
## > postData2021    <- postStats(year = 2021L, destDir = ".", txFile = "2022-01-01-letat-du-blog-2021-post-stats-2021-yearend.txt")
##
## *** For 2022 year-end post; replace XXX.txt with transcript file based on post filename.
## > postData2022    <- postStats(year = 2022L, destDir = ".", txFile = "XXX.txt")
## > postDataOmnibus <- postStats(              destDir = ".", txFile = "XXX.txt")
##
## or
##
## > postData <- postStats(clear = c("postData", "postDataSaved", "plotDone")) # or a subset of those
##
## See also post-stats, an RScript file in this directory for use at the (Unix) command line.
##

## *** Do regression in left half, splice in heatmap image in right half?
## *** Something like tobit regression of comments on hits?
## *** Other stats: # images for each post, byte count including images for each post, ...
## *** Graphics: quarterly boxplot of hits/comments, byte counts vs time, ...
## *** Show histogram sideways up against the y axis of the scatterplot?  (Log scale!)
##     See: https://www.r-bloggers.com/2012/09/example-10-3-enhanced-scatterplot-with-marginal-histograms/
postStats <- function(## Inputs
                      year          = NA,
                      clearVars     = c("postData", "postDataSaved", "plotDone", "summaryDone"),
                      ## Most of the time, these defaults are what you want
                      blogRoot      = "/Users/sgr/Documents/laboratory/someweekendreading.github.io",
                      postsDir      = file.path(blogRoot, "_posts"),
                      commentsDir   = file.path(blogRoot, "_data/comments"),
                      ## 2 capture groups: (1) for the post date, (2) for the post name in counters
                      postPatt      = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                      commentPatt   = "^.*entry([0-9]+)\\.yml$",
                      ## 1 capture group: get the integer value from the JSON returned
                      jsonRegexp    = "^\\{.*\"value\":([0-9]+).*\\}$",
                      blogName      = "www.someweekendreading.blog",
                      countURL      = sprintf("https://api.countapi.xyz/get/%s", blogName),
                      ## *** 2022-Jan-14: SSL certificate is expired; emailed developer
                      sslVerify     = FALSE, # TRUE,
                      hitStartDate  = as.Date("2021-Jul-15", format = "%Y-%b-%d"),
                      postStartDate = as.Date("2020-Jul-01", format = "%Y-%b-%d"),
                      today         = Sys.Date(),      # Today is when hits get measured
                      plotWidth     = 800,             # Shape of hits/comments vs time plot
                      plotHeight    = plotWidth,       # 2x2 array of plots, so why not square?
                      clGray        = gray(level = 0.80, alpha = 0.50),

                      ## Outputs (mostly, these defaults are what you want, except txFile and destDir)
                      destDir  = file.path(blogRoot, "_drafts"),
                      txFile   = sprintf("post-stats-%s.txt", format(today, format = "%Y-%b-%d")),
                      dataFile = if (is.null(txFile))
                                   NULL
                                 else
                                   sub("^(.*)\\.txt$", "\\1.tsv", txFile),
                      plotFile = if (is.null(txFile))  # If no transcript file
                                   NULL                # Then no plot file
                                 else                  # Else derive plot file from transcript file
                                   sub("^(.*)\\.txt$", "\\1.png", txFile)) {

  dateYear          <- function(d)  { as.integer(format(d, format = "%Y"))                           }
  dateYearEnd       <- function(d)  { as.Date(sprintf("%d-12-31", dateYear(d)), format = "%Y-%m-%d") }
  unixTimestampYear <- function(ts) { dateYear(as.Date(as.POSIXct(ts, origin = "1970-01-01")))       }

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

    cat(sprintf("\n\n* Breakdown of post counts by year:\n"))
    print(ddply(transform(postData, Year = dateYear(PostDate)), "Year",
                function(dfy) { data.frame(Year = dfy[1, "Year"], NPosts = nrow(dfy)) }))

    ## *** Might it be better to do this in the ldply(), to avoid having to collect all the rest?
    ## OTOH, this exercises each counter, making sure the server doesn't GC it?
    if (!is.na(year)) {                                # Wants to restrict to a single year
      stopifnot(is.integer(year)                &&
                dateYear(postStartDate) <= year &&
                year                    <= dateYear(Sys.Date()))
      cat(sprintf("\n* Restricting data to just the year %d", year))
      minDate <- as.Date(sprintf("%d-Jan-01", year), format = "%Y-%b-%d")
      maxDate <- as.Date(sprintf("%d-Dec-31", year), format = "%Y-%b-%d")
      postData <- subset(postData, subset = minDate <= PostDate & PostDate <= maxDate)
    }                                                  # postData is now just for that year

    cat(sprintf("\n  - Result: %d rows of data:\n", nrow(postData)))
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

    scatterplotWithLOESS <- function(postData, colName, clGray, log, main, hitsStart, histBreaks,
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
        main = main, log = log, xaxt = "n", xlab = NA,
        ylab = sprintf("%s (%s scale)", colName, if (nchar(log) > 0) "log" else "linear"))

        withPars(function() {                          # Horiz axis only: extra space for date labels
          minPostDate <- min(postData$"PostDate")      # Get date range to be covered,
          maxPostDate <- max(postData$"PostDate")      #   make 1st day of month for each
          axis.Date(side = 1, format = "%Y-%b-%d", labels = TRUE,
                    at = seq(from = minPostDate - as.integer(getDay(minPostDate)) + 1, #1st day
                             to   = maxPostDate - as.integer(getDay(maxPostDate)) + 1, # of month
                             by   = "month"))          # Ticks at start of each month
          ## Don't really need horizontal axis label, since dates make it obvious it's the post date
        }, mgp = c(7.5, 0.5, 0))                       # Horizontal axis only: title, label, tick

        rug(postData$"PostDate", side = 1, col = "gray") # Poor man's marginal histograms
        rug(postData[, colName], side = 2, col = "gray") #  done as rug plots

        sapply(seq(from = dateYear(xlim[[1]]), to = dateYear(xlim[[2]])), function(yr) {
          abline(v = as.Date(sprintf("%4d-Jan-01", yr), format = "%Y-%b-%d"),
                 lty = "solid", col = "gray")          # Draw vertical gray line @ Jan 01 of each year
        })                                             #  between min post date and max post date

        legendInset <- c(0.03, 0.01)                   # Insets for legend (accomodate vertical rug)
        if (!is.null(hitsStart)) {                     # Want to show when hit counter turned on?
          abline(v = postData[1, hitsStart], col = "gray", lty = "dashed")
          legend("topleft", bg = "antiquewhite", inset = legendInset,
                 pch    = c(21,                NA,                    22,        NA,       NA),
                 pt.bg  = c("blue",            NA,                    clGray,    NA,       NA),
                 pt.cex = c(1.5,               NA,                    3,         NA,       NA),
                 col    = c("black",           "black",               clGray,    "gray",   "gray"),
                 lty    = c(NA,                "solid",               "dashed",  "solid",  "dashed"),
                 lwd    = c(NA,                2,                     NA,        1,        1),
                 legend = c("Individual post", "LOESS central trend", "LOESS 95% confidence interval",
                            "Year boundary", sprintf("Hit counting started: %s",
                                                     postData[1, hitsStart])))
        } else                                         # Else don't show hit count start; diff legend
          legend("topleft", bg = "antiquewhite", inset = legendInset,
                 pch    = c(21,                NA,                    22,       NA),
                 pt.bg  = c("blue",            NA,                    clGray,   NA),
                 pt.cex = c(1.5,               NA,                    3,        NA),
                 col    = c("black",           "black",               clGray,   "gray"),
                 lty    = c(NA,                "solid",               "dashed", "solid"),
                 lwd    = c(NA,                2,                     NA,       1),
                 legend = c("Individual post", "LOESS central trend", "LOESS 95% confidence interval",
                            "Year boundary"))          #

      }, las = 3,                                      # Always vertical labels, both axes
         mar = c(7.5, 3, 2, 1))                        # Extra margin @ bottom for date labels

      if (barPlot)                                     # Barplot for too few vals to histogram
        barplot(height = table(postData[, colName]), col = "blue",
                xlab = colName, ylab = sprintf("Freq(%s)", colName),
                main = sprintf("%s Frequency Distribution", colName))
      else                                             # Else ordinary histogram
        hist(postData[, colName], xlab = colName, ylab = sprintf("Freq(%s)", colName),
             main = sprintf("%s Frequency Distribution", colName), col = "blue", breaks = histBreaks)
    }                                                  #

    f <- if (is.null(plotFile)) NULL else file.path(destDir, plotFile)
    withPNG(f, plotWidth, plotHeight, FALSE, function() {
      withPars(function() {                            # Save/restore graphics parameters

        scatterplotWithLOESS(postData, "PostHits", clGray, "y", "Hits vs Time", "HitsStart", 20)
        scatterplotWithLOESS(postData, "PostComments", clGray, "",  "Comments vs Time", NULL, NULL,
                             barPlot = TRUE)           # Too few distinct comment vals for histogram

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
    print(tbl)                                         # Table of comments x hits, for bicluster
    f2  <- if (is.null(f)) NULL else sub("^(.*)\\.png$", "\\1-2.png", f)
    withPNG(f2, plotWidth/2, plotHeight/2, FALSE, function() {
      legendFrac <- 0.20                               # How much space on left for color legend
      withPars(function() {                            # Save/restore graphics parameters
        ctRange   <- range(tbl)                        # Range of counts in table
        nColors   <- min(diff(ctRange) + 1, 256)       # Colors used in bicluster
        colors    <- makeSaturableHeatmapColorsBWR(nColors,
                                                   minObs = ctRange[[1]], maxObs = ctRange[[2]])

        heatmapRespectFALSE(tbl, scale = "none", col = colors,
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
              xaxt = "n", ylab = "Post Count", xlab = NA)
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

    f3 <- if (is.null(f)) NULL else sub("^(.*)\\.png$", "\\1-3.png", f)
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
        coefData <- coef(mdlSum)
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

  ## *** Add comments per post in each year, and overall
  ## *** Integrate this into postStats(), and capture the table to the transcript?
  ## *** Add number of comments not from me for each year
  ## *** Add number of comments from me for each year
  ## *** Total unique commenters for each year (and hand-collapse known spelling variations)
  ## *** Just for completelness, add century and millennium leap year calculations
  ## *** NB: BUG -- if run before Dec 31, will still use 365/366 days for final year
  summarizePostFrequency <- function(postData, commentsDir, commentPatt) {
    ## Returns a dataframe summarizing post frequency by year and overall, e.g.:
    ##    Year NPosts NDays NComments DaysPerPost DaysPerComment
    ## 1  2020     41   184        21        4.49           8.76
    ## 2  2021    111   365        58        3.29           6.29
    ## 3 Total    152   549        79        3.61           6.95

    commentYears <- function(commentsDir, commentPatt) {
      ## NB: Timestamps are 13-digit integers, apparently msec since Unix epoch 1970-01-01.
      ##     It would be more traditional to do it in seconds, and have a 10-digit integer,
      ##     which would fit into a 32-bit word.  So we conver to double via as.numeric(),
      ##     divide by 1000 to get to seconds, and convert to integer via as.integer().
      ##     Then convert THAT to a Date and extract the year.  Phew!
      sapply(list.files(path = commentsDir, patt = commentPatt, recursive = TRUE), function(cf) {
        unixTimestampYear(as.integer(as.numeric(sub(commentPatt, "\\1", cf)) / 1000))
      })                                               #
    }                                                  #

    yearComments <- table(commentYears(commentsDir, commentPatt))
    yearComments <- data.frame(Year      = as.integer(dimnames(yearComments)[[1]]),
                               NComments = as.vector(yearComments))
    foo <- ddply(transform(postData, Year = as.integer(sprintf("%s", dateYear(PostDate)))),
                 "Year",                               # Map over year subsets of the data
                 function(ydf) {                       # What to compute for each tranch of posts
                   data.frame(NPosts = nrow(ydf),      #
                              NDays = ifelse(ydf[[1, "Year"]] == 2020,
                                             184,      # Number of days in 1st year of blogging
                                             ifelse(ydf[[1, "Year"]] %% 4 == 0,
                                                    366,
                                                    365)))
                 })                                    #
    foo <- transform(merge(foo, yearComments, by = "Year", all = TRUE),
                     NComments = ifelse(is.na(NComments), 0, NComments))
    foo <- transform(foo,                              # Add rate columns
                     DaysPerPost    = round(NDays / NPosts, digits = 2),
                     DaysPerComment = round(NDays / NComments, digits = 2))
    rbind(foo,                                         # Add another row at the bottom, which has
          transform(data.frame(Year   = "Total",       #  totals of posts & days, & overall days/post
                               NPosts = sum(foo$"NPosts"),
                               NDays  = sum(foo$"NDays"),
                               NComments = sum(foo$"NComments")),
                    DaysPerPost    = round(NDays / NPosts, digits = 2),
                    DaysPerComment = round(NDays / NComments, digits = 2)))
  }                                                    #

  withTranscript(postsDir, destDir, txFile, "Blog Post Hit Counts", function() {

    if (!is.null(clearVars)) {                         # Wants completely virgin calculation?
      heraldPhase("Clearing out previous results")     # Delete globals holding previous results
      removePreviousResults(clearVars)                 # Remove the requested globals
      cat("\n\n* Done.\n")                             # Yep, we did that.
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
    maybeAssign("summaryDone", function() {            #
      print(summarizePostFrequency(postData, commentsDir, commentPatt))
      TRUE                                             # Flag that it was done
    })                                                 #

    invisible(postData)                                # Return results invisibly (also in global var)

  })                                                   # End withTranscript()
}                                                      #

