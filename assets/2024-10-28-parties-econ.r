## Created on Thursday, October 24, 2024 at 10:45am EDT by WeekendEditor on WeekendEditorMachine.
## UnCopyright (c) 2024, nobody-in-particular.  All rights reversed.  As if you care.

toolsDir <- "../../tools"                              # Random tools
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphicsusua stuff

library("plyr")                                        # For ddply (yes, I haven't moved on)
#library("DescTools")                                   # For PseudoR2()
#library("glmnet")                                      # For glmnet()

##
## Does party control of presidency, house, and senate influence changes in economic variables?
##
## * Political variables back to 1977:
##   - House:  https://en.wikipedia.org/wiki/Party_divisions_of_United_States_Congresses
##   - Senate: https://en.wikipedia.org/wiki/Party_divisions_of_United_States_Congresses
##
## * Economic variables:
##   - Inflation (CPI all urban consumers): CPI-U, not seasonally adjusted, 12-month percent
##     change only.  1977-2023 available.
##     https://data.bls.gov/pdq/SurveyOutputServlet
##   - unemployment:
##     - U3 is too easy to game, basically human sacrifice of "discouraged workers"
##     - U6 rate from BLS via St louis fed, back to 1994 only
##       https://fred.stlouisfed.org/series/U6RATE
##     - Labor force participation rate is harder to game, but measures something related but different:
##       https://fred.stlouisfed.org/series/CIVPART
##   - GDP: annual average from 1977-2023.
##     https://fred.stlouisfed.org/series/GDP#0
##   - Stock market: prefer easily available investment vehicles, not pure indices, for realism.
##     Also: insist on TOTAL returns, i.e., with dividends and cap gain distributions reinvested.
##     Also^2: use Fisher equation to convert nominal returns to real returns, then compound
##     o VFINX: investable, fully expensed.  Now replaced by VFIAX, but this one has the long
##       tail into history.  Time series surprisingly hard to find!  (NB: totalreturns.com only
##       goes back to 1979?  Use that: inflation-adjusted, dividends reinvested.
##       https://totalrealreturns.com/s/VFINX?start=1977-01-01
##     o VTSMX/VTSAX: investable, fully expensed, total market.  Series only back to 1992, though.
##       Again, time series of total returns surprisingly hard to find!  Use that: inflation-adjusted,
##       dividends reinvested.
##       https://totalrealreturns.com/n/VTSMX?start=1977-01-01
##
## Build logistic regression models predicting sign of change of economic variable
## based on political variables and their pairwise and trifecta interactions.
##

