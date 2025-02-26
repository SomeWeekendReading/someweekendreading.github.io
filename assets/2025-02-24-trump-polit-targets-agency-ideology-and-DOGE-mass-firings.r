## Created on Monday, February 24, 2025 at 2:34pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2025, SomeWeekendReading blog.  All rights reserved.  As if you care.

##
## Check Adam Bonica's analysis relating DOGE firings vs perceived department ideology
##
## Bonica's original copy of these data:
## https://docs.google.com/spreadsheets/d/1l80SG27cxUOAHknYvmp-LV6Ag5phGlBVJbqG2U066AI/edit?gid=0#gid=0
##

toolsDir <- "../../tools"                              # Random tools
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphics things
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff

library("performance")                                 # For r2_mcfadden()
library("glmnet")                                      # Crossvalidated classifier

## > rm("bonicaData", "scatterplotsDone", "actionTableDone", "regressionsDone", "biclusterDone", "confusionMatrixDone"); doit()
doit <- function(## Inputs
                 dataDir  = ".",
                 dataFile = "2025-02-24-trump-polit-targets-agency-ideology-and-DOGE-mass-firings.tsv",

                 ## Outputs
                 resultsDir  = ".",
                 scatterFile = "2025-02-24-trump-polit-targets-%s-ideology-firings.png",
                 biclFile    = "2025-02-24-trump-polit-targets-bicluster.png",
                 glmnetFile1 = "2025-02-24-trump-polit-targets-glmnet-coeffs-vs-lambda.png",
                 glmnetFile2 = "2025-02-24-trump-polit-targets-glmnet-cv-lse-vs-lambda.png",
                 txFile      = "2025-02-24-trump-polit-targets-agency-ideology-and-DOGE-mass-firings.txt") {

  loadBonicaData <- function(dataDir, dataFile) {      #
    f <- file.path(dataDir, dataFile)                  #
    cat(sprintf("* Loading Bonica data from %s", f))   #
    bonicaData <- transform(read.table(f, header = TRUE, sep = "\t", stringsAsFactors = TRUE),
                            ## Remove commas & parse as integer
                            Total_Staff              = as.integer(gsub(",", "",
                                                                       as.character(Total_Staff))),
                            ## Coerce to booleans (absent means FALSE)
                            doge_layoffs             = ifelse(!is.na(doge_layoffs) & doge_layoffs == 1,
                                                              TRUE, FALSE),
                            targeted_for_dismantling = ifelse(!is.na(targeted_for_dismantling) & targeted_for_dismantling == 1,
                                                              TRUE, FALSE))
    cat(sprintf("\n  - Found %d rows x %d columns:\n    %s\n",
                nrow(bonicaData), ncol(bonicaData), paste(colnames(bonicaData), collapse = ", ")))
    bonicaData                                         #
  }                                                    #

  agencyResults <- function(bonicaData) {              # Frequency of all 4 outcomes for agencies
    c("Both"             = nrow(subset(bonicaData, subset =  doge_layoffs &  targeted_for_dismantling)),
      "Dismantling Only" = nrow(subset(bonicaData, subset = !doge_layoffs &  targeted_for_dismantling)),
      "Layoffs Only"     = nrow(subset(bonicaData, subset =  doge_layoffs & !targeted_for_dismantling)),
      "Neither"          = nrow(subset(bonicaData, subset = !doge_layoffs & !targeted_for_dismantling)))
  }                                                    #

  showActions <- function(bonicaData) {                #
    cat(sprintf("* Intended actions on agencies, by ideology score:\n"))
    freqs <- data.frame("Left"  = agencyResults(subset(bonicaData,
                                                       subset = Perceived_Ideology_Estimate < 0)),
                        "Right" = agencyResults(subset(bonicaData,
                                                       subset = Perceived_Ideology_Estimate > 0)),
                        row.names = c("Both", "Dismantling Only", "Layoffs Only", "Neither"))
    print(tableRowColTotals(freqs))                                       # Show breakdown by left/right groups
    print(fisher.test(freqs))                          # Test statistical significance
    TRUE                                               # Flag that we've done this
  }                                                    #

  doScatterplot <- function(bonicaData, colName, resultsDir, scatterFile) {
    f <- file.path(resultsDir, sprintf(scatterFile, colName))
    cols <- c("Both"             = "purple",           #
              "Dismantling Only" = "yellow",           #
              "Layoffs Only"     = "red",              #
              "Neither"          = "gray")             #
    withPNG(f, 1400, 700, FALSE, function() {          #
      withPars(function() {                            #
        plot(x    = bonicaData$"Perceived_Ideology_Estimate",
             y    = bonicaData[, colName],             #
             bg   = ifelse(bonicaData$"doge_layoffs",
                           ifelse(bonicaData$"targeted_for_dismantling",
                                  cols[["Both"]],      #
                                  cols[["Layoffs Only"]]),
                           ifelse(bonicaData$"targeted_for_dismantling",
                                  cols[["Dismantling Only"]],
                                  cols[["Neither"]])), #
             log  = "y", pch = 21, cex = 2,            #
             xlab = "    Liberal <-- Agency Ideology --> Conservative",
             ylab = sprintf("%s (log scale)", colName),#
             main = sprintf("Agency %s vs Ideology and DOGE Firings", colName))
        legend("topleft", inset = 0.01, bg = "antiquewhite",
               legend = names(cols),                   #
               pt.bg  = cols,                          #
               pch    = 21,                            #
               col    = "black",                       #
               pt.cex = 2)                             #
        abline(v = 0, lty = "dashed", col = "black", lwd = 2)
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })                                                 #
    cat(sprintf("\n  - Scatterplot of %s vs ideology to %s.", colName, f))
    TRUE                                               #
  }                                                    #

  doBicluster <- function(bonicaData, resultsDir, biclFile, legendFrac = 0.15, nColors = 256) {
    f <- file.path(resultsDir, biclFile)
    cat(sprintf("\n\n* Biclustering correlations to %s.", f))
    withPNG(f, 1000, 1000, FALSE, function() {
      withPars(function() {
        corData <- transform(subset(bonicaData, select = c(Perceived_Ideology_Estimate,
                                                           Annual_Budget_USD, Total_Staff,
                                                           doge_layoffs)),
                             Annual_Budget_USD = log(Annual_Budget_USD),
                             Total_Staff       = log(Total_Staff))
        corMx <- round(cor(corData, use = "pairwise.complete.obs"), digits = 2)
        ## Need to compute dendrograms OUTSIDE heatmap(), so rowInd/colInd can be used in the add.expr{}.
        ## abs() to bring some negatively correlated vars together
        n             <- nrow(corMx)                   #
        rowDendrogram <- reorder(as.dendrogram(hclust(dist(corMx))), rowMeans(abs(corMx)))
        rowInd        <- order.dendrogram(rowDendrogram)
        colDendrogram <- reorder(as.dendrogram(hclust(dist(t(corMx)))), colMeans(abs(corMx)))
        colInd        <- order.dendrogram(colDendrogram)
        cat(sprintf("\n  - Correlation matrix (pairwise complete observations):\n"))
        print(corMx[rowInd, colInd])                   # Same order as dendrograms will force in plot

        corrRange  <- range(corMx)                     # Range of correlations (inside [-1, +1])
        colors     <- makeSaturableHeatmapColorsBWR(nColors, corrRange[[1]], corrRange[[2]],
                                                    minSat = -1, midSat = 0, maxSat = +1)
        maxLabLen  <- max(nchar(rownames(corMx)))      #

        heatmap(corMx,                                 #
                Rowv = rowDendrogram, Colv = colDendrogram,
                symm = TRUE, revC = TRUE, scale = "none", col = colors,
                margins = 0.90 * c(maxLabLen, maxLabLen),
                main = "DOGE Firings: Pearson Correlations",
                add.expr = {                           #
                  sapply(1 : n, function(r) {
                    sapply(1 : n, function(c) {
                      ## Print the correlations to 2 decimal places in each box
                      ##  basically writing corMx[rowInd, colInd] over the cells of the heatmap
                      ## *** n - r + 1 respects revC, swapping row/col is counter-transpose?
                      text(c, n - r + 1, labels = sprintf("%.2f", corMx[rowInd[r], colInd[c]]), cex = 2)
                    })
                  })
                  box(which = "plot")                  # Draw a box around the whole plot
                })                                     #
        par(omd = c(0.02, legendFrac, 0, 1), pty = "m", new = TRUE)
        image(x    = 0,                                # draw the color bar
              y    = seq(from = corrRange[[1]], to = corrRange[[2]], along.with = colors),
              z    = matrix(1 : length(colors), ncol = length(colors)),
              cex.axis = 0.9,                          # Smaller labels
              las  = 1,                                # Label positioning
              ylim = c(-1, +1),                        # Show range of POSSIBLE correlations
              col  = colors,                           # Heatmap colors
              xaxt = "n", ylab = NA, xlab = NA)        #
        box(which = "plot")                            #

      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         ps  = 14,                                     # Larger type size for file capture
         omd = c(legendFrac, 1, 0, 1),                 # Leave room for color bar legend
         mar = c(1, 2, 1, 1))                          # Pull in on margins
    })                                                 #
  }                                                    #

  doRegression <- function(bonicaData, resultsDir, glmnetFile1, glmnetFile2) {
    cat(sprintf("\n* Regressions:"))                   #

    cat(sprintf("\n  - Silly linear regression (uncrossvalidated):\n"))
    sillyMdl <<- lm(doge_layoffs ~ Perceived_Ideology_Estimate + log(Annual_Budget_USD) + log(Total_Staff),
                    data = bonicaData)                 #
    print(summary(sillyMdl))                           #

    cat(sprintf("\n  - Slightly less silly logistic regression (uncrossvalidated):\n"))
    lessSillyMdl <<- glm(doge_layoffs ~ Perceived_Ideology_Estimate + log(Annual_Budget_USD) + log(Total_Staff),
                         family = binomial(link = "logit"), data = bonicaData)
    print(summary(lessSillyMdl))                       #
    print(r2_mcfadden(lessSillyMdl))                   #

    cat(sprintf("\n  - Simplest model using just agency perceived ideology as a predictor:"))
    simpleMdl <<- glm(doge_layoffs ~ Perceived_Ideology_Estimate,
                      family = binomial(link = "logit"), data = bonicaData)
    print(summary(simpleMdl))                          #
    print(r2_mcfadden(simpleMdl))                      #

    cat(sprintf("\n  - Doing cross-validated, LASSO-regluated logistic regression with glmnet()"))
    ## No factor predictors, so no need for model.matrix()
    ##
    ## NB: 5 cases missing data for annual budget:
    ##
    ## 13            Central Intelligence Agency
    ## 44  Federal National Mortgage Association
    ## 61 Federal Home Loan Mortgage Corporation
    ## 66           United States Postal Service
    ## 81   Federal Housing Administration (HUD)
    foo <- subset(bonicaData, select = c(doge_layoffs,
                                         Perceived_Ideology_Estimate,
                                         Annual_Budget_USD,
                                         Total_Staff))
    foo <- transform(subset(foo, subset = complete.cases(foo)),
                     Annual_Budget_USD = log(Annual_Budget_USD),
                     Total_Staff       = log(Total_Staff))

    mx <- as.matrix(subset(foo, select = c(Perceived_Ideology_Estimate,
                                           Annual_Budget_USD,
                                           Total_Staff)))
    glmMdl <<- glmnet(x = mx, y = foo$"doge_layoffs", # *** as.factor(bonicaData$"doge_layoffs")?
                      alpha = 1, family = binomial(link = "logit"))
    f1 <- file.path(resultsDir, glmnetFile1)
    cat(sprintf("\n    o Plot of coeffs vs lambda to %s", f1))
    withPNG(f1, 700, 700, FALSE, function() {
      withPars(function() {
        plot(glmMdl, xvar="lambda")
        legend("bottomright", inset = 0.01, bg = "antiquewhite",
               lty = "solid",
               ## No idea how to figure this out programamtically?!
               col    = c("black", "green", "red"),
               legend = c("Perceived_Ideology_Estimate", "log(Total_Staff)", "log(Annual_Budget_USD)"))
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })
    cv.glmMdl <<- cv.glmnet(x = mx, y = foo$"doge_layoffs", alpha = 1, family = binomial(link = "logit"))

    f2 <- file.path(resultsDir, glmnetFile2)
    cat(sprintf("\n    o Plot of crossvalidated error vs lambda to %s", f2))
    withPNG(f2, 700, 700, FALSE, function() {
      withPars(function() {
        plot(cv.glmMdl)
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })

    cat(sprintf("\n    o Coefficients at lambda min:\n"))
    print(coef(cv.glmMdl, s = "lambda.min"))           #

    cat(sprintf("\n    o Coefficients at lambda 1se:\n"))
    print(coef(cv.glmMdl, s = "lambda.1se"))           #

    TRUE                                               #
  }                                                    #

  confusionMatrix <- function(bonicaData, mdl, lambdaName) {
    ## Mostly because I don't understand assess.glmnet(), confusion.glmnet(), and roc.glmnet()
    cat(sprintf("\n* Computing confusion matrix for %s:\n", lambdaName))
    newx <- transform(subset(bonicaData, select = c(Perceived_Ideology_Estimate,
                                                    Annual_Budget_USD,
                                                    Total_Staff)),
                      Annual_Budget_USD = log(Annual_Budget_USD),
                      Total_Staff       = log(Total_Staff))
    ## Hit calling threshold is probability of 50%; this is the ROC parameter if we wanna do that
    preds <<- cbind(subset(bonicaData, select = c(Agency, doge_layoffs)),
                   predict(mdl, newx = as.matrix(newx), s = lambdaName, type = "response") > 0.5)
    tbl <<- table(subset(preds, select = -Agency))
    print(tbl)

    cat(sprintf("\n  - Overall correct   = %.2f%%\n  - Overall incorrect = %.2f%%\n",
                100.0 * (tbl[[1, 1]] + tbl[[2, 2]]) / sum(tbl),
                100.0 * (tbl[[1, 2]] + tbl[[2, 1]]) / sum(tbl)))

    cat(sprintf("\n  - PPV = Pr(DOGE layoffs | model positive)    = %.2f%%",
                100.0 * (tbl[[2, 2]] / (tbl[[2, 2]] + tbl[[1, 2]]))))
    cat(sprintf("\n  - NPV = Pr(No DOGE layoffs | model negative) = %.2f%%",
                100.0 * (tbl[[1, 1]] / (tbl[[1, 1]] + tbl[[2, 1]]))))
    cat(sprintf("\n  - FDR = Pr(No DOGE layoffs | model positive) = %.2f%%",
                100.0 * (tbl[[1, 2]] / (tbl[[1, 2]] + tbl[[2, 2]]))))
    cat(sprintf("\n  - NOV = Pr(DOGE layoffs | model negative)    = %.2f%%",
                100.0 * (tbl[[2, 1]] / (tbl[[2, 1]] + tbl[[1, 1]]))))
    cat("\n")
  }

  ## Main body of script begins here
  withTranscript(dataDir, resultsDir, txFile, "DOGE firings vs Ideology Estimates", function() {

    heraldPhase("Loading data")                        # Load the data
    maybeAssign("bonicaData", function() { loadBonicaData(dataDir, dataFile) })

    heraldPhase("Analyses")                            # But what does it MEAN?!
    maybeAssign("scatterplotsDone", function() {       #
      cat(sprintf("* Scatterplots colored by layoffs/dismantling:"))
      doScatterplot(bonicaData, "Total_Staff",       resultsDir, scatterFile)
      doScatterplot(bonicaData, "Annual_Budget_USD", resultsDir, scatterFile)
    })                                                 #
    maybeAssign("actionTableDone", function() { showActions(bonicaData)                           })
    maybeAssign("biclusterDone",   function() { doBicluster(bonicaData, resultsDir, biclFile)     })
    maybeAssign("regressionsDone", function() {
      doRegression(bonicaData, resultsDir, glmnetFile1, glmnetFile2)
    })
    maybeAssign("confusionMatrixDone", function() {
      confusionMatrix(bonicaData, cv.glmMdl, "lambda.1se")
      confusionMatrix(bonicaData, cv.glmMdl, "lambda.min")
    })

    invisible(NA)                                      # Return nothing of interest
  })                                                   # Done!
}
