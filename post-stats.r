## Created on Saturday, November 27, 2021 at 9:06am EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../tools"
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction

library("plyr")                                        # For ddply()
library("RCurl")                                       # For getURLContent()

##
## Collect stats on posts
##

postHits <- function(postsDir = "./_posts",
                     mdRegexp = "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)\\.md$",
                     countNS  = "www.someweekendreading.blog",
                     countURL = sprintf("https://api.countapi.xyz/get/%s", countNS),
                     baseURL  = sprintf("https://%s", countNS)
                     ## *** Add option to save in ./_drafts/post-hit-counts-%d.tsv (put in date)
                     ) {

  ## *** Add pipeline stuff, transcript, etc.  (Trnascript to file similar to .tsv save file)
  ddply(data.frame(PostFile = list.files(path = postsDir, pattern = "*.md")), "PostFile",
        function(postFile) {                           #
          pf            <- as.character(postFile[1, 1])#
          postDate      <- as.Date(sub(mdRegexp, "\\1", pf))
          ## What the analytics page does:
          ## https://api.countapi.xyz/get/www.someweekendreading.blog/{{ page.url | escape | replace: "/", "." }}
          postCountURL  <- sprintf("%s/%s",            #
                                   countURL, gsub("/", "\\.", URLencode(sub(mdRegexp, "/\\2/", pf))))
          postCountJSON <- getURLContent(postCountURL) #
          data.frame(PostDate  = postDate,             #
                     PostCount = as.integer(sub("^\\{.*\"value\":([0-9]+)\\}$", "\\1",
                                                postCountJSON)))
        }, .progress = progress_text())                #
}                                                      #
