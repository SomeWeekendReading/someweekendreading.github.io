## Created on Friday, August 27, 2021 at 7:14pm EDT by Weekend Editor on WeekendEditorMachine.
## Copyright (c) 2021, SomeWeekendReading.blog.  All rights reserved.  As if you care.

toolsDir <- "../../tools"                              # Various tools available from author
source(file.path(toolsDir, "graphics-tools.r"))        # Various graphics hacks

##
## After accounting for age and vax status to evade Simpson's paradox, show vaccine efficacy
## in Israel (which has much better medical records than the US!) vs age cohort.
##

doit <- function(cohorts    = c("12-15", "16-19", "20-29", "30-39", "40-49", "50-59",
                                "60-69", "70-79", "80-89", "90+"),
                 efficacies = c(100.0,   100.0,   100.0,   96.8,    93.9,    92.8,
                                 88.7,    89.6,    81.1,   92.4),
                 plotFile   = "./2021-08-29-covid-simpson-ve-by-age.png") {
  ## *** IWBNI we knew 95% cl bars on the efficacies, say by posterior Beta + Monte Carlo method
  withPNG(plotFile, 400, 400, FALSE, function() {      # Capture graphics to file
    withPars(function() {                              # Save/restore graphics params
      plot(x = 1 : length(cohorts), y = efficacies,    # Plot points & lines
           type = "b", pch = 21, col = "black", bg = "blue",
           xaxt = "n", xlab = NA, ylab = "Vaccine Efficacy (%)", ylim = c(0, 100),
           main = "Vaccine efficacy by age cohort")    # Horizontal axis done manually
      axis(side = 1, at = 1 : length(cohorts), labels = cohorts)
      title(xlab = "Age Cohort", line = 3.5)           # Horizontal axis title
    }, pty = "m",                                      # Maximal plotting area
       bg  = "white",                                  # White background
       mar = c(5, 3, 2, 1),                            # Margins for axis labels, title
       mgp = c(1.7, 0.5, 0),                           # Axis title, labels, ticks
       ps  = 16,                                       # Larger type size for file capture
       las = 2)                                        # Axis labels always perp to axis
  })                                                   # Done!
}                                                      #