## > rm("partyEconData", "partyEconDataConsolidated", "partyEconDataModels", "partyEconDataModels2"); doit()
doit <- function(## Inputs
                 dataDir          = ".",
                 dataFile         = "2024-10-28-parties-econ.tsv",
                 inflTarget       = 3.0,

                 ## Outputs
                 resultsDir       = ".",
                 txFile           = "2024-10-28-parties-econ-transcript.txt",
                 consolidatedFile = "2024-10-28-parties-econ-consolidated.tsv",
                 biclFile         = "2024-10-28-parties-econ-consolidated-bicluster.png") {

  loadData <- function(dataDir, dataFile) {            # Load data from tsv file
    f <- file.path(dataDir, dataFile)                  # Full pathname
    cat(sprintf("* Loading data from %s", f))          #
    partyEconData <- read.table(f, sep = "\t", header = TRUE, stringsAsFactors = TRUE)
    stopifnot(nrow(partyEconData) %% 2 == 0)           # Num years is even (2 year congressional terms)

    gdpButLast    <- partyEconData$"GDP"[1 : nrow(partyEconData) - 1]
    partyEconData <- transform(partyEconData,          # GDP is % change wrt previous year
                               GDP = round(c(NA, 100.0 * diff(GDP)/gdpButLast), digits = 1))

    cat(sprintf("\n - Found %d columns and %d rows:\n", nrow(partyEconData), ncol(partyEconData)))
    showDataframeHeadTail(partyEconData)               # Show off the fish we caught

    partyEconData                                      # Return the data
  }                                                    #

  consolidateData <- function(partyEconData, inflTarget, resultsDir, consolidatedFile, biclFile,
                              legendFrac = 0.15, nColors = 256) {

    compound2 <- function(r1, r2) {                    # Geom mean compound anualized rate
      ## Basically, geometric average compounding: (1 + r)^2 = (1 + r1) * (1 + r2)
      ## ... and some meepery with 100 to convert from % to fraction and back.
      round((sqrt((1 + r1/100.0) * (1 + r2/100.0)) - 1) * 100.0, digits = 1)
    }                                                  #

    fisherReal <- function(nr, i) {                    # Fisher eqn for real return in terms of
      ((1 + nr/100.0) / (1 + i/100.0) - 1) * 100.0     #  nominal return and inflation
    }                                                  # https://en.wikipedia.org/wiki/Fisher_equation

    average2 <- function(x1, x2) { round((x1 + x2)/2.0, digits = 1) }

    ## Step 1: consolidate econ vars within each congressional term (consecutive row pairs)
    cat(sprintf("* Averaging & compounding data by 2-year congressional terms"))
    partyEconDataConsolidated <-                       #
      ## Congressional term is computed from number of years from start; 1977 was the 95th congress
      ddply(transform(partyEconData, CongrTerm = floor((partyEconData$"Year" - 1977) / 2) + 95),
            "CongrTerm",                               #
            function(ctdf) {                           # cwe tdf should be 2 rows, for 2 yr congr term
              stopifnot(nrow(ctdf) == 2)               # Ensure all is as it seems
              ## These should not change within a congressional term. (Possible, though:
              ## one year there was a senate change because Jeffords changed parties.  We
              ## coded that as a Dem term because almost all the time was AFTER the switch to Dems.)
              stopifnot(ctdf[1, "President"]      == ctdf[1, "President"])
              stopifnot(ctdf[1, "PartyPresident"] == ctdf[1, "PartyPresident"])
              stopifnot(ctdf[1, "PartyHouse"]     == ctdf[1, "PartyHouse"])
              stopifnot(ctdf[1, "PartySenate"]    == ctdf[1, "PartySenate"])

              data.frame(                              #
                  ## Years is hypenated 2 years of this congressional term
                  Years          = factor(sprintf("%d-%d", ctdf[1, "Year"], ctdf[2, "Year"])),

                  ## Pass along the partisanship data
                  President      = ctdf[1, "President"],
                  PartyPresident = ctdf[1, "PartyPresident"],
                  PartyHouse     = ctdf[1, "PartyHouse"],
                  PartySenate    = ctdf[1, "PartySenate"],

                  ## Create interactions (if we figure out how to use glmnet() on factors).
                  ##
                  ## This is distinct from just taking the factor products F1:F2, or doing the
                  ## triple combinations (F1 + F2 + F3)^3 in the R formula language.
                  ##
                  ## Not *all* factor combinations are interesting, i.e., House/Senate
                  ## being D/R or R/D is about the same.  We're interested in the case
                  ## where one party runs the board, or not.  So the combinations there
                  ## are D/D, Mixed, and R/R.
                  ##
                  ## Similarly, the trifecta levels are D/D/D, Mixed, or R/R/R.
                  ## Force the factor levels to be D, Mixed, R in exactly that order.
#                  PartyPresHouse  = factor(ifelse(ctdf[1, "PartyPresident"] == ctdf[1, "PartyHouse"],
#                                                  as.character(ctdf[1, "PartyPresident"]),
#                                                  "Mixed"),
#                                           levels = c("D", "Mixed", "R")),
#                  PartyPresSenate = factor(ifelse(ctdf[1, "PartyPresident"] == ctdf[1, "PartySenate"],
#                                                  as.character(ctdf[1, "PartyPresident"]),
#                                                  "Mixed"),
#                                           levels = c("D", "Mixed", "R")),
#                  PartyHouseSenate = factor(ifelse(ctdf[1, "PartyHouse"] == ctdf[1, "PartySenate"],
#                                                  as.character(ctdf[1, "PartyHouse"]),
#                                                  "Mixed"),
#                                           levels = c("D", "Mixed", "R")),
#                  PartyPresHouseSenate = factor(       #
#                      ifelse(ctdf[1, "PartyPresident"] == ctdf[1, "PartySenate"] &
#                             ctdf[1, "PartyPresident"] == ctdf[1, "PartyHouse"],
#                             as.character(ctdf[1, "PartyPresident"]),
#                             "Mixed"),                 #
#                      levels = c("D", "Mixed", "R")),  #

                  ## Inflation is compounded
                  Inflation      = compound2(ctdf[1, "Inflation"], ctdf[2, "Inflation"]),

                  ## U6 and LFPR are averaged over the 2 years of the congressional term
                  U6             = average2(ctdf[1, "U6"],   ctdf[2, "U6"]),
                  LFPR           = average2(ctdf[1, "LFPR"], ctdf[2, "LFPR"]),

                  ## GDP is percent change wrt previous year, so we compound it
                  ## *** Should this be corrected for running cumulative inflation since 1977?
                  GDP            = compound2(ctdf[1, "GDP"],   ctdf[2, "GDP"]),

                  ## Stock market total returns are compounded, annualized rates.
                  ## Already converted to real rates, so nothing more to do beyond compounding.
                  ##   after using Fisher equation to convert to real (after inflation) returns
                  VFINX          = compound2(ctdf[1, "VFINX"], ctdf[2, "VFINX"]),
                  VTSMX          = compound2(ctdf[1, "VTSMX"], ctdf[2, "VTSMX"]))
            })                                         #
    cat(sprintf("\n  - Now have %d rows x %d columns", # Describe shape
                nrow(partyEconDataConsolidated), ncol(partyEconDataConsolidated)))

    ## Step 2: summarize each consolidated econ var as Better/Worse
    cat(sprintf("\n\n* Adding Better/Worse indicator variables"))
    partyEconDataConsolidated <-                       #
      transform(partyEconDataConsolidated,             #
                ## Inflation is worse if above Fed target rate, else better.  (Deflation not considered.)
                InflationIndic = factor(ifelse(Inflation > inflTarget, "Worse", "Better")),

                ## Unemployment is worse if it rises, else better.
                ## Labor force participation rate goes opposite to unemployment.
                ## *** Could also credibly compare these versus the mean?
                ##     But that would penalize when prev admin dug a hole & it took years to climb out.
                U6Indic        = factor(c(NA, ifelse(diff(U6)   >= 0, "Worse",  "Better"))),
                LFPRIndic      = factor(c(NA, ifelse(diff(LFPR) >= 0, "Better", "Worse"))),

                ## GDP is better if it rises, worse if it falls.
                ## Here we're asking if the annualized compounded 2-year growth rate is above/below avg.
                GDPIndic       = factor(ifelse(GDP >= mean(GDP, na.rm = TRUE), "Better", "Worse")),

                ## Stock market returns higher than the dataset average are better, worse if lower.
                ## This gets us more information, as the stock market USUALLY goes up.
                VFINXIndic     = factor(ifelse(VFINX >= mean(VFINX, na.rm=TRUE), "Better", "Worse")),
                VTSMXIndic     = factor(ifelse(VTSMX >= mean(VTSMX, na.rm=TRUE), "Better", "Worse")))
    cat(sprintf("\n  - Now have %d rows x %d columns", # Describe shape
                nrow(partyEconDataConsolidated), ncol(partyEconDataConsolidated)))

    f <- file.path(resultsDir, consolidatedFile)       # Save consolidated data for peer review
    cat(sprintf("\n\n* Saving consolidated data to %s", f))
    saveDataframe(partyEconDataConsolidated, f)        #

    ## https://stats.stackexchange.com/questions/108007/correlations-with-unordered-categorical-variables
    ## chi-squared as a test of significant association
    ## Cramer's V as a test of strength of association
    ## https://rstudio-pubs-static.s3.amazonaws.com/558925_38b86f0530c9480fad4d029a4e4aea68.html#cramers-v
    cat(sprintf("\n* Crosstabulation of political predictors:"))
    cat(sprintf("\n  - President vs House:\n"))        #
    tbl <- table(partyEconDataConsolidated$"PartyPresident", partyEconDataConsolidated$"PartyHouse")
    print(tableRowColTotals(tbl)); print(chisq.test(tbl))

    cat(sprintf("\n  - President vs Senate:\n"))       #
    tbl <- table(partyEconDataConsolidated$"PartyPresident", partyEconDataConsolidated$"PartySenate")
    print(tableRowColTotals(tbl)); print(chisq.test(tbl))

    cat(sprintf("\n  - House vs Senate:\n"))           #
    tbl <- table(partyEconDataConsolidated$"PartyHouse", partyEconDataConsolidated$"PartySenate")
    print(tableRowColTotals(tbl)); print(chisq.test(tbl))

    ## Bicluster of econ outcome vars (continuous, not indicators) correlation
    f2 <- file.path(resultsDir, biclFile)              #
    cat(sprintf("\n* Biclustering econ correlations to %s.", f2))
    withPNG(f2, 1000, 1000, FALSE, function() {        #
      withPars(function() {                            #
        corMx <- round(cor(subset(partyEconDataConsolidated, select = c(U6, LFPR, GDP, VFINX, VTSMX)),
                           use = "pairwise.complete.obs"), digits = 2)

        ## Need to compute dendrograms OUTSIDE heatmap(), so rowInd/colInd can be used in the add.expr{}.
        ## Absolute value in rowMeans in reorder means U6 and GDP, anticorrelated, form a sub-block.
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
                main = "Economic Measures: Pearson Correlations",
                add.expr = {                           #
                  sapply(1 : n, function(r) {
                    sapply(1 : n, function(c) {
                      ## Print the correlations to 2 decimal places in each box
                      ##  basically writing corMx[rowInd, colInd] over the cells of the heatmap
                      ## *** n - r + 1 respects revC, swapping row/col is counter-transpose?
                      text(c, n - r + 1, labels = sprintf("%.2f", corMx[rowInd[r], colInd[c]]), cex = 3)
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
         ps  = 10,                                     # Larger type size for file capture
         omd = c(legendFrac, 1, 0, 1),                 # Leave room for color bar legend
         mar = c(1, 2, 1, 1))                          # Pull in on margins
    })

    partyEconDataConsolidated                          # Return the consolidated data
  }                                                    #

  buildModels <- function(partyEconDataConsolidated, interactions) {
    ## We have 3 basic predictors, 3 pairwise interactions and 1 triplet interaction:
    ## o PartyPresident, PartyHouse, and PartySenate
    ## o PartyPresHouse, PartyPresSenate, and PartyHouseSenate
    ## o PartyPresHouseSenate
    ##
    ## So that's 7 predictors and an intercept, for an 8-parameter model.
    ##
    ## By rights we should be using glmnet() to do a LASSO model and have it select features
    ## for a lower number of parameters preserving prediction.  However, glmnet() with factor
    ## predictors is surprisingly hard!  After thrashing about with model.matrix(), dummy coding,
    ## and level contrasts, I was unable to make it work.
    ##
    ## So, with apologies, we'll just do a single full-up model and hope someone corrects us.
    ## Use LASSO/glmnet: https://glmnet.stanford.edu/reference/glmnet.html

#    regData <- subset(partyEconDataConsolidated,
#                      select = c(PartyPresident, PartyHouse, PartySenate,
#                                 PartyPresHouse, PartyPresSenate, PartyHouseSenate,
#                                 PartyPresHouseSenate,
#                                 InflationIndic))
#    regData <- subset(regData, subset = complete.cases(regData))
#    ## *** Need to use model.matrix() to dummy-code the factors, insisting on R as reference level?
#    ## x <- subset(regData, select = -InflationIndic)
#    x <- model.matrix(InflationIndic ~ PartyPresident + PartyHouse + PartySenate + PartyPresHouse + PartyPresSenate + PartyHouseSenate + PartyPresHouseSenate, data = regData)
#    y <- subset(regData, select = InflationIndic)
#    mdl <- glmnet(x, y, family = "binomial", alpha = 1, standardize = FALSE)

    ## (a + b + c)^3 includes each var, 2-way, and 3-way interactions
    depVars   <- data.frame("DepVar" = grep("^.*Indic$", names(partyEconDataConsolidated), value = TRUE))
    indepVars <- grep("^Party.*$", names(partyEconDataConsolidated), value = TRUE)
    rhs       <- paste(indepVars, collapse = " + ")    # Simple model, no interaction terms
    if (interactions) rhs <- sprintf("(%s)^3", rhs)    # Doing pairwise and triplet interactions?

    tbl <- ddply(depVars, "DepVar", function(depVar) { # Predict each dependent variable in turn
      depVar  <- as.character(depVar)                  #
      foo     <- subset(partyEconDataConsolidated, select = c(indepVars, depVar))
      foo     <- subset(foo, subset = complete.cases(foo)) # *** Normally bad; here pure function of time
      formula <- as.formula(sprintf("%s ~ %s", depVar, rhs))
      mdl     <- glm(formula, family = binomial(link = logit), data = foo)

      cat(sprintf("\n* %s being predicted:", depVar))  # For transcript: dependent variable
      cat(sprintf("\n  - Interactions included: %s\n", interactions))
      print(summary(mdl))                              #  and the model fit

      ## For each dependent variable, predict probability of "Worse".
      ## Report as (sorta) strength the Mann-Whitney rank test p-value for separating Better/Worse
      results <- data.frame(DepVar = foo[, depVar],    # Predict, get Mann-Whitney p-value
                            pHat   = predict.glm(mdl, newdata = foo, type = "response"))
      tst <- wilcox.test(as.formula(pHat ~ DepVar), data = results, exact = FALSE) # ties!
      cat(sprintf("\n  - Prediction results: p ~ %g\n", tst$"p.value"))
      print(results[order(results$"pHat"), ])          # Sort on prediction value pHat

      ## Have to interpret negative R^2 here, which can be done, but is confusing to mundanes.
      ## cat(sprintf("\n  - McFadden pseudo-R2 ~ %g\n", PseudoR2(mdl, which = "McFaddenAd")))

      data.frame("AIC" = mdl$"aic", "p" = tst$"p.value")
    })                                                 # Return table of AIC and Mann-Whitney p

    ## *** NB: not crossvalidated, not LASSO regularized.  So, likely over-optimistic!
    cat(sprintf("\n* Regression Akaike Information Criterion and Mann-Whitney rank p-values:\n"))
    tbl <- tbl[order(tbl$"p"), ]                       #
    print(tbl)                                         #

    tbl                                                # Return the table
  }                                                    #

  withTranscript(dataDir, resultsDir, txFile, "Parties vs Econ", function() {
    heraldPhase("Loading data")                        # Load the data
    maybeAssign("partyEconData", function() { loadData(dataDir, dataFile) })

    heraldPhase("Consolidating data")                  # Consolidate to indicators per congr term
    maybeAssign("partyEconDataConsolidated", function() {
      consolidateData(partyEconData, inflTarget, resultsDir, consolidatedFile, biclFile)
    })                                                 #

    heraldPhase("Fitting data")                        # Fit regression models on party control
    maybeAssign("partyEconDataModels",  function() { buildModels(partyEconDataConsolidated, TRUE)  })
    maybeAssign("partyEconDataModels2", function() { buildModels(partyEconDataConsolidated, FALSE) })

  })                                                   #
}                                                      # Done!
