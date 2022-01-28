## Created on Wednesday, January 19, 2022 at 5:45pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2022, SomeWeekendReading.blog.  All rights reserved.  As if you care.

suppressPackageStartupMessages({                       # Ssshh!  Quiet in the library...
  toolsDir <- "../../tools"                            # Tools available from the author
  source(file.path(toolsDir, "pipeline-tools.r"))      # Pipeline construction tools
  source(file.path(toolsDir, "graphics-tools.r"))      # Various graphics tools

  library("igraph")                                    # Finite graphs
  library("plyr")                                      # For ddply()
})                                                     #

##
## Biopharma corporate donations do US reps & senators who supported the 2021-Jan-06 insurrection.
## https://www.biocentury.com/article/641697
## https://www.science.org/content/blog-post/shame
## https://capaction.medium.com/the-corporations-trying-to-save-kevin-mccarthy-and-the-insurrection-caucus-43a74488416c
##

doit <- function(## Inputs
                 dataDir  = ".",                       #
                 dataFile = "2022-01-21-biopharma-insurrection-donors.tsv",
                 ## Map names of donors to shorter versions
                 donorMap = c("Biotechnology Innovation Organization (BIO)" = "BIO",
                              "Genentech unit of Roche"                     = "Genentech",
                              "Merck & Co."                                 = "Merck",
                              "Johnson & Johnson"                           = "J&J",
                              "Eli Lilly"                                   = "Lilly",
                              "GlaxoSmithKline"                             = "GSK"),
                 ## Map names of states to shorter versions
                 stateMap = c("Texas" = "TX", "Kan." = "KS", "Okla." = "OK", "Calif." = "CA",
                              "Neb." = "NB", "Pa." = "PA", "Ala." = "AL", "Ind." = "IN", "Ill." = "IL",
                              "Ga." = "GA", "Ariz." = "AZ", "Wyo." = "WY", "S.C." = "SC", "La." = "LA",
                              "Mont." = "MT", "Fla." = "FL", "N.C." = "NC", "Ohio" = "OH", "Va." = "VA",
                              "N.Y." = "NY"),

                 ## Outputs
                 destDir  = ".",                       #
                 txFile   = sub("^(.*)\\.tsv$", "\\1.txt", dataFile),
                 plotFile = sub("^(.*)\\.tsv$", "\\1.png", dataFile)) {

  loadData <- function(dataDir, dataFile, donorMap, stateMap) {
    f <- file.path(dataDir, dataFile)                  # Where teh data lives
    cat(sprintf("* Loading data from %s", f))          # Yack about it

    donorData <- read.table(f, sep = "\t", header = TRUE)
    cat(sprintf("\n  - Found %d columns (%s) x %d rows:\n",
                ncol(donorData), paste(colnames(donorData), collapse = ", "), nrow(donorData)))
    stopifnot(ncol(donorData) == 2 && colnames(donorData) == c("Donor", "Recipient"))

    ## Shorten recipient names:
    recipRegex <- "^(.*)\\. (.*), .* \\((.*)\\)$"      # Regexp to capture recip title, surname, state
    titles     <- sub(recipRegex, "\\1", as.character(donorData$"Recipient"))
    surnames   <- sub(recipRegex, "\\2", as.character(donorData$"Recipient"))
    states     <- stateMap[sub(recipRegex, "\\3", as.character(donorData$"Recipient"))]
    donorData  <- transform(donorData,                 # Replace name with shorter version
                            Recipient = factor(sprintf("%s %s (%s)", titles, surnames, states)))

    ## Shorten donor names:
    donorData <- transform(donorData,                  # If name is in map, use that else original
                           Donor = factor(ifelse(as.character(Donor) %in% names(donorMap),
                                                 donorMap[as.character(Donor)],
                                                 as.character(Donor))))
    showDataframeHeadTail(donorData)                   # Show off the fish we caught

    cat(sprintf("\n  - Number of recipients for each biopharma donor:\n"))
    foo <- ddply(donorData, "Donor", function(df) { data.frame(NRecipients = nrow(df)) })
    foo <- foo[order(-foo$"NRecipients", as.character(foo$"Donor"), decreasing = FALSE), ]
    print(foo)                                         # Show frequent donors

    cat(sprintf("\n  - Number of donors for each insurrectionist recipient:\n"))
    foo <- ddply(donorData, "Recipient", function(df) { data.frame(NDonors = nrow(df)) })
    foo <- foo[order(-foo$"NDonors", as.character(foo$"Recipient"), decreasing = FALSE), ]
    print(foo)                                         # Show frequent recipients

    donorData                                          # Return the dataframe
  }                                                    #

  makeDonorGraph <- function(donorData) {              # Make a bipartite, undirected graph
    cat(sprintf("* Making graph with %d donors and %d recipients",
                length(levels(donorData$"Donor")), length(levels(donorData$"Recipient"))))
    donorGraph <- graph_from_incidence_matrix(table(donorData), directed = FALSE, mode = "out")
    stopifnot(is.bipartite(donorGraph))                # Ensure it's bipartite
    cat(sprintf("\n  - Graph is verified to be bipartite\n"))
    donorGraph                                         # Return the graph
  }                                                    #

  plotBipartiteGraph <- function(donorGraph, donorData, destDir, plotFile) {
    ## *** Ok, I could never make this look pretty enough to satsify me, so I
    ##     perpeatrated the really hacky kludge that follows.

    ## Modeled after 2nd answer in:
    ##   https://stackoverflow.com/questions/31366066/how-to-plot-a-bipartite-graph-in-r
    ## V(g)$shape <- shape[as.numeric(V(g)$type) + 1]
    ## V(g)$color <- c('red', 'blue', 'green', 'steelblue', 'steelblue', 'steelblue', 'steelblue')
    ## E(g)$color <- ## 'gray'
    ## E(g)$color[E(g)['A' %--% V(g)]] <- 'red'
    ## E(g)$color[E(g)['B' %--% V(g)]] <- 'blue'
    ## E(g)$color[E(g)['C' %--% V(g)]] <- 'green'

    sortedDonors <- ddply(donorData, "Donor", function(df) { data.frame(NRecipients = nrow(df)) })
    sortedDonors <- as.character(
        sortedDonors[order(-sortedDonors$"NRecipients", as.character(sortedDonors$"Donor"),
                           decreasing = TRUE), ]$"Donor")

    sortedRecips <- ddply(donorData, "Recipient", function(df) { data.frame(NDonors = nrow(df)) })
    sortedRecips <- as.character(
        sortedRecips[order(-sortedRecips$"NDonors", as.character(sortedRecips$"Recipient"),
                           decreasing = FALSE), ]$"Recipient")

    ## Default xlim is [-1, +1], so put donors @ -0.5 and recipients @ +0.5
    V(donorGraph)$"x" <- ifelse(!V(donorGraph)$"type", -0.25, +0.25)
    ## Default ylim is [-1, +1].
    ## - So we want the bottom vertex at y1 = -1 and the top one at y2 = +1.
    ## - The vertex rank ranges from x1 = 1 to x2 = n.
    ## - Slope: m = (y2 - y1) / (x2 - x1) = 2 / (n - 1).
    ## - Slope-point formula for linear embedding:
    ##   y - y1 = m * (x - x1)
    ##   y = y1 + (2 / (n-1)) * (x - 1) = y1 + 2 * (x-1) / (n-1)
    nDonors <- length(levels(donorData$"Donor"))
    nRecips <- length(levels(donorData$"Recipient"))
    V(donorGraph)$"y" <- sapply(1 : length(V(donorGraph)), function(n) {
      ## *** More vertical spacing between vertices somehow?
      v <- V(donorGraph)[[n]]                          # sapply(V(donorGraph), ...) gets indices not vrtxs
      if (!v$"type")
        -1 + 2 * (match(v$"name", sortedDonors) - 1) / (nDonors - 1)
      else
        -1 + 2 * (match(v$"name", sortedRecips) - 1) / (nRecips - 1)
    })
    V(donorGraph)$"color"        <- ifelse(!V(donorGraph)$"type", "lightgray", "pink")
    V(donorGraph)$"shape"        <- ifelse(!V(donorGraph)$"type", "square",    "circle")
    V(donorGraph)$"label.degree" <- ifelse(!V(donorGraph)$"type", pi,          0)
    V(donorGraph)$"label.dist"   <- ifelse(!V(donorGraph)$"type",
                                           0.5 * nchar(V(donorGraph)$"name"),
                                           4)
    ##V(donorGraph)$"size"  <- sapply(1 : length(V(donorGraph)), function(n) {
    ##  7 * nchar(V(donorGraph)[[n]]$"name")
    ##})
    ## V(donorGraph)$"size2"  <- sapply(1 : length(V(donorGraph)), function(n) { 10 })

    f <- file.path(destDir, plotFile)
    withPNG(f, 400, 1000, FALSE, function() {
      withPars(function() {
        plot(donorGraph, vertex.label.color = "black", asp = FALSE)
        ## box(which = "plot")
      }, pty = "m",
         bg  = "white",
         mar = c(0, 2, 0, 5)
      )
    })
  }

  plotBipartiteGraph2 <- function(donorData, destDir, plotFile,
                                  donorx = -0.65, recipx = +0.25) {
    ## Really hacky kludge, doing it the hard way, because I don't understand igraph well enough!

    ## How to assign y coordinates to nodes:
    ## - Default ylim is [-1, +1], so we'll rank nodes and embed in that range
    ## - So we want the bottom vertex at y1 = -1 and the top one at y2 = +1
    ## - The vertex rank ranges from x1 = 1 to x2 = n
    ## - Slope: m = (y2 - y1) / (x2 - x1) = 2 / (n - 1)
    ## - Slope-point formula for linear embedding:
    ##   y - y1 = m * (x - x1)
    ##   y = y1 + m * (x - x1)            x -> 0
    ##     = -1 + (2 / (n-1)) * (x - 1) ---------> -1 - 2/(n-1) = -(n-1 + 2)/(n-1) = -(n+1)/(n-1)
    ##     = -1 - (2 / (n-1)) + (2 / (n-1)) * x
    ##     = -(n-1 + 2) / (n-1) + (2 / (n-1)) * x
    ##     = -(n+1)/(n-1) + (2 / (n-1)) * x   Agrees with above on y-intercept and slope.

    ## Sort Donors by # recipients and name, then add Rank, x, y
    sortedDonors <- ddply(donorData, "Donor", function(df) { data.frame(NRecipients = nrow(df)) })
    sortedDonors <- transform(transform(sortedDonors[order(-sortedDonors$"NRecipients",
                                                           as.character(sortedDonors$"Donor"),
                                                           decreasing = TRUE), ],
                                        Rank = 1 : nrow(sortedDonors)),
                              x = donorx,              # Add in points where edge joins on
                              y = -1 + 2 * (Rank - 1) / (nrow(sortedDonors) - 1))
    rownames(sortedDonors) <- as.character(sortedDonors$"Donor") # Look up by donor name

    ## Sort Recipients by # donors and name, then add Rank, x, y
    sortedRecips <- ddply(donorData, "Recipient", function(df) { data.frame(NDonors = nrow(df)) })
    sortedRecips <- transform(transform(sortedRecips[order(-sortedRecips$"NDonors",
                                                           as.character(sortedRecips$"Recipient"),
                                                           decreasing = TRUE), ],
                                        Rank = 1 : nrow(sortedRecips)),
                              x = recipx,              # Add in points where edge joins on
                              y = -1 + 2 * (Rank - 1) / (nrow(sortedRecips) - 1))
    rownames(sortedRecips) <- as.character(sortedRecips$"Recipient") # Look up by recipient name

    edges <- transform(donorData,                      # Add edge data
                       fromx = donorx,                 # Edge goes from here
                       fromy = sortedDonors[as.character(Donor),     "y"],
                       tox   = recipx,                 #  to here
                       toy   = sortedRecips[as.character(Recipient), "y"])

    f <- file.path(destDir, plotFile)                  # Where the plot goes
    withPNG(f, 400, 1000, FALSE, function() {          # Capture to file
      withPars(function() {                            # Save/restore graphics params
        plot(x = NA, y = NA,                           # Draw nothing; set up plot area & scale coords
             xlim = c(-1, +1), ylim = c(-1, +1), axes = FALSE, ann = FALSE, frame.plot = FALSE)
        text(x = sortedDonors$"x", y = sortedDonors$"y", labels = as.character(sortedDonors$"Donor"),
             adj = c(1, 0.5))                          # Put names of donors, to left of assigned point
        text(x = sortedRecips$"x", y = sortedRecips$"y", labels = as.character(sortedRecips$"Recipient"),
             adj = c(0, 0.5))                          # Put names of recipients, to right of point
        ddply(edges, c("Donor", "Recipient"), function(drdf) {
          lines(x = c(drdf$"fromx", drdf$"tox"), y = c(drdf$"fromy", drdf$"toy"))
          NULL                                         # Don't build a nonsense result from ddply()
        })                                             # Done with edges
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         ps  = 16,                                     # Larger type size for file capture
         mar = c(0, 0, 0, 0)                           # Pull in on margins
      )                                                # Done with graphics params
    })                                                 # Done with file capture
    cat(sprintf("* Plotted to %s\n", f))               # Log what we did to the transcript
  }                                                    #

  withTranscript(dataDir, destDir, txFile, "BioPharma Insurrectionist Donors", function() {

    heraldPhase("Loading biopharma/insurrectionist politician donor data")
    maybeAssign("donorData", function() { loadData(dataDir, dataFile, donorMap, stateMap) })

    heraldPhase("Making bipartite graph")              # Make finite graph
    maybeAssign("donorGraph", function() { makeDonorGraph(donorData) })

    heraldPhase("Plotting graph")                      # Plot the graph: relates donors to recipients,
    maybeAssign("plotDone", function() {               #  highlighting frequent offenders
      ## plotBipartiteGraph(donorGraph, donorData, destDir, plotFile)
      plotBipartiteGraph2(donorData, destDir, plotFile)# Do it the hard way, which is easier (oddly)!
    })                                                 #

  })                                                   # Done capturing transcript
}                                                      # Done overall
