## Created on Sunday, September 22, 2024 at 7:52am EDT by Weekend Editor on Weekend-Editor-Machine.
## UnCopyright (c) 2024, Some Weekend Reading blog.  All rights reversed.  As if you care.

toolsDir <- "../../tools"                              # Random tools
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphicsusua stuff

library("plyr")                                        # For ddply (yes, I haven't moved on)
library("Rgraphviz")                                   # Sigh.

##
## Try to give some better meaning -- mathematical meaning -- to the phrase "pathway to victory"
## in the Electoral College.
##
## Basicallly look at the subset DAG of swing states:
## - assign the locked-in states EC votes to the bottom node (empty set, no swing states)
## - enumerate paths upward, adding in Electoral College votes for each subset
## - identify places where you reach 270, and the path upward from the bottom node.
##
## From 2024-Sep-13 episode of The TEC Show (https://www.youtube.com/watch?v=oN4sE_DWGOQ&t=610s):
## - The swing states and their electoral votes are:
##   Nevada 6, Arizona 11, Wisconsin 10, Michigan 15, Georgia 16, North Carolina 16, Pennsylvania 19
## - The rest of the states are locked in, or nearly so.  This means:
##   o Dems start from 226 EC votes (140 Dem + 70 likely Dem + 16 lean Dem)
##   o Repubs start frm 219 EC votes (126 Repub + 93 likely Repub)
##

