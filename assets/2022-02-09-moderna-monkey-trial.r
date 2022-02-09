## Created on Tuesday, February  8, 2022 at 11:11pm EST by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2022, SomeWeekendReading.blog.  All rights reserved.  As if you care.

toolsDir <- "../../tools"
source(file.path(toolsDir, "pipeline-tools.r"))        # For saveDataframe()
source("./2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r")
library("reshape2")                                    # For acast()

##
## Moderna's animal trial of an Omicron-specific COVID-19 vaccine showed "no better
## than original vaccine."
##
## - N = 8 monkeys = 4 control + 4 treatment
## - Original efficacy 80% or so.
##
## Could you, even in principle, tell the difference between 80% efficacy and 100%, with
## only 4 animals in each group?
##
## Summary of study:
##   https://arstechnica.com/science/2022/02/monkey-study-casts-doubt-on-need-for-an-omicron-specific-booster/
## Study itself, says nothing re efficacy but is all about B cells and T cells:
##   https://www.biorxiv.org/content/10.1101/2022.02.03.479037v1
##
## Summary of CDC stuff on efficacy of booster:
##   https://arstechnica.com/science/2022/01/unvaccinated-5x-more-likely-to-get-omicron-than-those-boosted-cdc-reports/
## The CDC MMWR's themselves, quoting booster efficacy vs Omicron:
##   https://www.cdc.gov/mmwr/volumes/71/wr/mm7104e2.htm?s_cid=mm7104e2_w
##   https://www.cdc.gov/mmwr/volumes/71/wr/mm7104e3.htm?s_cid=mm7104e3_w
##

## Efficacy against urgent care with Omicron: 82%
## Efficacy against hospitalization with Omicron: 94%
## Can we tell if ANYTHING in the monkey trial is statistically significantly different from that?
doit <- function(Ntrt = 4, Ncnt = 4, destPath = "./2022-02-09-moderna-monkey-trial.tsv") {
  saveDataframe(dcast(transform(expand.grid(Ktrt = 0 : Ntrt, Kcnt = 0 : Ncnt),
                                Eff = Vectorize(function(Ntrt, Ktrt, Ncnt, Kcnt) {
                                  effs <- 100.0 * efficacyAndCL(Ntrt, Ktrt, Ncnt, Kcnt)
                                  sprintf("%+6.1f%% (%+6.1f%% - %+6.1f%%)",
                                          effs[["Eff"]], effs[["LCL"]], effs[["UCL"]])
                                })(Ntrt, Ktrt, Ncnt, Kcnt)),
                      Kcnt ~ Ktrt, value.var = "Eff"), #
                destPath)                              #
}                                                      #
