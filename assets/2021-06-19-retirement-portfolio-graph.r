## Created on Thursday, June 17, 2021 at 1:05pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, Some Weekend Reading.  All rights reserved.  As if you care.

toolsDir <- "../tools"                                 # Random tools available from the author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
library("data.tree")                                   # Tree data structure stuff
library("DiagrammeR")

##
## Retirement asset allocation as a tree
##

doit <- function(## Inputs
                 dataDir   = ".",                      #
                 dataFile  = "graph.tsv",              #
                 colorBox  = c("Cash" = "red", "Bonds" = "orange", "REITs" = "yellow",
                               ## *** Cyan gets ignored?  Hex gets ignored too?
                               "WorldStock" = "#00ffff", "US Stock" = "green",
                               "Foreign Stock" = "blue"),
                 ## *** fillcolor gets ignored, and no text appears in nodes if used?
                 colorFill = c("Cash" = "#ffcccc", "Bonds" = "#ffdb99", "REITs" = "#ffff99",
                               "WorldStock" = "#b2ffff", "US Stock" = "#99cc99",
                               "Foreign Stock" = "#b2b2ff"),


                 ## Outputs
                 resultsDir = "./graph-results",       #
                 txFile     = "graph-transcript.txt",  #
                 graphFile  = "graph.png",             #
                 graphLgnd  = "graph-legend.png") {    #

  makePortfolioTree <- function(dataDir, dataFile) {   # Make the portfolio as a data.tree

    f <- file.path(dataDir, dataFile)                  # Where the data description lives
    cat(sprintf("* Building portfolio tree from description in %s", f))
    portfolio <- as.Node(read.table(f, sep = "\t",     # Build tree from description in .tsv file
                                    header = TRUE,     # Strings, not factors (else get level nums!)
                                    stringsAsFactors = FALSE))

    cat(sprintf("\n  - Propagating values"))           #
    portfolio$Do(function(self) {                      # Non-leaf nodes should have Alloc which
      self$"Alloc" <- Aggregate(self, "Alloc", sum)    #  is the sum of their children
    }, traversal = "pre-order")                        # Enforce bottom-up calculation

    portfolio$Do(function(self) {                      # Add Asset/Description for non-leaf nodes
      if (is.null(self$"Asset"))       self$"Asset"       <- self$name
      if (is.null(self$"Description")) self$"Description" <- self$name
      ## But don't propagate AssetType; that's for leaf nodes only.
    })                                                 #

    cat(sprintf("\n  - Enforcing constraints"))        #
    stopifnot(portfolio$Get("Alloc")[[1]] == 100.0)    # Enforce that Allocs add up to 100%
    stopifnot(sum(portfolio$Get("Alloc", filterFun = isLeaf)) == 100.0)

    cat(sprintf("\n  - Here's what we built:\n"))      # Show off the fish we caught
    print(portfolio, "AssetType", "Description", "Alloc")

    portfolio                                          # Return the portfolio tree
  }                                                    #

  plotPortfolioTree <- function(portfolio, colorBox, colorFill) { # Plot the thing
    ## Example: https://cran.r-project.org/web/packages/data.tree/vignettes/applications.html
    SetGraphStyle(portfolio, rankdir = "LR")           # Plot left-to-right

    getNodeShape <- function(n) { if (isLeaf(n)) "ellipse"               else "folder" }
    getNodeColor <- function(n) { if (isLeaf(n)) colorBox[n$"AssetType"] else "black"  }
    getNodeFillColor <- function(n) { if (isLeaf(n)) colorFill[n$"AssetType"] else "black"  }
    getNodeLabel <- function(n) {                      #
      if (n$"Description" == n$"Asset")                #
        sprintf("%s\n%6.2f%%", n$"Asset", n$"Alloc")   #
      else                                             #
        sprintf("%s: %s\n%6.2f%%", n$"Asset", n$"Description", n$"Alloc")
    }                                                  #
    SetNodeStyle(portfolio,                            #
                 penwidth = 2,                         # Inherited
                 fontname = "helvetica",               # Inherited
                 shape    = getNodeShape,              # Others from fns, so done on every node
                 color    = getNodeColor,              #
#                 fillcolor = getNodeFillColor,         #
                 label    = getNodeLabel)              #

    SetEdgeStyle(portfolio, penwidth = 2)              # Inherited

    ## *** This really should be automated somehow in a column of graph.tsv
    SetEdgeStyle(portfolio$"FixedIncome",             inherit = FALSE, label = "b")

    SetEdgeStyle(portfolio$FixedIncome$"Cash",        inherit = FALSE, label = "0")
    SetEdgeStyle(portfolio$FixedIncome$Cash$"Cash",   inherit = FALSE, label = "0")
    SetEdgeStyle(portfolio$FixedIncome$"Bonds",       inherit = FALSE, label = "b")
    SetEdgeStyle(portfolio$FixedIncome$Bonds$"VSBSX", inherit = FALSE, label = "b/4")
    SetEdgeStyle(portfolio$FixedIncome$Bonds$"VSIGX", inherit = FALSE, label = "b/4")
    SetEdgeStyle(portfolio$FixedIncome$Bonds$"VTAPX", inherit = FALSE, label = "b/4")
    SetEdgeStyle(portfolio$FixedIncome$Bonds$"VTABX", inherit = FALSE, label = "b/4")

    SetEdgeStyle(portfolio$"Stocks",                  inherit = FALSE, label = "1-b")

    SetEdgeStyle(portfolio$Stocks$"REITs",            inherit = FALSE, label = "(1-b)r")
    SetEdgeStyle(portfolio$Stocks$REITs$"VGSLX",      inherit = FALSE, label = "(1-b)r(1-f)")
    SetEdgeStyle(portfolio$Stocks$REITs$"VGRLX",      inherit = FALSE, label = "(1-b)rf")

    SetEdgeStyle(portfolio$Stocks$"Total Markets",    inherit = FALSE, label = "(1-b)(1-r)t")
    SetEdgeStyle(portfolio$Stocks$"Tilts",            inherit = FALSE, label = "(1-b)(1-r)(1-t)")
    SetEdgeStyle(portfolio$Stocks$Tilts$"VSIAX",      inherit = FALSE, label = "(1-b)(1-r)(1-t)(1-f)")
    SetEdgeStyle(portfolio$Stocks$Tilts$"VFSAX",      inherit = FALSE, label = "(1-b)(1-r)(1-t)f")

    ## *** Plot a color legend, too: explain the colors.  Add to this plot if possible? Use colorBox.

    ## *** NB: doesn't work when stdout has been diverted, e.g., under withTranscript()?!
    plot(portfolio)                                    # Do the actual plotting (to HTML temp file?!)
    cat("* Done.\n")                                     # (Not really; see below.)

    TRUE                                               # Flag that it was done
  }                                                    #

  withTranscript(dataDir, resultsDir, txFile, "Portfolio Graph", function() {

    heraldPhase("Script archival")                     # Archive script for peer review
    archiveAnalysisScript(resultsDir, "graph.r")       #

    heraldPhase("Graph construction")                  # Build the tree asset allocation tree
    maybeAssign("portfolio", function() { makePortfolioTree(dataDir, dataFile) })

    heraldPhase("Graph drawing")                       # Draw a picture, in childish crayon
    maybeAssign("plotDone", function() { plotPortfolioTree(portfolio, colorBox, colorFill) })

    invisible(NA)                                      # Return nothing of interest
  })                                                   #

  plot(portfolio) # *** Doesn't work when stdout redirected?!  So do it here. *sigh*
  ## See: https://stackoverflow.com/questions/42108105/in-r-how-do-i-save-a-data-tree-plot-to-a-file
  ## > export_graph(ToDiagrammeRGraph(portfolio), file_name = file.path(resultsDir, graphFile), file_type = sub("^.*\\.([^\\.]+)$", "\\1", "graph.png"), width = 500, height = 800)
}                                                      #
