## Created on Friday, April 16, 2021 at 4:19pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Various tools available from author
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline construction tools
source(file.path(toolsDir, "graphics-tools.r"))        # Graphics tools

library("plyr")                                        # For ddply()

##
## Do US state political slants affect vaccine uptake?
##

doit <- function(## Inputs
                 ## - Presidential popular vote percentages by states, assembled from Wikipedia
                 ##   for a previous post on Trump impeachment votes.
                 ## - Vaccine uptake rates (% used, % popln dosed 1ce, % popln dosed fully),
                 ##   from a CDC spreadsheet.
                 inputDir      = ".",
                 votesFile     = "2021-02-24-republican-impeachment-votes-states.tsv",
                 vaxUptakeFile = "2021-04-19-politics-vs-mask-and-vaccine-use-covid19_vaccinations_in_the_united_states.csv",

                 ## Outputs
                 resultsDir  = ".",
                 txFile      = "2021-04-19-politics-vs-mask-and-vaccine-use.txt",
                 omnibusFile = "2021-04-19-politics-vs-mask-and-vaccine-use-omnibus.tsv",
                 signifFile  = "2021-04-19-politics-vs-mask-and-vaccine-use-significance.tsv",
                 plotFile    = "2021-04-19-politics-vs-mask-and-vaccine-use-plot.png") {

  loadData <- function(inputDir, votesFile, vaxUptakeFile, resultsDir, omnibusFile) {
    f <- file.path(inputDir, votesFile)                # Where the votes data live
    cat(sprintf("* Loading votes data from %s.", f))   # Already simplified for impeachment vote post
    votesData <- transform(read.table(f, sep = "\t", header = TRUE),
                           TrumpMargin = TrumpPct - BidenPct,
                           TrumpState  = TrumpPct > BidenPct)

    f <- file.path(inputDir, vaxUptakeFile)            # Where the vaccine uptake data live
    cat(sprintf("\n* Loading vaccination uptake data from %s.", f))
    vaxData   <- subset(transform(subset(read.table(f, # Load & simplify the CDC spreadsheet
                                                    sep = ",",  header = TRUE,
                                                    na = "N/A", skip = 2),
                                         select = c(State.Territory.Federal.Entity,
                                                    Doses.Delivered.per.100K,
                                                    Doses.Administered.per.100k.by.State.where.Administered,
                                                    Percent.of.Total.Pop.with.at.least.One.Dose.by.State.of.Residence,
                                                    Percent.of.Total.Pop.Fully.Vaccinated.by.State.of.Residence)),
                                  Percent.Doses.Used = signif(100.0 *
                                    Doses.Administered.per.100k.by.State.where.Administered / Doses.Delivered.per.100K,
                                    digits = 3),
                                  State.Territory.Federal.Entity = factor(
                                      ## Why did they rename a state?!
                                      ifelse(State.Territory.Federal.Entity == "New York State",
                                             "New York",
                                             as.character(State.Territory.Federal.Entity)))),
                        select = -c(Doses.Delivered.per.100K,
                                    Doses.Administered.per.100k.by.State.where.Administered))
    names(vaxData) <- c("State", "PctPopln1Dose", "PctPoplnFullDose", "PctDosesUsed")

    ## Combine the data with a left outer join: drop territories, bureau of prisons,
    ## Indian health service, etc.  Just the states, for this analysis.
    cat("\n\n* Left outer join:\n")                    # Join on the state name
    votesVaxData <- merge(votesData, vaxData, by = "State", all.x = TRUE, all.y = FALSE)
    str(votesVaxData)                                  # Show what kind of fish we have caught
    stopifnot(nrow(votesVaxData) == 50)                # Caught renaming of New York this way!

    f <- file.path(resultsDir, omnibusFile)            # Where the omnibus dataset gets saved
    saveDataframe(votesVaxData, f)                     # Save it
    cat(sprintf("\n* Saved to %s.\n\n", f))            #

    votesVaxData                                       # Return the omnibus dataset
  }                                                    #

  testHypothesis <- function(votesVaxData, resultsDir, signifFile, plotFile) {
    ## Names of vars being tested and associated colors for plot
    cols <- c("PctDosesUsed" = "blue", "PctPopln1Dose" = "green", "PctPoplnFullDose" = "red")

    models <- NULL                                     # Keep regression models to plot lines later
    modelSignifs <- transform(ldply(names(cols), function(var) {
      cat(sprintf("\n* Testing relation of %s to TrumpMargin:", var))

      ## Continuous analysis: regressions.
      mdl    <- lm(as.formula(sprintf("%s ~ TrumpMargin", var)), data = votesVaxData)
      mdlSum <- summary(mdl)
      cat(sprintf("\n  - Regression:\n", var)); print(mdlSum)

      ## Binned analysis: 1-sided t-tests.
      tst <- t.test(x = subset(votesVaxData, subset = !TrumpState, select = var, drop = TRUE),
                    y = subset(votesVaxData, subset =  TrumpState, select = var, drop = TRUE),
                    alternative = "greater")           # Do blue states vaccinate more?
      cat(sprintf("\n  - t Test:\n")); print(tst)      #

      models[[var]] <<- mdl                            # Save model for later line plotting
      data.frame(Measure = var,                        # Table of significance for each variable
                 Adj.R2  = signif(mdlSum$"adj.r.squared", digits = 3),
                 Slope   = signif(coef(mdlSum)[["TrumpMargin", "Estimate"]], digits = 3),
                 Slope.p = signif(coef(mdlSum)[["TrumpMargin", "Pr(>|t|)"]], digits = 3),
                 tTest.p = signif(tst$"p.value", digits = 3))
    }), Slope.FDR = p.adjust(Slope.p, method = "BH"),  # Multiple hypothesis test correction to FDR
        tTest.FDR = p.adjust(tTest.p, method = "BH"))  #  by Benjamini-Hochberg method
    modelSignifs <- modelSignifs[, c("Measure",        # Order columns sensibly
                                     "tTest.p", "tTest.FDR",
                                     "Adj.R2", "Slope", "Slope.p", "Slope.FDR")]

    f <- file.path(resultsDir, signifFile)             # Where to save model significances
    saveDataframe(modelSignifs, f)                     # Save for presentation in spreadsheet
    cat(sprintf("\n* Model significances saved to %s.\n", f))
    print(modelSignifs)                                # Capture it to the transcript also

    f <- file.path(resultsDir, plotFile)               # Where the plot goes
    withPNG(f, 400, 400, FALSE, function() {           # Saving graphics to file
      maxMargin <- max(abs(votesVaxData$"TrumpMargin"))# Max Trump margin to set horizontal limits
      withPars(function() {                            # Save/restore graphics params
        matplot(x = votesVaxData$"TrumpMargin", y = votesVaxData[, names(cols)],
                type = "p", col = "black", pch = 21, bg = cols,
                xlim = c(-maxMargin, +maxMargin), ylim = c(0, 100),
                xlab = "Trump Margin (%)", ylab = "% Population or Doses",
                main = "State % Pop Vax/Doses Used vs Trump Margin")
        abline(v = 0, lty = "dashed", col = "gray")    # Vertical line at 0 Trump margin
        sapply(names(models), function(var) { abline(reg = models[[var]], col = cols[[var]]) })
        legend("bottomleft", bg = "antiquewhite", inset = 0.01,
               pch = 21, pt.cex = 1.5, pt.bg = cols, legend = names(cols))
      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background (sigh)
         las = 1,                                      # Tick labels always vertical
         ps  = 14,                                     # Larger type size for file capture
         mgp = c(1.7, 0.5, 0),                         # Axis title, label, tick
         mar = c(3, 3, 2, 1))                          # Pull in on margins
    })                                                 #
    cat(sprintf("\n* Plot saved to %s.\n\n", f))       #

    modelSignifs                                       # Return significance table
  }                                                    #

  ## Main body of script starts here
  withTranscript(inputDir, resultsDir, txFile, "US politics vs vax uptake", function() {

    heraldPhase("Data loading and left outer joins")   # Load presidential election data
    maybeAssign("votesVaxData", function() {           #  and vaccine uptake data for each state
      loadData(inputDir, votesFile, vaxUptakeFile, resultsDir, omnibusFile)
    })                                                 #

    heraldPhase("Statistical significance tests")      # Test relationship of various medical
    maybeAssign("modelSignifs", function() {           # behaviors to Trump margin
      testHypothesis(votesVaxData, resultsDir, signifFile, plotFile)
    })                                                 #

  })                                                   #
}                                                      #
