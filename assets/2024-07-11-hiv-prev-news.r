## Created on Friday, July 12, 2024 at 6:22pm EDT by WeekendEditor on WeekendEditorMachine.
## UnCopyright (c) 2024, SomeWeekendReading blog.  All rights reversed.  As if you care.

toolsDir <- "../../tools"                              # Where the tool scripts live
source(file.path(toolsDir, "pipeline-tools.r"))        # Random pipeline stuff
source(file.path(toolsDir, "graphics-tools.r"))        # Random graphics stuff
library("gsDesign")                                    # For ciBinomial()

##
## Fiddle with the preliminary data reported by Gilead on lenacapavir in HIV prevention.
## This is technically incorrect, since it lacks censorship data about patients dropping out.
## But as a crude estimate from the published numbers, it will do.
##

## > doit()
## > rm("purpose1Summary"); rm("efficacyCL"); rm("signf"); rm("stren"); rm("bayesProbs"); rm("rule3Done"); doit()
doit <- function(purpose1     = data.frame(Arm       = c("lenacapavir", "Descovy", "Truvada"),
                                           N         = c(2134,          2136,      1068),
                                           K         = c(   0,            39,        16),
                                           Infp100py = c(   0,             2.02,      1.69),
                                           stringsAsFactors = TRUE),
                 yatesCorrect = TRUE,                  # Default on test of proportion is TRUE
                 txFile       = "2024-07-11-hiv-prev-news.txt",
                 plotFile     = "2024-07-11-hiv-prev-news.png") {

  makeSummaryData <- function(purpose1) {              # Take data reported in press release,
    cat(sprintf("* PURPOSE1 data as reported:\n"))     #  drop infections/100 person-years,
    print(purpose1)                                    #  combine both PReP arms into 1 for comparison

    purpose1Summary <- rbind(subset(purpose1, subset = Arm == "lenacapavir", select = -Infp100py),
                             data.frame(Arm = "PReP",  # Just add patient counts in both PReP arms
                                        t(colSums(subset(purpose1,
                                                         subset = Arm != "lenacapavir",
                                                         select = -c(Arm, Infp100py)))),
                                        stringsAsFactors = TRUE))
    cat(sprintf("\n* PURPOSE1 summary data for analysis:\n"))
    print(purpose1Summary)                             # Describe what we did

    purpose1Summary                                    # Return the summary data
  }                                                    #

  efficacyAndCL <- function(Ntrt, Ktrt, Ncnt, Kcnt) {  # Treatment efficacy & 95% conf limit
    ## Simple-minded efficacy computation, with confidence limits using a scaled binomial model.
    ## (To be eventually replaced by my super-duper Beta ratios stuff with Gauss hypergeometric magic!)
    ##
    ## Ntrt = number of subjects in treatment arm
    ## Ktrt = number of sick in treatment arm
    ## Ncnt = number of subjects in control arm
    ## Kcnt = number of sick in control arm
    eff   <- 1 - (Ktrt / Ntrt) / (Kcnt / Ncnt)         # Point estimate, then confidence limits
    effCL <- rev(1 - ciBinomial(Ktrt, Kcnt, Ntrt, Ncnt, scale = "RR"))
    c(LCL = effCL[[1]], Eff = eff, UCL = effCL[[2]])   # Return 3-vector of LCL, estimate, and UCL
  }                                                    #

  efficacyOverPReP <- function(purpose1Summary) {      # Compare lenacapavir vs PReP as control
    ## Scaled binomial model of efficacy and its confidence interval, compared to PReP
    ## 0% means comparable to PReP, positive means better
    efficacyCL <- round(100.0 * efficacyAndCL(purpose1Summary[1, 2], purpose1Summary[1, 3],
                                              purpose1Summary[2, 2], purpose1Summary[2, 3]),
                        digits = 2)                    #

    cat(sprintf("* Efficacy (%%) over PReP, where 0%% means comparable to PReP:\n"))
    print(efficacyCL)                                  # Know eff = 100%, CL's are the interesting part

    efficacyCL                                         # Return the efficacy & CL's
  }                                                    #

  doSignificance <- function(purpose1Summary, yatesCorrect) {
    cat(sprintf(paste("* Significance test of proportion:",
                      "  - Yates correction: %s",      # Explain what we're doing on the transcript
                      "  - Alternative: probability of infection same in both arms\n",
                      sep = "\n"),                     # Null hypothesis: probability of infection
                yatesCorrect))                         #  is the same in both arms
    tst <- prop.test(x       = c(purpose1Summary[1, 3], purpose1Summary[2, 3]),
                     n       = c(purpose1Summary[1, 2], purpose1Summary[2, 2]),
                     correct = yatesCorrect)           # Default is TRUE, I dunno what else to say
    print(tst)                                         # Show test results on transcript

    tst$"p.value"                                      # Return the p-value
  }                                                    #

  doStrength <- function(purpose1Summary) {            # Stength of effect
    ## See, for Cohen's h: https://en.wikipedia.org/wiki/Cohen%27s_h
    ##
    ## We're going to use Cohen's h, but very crudely.  We compare the observed proportion of
    ##   infections with lenacapavir vs combined PReP controls.
    ## h = 2 * (asin(sqrt(p1)) - asin(sqrt(p2)))
    ## This can range from -pi to +pi (or 0 to pi when nondirectional).
    ## Anything over 0.8 is large.
    cat(sprintf(paste("* Computing Cohen's h for strength of effect",
                      "  - Range of h is -pi to +pi",  #
                      "  - anything with absolute value over 0.8 is a large effect.",
                      sep = "\n")))                    #
    ## Could use pwr package's ES.h(), but simpler just to do it ourselves.
    absCohenh <- round(abs(2 * (asin(sqrt(purpose1Summary[1, 3] / purpose1Summary[1, 2])) -
                                asin(sqrt(purpose1Summary[2, 3] / purpose1Summary[2, 2])))),
                       digits = 3)                     #
    cat(sprintf("\n  - Result: |h| = %.3f\n", absCohenh))
    absCohenh                                          # Return the strength statistic
  }                                                    #

  doBeta <- function(purpose1Summary, plotFile, npoints = 1000) {
    cat(sprintf("* Doing Baysian posterior Beta distribution analysis."))
    ## Let p = probability of a infection for an arm.
    ## Start with a uniform prior on p, which happens to be B(1, 1).
    ## After observing N patients, of which k were infected, we have B(N - k + 1, k + 1).

    makeBetaQDF <- function(n, k) { function(q) { qbeta(q, k + 1, n - k + 1) }}
    bayesProbs <- transform(data.frame(Quantile = c(0.025, 0.500, 0.975)),
                            lenacapavir = makeBetaQDF(purpose1Summary[1, 2],
                                                      purpose1Summary[1, 3])(Quantile),
                            PReP        = makeBetaQDF(purpose1Summary[2, 2],
                                                      purpose1Summary[2, 3])(Quantile))
    rownames(bayesProbs) <- bayesProbs$"Quantile"      # Treatments on rows, quantiles on cols
    bayesProbs <- t(subset(bayesProbs, select = -Quantile))
    cat(sprintf("\n\n* Posterior quantiles:\n")); print(round(bayesProbs, digits = 5))

    makeBetaPDF <- function(n, k) { function(p) { dbeta(p, k + 1, n - k + 1) } }
    bdf <- transform(data.frame(p = seq(from = 0.0, to = 0.05, length.out = npoints)),
                     pT = makeBetaPDF(purpose1Summary[1, 2], purpose1Summary[1, 3])(p),
                     pC = makeBetaPDF(purpose1Summary[2, 2], purpose1Summary[2, 3])(p))
    f <- file.path(".", plotFile)                      # Where the plot goes
    withPNG(f, 700, 700, FALSE, function() {           # Capturing output to file
      withPars(function() {                            # Binding graphics parameters
        matplot(x = bdf[, 1], y = bdf[, -1],           #
                type = "l", lty = "solid", lwd = 2, col = c("blue", "red"),
                xlab = "p", ylab = "Pr(infection p)",  #
                main = "Posterior Beta Densities: Infection p, Given Treatment")
        abline(v = bayesProbs["lenacapavir", "0.5"], col = "blue", lty = "dotted")
        abline(v = bayesProbs["PReP",        "0.5"], col = "red",  lty = "dotted")
        legend("topright", bg = "antiquewhite", inset = 0.01,
               lty = "solid", lwd = 2, col = c("blue", "red"),
               legend = c("lenacapavir", "PReP"))      #

      }, pty = "m",                                    # Maximal plotting area
         bg  = "white",                                # White background
         mar = c(3, 3, 2, 1),                          # Pull in on margins a bit
         mgp = c(1.7, 0.5, 0),                         # Axis title, labels, ticks
         ps  = 16)                                     # Larger type size for file capture
    })                                                 #
    cat(sprintf("\n\n* Bayesian Beta posterior plot to %s.", f))

    bayesProbs                                         # Return the median posterior probabilities
  }                                                    #  of infection, for each arm

  doRuleOf3 <- function(purpose1Summary, bayesProbs) { # Heuristic for when ZERO events observed
    ## https://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval#Rule_of_three_%E2%80%94_for_when_no_successes_are_observed
    cat(sprintf(paste("\n\n* Frequentist heuristic for lenacapavir infection CL",
                      "  - Rule of 3: [0.0000000, %.7f]",
                      "  - Bayes:     [%.7f, %.7f].\n",#
                      sep = "\n"),                     #
                3.0 / purpose1Summary[1, 2],           #
                bayesProbs[1, 1], bayesProbs[1, 3]))
    TRUE                                               # Flag that it was done
  }                                                    #

  withTranscript(inDir = ".", resultsDir = ".", transcriptFile = txFile,
                 name = "PURPOSE1 HIV Prevention", function() {

    heraldPhase("Building summary data")               # Get just the bits we need
    maybeAssign("purpose1Summary", function() { makeSummaryData(purpose1) })

    heraldPhase("Naive efficacy/CL vs PReP controls:") # Efficacy is 100%, what are CL's vs PReP?
    maybeAssign("efficacyCL", function() { efficacyOverPReP(purpose1Summary) })

    heraldPhase("Frequentist tests of significance and strength")
    maybeAssign("signf", function() { doSignificance(purpose1Summary, yatesCorrect) })
    maybeAssign("stren", function() { doStrength(purpose1Summary) })

    heraldPhase("Plotting posterior Beta distributions for probability of infection")
    maybeAssign("bayesProbs", function() { doBeta(purpose1Summary, plotFile) })
    maybeAssign("rule3Done",  function() { doRuleOf3(purpose1Summary, bayesProbs) })

  })                                                   # Done!
}                                                      #
