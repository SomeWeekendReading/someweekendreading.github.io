## Created on Tuesday, November 12, 2024 at 9:22pm CDT by sgr on Kryfthanima.Local.
## Copyright (c) 2024, nobody-in-particular.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # My box of magic swords
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphics things
source(file.path(toolsDir, "pipeline-tools.r"))        # Pipeline tools

library("plyr")                                        # For ddply (yes, I haven't moved on)

##
## Examine the effect of the Wyoming Rule on the House
##
## Data sources:
## - Start with state poplns & congressional reps from Wikipedia, then remove
##   territories/DC/non-voting members, then recalculate percentages, and calculate
##   Wyoming Rule (WR) equivalents.
##   https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population
## - Delegation partisanship:
##   https://en.wikipedia.org/wiki/2022_United_States_House_of_Representatives_elections#:~:text=of%20the%20Clerk-,Per%20state,-%5Bedit%5D
## - Export from Apple .numbers file to .tsv for analysis here.
##
## Check results vs https://en.wikipedia.org/wiki/Wyoming_Rule
## Allocate new seats according to existing partisan divide in each state
##

## > rm("wyomingRuleData"); doit()
doit <- function(## Inputs
                 dataDir   = ".",                      #
                 dataFile  = "2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule.tsv",
                 dataFile2 = "2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-delegates.tsv",
                 nStates   = 50,                       # Sanity check: number of states
                 nHouse    = 435,                      # Sanity check: number of representatives

                 ## Outputs
                 resultsDir  = ".",                    # Results go here
                 dataSave    = "2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-omnibus.tsv",
                 txFile      = "2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule.txt",
                 boxplotFile = "2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-boxplot.png") {

  loadData <- function(dataDir, dataFile, dataFile2, nStates, nHouse, dataSave) {
    f <- file.path(dataDir, dataFile)                  # Full pathname to main data file
    cat(sprintf("* Loading data from %s", f))          # Log it to the transcript
    wyomingRuleData <- subset(read.table(f, sep = "\t", header = TRUE, stringsAsFactors = TRUE),
                              subset = State != "Totals")
    stopifnot(nrow(wyomingRuleData) == nStates)        # Enforce right number of states and house seats
    stopifnot(sum(wyomingRuleData$"House.Seats") == nHouse)

    f2 <- file.path(dataDir, dataFile2)                # Full pathname to state delegation partisanship
    cat(sprintf("\n* Loading partisanship data from %s", f2))
    wyomingRulePartisanship <- subset(read.table(f2, sep = "\t", header = TRUE, stringsAsFactors = TRUE),
                                      select = c(State, Republican, Democratic))
    stopifnot(nrow(wyomingRulePartisanship) == nStates)# Sanity check: number of states
    stopifnot(sum(wyomingRulePartisanship$"Democratic") + sum(wyomingRulePartisanship$"Republican")
              == nHouse)                               # Sanity check: number of house seats

    wyomingRuleData <- merge(wyomingRuleData, wyomingRulePartisanship, by = "State")
    wyomingRuleData <- transform(wyomingRuleData,      # Join on state name, label by delegation majority
                                 Partisanship = ifelse(Republican > Democratic, "Red", "Blue"))

    cat(sprintf("\n  - Found %d rows x %d cols", nrow(wyomingRuleData), ncol(wyomingRuleData)))
    cat(sprintf("\n  - Column names:\n    %s",         # Yack to the log about what we found in the data
                paste(colnames(wyomingRuleData), collapse = ", ")))
    cat(sprintf("\n  - Total current seats: %d\n  - Wyoming Rule seates: %d",
                sum(wyomingRuleData$"House.Seats"),    #
                sum(wyomingRuleData$"WR.House.Seats")))#

    f3 <- file.path(dataDir, dataSave)                 # Where to save the omnibus data file
    saveDataframe(wyomingRuleData, f3)                 # Save it
    cat(sprintf("\n* Saved to %s\n", f3))              # Log it to the transcript

    wyomingRuleData                                    # Return the omnibus data file
  }                                                    #

  withTranscript(dataDir, resultsDir, txFile, "Wyoming Rule", function() {
    heraldPhase("Loading data")                        # Load the data: state popln, electoral votes,
    maybeAssign("wyomingRuleData", function() {        #  reps, partisanship, % of national poln, etc.
      loadData(dataDir, dataFile, dataFile2, nStates, nHouse, dataSave)
    })                                                 #

    ## Slightly more blue reps to for majority-blue districts, but not statistically significant
    cat(sprintf("\n* New seats by state partisanship, and statistical (non-)significance:\n"))
    seatStats <<- ddply(wyomingRuleData, "Partisanship", function(pdf) {
      data.frame(Change.Total  = sum(pdf$"House.Seats.Change"),
                 Change.Mean   = round(mean(pdf$"House.Seats.Change"), digits = 2),
                 Change.StdDev = round(sd(pdf$"House.Seats.Change"),   digits = 2)) })
    print(seatStats)
    tst <- t.test(House.Seats.Change ~ Partisanship, data = wyomingRuleData)
    print(tst)
    bpPath <- file.path(resultsDir, boxplotFile)
    withPNG(bpPath, 700, 700, FALSE, function() {
      withPars(function() {                            # Boxplot house seats by state partisanship
        boxplot(House.Seats.Change ~ Partisanship, data = wyomingRuleData,
                xlab = "State Partisanship", ylab = "Additional Delegates",
                main = "Partisan Distribution of Wyoming Rule Delegates",
                col = c("blue", "red"))                #
        legend("topright", inset = 0.01, bg = "antiquewhite",
               fill = c("blue", "red"),                #
               legend = c(sprintf("Democrats:   %.2f ± %.2f",
                                  subset(seatStats, subset = Partisanship == "Blue", select = Change.Mean),
                                  subset(seatStats, subset = Partisanship == "Blue", select = Change.StdDev)),
                          sprintf("Republicans: %.2f ± %.2f",
                                  subset(seatStats, subset = Partisanship == "Red", select = Change.Mean),
                                  subset(seatStats, subset = Partisanship == "Red", select = Change.StdDev))))
      }, pty = "m",                                    #
         bg  = "white",                                #
         ps  = 16,                                     #
         mar = c(3, 3, 2, 1),                          #
         mgp = c(1.7, 0.5, 0))                         #
    })                                                 #
    cat(sprintf("\n  - Boxplot to %s.", bpPath))       #

    ## Assign new states like each state's D-R split: favors repubs?
    cat(sprintf("\n\n* Assign new delegates in proportion to state delegation's D-R ratio:\n"))
    foo <- transform(wyomingRuleData,                  #
                     RepublicanNew = round(House.Seats.Change * Republican / (Republican + Democratic)),
                     DemocraticNew = round(House.Seats.Change * Democratic / (Republican + Democratic)))
    print(c("Republican" = sum(foo$"RepublicanNew"), "Democratic" = sum(foo$"DemocraticNew")))

    ## Assign all new seats to state majority, assuming gerrymandering: favors dems, like overall case.
    cat(sprintf("\n\n* Gerrymandering: Assign new delegates to state delegation's majority:\n"))
    bar <- transform(wyomingRuleData,                  #
                     RepublicanNew = ifelse(Partisanship == "Red",  House.Seats.Change, 0),
                     DemocraticNew = ifelse(Partisanship == "Blue", House.Seats.Change, 0))
    print(c("Republican" = sum(bar$"RepublicanNew"), "Democratic" = sum(bar$"DemocraticNew")))

  })                                                   #
}                                                      # Done!
