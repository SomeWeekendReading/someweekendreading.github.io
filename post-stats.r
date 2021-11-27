## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../tools"
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction

library("plyr")                                        # For ddply()
library("RCurl")                                       # For getURLContent()

##
## Collect stats on posts
##

postHits <- function(## Inputs
                     postsDir = "./_posts",
                     mdRegexp = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                     countNS  = "www.someweekendreading.blog",
                     countURL = sprintf("https://api.countapi.xyz/get/%s", countNS),
                     baseURL  = sprintf("https://%s", countNS)

                     ## Outputs
                     destFile = sprintf("./drafts/post-hit-counts-%s.tsv", Sys.Date())) {

  ## What the analytics page does:
  ##
  ## https://api.countapi.xyz/get/www.someweekendreading.blog/{{ page.url | escape | replace: "/", "." }}
  ##
  ## NB: page.url returns a string like "/name/", so this escapes and puts periods
  ## both before and after: ".name.".  Historical accident, but let's stick with it.

  ## *** Add pipeline stuff, transcript, etc.  (Trnascript to file similar to .tsv save file)
  ans <- ddply(data.frame(PostFile = list.files(path = postsDir, pattern = "*.md")), "PostFile",
               function(postFile) {                    # Process each post's .md file
                 pf            <- as.character(postFile[1, 1])
                 postDate      <- as.Date(sub(mdRegexp, "\\1", pf))
                 postCount     <- as.integer(sub("^\\{.*\"value\":([0-9]+)\\}$",
                                                 "\\1",#
                                                 getURLContent(sprintf("%s/%s",
                                                                       countURL,
                                                                       gsub("/",
                                                                            "\\.",
                                                                            URLencode(sub(mdRegexp,
                                                                                          "/\\2/",
                                                                                          pf)))))))
                 data.frame(PostDate = postDate, PostCount = postCount)
               }, .progress = progress_text())         # Takes a minute or so; show progress

  if (!is.null(destFile)) {                            # If specified destination file
    saveDataframe(ans, destFile)                       #   then save results
    cat(sprintf("\nSaved to %s.", destFile))           #
  }                                                    #

  ans                                                  # Return the dataframe of results
}                                                      #

