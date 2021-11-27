## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Tools available from the author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools

library("plyr")                                        # For ddply()
library("RCurl")                                       # For getURLContent()

##
## Collect stats on posts
##
## *** Other stats: # comments for each post, # images for each post, byte count including
##     images for each post, ...
## *** Graphics (hit count (log scale) vs time, prob dist hit counts, ...)
##

## Example:
## > postStats()
## or
## > rm("postData"); postStats()
postStats <- function(## Inputs
                      postsDir  = "../_posts",         # Local repository of posts (*.md files)
                      mdRegexp  = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                      countNS   = "www.someweekendreading.blog",
                      countURL  = sprintf("https://api.countapi.xyz/get/%s", countNS),
                      startDate = "2021-Jul-15",       # When counting started
                      today     = format(Sys.Date(), "%Y-%b-%d"),

                      ## Outputs
                      destDir  = "../_drafts",         # Directory where results get written
                      txFile   = sprintf("post-stats-%s.txt", today),   # NULL for no tx
                      destFile = sprintf("post-stats-%s.tsv", today)) { # NULL for no save

  withTranscript(postsDir, destDir, txFile, "Blog Post Hit Counts", function() {

    heraldPhase("Getting hit count for each post")     # Announce what we're doing
    maybeAssign("postData", function() {               # Collect hit count for each post
      cat(sprintf(paste("* Dates:",                    # First report date when counting started
                        "\n  - Date hit counting started: %s",
                        "\n  - Today:                     %s\n",
                        sep = ""),                     #
                  startDate, today))                   #
      postFiles <- list.files(path = postsDir, pattern = "*.md")
      cat(sprintf("\n* Found %d posts to check for hit counts.\n", length(postFiles)))
      ddply(data.frame(PostFile = postFiles), "PostFile", function(postFile) {
        pf       <- as.character(postFile[1, 1])       # Convert factor to string
        postDate <- as.Date(sub(mdRegexp, "\\1", pf))  # Extract date from post filename
        ## What the analytics page does:
        ##
        ## https://api.countapi.xyz/get/www.someweekendreading.blog/{{ page.url | escape | replace: "/", "." }}
        ##
        ## NB: page.url returns a string like "/name/", so this escapes and puts periods
        ## BOTH before AND after: ".name." -- a historical accident, but let's stick with it,
        ## since all the counters at countapi.xyz have that in them now.
        postHits <- as.integer(                        # Parse as integer
            sub("^\\{.*\"value\":([0-9]+)\\}$", "\\1", # Extract count from JSON return value
                getURLContent(sprintf("%s/%s",         # Construct URL to countapi.xyz, and
                                      countURL,        #  use "get" command to get its value
                                      gsub("/", "\\.", URLencode(sub(mdRegexp, "/\\2/", pf)))))))
        data.frame(PostDate = postDate, PostHits = postHits, HitsStart = startDate, HitsEnd = today)
      }, .progress = progress_text())                  # Takes a minute; might as well show progress
    })                                                 # Done retrieving counts
    cat(sprintf("\n  - Result: %d rows of data:\n", nrow(postData)))
    print(head(postData))                              # Describe the fish we caught

    heraldPhase("Saving results")                      # Save the results, maybe
    if (!is.null(destFile)) {                          # If specified destination file
      f <- file.path(destDir, destFile)                #  make full pathname
      saveDataframe(postData, f)                       #   then save results
      cat(sprintf("Saved to %s.\n", f))                #   and report it
    } else {                                           # Else doesn't want report saved
      cat(sprintf("Results not saved.\n"))             #   so don't do that
    }                                                  #

    invisible(postData)                                # Return the dataframe of results, invisibly
  })                                                   # End withTranscript()
}                                                      #
