---
layout: post
title: Moderna/Lonza vaccine interim readout&colon; 95% efficacy!
tags: COVID MathInTheNews R
comments: true
---

Today the Moderna/Lonza vaccine trial vaccine trial gave its _first interim_ readout: 95%
efficacy!  Also, 100% prevention of _severe_ cases of COVID-19.  Like last week's
Pfizer/BioNTech interim readout, this is again unabashedly good news.  

<a href="#fn1"><img src="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data-globe.jpg" width="341" height="400" alt="Boston Globe on Moderna vaccine efficacy readout" title="Boston Globe on Moderna vaccine efficacy readout" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/></a>
Today, in what has become a regrettably rare experience of late, I see the venerable
_Globe_ had some good news <sup id="fn1a">[[1](#fn1)]</sup>!  As with 
[last week's entirely agreeable results from Pfizer/BioNTech](https://www.someweekendreading.blog/pfizer-vaccine-efficacy-data/),
this week the Moderna trial reported its first interim data, i.e., a "sneak peek" at early
results, not the final word.  Also, it's just a press release instead of a peer-reviewed
journal article, and you know how we feel about that here at Chez Weekend.  But&hellip;
the results are _excellent_: 95% efficacy at preventing COVID-19 ([explained below](#some-analyses)).  

<a href="#fn2"><img src="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data-stat.jpg" width="400" height="357" alt="STAT News on Moderna vaccine efficacy readout" title="STAT News on Moderna vaccine efficacy readout" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/></a>
Our next stop was STAT News <sup id="fn2a">[[2](#fn2)]</sup>, since they usually don't
mangle the mathematical details much, and point to the primary sources.  They quote one of
our heroes, Tony Fauci of NIAID:  
> "I’d like to say I would have predicted it, but I would not have," said Fauci, who has often said he would have been satisfied with Covid vaccines that were 70% or 75% efficacy. "Honestly, I would not have expected that. I thought that was too much to hope for," he told STAT.

They also report that of the 11 _severe_ COVID-19 cases observed, _all were in the placebo
arm, none in the treatment arm_.  Due to the Bayesian nature of things, this isn't 100%
protection, but it hints at very high levels of protection from severe disease 
([see below](#some-analyses)).  

The EMA (European Medicines Agency, equivalent to the FDA) has already started rolling
reviews pending a submission to approve.  

The most severe adverse events that ocurred frequently enough to be statistically
significant were fatigue and muscle pain in about 10% of the patients, but were "generally
short-lived".  

<a href="#fn3"><img src="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data-moderna-pr.jpg" width="400" height="120" alt="Moderna press release: vaccine efficacy readout" title="Moderna press release: vaccine efficacy readout" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/></a>
That took us to the Moderna press release itself <sup id="fn3a">[[3](#fn3)]</sup>, with
our usual grumbles about partial data releases by companies in lieu of a full scientific
paper&hellip; but the news put your Weekend Editor in such a good mood we'll pass on that
just this once.  Some numbers:  
- mRNA-1273 has been tested in "more than" $N = 30,000$ participants, presumably equally
  divided into placebo and treatment arms.  
- Thus far, 95 cases of COVID-19 have been observed; 90 were in the placebo arm and 5 were
  in the treatment arm.  This leads to a simple-minded point estimate of efficacy of 
  (95 - 5) / 95 = 94.7%.  That's close enough to the more sophisticated 94.5% reported by
  Moderna (see the [Fisher exact test below for a slightly more sophisticated way](#some-analyses) 
  that gets Moderna's number and a confidence interval on it, but is 
  [still kind of wrong for a survival problem](#this-analysis-is-still-wrong)).  
- A secondary endpoint of preventing severe COVID-19 was even more interesting, with 11
  cases in the placebo arm and 0 in the treatment arm.  
- The 95 COVID-19 cases were 15 people age 65+, 20 people identifying as non-white (12
  LatinX, 4 Black, 3 Asian, 1 multiracial).  
- In these days of EMR (electronic medical records), they've even gotten a CPT (current
  procedural terminology) code to report mRNA-1273 vaccination into computer systems at
  hospitals and medical practices (code 91301, if for some reason you think you want to
  know that; but if you _do_ need to know that, you shouldn't be finding it out _here_!)  

Here's the key quote: "Preliminary analysis suggests a broadly consistent safety and
efficacy profile across all evaluated subgroups."  That has to get out to all the
communities that are skeptical of vaccine efficacy in their group.  

<a href="#fn4"><img src="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data-derek-lowe.jpg" width="400" height="195" alt="Derek Lowe: vaccine efficacy readout" title="Derek Lowe: vaccine efficacy readout" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/></a>
Finally, we went to see what our favorite med-chem blogger, Derek Lowe, had to say about
it over at _In the Pipeline_ <sup id="fn4a">[[4](#fn4)]</sup>.  He summarizes the above
primary sources pretty nicely, and goes on to point out that the adverse events were grade
3 ("significant, prevents daily activity") but not requiring hospitalization.  So about
10% of the vaccine recipients will spend a day in bed feeling like they've got a mild case
of the flu, no worse.  (For reference, the Shingrix vaccine for shingles also has about
10% of the population getting grade 3 adverse events.  So we're on track for something
easily approvable and acceptable to patients.)  

One of the reasons to read guys like Derek is that he tracked down the second Modernal
press release <sup id="fn5a">[[5](#fn5)]</sup>.  This has the very good news that their
vaccine is stable for 12 hours at room temperature, 30 days at standard refrigerator
temperature, and 6 months at standard freezer temperature.  Also, it doesn't require
dilution at the site of use; it comes ready to inject.  That has a lot of medical
logistics folks breathing a sigh of relief: the standard medical infrastructure already
handles stuff like that.  

There's still stuff to do, as he points out:  
> &hellip;there are several other categories that could differentiate all the vaccine candidates: point efficacy (as we have now, 14 days after the second), effect on severity of disease when it does occur, duration of efficacy (which we’ll need time for, and there’s no other way), overall safety (which also needs big numbers and will sharpen with longer time points), and whatever differences in all these categories may show up in different patient populations.  

## Summary: the Good Stuff  

Yeah, this really does look pretty good for a variety of reasons:  
- 95% efficacy is very good to hear; the FDA's stated threshold for COVID-19 vaccine
  approval is 50%.  So that's good.  (Pfizer claimed 90% or more efficacy, but apparently
  the methods of analysis are a little different.  Basically, they're both very, very
  good.  Don't worry about which one, if you're offered the chance to get either.)  
- All 11 cases of _severe_ COVID-19 that occurred in the trial so far were in the placebo
  arm, and 0 in the treatment arm.  That's effectively 100% prevention of severe disease
  (_pacem_ [the Bayesian posterior Beta analysis below](#some-analyses), to get error bars).  
  So that's _very_ good.  
- Efficacy was consistent across all age groups, not just the young.  
- The trial population was relatively diverse, as these things go: 37% from communities of
  color, 23% over age 65, 16% under age 65 but with high-risk conditions (diabetes,
  obseity, heart disease, etc.).
- Also, the Moderna formulation can be stored at -20&deg;C, which is well within the reach
  of freezers at typical hospitals, labs, and even medical practices:
  stable for 30 days at ordinary refrigerator temperatures, and for 6 months at -20&deg;C
  freezer temperatures.  That cold chain is much less onerous than the -70&deg;C
  requirement of Pfizer.  The 
  Moderna vaccine has a chance of getting into rural areas in the US with less chance of
  chaos, and it's the only way to get into the developing world.  (Yes, the rural areas of
  the US are in some ways regrettably like countries of the developing world: issues of
  education, employment, inequality, racism, and access to health care.)  
- Moderna intends to apply for an EUA ("emergency use authorization") in a few weeks.
  They, along with their partners Lonza, claim to have about 20 million doses ready to
  ship in the US by the end of 2020 (2 doses/person, so 10 million people).  They also
  claim to be on track to produce 500 million to 1 billion doses in 2021, which is getting
  on towards being serious about vaccinating _everyone_.  (There are about 7.6 billion
  people alive right now, so we still need the other vaccines too.  Pfizer claims to be
  able to deliver enough to immunize 25 million people by the end of this horrible year.)  
- Lipid nanoparticle encapsulated mRNA vaccines will become the new normal, since they can
  be designed quickly and go directly into animal trials and thence into humans.  Indeed,
  mRNA therapeutics for _lots_ of conditions will thrive, such as the mRNA cancer
  immunotherapy projects at several big pharmas.  

## Summary: cautionary notes  

But... all the usual cautions still apply:  
- This is an _interim_ readout looked at by the DSMB (data safety monitoring board).  They
  have thus far seen 95 COVID-19 cases; the final readout at full statistical strength
  will be when they have 151.  It could get better; it could get worse.  Given current
  whacking-stupid-high infection rates in the US, that won't be a long wait.  
- This is a study of $N=30,000$ participants divided into placebo and treatment arms.
  Seeing 95 infections is a rate of 0.32%, i.e., not very high.  (Pfizer saw about 0.2%,
  so they're apparently on track with each other.)  
- Safety data will require following up with patients for quite a while longer than this,
  but on an emergency basis we might proceed with some vaccinations of health care
  workers.  Ordinaries like your humble Weekend Editor won't see this vaccine for a while,
  like starting April - June of 2021 &mdash; so keep your masks on for another 8 or 9
  months.  

## Some analyses  

Ok, can we pull out similar numbers from the teensy-tiny bit of data made public so far?
Do you think we're not gonna at least _try_ to repeat 
[the spot-check we did for the Pfizer vaccine readout](https://www.someweekendreading.blog/pfizer-vaccine-efficacy-data/#added-2020-nov-10-because-i-just-cant-leave-this-alone)?  

Notation:  
$$
\begin{align*}
N  & = \mbox{# patients in trial w/2nd dose} & = 30000 \\
NT & = \mbox{# patients in treatment arm}    & = N/2   \\
NP & = \mbox{# patients in placebo arm}      & = N/2   \\
K  & = \mbox{# infections seen in both arms} & = 95    \\
KT & = \mbox{# infections in treatment arm}  & =  5    \\
KP & = \mbox{# infections in placebo arm}    & = 90
\end{align*}
$$

Crosstabulation matrix in [R](https://www.r-project.org/):  
```R
> N  <- 30000
> NT <- N / 2
> NP <- N / 2
> K  <- 95
> KP <- 90
> KT <-  5

> mx <- matrix(c(NT - KP, KP, NT - KT, KT), nrow = 2, byrow = TRUE, dimnames = list(c("Placebo", "Treatment"), c("Uninfected", "Infected"))); mx
          Uninfected Infected
Placebo        14910       90
Treatment      14995        5
```

Significance test, by [Fisher's exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test), is highly significant:  
```R
> fisher.test(mx)
	Fisher's Exact Test for Count Data

data:  mx
p-value < 2.2e-16
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 0.0175102 0.1338031
sample estimates:
odds ratio 
0.05523721 
```

The odds ratio above of 0.055 is what translates to an efficacy of 1 - 0.055 = 94.5%.  The
95% confidence limits on the odds ratio of 0.018 &ndash; 0.134 mean the 95% confidence
limit on the efficacy is 86.6% &ndash; 98.2%.  So we're 97.5% confident that the efficacy
is above 86.6%.  

Significance test, by [test of proportion](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/prop.test),
confirms statistical significance:  
```R
> prop.test(mx)
	2-sample test for equality of proportions with continuity correction

data:  mx
X-squared = 74.51, df = 1, p-value < 2.2e-16
alternative hypothesis: two.sided
95 percent confidence interval:
 -0.007003255 -0.004330078
sample estimates:
   prop 1    prop 2 
0.9940000 0.9996667 
```

[Bayesian posterior Beta distribution](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading14a.pdf)
analysis of the probability of infection, per time spent in the trial, separately
conditioned on being in the placebo arm or the treatment arm, and the 
[MAP estimators](https://en.wikipedia.org/wiki/Maximum_a_posteriori_estimation):  
$$
\begin{align*}
& \Pr(pP | \mbox{placebo})    & \sim \mathrm{Beta}(KP + 1, NP - KP + 1) \\
& \Pr(pT | \mbox{treatment})  & \sim \mathrm{Beta}(KT + 1, NT - KT + 1)
\end{align*}
$$

```R
> ps  <- seq(from = 0.0, to = 0.01, length.out = 1000)
> pPs <- dbeta(ps, shape1 = KP + 1, shape2 = NP - KP + 1)
> pTs <- dbeta(ps, shape1 = KT + 1, shape2 = NT - KT + 1)

> source("~/Documents/laboratory/tools/graphics-tools.r")

> withPNG("./images/2020-11-16-moderna-vaccine-efficacy-data.png", 600, 300, FALSE, function() { withPars(function() { matplot(ps, matrix(c(pTs, pPs), byrow = FALSE, ncol = 2), type = "l", lty = "solid", col = c("blue", "black"), xlab = "p", ylab = "Density", main = "Posterior Beta Distribution: Infection Probability by Trial Arm"); legend("topright", inset = 0.01, bg = "antiquewhite", legend = c(sprintf("Treatment MAP: %.5f", ps[which.max(pTs)]), sprintf("Placebo MAP:    %.5f", ps[which.max(pPs)])), col = c("blue", "black"), lty = "solid", lwd = 2) }, pty = "m", bg = "transparent", ps = 16, mar = c(3, 3, 2, 1), mgp = c(1.7, 0.5, 0)) })
```

<a href="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data.png" target="_blank"><img src="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data.png" height="150" width="300" alt="Bayesian posteriors" title="Bayesian posteriors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Just as in the Pfizer case, the distributions are indeed quite distinct.  The MAP
estimators show the probability per unit time of infection in the arms differ by about a
factor of 20, even stronger than the factor of 10 we found with the Pfizer vaccine.  

Finally, with 11 severe infections in the control arm and 0 in the treatment what
should we believe about the probability of severe infection in the treatment arm?  The
obvious point estimate is $pS = 0$, but we can do the posterior Beta distribution trick
there, too:  
$$
Pr(pS | \mbox{treatment}) \sim \mathrm{Beta}(0 + 1, 11 + 1)
$$

```R
> ps  <- seq(from = 0.0, to = 1.0, length.out = 1000)
> pSs <- dbeta(ps, shape1 = 1, shape2 = 12)
> med <- median(rbeta(n = 1000, shape1 = 1, shape2 = 12))

> withPNG("./images/2020-11-16-moderna-vaccine-efficacy-data-severe.png", 600, 300, FALSE, function() { withPars(function() { plot(ps, pSs, type = "l", lty = "solid", col = "blue", xlim = c(0.0, 1.0), xlab = "p", ylab = "Density", main = "Posterior Beta: Severe Infection After Treatment"); abline(v = med, lty = "dashed", col = "black"); legend("topright", inset = 0.01, bg = "antiquewhite", legend = sprintf("Median: %.1f%%", 100.0 * med)) }, pty = "m", bg = "transparent", ps = 16, mar = c(3, 3, 2, 1), mgp = c(1.7, 0.5, 0)) })
```

<a href="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data-severe.png" target="_blank"><img src="{{ site.baseurl }}/images/2020-11-16-moderna-vaccine-efficacy-data-severe.png" height="150" width="300" alt="Bayesian posterior for severe COVID-19" title="Bayesian posterior for severe COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
As you can see, the probability of severe COVID-19 infection is not exactly 0.  With only
11 observations, we have relatively broad error bands here!  But at least it's
concentrated down pretty low, with a median of about 5.8%.  Not bad, for 11
observations&hellip; I'll take that.  

## This analysis is still wrong  

As we said for the Pfizer vaccine, the above is just noodling around with the very few
numbers that have been published so far.  The real analysis will involve a 
[Cox proportional hazard model](https://en.wikipedia.org/wiki/Proportional_hazards_model), 
a [Kaplan Meier plot](https://en.wikipedia.org/wiki/Kaplan%E2%80%93Meier_estimator),
and a [logrank $p$-value](https://en.wikipedia.org/wiki/Logrank_test).  I'm sure the
clinical trial protocol specifies doing exactly that for the FDA, and we'll see it then.  

Given the current _very, very bad situation_ with infection rates in the US, it won't take
very long for them to go from 95 infections up to the required 151.  The analysis will
probably be done _that very day_, and plugged into an already-written FDA submission for
an EUA _the next day_.  We'll read about it then.  

Until then, stay masked, stay socially distant, get a flu vaccination, have some extra
food at home, and fill any prescriptions now.  Stay safe, and we'll get through this
together.  


---

## Notes &amp; References  

<a id="fn1">1</a>: J Saltzman, ["Moderna says early data suggest its COVID-19 vaccine is 94.5 percent effective"](https://www.bostonglobe.com/2020/11/16/business/modernas-early-data-suggests-its-covid-19-vaccine-is-945-percent-effective/), _Boston Globe_, 2020-Nov-16.[↩](#fn1a)  

<a id="fn2">2</a>: M Herper and H Branswell, ["Moderna’s Covid-19 vaccine is strongly effective, early look at data show"](https://www.statnews.com/2020/11/16/modernas-covid-19-vaccine-is-strongly-effective-early-look-at-data-show/), _STAT News_, 2020-Nov-16.[↩](#fn2a)  

<a id="fn3">3</a>: Moderna Therapeutics, ["Moderna’s COVID-19 Vaccine Candidate Meets its Primary Efficacy Endpoint in the First Interim Analysis of the Phase 3 COVE Study"](https://investors.modernatx.com/news-releases/news-release-details/modernas-covid-19-vaccine-candidate-meets-its-primary-efficacy), Moderna press releases, 2020-Nov-16.[↩](#fn3a)  

<a id="fn4">4</a>: D Lowe, ["Moderna’s Vaccine Efficacy Readout"](https://blogs.sciencemag.org/pipeline/archives/2020/11/16/modernas-vaccine-efficacy-readout), _In the Pipeline_, _Science Translational Medicine_, 2020-Nov-16.[↩](#fn4a)  

<a id="fn5">5</a>: Moderna Therapeutics, ["Moderna Announces Longer Shelf Life for its COVID-19 Vaccine Candidate at Refrigerated Temperatures"](https://investors.modernatx.com/news-releases/news-release-details/moderna-announces-longer-shelf-life-its-covid-19-vaccine), Moderna press releases, 2020-Nov-16.[↩](#fn5a)  
