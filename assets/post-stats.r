## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Tools available from the author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics tools

library("plyr")                                        # For ldply()
library("RCurl")                                       # For getURLContent()

##
## Collect stats on posts over time.
##
## We peruse the local snapshot of the repository, looking for post markdown files (_posts/*.md),
## then interrogating the hit count server for the coresponding post keys (api.countapi.xyz/get).
##
## This carefully uses the get rather than bump interface, so it doesn't alter the counter values.
##
## Example:
##
## > postStats()
##
## or
##
## > postStats(clear = c("postData", "postDataSaved", "hitPlotDone")) # or a subset of those
##
## or
##
## > postData <- transform(read.table("../_drafts/post-stats-2021-Nov-27.tsv", sep = "\t", header = TRUE), PostDate = as.Date(PostDate), HitsStart = as.Date(HitsStart), HitsEnd = as.Date(HitsEnd))
##

## Issues:
## *** Other stats: # comments for each post, # images for each post, byte count including
##     images for each post, ...
## *** Graphics (quarterly boxplot of hits, byte counts vs time, ...)
## *** Just for kicks, try fitting an actual logistic curve?  Really, any CDF will
##     have the flattening out property; which one, though?
## *** Show histogram sideways up against the y axis of the scatterplot?  (Log scale!)
##     See: https://www.r-bloggers.com/2012/09/example-10-3-enhanced-scatterplot-with-marginal-histograms/
postStats <- function(## Inputs (most of the time defaults are ok; clearVars is most likely to change)
                      clearVars     = c("postData", "postDataSaved", "hitPlotDone"),
                      postsDir      = "../_posts",     # Local repository of posts (*.md files)
                      postPatt      = "*.md",          # What post files look like
                      ## 2 capture groups: (1) for the post date, (2) for the post name in counters
                      mdRegexp      = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                      ## 1 capture group: get the integer value from the JSON returned
                      jsonRegexp    = "^\\{.*\"value\":([0-9]+).*\\}$",
                      blogName      = "www.someweekendreading.blog",
                      countURL      = sprintf("https://api.countapi.xyz/get/%s", blogName),
                      startDate     = as.Date("2021-Jul-15", format = "%Y-%b-%d"),
                      today         = Sys.Date(),      # Today is when hits get measured
                      hitPlotWidth  = 800,             # Shape of hits vs time plot
                      hitPlotHeight = hitPlotWidth / 2,#
                      clGray        = gray(level = 0.80, alpha = 0.50),

                      ## Outputs (most of the time, these defaults are what you want)
                      destDir     = "../_drafts",      # Directory where results get written
                      txFile      = sprintf("post-stats-%s.txt", format(today, format = "%Y-%b-%d")),
                      destFile    = sprintf("post-stats-%s.tsv", format(today, format = "%Y-%b-%d")),
                      hitPlotFile = if (is.null(destFile))
                                      NULL             # No plot file
                                    else               # Else derive from data save file
                                      sub("^(.*)\\.tsv$", "\\1-hits.png", destFile)) {

  getPostData <- function(startDate, today, postsDir, postPatt, mdRegexp, jsonRegexp, countURL) {
    cat(sprintf(paste("* Dates:",                      # First report date when counting started
                      "\n  - Date hit counting started: %s",
                      "\n  - Today:                     %s\n",
                      sep = ""),                       #  and today, so measuring blog hits btw dates
                format(startDate, format = "%Y-%b-%d"),#
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
      data.frame(PostFile  = postFile,                 # Construct dataframe row for this postFile
                 PostDate  = as.Date(sub(mdRegexp, "\\1", postFile), format = "%Y-%m-%d"),
                 PostHits  = as.integer(sub(jsonRegexp, "\\1",
                                            ## I wish we could batch these, not slowly 1 by 1!
                                            getURLContent(sprintf("%s/%s",
                                                                  countURL,
                                                                  gsub("/", "\\.",
                                                                       URLencode(sub(mdRegexp,
                                                                                     "/\\2/",
                                                                                     postFile))))))),
                 HitsStart = startDate,                # Keep track of when we started counting,
                 HitsEnd   = today)                    #  and today.  Counts are in that interval.
    }, .progress = progress_text())                    # Takes a minute; might as well show progress

    cat(sprintf("\n  - Result: %d rows of data:\n", nrow(postData)))
    showDataframeHeadTail(postData)                    # Show first few and last few rows

    postData                                           # Return data for posts
  }                                                    #

  savePostData <- function(destDir, destFile, postData) {
    if (!is.null(destFile)) {                          # If specified destination file
      f <- file.path(destDir, destFile)                #  make full pathname
      saveDataframe(postData, f)                       #   then save results
      cat(sprintf("* Saved to %s.\n", f))              #   report it
      TRUE                                             #   and flag that it was done
    } else {                                           # Else doesn't want report saved
      cat(sprintf("* Results not saved.\n"))           #   so don't do that
      FALSE                                            #   and flag that it was NOT done
    }                                                  #
  }                                                    #

  plotHitsVsTime <- function(postData, today, blogName, clGray, plotWidth, plotHeight,
                             destDir, destFile) {      # Outputs

    if (is.null(destFile))                             # If doesn't want the plot,
      cat(sprintf("* Hits vs time not plotted.\n"))    #  then don't do that
    else {                                             # Otherwise...
      f <- file.path(destDir, destFile)                # Destination pathname
      withPNG(f, plotWidth, plotHeight, FALSE, function() {
        withPars(function() {                          # Save/restore graphics parameters
          withPars(function() {                        # Set label orientation & add space @ bottom
            plot(panel.first = {
                   ## LOESS fit and 95% confidence interval as a function of time.  Imitated
                   ## from an example at:
                   ## https://stackoverflow.com/questions/22717930/how-to-get-the-confidence-intervals-for-lowess-fit-using-r
                   plx <- predict(loess(PostHits ~ PostDays,
                                  data = transform(postData,
                                                   PostDays = as.numeric(
                                                       PostDate - min(postData$"PostDate")))),
                                  se = TRUE)           # Get predictions and standard errors
                   ucl <- plx$"fit" + qt(0.975, plx$"df") * plx$"se"
                   lcl <- plx$"fit" - qt(0.975, plx$"df") * plx$"se"
                   minPosLCL <- min(subset(lcl, subset = lcl > 0))
                   lcl <- pmax(lcl, minPosLCL)         # Clip negatives up to min pos (log scale!)
                   polygon(x = c(postData$"PostDate", rev(postData$"PostDate")),
                           y = c(lcl, rev(ucl)),       # Polygon with shade of confidence limits
                           col = clGray, border = NA)  # Then LOESS line and CL borders (dashed)
                   lines(postData$"PostDate", plx$"fit", lwd = 2)
                   lines(postData$"PostDate", ucl,       lty = "dashed")
                   lines(postData$"PostDate", lcl,       lty = "dashed")
                 },                                    # Preliminaries done; now rest of plot:
                 x = postData$"PostDate", y = postData$"PostHits", pch = 21, bg = "blue",
                 ## ylim = c(1, max(postData$"PostHits")),
                 main = "Hits vs Time", ylab = "Post Hits (log scale)", log = "y",
                 xaxt = "n", xlab = NA)                # Horiz axis done manually, below

            rug(postData$"PostDate", side = 1, col = "gray")
            rug(postData$"PostHits", side = 2, col = "gray")

            yrRange <- sapply(range(postData$"PostDate"), function(d) { as.integer(format(d, "%Y")) })
            sapply(seq(from = yrRange[[1]], to = yrRange[[2]]), function(yr) {
              abline(v = as.Date(sprintf("%4d-Jan-01", yr), format = "%Y-%b-%d"),
                     lty = "solid", col = "gray")      # Draw vertical gray line @ Jan 01 of each year
            })                                         #  between min post date and max post date
            ## Vertical dashed line when hit counter was turned on
            abline(v = postData[1, "HitsStart"], col = "gray", lty = "dashed")

            legend("topleft", bg = "antiquewhite", inset = c(0.05, 0.01),
                   pch    = c(21,                NA,                    22,        NA,       NA),
                   pt.bg  = c("blue",            NA,                    clGray,    NA,       NA),
                   pt.cex = c(1.5,               NA,                    3,         NA,       NA),
                   col    = c("black",           "black",               clGray,    "gray",   "gray"),
                   lty    = c(NA,                "solid",               "dashed",  "dashed", "solid"),
                   lwd    = c(NA,                2,                     NA,        1,        1),
                   legend = c("Individual post", "LOESS central trend", "95% confidence interval",
                              "Hit counting started", "Year end"))

            withPars(function() {                      # Horiz axis only: extra space for date labels
              minPostDate <- min(postData$"PostDate")  # Get date range to be covered,
              maxPostDate <- max(postData$"PostDate")  #   make 1st day of month for each
              axis.Date(side = 1, format = "%Y-%b-%d", labels = TRUE,
                        at = seq(from = minPostDate - as.integer(getDay(minPostDate)) + 1,
                                 to   = maxPostDate - as.integer(getDay(maxPostDate)) + 1,
                                 by   = "month"))      # Ticks at start of each month
              mtext("Post Date", side = 1, line = 5.5, las = 0)
            }, mgp = c(7, 0.5, 0))                     # Horizontal axis only: title, label, tick

          }, las = 3,                                  # Always vertical labels, both axes
             mar = c(7, 3, 2, 1))                      # Extra margin @ bottom for date labels

          hist(postData$"PostHits", xlab = "Post Hits", ylab = "Freq(Post Hits)",
               main = "Hit Frequency Distribution", col = "blue", breaks = 20)

          title(main = sprintf("%s: Hits %s to %s; %d Posts %s to %s",
                               blogName,               # Overall title of all plots
                               format(postData[1, "HitsStart"], format = "%Y-%b-%d"),
                               format(postData[1, "HitsEnd"], format = "%Y-%b-%d"),
                               nrow(postData),         # Include number of posts
                               format(postData[1,              "PostDate"],   format = "%Y-%b-%d"),
                               format(postData[nrow(postData), "PostDate"],   format = "%Y-%b-%d")),
                outer = TRUE)                          # It's in the top outer margin

        }, pty   = "m",                                # Maximal plotting area
           bg    = "white",                            # Background
           mfrow = c(1, 2),                            # 1 row of 2 plots
           oma   = c(0, 0, 1, 0),                      # Outer margin @ top for overall title
           mar   = c(3, 3, 2, 1),                      # Pull in on margins
           mgp   = c(1.7, 0.5, 0))                     # Axis title, label, tick
      })                                               # Done with file capture
      cat(sprintf("* Hits vs time plot: %s.\n", f))    # Capture filename to transcript
    }                                                  #
    TRUE                                               # Flag that it was done
  }                                                    #

  withTranscript(postsDir, destDir, txFile, "Blog Post Hit Counts", function() {

    if (!is.null(clearVars)) {                         # Wants completely virgin calculation?
      heraldPhase("Clearing out previous results")     # Delete globals holding previous results
      removePreviousResults(clearVars)                 # Remove the requested globals
      cat("\n\n* Done.\n")                             # Yep, we did that.
    }                                                  #

    heraldPhase("Getting hit count for each post")     # Announce what we're doing
    maybeAssign("postData", function() {               # Collect hit count for each post
      getPostData(startDate, today, postsDir, postPatt, mdRegexp, jsonRegexp, countURL)
    })                                                 # Done retrieving counts

    heraldPhase("Saving results")                      # Save the results, maybe
    maybeAssign("postDataSaved", function() { savePostData(destDir, destFile, postData) })

    heraldPhase("Plotting hits vs time")               # Plot hits vs time and probability
    maybeAssign("hitPlotDone", function() {            #   distribution of hits
      plotHitsVsTime(postData, today, blogName, clGray,#
                     hitPlotWidth, hitPlotHeight, destDir, hitPlotFile)
    })                                                 #

    invisible(postData)                                # Return results invisibly (also in global var)

  })                                                   # End withTranscript()
}                                                      #