doit <- function(## Inputs
                 rBase       = 219,                    # Republican base EC votes
                 dBase       = 226,                    # Democratic base EC votes
                 needToWin   = 270,                    # Min EC votes to win
                 swingStates = c(AZ = 11, GA = 16, MI = 15, NC = 16, NV = 6, PA = 19, WI = 10),

                 ## Outputs
                 inDir       = ".",                    #
                 outDir      = ".",                    #
                 runName     = "Electoral Paths and Powersets",
                 txFile      = "2024-09-28-electoral-paths.txt",
                 plotFile    = "2024-09-28-electoral-paths-%s.png",
                 tsvFile     = "2024-09-28-electoral-paths.tsv") {

  makeSubsetData <- function(swingStates, outDir, tsvFile) {

    powerset <- function (x) {                         # A list of subsets of elements of vector x
      out <- list(x[NULL])                             # Initial list of NULL, but typed like x
      if (length(x) == 0)                              # If input set is empty,
        out                                            #  then powerset is list of just the empty set
      else if (length(x) == 1)                         # Else if input set is of length 1,
        c(out, list(x))                                #  then powerset is list of empty set and itself
      else {                                           # Else the set is of size > 1
        ## *** Explain this!  Is there a less side-effecty way to do it?
        ##     Perhaps a recursive helper function would be clearer?
        sapply(x, function(xi) { out <<- c(out, lapply(out, function(y) c(y, xi)))})
        out[order(unlist(lapply(out, length)))]        # Sort by cardinality of subset
      }                                                #
    }                                                  #

    ## First just make a list of all the powersets, and ensure each is alphabetically sorted
    cat(sprintf("* Making basic powerset list"))
    subsets <- lapply(powerset(names(swingStates)), function(s) { sort(s) })
    stopifnot(length(subsets) == 2^length(swingStates))
    cat(sprintf("\n  - Found the %d states have %d subsets, as expected.",
                length(swingStates), length(subsets)))

    ## Use that to make a more useful dataframe:
    ## - Name:        the comma-separated string of the state names, or "None" for the empty set
    ## - Card:        the cardinality of a set of states
    ## - ECVotes:     the sum of the electoral votes of a set of states
    ## - FormulaName: same as name, but with no commas, so it can be used in R formulas

    ## It turns out that since R 4.0.0, dataframes no longer by default convert string colums to factors.
    ## This apparentiy discombobulates ddply(), which errors obscurely:
    ## https://stackoverflow.com/questions/70163895/ddply-error-error-in-list-to-dataframeres-attr-data-split-labels-id
    ##
    ## Really I should just take a couple weeks to convert to tidyverse, but I don't want to take
    ## the time when I already understand ddply().  So as you can see below, I had to contort a bit.
    cat(sprintf("\n\n* Making dataframe"))             #
    subsetData <- data.frame(Name    = sapply(subsets, #
                                              function(subset) {
                                                if (length(subset) == 0)
                                                  "None"
                                                else   #
                                                  paste(subset, collapse = ",")
                                              }),      #
                             Card    = lengths(subsets),
                             ECVotes = sapply(subsets, function(subset) { sum(swingStates[subset]) }),
                             stringsAsFactors = TRUE)  # Do it the old way
    subsetData <- transform(subsetData, FormulaName = factor(gsub(",", "", as.character(Name))))

    ## A bit of defensive programming
    stopifnot(all(sapply(subsetData$"Name", function(n) {
      !is.unsorted(strsplit(as.character(n), split = ","))
    })))                                               # Insist that within each name, states are sorted

    ## Encode immediate subsets as a comma-separated string of FormulaName
    subsetData <- ddply(subsetData, "Name", function(ndf) {
      stopifnot(nrow(ndf) == 1)                        # Outer ddply() is a loop over each subset
      nCard <- ndf[1, "Card"]                          # Cardinality of this set
      if (nCard == 0)                                  # If this is the empty set
        data.frame(ndf, ImmedSubsets = NA)             #   then no immediate subsets
      else if (nCard == 1)                             # Else if this is a singlet set
        data.frame(ndf, ImmedSubsets = "None")         #   then empty set is only immed subset
      else {                                           # Else this set is nonempty, 2+ members
        ## Get the elements of this subset
        nSet    <- strsplit(as.character(ndf[1, "Name"]), ",")[[1]]
        ## Find siblings 1 lower in cardinality, detect which are subsets
        immSubs <- daply(subset(subsetData, subset = Card == nCard - 1), "Name", function(nndf) {
          stopifnot(nrow(nndf) == 1)                   # Should be unique by name
          nnSet <- strsplit(as.character(nndf[1, "Name"]), ",")[[1]]
          if (all(nnSet %in% nSet)) as.character(nndf[[1, "FormulaName"]]) else NA
        })                                             #
        immSubs <- immSubs[!is.na(immSubs)]            #
        ## Construct comma-separated FormulaNames
        data.frame(ndf, ImmedSubsets = paste(immSubs, collapse = ","))
      }                                                #
    })                                                 #
    subsetData <- transform(subsetData, ImmedSubsets = factor(ImmedSubsets))
    subsetData <- subsetData[order(subsetData$"Card",  # By cardinality, then EC votes, then ForumulaName
                                   subsetData$"ECVotes",
                                   as.character(subsetData$"FormulaName")), ]

    stopifnot(nrow(subsetData) == 2^length(swingStates))
    cat(sprintf("\n  - Found %d rows, as expected:\n", nrow(subsetData)))
    showDataframeHeadTail(subsetData)                  #

    cat(sprintf("\n  - Frequencies of subset cardinalities:"))
    print(table(subsetData$"Card"))                    # See how wide the graph gets

    bpFile <- file.path(outDir, sprintf(plotFile, "barplot"))
    withPNG(bpFile, 700, 700, FALSE, function() {      # Visual representation of cardinality table
      withPars(function() {                            #
        barplot(table(subsetData$"Card"), space = 0, col = "blue",
                xlab = "Cardinality", ylab = "Number of Subsets",
                main = "Number of Subsets With Each Cardinality")
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture)
    })                                                 #
    cat(sprintf("    o Barplot of frequencies to %s", bpFile))

    tsvPath <- file.path(outDir, tsvFile)              # Full pathname of save file
    saveDataframe(subsetData, tsvFile)                 # Save it in tsv format
    cat(sprintf("  - Saved to %s\n", tsvPath))         #

    subsetData                                         # Return the subset dataframe
  }                                                    #

  makeDAG <- function(subsetData) {                    #
    cat(sprintf("* Making powerset DAG of swing states, starting with %d EC votes.",
                subset(subsetData, subset = Name == "None", select = ECVotes, drop = TRUE)))

    dag <- new("graphNEL", nodes = as.character(subsetData$"FormulaName"), edgemode = "directed")
    ddply(subsetData, "FormulaName", function(fndf) {  #
      toNode    <- as.character(fndf[1, "FormulaName"])#
      if (as.character(toNode) != "None") {            #
        fromNodes <- strsplit(as.character(fndf[1, "ImmedSubsets"]), ",")[[1]]
        sapply(fromNodes, function(fromNode) { dag <<- addEdge(fromNode, toNode, dag, 1) })
      }                                                #
      NULL                                             #
    })                                                 #

    ## *** Kind of want ImmedSupersets instead, so we can work up from the bottom?
    ##     Or is it easier to work down from the bottom, finding the node that transistions to 270?
    ## *** add node, edge attributes here?
    ## *** adj(dag, "None") gets next level up; also edges(dag, "None")

    dag                                                # Return the DAG
  }                                                    #

  plotDAG <- function(dag, subsetData, resultsDir, plotFile, suffix, col, baseEC) {

    f <- file.path(outDir, sprintf(plotFile, suffix))
    cat(sprintf("\n* Plotting dag to %s", f))

    ## https://rdrr.io/bioc/Rgraphviz/man/GraphvizAttributes.html
    ## list names are node, graph, and edge
    ## List of attributes & settings: https://graphviz.org/doc/info/attrs.html
    gAttrs <- list(node  = list(shape = "ellipse", fixedsize = FALSE, fontsize = 12.0),
                   graph = list(center = TRUE, rankdir = "BT", ranksep = "equally", size = "8,8"))

    ## Names for the nodes
    ## *** color, fillcolor, fontcolor are node attributes
    ## *** fontsize, height, width
    ## *** Color nodes with > 270, optionally color arcs leading there from bottom?
    ##     Really only want to color the lowest such states.
    nAttrs <<- list(label = dlply(subsetData, "FormulaName", function(df) {
      sprintf("%s: %d", # *** break string into 2 or 3 lines, but doesn't render?
              if (df[1, "Name"] == "") "None" else df[1, "Name"],
              df[1, "ECVotes"] + baseEC)
    }))

    ## *** color is a possible edge attribute and a possible node attribute
    withPNG(f, 3000, 3000, FALSE, function() {
      withPars(function() {
        ## *** groups arg, by cardinality?
        ## *** highlight arg, to show paths? https://www.bnlearn.com/examples/graphviz-plot/
        plot(dag, "dot", attrs = gAttrs, nodeAttrs = nAttrs)
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture)
    })
    TRUE
  }

  ## Main body of script starts here
  withTranscript(inDir = inDir, resultsDir = outDir, transcriptFile = txFile, name = runName, function(){

    heraldPhase("Building swing state subset data")    # Build the subset data and save it to tsv file
    maybeAssign("subsetData", function() { makeSubsetData(swingStates, outDir, tsvFile) })

    heraldPhase("Building DAG")                        # Basic powerset of swing states & EC votes
    maybeAssign("dag", function() { makeDAG(subsetData) })

    heraldPhase("Plotting DAGs")
    maybeAssign("plottedDAG1", function() {
      plotDAG(dag, subsetData, resultsDir, plotFile, "1", NULL, 0)
    })
    maybeAssign("plottedDAG2", function() {
      plotDAG(dag, subsetData, resultsDir, plotFile, "2", "red", rBase)
    })
    maybeAssign("plottedDAG3", function() {
      plotDAG(dag, subsetData, resultsDir, plotFile, "3", "blue", dBase)
    })

  })                                                   #
}                                                      #
