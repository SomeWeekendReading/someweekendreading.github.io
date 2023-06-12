## Created on Monday, June 12, 2023 at 10:05am EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2023, SomeWeekendReading.blog.  All rights reserved.  As if you care.

library("effectsize")                                    # For cohens_d()
source("../tools/pipeline-tools.r")                      # Random pipeline stuff
source("../tools/graphics-tools.r")                      # Random graphics stuff

##
## Does administration party in the US presage the number of criminal indictments
## of officials at various levels?
##
## Data source: https://libretooth.gr/@dougiec3/110482616205581506
##

## > indictData <- doit()
doit <- function(indictDataString = "Party	President	NIndicted	YrsInOffice
R	Trump	215	4
R	Nixon	76	6
R	Reagan	26	8
R	Bush2	16	8
D	Clinton	2	8
R	Bush1	1	4
R	Ford	1	2
D	Carter	1	4
D	Obama	0	8
D	Biden	0	3",
                 txFile   = "administrative-indictments.txt",
                 plotFile = "indictments-by-pres-party.png") {
  withTranscript(inDir = ".", resultsDir = ".", transcriptFile = txFile, name = "Indictments",
                 function() {
    indictData <- transform(read.table(text = indictDataString,  # Read data from string
                                       header = TRUE, sep = "\t", stringsAsFactors = TRUE),
                            NIndictedPerYr = NIndicted / YrsInOffice)
    ## Sort by number of indictments per year in office, decreasing
    indictData <- indictData[order(indictData$"NIndictedPerYr", decreasing = TRUE),]
    print(indictData)                                  # Attrapez le poisson de juin?
    print(t.test(NIndictedPerYr ~ Party, data = indictData, alternative = "less"))
    print(cohens_d(NIndictedPerYr ~ Party, data = indictData)); cat("\n")

    withPNG(file.path(".", plotFile), 750, 750, FALSE, function() {
      withPars(function() {                            # Save/restore graphics params
        boxplot(NIndictedPerYr ~ Party, data = indictData, col = "blue",
                xlab = "Party", ylab = "Number of Indictments per Year",
                main = "# Indictments vs Presidential Party")
      }, "pty" = "m",                                  # Maximal plotting region
         "mar" = c(3.8, 3.8, 2.5, 0.0),                # Margins: (bottom, left, top, right)
         "mgp" = c(2.6, 0.7, 0),                       # Axis label, tick and line offsets
         "las" = 1,                                    # Always horizontal labels
         "ps"  = 18)                                   # Size of type in labels
    })                                                 #

    invisible(indictData)                              # Return the data, invisibly
  })                                                   # Done capturing transcript
}                                                      #
