## Created on Wednesday, December  4, 2024 at 6:53pm EST by Weekend Editor on WeekendEditorMachine.
## UnCopyright (c) 2024, Some Weekend Reading blog.  All rights reversed.  As if you care.

toolsDir <- "../../tools"                              # Random tools
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff

library("plyr")                                        # For ddply (yes, I haven't moved on)

##
## The further adventures of Republicans vs federal budget deficits.
##

## > rm("consolidatedData", "modelResults"); doit()
doit <- function(## Inputs
                 dataDir          = ".",
                 dataFile1        = "2024-12-05-parties-deficit-FYFSD-1977-2023.csv",
                 dataFile2        = "2024-12-05-parties-deficit-FYFSGDA188S-1977-2023.csv",
                 dataFile3        = "2024-10-28-parties-econ-consolidated.tsv",

                 ## Outputs
                 resultsDir       = ".",
                 txFile           = "2024-12-05-parties-deficit.txt",
                 consolidatedFile = "2024-12-05-parties-deficit-1977-2023-consolidated.tsv") {


  loadData <- function(dataDir, dataFile1, dataFile2, dataFile3, resultsDir, consolidatedFile) {

    extractYear <- function(x) {                       # Extract year from factor like 1977-01-01
      as.integer(sub("^([0-9]+).*$", "\\1", as.character(x)))
    }                                                  #

    consolidateCongressionalTerm <- function(df, colname) {
      cat(sprintf("\n  - Consolidating to congressinal terms by adding"))
      stopifnot(ncol(df) == 2)                         # Must be 2 cols of right names
      stopifnot(colnames(df) == c("DATE", colname))    #  and even number of years to get congr terms
      if (nrow(df) %% 2 == 1) df <- df[1 : (nrow(df) - 1), ]

      ## Congressional term is computed from number of years from start; 1977 was the 95th congress
      df <- ddply(transform(df, CongrTerm = floor((extractYear(df$"DATE") - 1977) / 2) + 95),
                  "CongrTerm",                         # Group by congressional terms
                  function(ctdf) {                     # Congr term dataframe
                    stopifnot(nrow(ctdf) == 2)         # Ensure all is as it seems!
                    data.frame(                        # Years and sum of relevant variable
                        ## Years is hypenated 2 years of this congressional term
                        Years          = factor(sprintf("%d-%d",
                                                        extractYear(ctdf[1, "DATE"]),
                                                        extractYear(ctdf[2, "DATE"]))),
                        X              = ctdf[1, colname] + ctdf[2, colname])
                  })                                   # Call it X, rename later
      df <- df[order(df$"CongrTerm"), ]                # Sort by term, add indicator variable
      df <- transform(df, Y = factor(c(NA, ifelse(diff(X) > 0, "Better", "Worse"))))
      colnames(df)[3:4] <- c(colname, sprintf("%sIndic", colname))

      cat(sprintf("\n    o Now have %d rows x %d columns: %s",
                  nrow(df), ncol(df), paste(colnames(df), collapse = ", ")))
      df                                               # Return the congressiona term dataframe
    }                                                  #

    f1  <- file.path(dataDir, dataFile1)               # Read in the deficit data
    cat(sprintf("* Loading deficit data from %s", f1)) #
    df1 <- read.table(f1, sep = ",", header = TRUE, stringsAsFactors = TRUE)
    cat(sprintf("\n  - Found %d rows x %d columns: %s",#
                nrow(df1), ncol(df1), paste(colnames(df1), collapse = ", ")))
    df1 <- consolidateCongressionalTerm(df1, "FYFSD")  # Consolidate it

    f2  <- file.path(dataDir, dataFile2)               # Read in the deficit as % of GDP data
    cat(sprintf("\n\n* Loading deficit data as a %% of GDP from %s", f2))
    df2 <- read.table(f2, sep = ",", header = TRUE, stringsAsFactors = TRUE)
    cat(sprintf("\n  - Found %d rows x %d columns: %s",#
                nrow(df2), ncol(df2), paste(colnames(df2), collapse = ", ")))
    df2 <- consolidateCongressionalTerm(df2, "FYFSGDA188S")

    f3  <- file.path(dataDir, dataFile3)               # Read in previous data, for party assignments
    cat(sprintf("\n\n* Loading previous party &c consolidated data from %s", f3))
    df3 <- subset(read.table(f3, sep = "\t", header = TRUE, stringsAsFactors = TRUE),
                  select = c(CongrTerm, Years, President, PartyPresident, PartyHouse,PartySenate))
    cat(sprintf("\n  - Found %d rows x %d columns: %s",#
                nrow(df3), ncol(df3), paste(colnames(df3), collapse = ", ")))
    cat(sprintf("\n  - Joining datasets on congressinoal term"))

    df3 <- merge(merge(df3, df1, by = c("CongrTerm", "Years")), df2, by = c("CongrTerm", "Years"))
    df3 <- df3[order(df3$"CongrTerm"), ]               # Merge with deficit data, sort by term

    cat(sprintf("\n    o Now have %d rows x %d columns: %s",
                nrow(df3), ncol(df3), paste(colnames(df3), collapse = ", ")))

    f4 <- file.path(resultsDir, consolidatedFile)      # Where the consolidated daa is saved
    saveDataframe(df3, f4)                             # Save it
    cat(sprintf("\n\n* Saved consolidated data to %s.\n", f4))

    df3                                                # Return the consolidated dataset
  }                                                    #

  buildModels <- function(consolidatedData, depVarPattern, indepVarPattern) {
    depVars   <- grep(depVarPattern, colnames(consolidatedData), value = TRUE)
    indepVars <- grep(indepVarPattern, colnames(consolidatedData), value = TRUE)
    tbl <- ddply(data.frame(DepVar = factor(depVars)), "DepVar", function(dvdf) {
      depVar  <- as.character(dvdf[1, "DepVar"])       #
      foo     <- subset(consolidatedData, select = c(indepVars, depVar, "Years"))
      foo     <- subset(foo, subset = complete.cases(foo)) # *** Normally bad; here pure function of time
      formula <- as.formula(sprintf("%s ~ %s", depVar, paste(indepVars, collapse = " + ")))
      mdl     <- glm(formula, family = binomial(link = logit), data = foo)

      cat(sprintf("\n* %s being predicted:", depVar))  # For transcript: dependent variable
      print(summary(mdl))                              #  and the model fit

      ## For each dependent variable, predict probability of "Worse".
      ## Report as (sorta) strength the Mann-Whitney rank test p-value for separating Better/Worse
      results <- data.frame(Years          = foo[, "Years"],
                            PartyPresident = foo[, "PartyPresident"],
                            PartyHouse     = foo[, "PartyHouse"],
                            PartySenate    = foo[, "PartySenate"],
                            DepVar         = foo[, depVar],
                            pHat           = predict.glm(mdl, newdata = foo, type = "response"))
      tst <- wilcox.test(as.formula(pHat ~ DepVar), data = results, exact = FALSE) # ties!
      cat(sprintf("\n  - Prediction results: p ~ %g\n", tst$"p.value"))
      print(results[order(results$"pHat"), ])          # Sort on prediction value pHat

      ## Have to interpret negative R^2 here, which can be done, but is confusing to mundanes.
      ## cat(sprintf("\n  - McFadden pseudo-R2 ~ %g\n", PseudoR2(mdl, which = "McFaddenAd")))

      data.frame("AIC" = mdl$"aic", "p" = tst$"p.value")
    })                                                 #

    ## *** NB: not crossvalidated, not LASSO regularized.  So, likely over-optimistic!
    cat(sprintf("\n* Regression Akaike Information Criterion and Mann-Whitney rank p-values:\n"))
    tbl <- tbl[order(tbl$"p"), ]                       #
    print(tbl)                                         #

    tbl                                                # Return the table
  }

  withTranscript(dataDir, resultsDir, txFile, "Parties vs Econ", function() {
    heraldPhase("Loading data")                        # Load the data
    maybeAssign("consolidatedData", function() {       #
      loadData(dataDir, dataFile1, dataFile2, dataFile3, resultsDir, consolidatedFile)
    })                                                 #

    maybeAssign("modelResults", function() {           #
      buildModels(consolidatedData, "^FYF.*Indic$", "^Party.*$")
    })                                                 #
  })                                                   #
}                                                      # Done!
