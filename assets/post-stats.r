## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Tools available from the author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Pipeline construction tools

library("plyr")                                        # For ddply()
library("RCurl")                                       # For getURLContent()

##
## Collect stats on posts
##
## *** Other stats: # comments for each post, # images for each post, byte count including
##     images for each post, ...
## *** Graphics (quarterly boxplot of hits, byte counts vs time, ...)
##

## Example:
## > postStats()
## or
## > rm("postData"); postStats()
## or
## > postData <- transform(read.table("../_drafts/post-stats-2021-Nov-27.tsv", sep = "\t", header = TRUE), PostDate = as.Date(PostDate), HitsStart = as.Date(HitsStart), HitsEnd = as.Date(HitsEnd))
postStats <- function(## Inputs
                      postsDir  = "../_posts",         # Local repository of posts (*.md files)
                      postPatt  = "*.md",              # What post files look like
                      mdRegexp  = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                      blogName   = "www.someweekendreading.blog",
                      countURL  = sprintf("https://api.countapi.xyz/get/%s", blogName),
                      startDate = "2021-Jul-15",       # When counting started
                      today     = format(Sys.Date(), "%Y-%b-%d"),
                      hitPlotWidth  = 800,
                      hitPlotHeight = hitPlotWidth / 2,

                      ## Outputs
                      destDir     = "../_drafts",      # Directory where results get written
                      txFile      = sprintf("post-stats-%s.txt", today),   # NULL for no tx
                      destFile    = sprintf("post-stats-%s.tsv", today),   # NULL for no save
                      hitPlotFile = if (is.null(destFile))
                                      NULL
                                    else
                                      sub("^(.*)\\.tsv$", "\\1-hits.png", destFile)) {

  getPostData <- function(startDate, today, postsDir, postPatt, mdRegexp, countURL) {
    cat(sprintf(paste("* Dates:",                      # First report date when counting started
                      "\n  - Date hit counting started: %s",
                      "\n  - Today:                     %s\n",
                      sep = ""),                       #
                startDate, today))                     #
    postFiles <- list.files(path = postsDir, pattern = postPatt)
    cat(sprintf("\n* Found %d posts to check for hit counts.\n", length(postFiles)))
    postData <- transform(ddply(data.frame(PostFile = postFiles), "PostFile", function(postFile) {
      pf       <- as.character(postFile[1, 1])         # Convert factor to string
      postDate <- as.Date(sub(mdRegexp, "\\1", pf))    # Extract date from post filename
      ## What the analytics page does:
      ##
      ## https://api.countapi.xyz/get/www.someweekendreading.blog/{{ page.url | escape | replace: "/", "." }}
      ##
      ## NB: page.url returns a string like "/name/", so this escapes and puts periods
      ## BOTH before AND after: ".name." -- a historical accident, but let's stick with it,
      ## since all our counters at countapi.xyz have that in them now.
      postHits <- as.integer(                          # Parse as integer
          sub("^\\{.*\"value\":([0-9]+).*\\}$", "\\1", #   extracted from JSON string
              getURLContent(sprintf("%s/%s",           # Construct URL to countapi.xyz, and
                                    countURL,          #  use "get" command to get its value
                                    gsub("/", "\\.", URLencode(sub(mdRegexp, "/\\2/", pf)))))))
      data.frame(PostDate = postDate, PostHits = postHits, HitsStart = startDate, HitsEnd = today)
    }, .progress = progress_text()),                   # Takes a minute; might as well show progress
    HitsStart = as.Date(HitsStart, format = "%Y-%b-%d"),
    HitsEnd   = as.Date(HitsEnd,   format = "%Y-%b-%d"))

    cat(sprintf("\n  - Result: %d rows of data:\n", nrow(postData)))
    print(head(postData))                              # Describe the fish we caught
    cat("...\n")                                       #
    print(tail(postData))                              #

    postData                                           # Return data for posts
  }                                                    #

  savePostData <- function(destDir, destFile, postData) {
    if (!is.null(destFile)) {                          # If specified destination file
      f <- file.path(destDir, destFile)                #  make full pathname
      saveDataframe(postData, f)                       #   then save results
      cat(sprintf("* Saved to %s.\n", f))              #   and report it
    } else                                             # Else doesn't want report saved
      cat(sprintf("* Results not saved.\n"))           #   so don't do that
    TRUE                                               # Flag that it was done
  }                                                    #

  plotHitsVsTime <- function(## Inputs
                             postData,
                             blogName   = "www.someweekendreading.blog",
                             plotWidth  = 800,
                             plotHeight = plotWidth / 2,

                             ## Outputs
                             destDir  = "../_drafts",
                             destFile = "post-stats-hits.png") {

    if (is.null(destFile))                             # If doesn't want the plot,
      cat(sprintf("* Hits vs time not plotted.\n"))    #  then don't do that
    else {                                             # Otherwise...
      f <- file.path(destDir, destFile)                # Destination pathname
      withPNG(f, plotWidth, plotHeight, FALSE, function() {
        withPars(function() {                          # Save/restore graphics parameters

          ## *** Add quarterly boxplot of hits?
          ## *** Should do horizontal axis manually: vertical dates, monthly intervals
          plot(x = postData$"PostDate", y = postData$"PostHits", pch = 21, bg = "blue", log = "y",
               xlab = "Post Date", ylab = "Post Hits (log scale)", main = "Hits vs Time")
               #ylim = c(1, max(postData$"PostHits")))
          rug(postData$"PostHits", side = 2, col = "gray")
          ## LOESS fit and 95% confidence interval as a function of time.  See example at:
          ## https://stackoverflow.com/questions/22717930/how-to-get-the-confidence-intervals-for-lowess-fit-using-r
          plx <- predict(loess(PostHits ~ PostDays,    # LOESS fit of hits vs days since min date
                               data = transform(postData,
                                                PostDays =
                                                  as.numeric(PostDate - min(postData$"PostDate")))),
                         se = TRUE)                    # Get predictions and standard errors
          lines(postData$"PostDate", plx$"fit")        # Main trend and 95% CL by t-distribution
          ## *** Do CL shaded polygon like everybody else (do first, plot points & fit curve on top)
          lines(postData$"PostDate", plx$"fit" + qt(0.975, plx$"df") * plx$"se", lty = "dashed")
          lines(postData$"PostDate", plx$"fit" - qt(0.975, plx$"df") * plx$"se", lty = "dashed")
          legend("topleft", bg = "antiquewhite", inset = 0.01,
                 pch    = c(21,                NA,            NA),
                 pt.bg  = c("blue",            NA,            NA),
                 lty    = c(NA,                "solid",       "dashed"),
                 legend = c("Individual Post", "LOESS trend", "95% confidence interval"))

          ## *** Show histogram sideways up against the y axis of the scatterplot?
          hist(postData$"PostHits", xlab = "Post Hits", ylab = "Freq(Post Hits)",
               main = "Hit Frequency Distribution", col = "blue", breaks = 20)

          title(main = sprintf("Hits on %s: %s to %s", # Overall title
                               blogName,               # Put blog name in title
                               format(postData[1, "HitsStart"], format = "%Y-%b-%d"),
                               format(postData[1, "HitsEnd"],   format = "%Y-%b-%d")),
                outer = TRUE)                          # It's in the top outer margin

        }, pty   = "m",                                # Maximal plotting area
           bg    = "white",                            # Background
           mfrow = c(1, 2),                            # 1 row of 2 plots
           oma   = c(0, 0, 1, 0),                      # Outer margin @ top for overall title
           mar   = c(3, 3, 2, 1),                      # Pull in on margins
           mgp   = c(1.7, 0.5, 0))                     # Axis title, label, tick
      })                                               # Done with file capture
      cat(sprintf("* Hits vs time plotted to %s.\n", f))
    }                                                  #
    TRUE                                               # Flag that it was done
  }                                                    #

  withTranscript(postsDir, destDir, txFile, "Blog Post Hit Counts", function() {

    heraldPhase("Getting hit count for each post")     # Announce what we're doing
    maybeAssign("postData", function() {               # Collect hit count for each post
      getPostData(startDate, today, postsDir, postPatt, mdRegexp, countURL)
    })                                                 # Done retrieving counts

    heraldPhase("Saving results")                      # Save the results, maybe
    maybeAssign("postDataSaved", function() { savePostData(destDir, destFile, postData) })

    heraldPhase("Plotting hits vs time")               # Plot hits vs time and probability
    maybeAssign("hitPlotDone", function() {            #   distribution of hits
      plotHitsVsTime(postData, blogName, hitPlotWidth, hitPlotHeight, destDir, hitPlotFile)
    })                                                 #

    invisible(postData)                                # Return the dataframe of results, invisibly
  })                                                   # End withTranscript()
}                                                      #
