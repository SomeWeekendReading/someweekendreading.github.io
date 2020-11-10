---
layout: post
title: Pfizer/BioNTech vaccine interim readout&colon; 90% efficacy!
tags: COVID MathInTheNews R
comments: true
---

Today the Pfizer/BioNTech vaccine trial gave its _first interim_ readout: 90% efficacy.
This is unabashedly good news.  

<img src="{{ site.baseurl }}/images/2020-11-09-vaccine-efficacy-data-pfizer-press-release.png" width="400" height="250" alt="Pfizer/BioNTech efficacy press release" title="Pfizer/BioNTech efficacy press release" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
This is an _interim_ readout from Pfizer &amp; BioNTech <sup id="fn1a">[[reference 1](#fn1)]</sup>,
meaning it's an early look at the data using simplified analyses.  And it's just a press
release: a bit of corporate propaganda to which your Weekend Editor has allergies, instead
of peer-reviewed science.  But still&hellip; 90% efficacy is very good news, indeed!  

I'm very slightly surprised that Moderna wasn't the first to do an interim readout, since
they looked slightly ahead.  But, a lot of this sort of thing is down to random chance, so
that doesn't mean much.  What _is_ meaningful: all the vaccines target the same spike
protein, and what's more Moderna and Pfizer both target it with an mRNA vaccine.  So, if
one vaccine works, they're all likely to work (to varying degrees, in varying populations,
but that's a good thing).  

And&hellip; mRNA vaccines will have been proven to work.  That's another good thing, since
they can be developed _very_ quickly.  

## Cautionary notes  

- Being an _interim_ readout, there is a chance that the final results will weaken the
  result.  
- We're talking about a study with $N = 38,955$ participants who have received both doses, 
  and we've thus far seen only 94 COVID cases in both treatment & control arms, total.
  That is a very small fraction of the total (about 0.2%)!  
- The initial study design called for an interim readout at 32 cases, and while the FDA
  was negotiating a protocol amendment to increase that to 62 cases, the number of cases 
  climbed up to 94.  We really have let political dysfunction lead into uncontrolled
  spread.  
- The final readout will be at 164 cases, and that is expected to happen sometime in late
  November.  The bad news is uncontrolled spread; the good news is that makes it easy to
  run the trial and get a fast readout.  That's a bad trade-off, but here we are.  
- Protection looks like it will last at least a year.  Possibly longer, but even so, it's
  acceptable to get an annual booster shot until the virus is stamped out of human
  circulation.  
- Strangely, Pence tried to claim today that the Trump administrations Operation Warp
  Speed helped.  Pfizer was quick to deny that they were ever part of that, nor had they
  ever taken money from the Trump administration for this.  So, at least that got slapped
  down quickly.  
- The required safety data is not yet in hand.  We want to see at least 2 months of safety
  data, for at least half the participants.  Even that is ok for a smallish population to
  be vaccinated, but thin ice if you're going to vaccinate billions.  After all, if you
  have a billion patients, then one-in-a-million events are going to crop up about 1,000
  times.  
- The vaccine requires an onerous cold chain of -70&deg;C freezers.  That's going to be
  hideously difficult in most of the world, where you take the vaccine out of the -70&deg;C
  freezer, dry ice pack it, and from that moment you're on a short timeline with the clock
  ticking away the minutes until you get it into a patient.  I have literally no idea how
  that can work in the developing world; even in the US, Europe, and Japan it's difficult
  to imagine working outside the big cities.  
- Doses are limited.  It won't be available to average citizens until maybe mid next year,
  optimistically?  And then it takes at least a month to get both doses and get the
  immunity built up after the second dose.  So... isolation is the rule of the day for at
  least 8 more months.  
  
## But hey, remember the good news  
  
At least we have preliminary evidence that it's _possible_ to make a coronavirus
vaccine.  

I won't go into the details here.  You can read the Pfizer/BioNTech press release in 
[reference 1](#fn1), or you can read Derek Lowe's excellent summary
in <sup id="fn2a">[reference 2](#fn2)</sup>.  

## Added 2020-Nov-10, because I just can't let this alone  

Hey, it's good news, and this is 2020, right?  I can't just walk away from this.  As
astute readers may recall, we solved a similar problem in 
[the post about the racial balance of the Boston Police Department](https://www.someweekendreading.blog/bpd-racial-makeup/), 
so we can just repurpose that machinery.  Let's use the following notation:  
$$
\begin{align*}
N  & = \mbox{\# patients in trial w/2nd dose} & = 38955 \\
NT & = \mbox{\# patients in treatment arm}    & = N/2   \\
NP & = \mbox{\# patients in placebo arm}      & = N/2   \\
K  & = \mbox{\# infections seen in both arms} & =  94   \\
KT & = \mbox{\# infections in treatment arm}  &         \\
KP & = \mbox{\# infections in placebo arm}    & 
\end{align*}
$$

Then, by conservation of patients and the 90% efficacy claim, we know that:  
$$
\begin{align*}
KT + KP & = K \\
KT / KP & = 0.10, \mbox{what we assume they mean by "90% efficacy"}
\end{align*}
$$

Solve for $KT$, $KP$:
$$
\begin{align*}
KP & = K / 1.1 & = 85.45455  \\
KT & = K - KP  & =  8.545455
\end{align*}
$$

Now we can make the crosstabulation matrix in [R](https://www.r-project.org/):  
```R
> N  <- 38955
> NT <- N / 2
> NP <- N / 2
> K  <- 94
> KP <- K / 1.1
> KT <- K - KP

> mx <- matrix(c(NT - KP, KP, NT - KT, KT), nrow = 2, byrow = TRUE, dimnames = list(c("Placebo", "Treatment"), c("Uninfected", "Infected"))); mx
          Uninfected  Infected
Placebo     19392.05 85.454545
Treatment   19468.95  8.545455
```

Applying [Fisher's exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test), 
possibly [while tasting tea](https://en.wikipedia.org/wiki/Lady_tasting_tea),
we get the result that the treatment & control arms are very
statistically significantly different, i.e., the vaccine seems to be working:  
```R
> fisher.test(mx)
	Fisher's Exact Test for Count Data

data:  mx
p-value < 2.2e-16
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 0.04661974 0.20988610
sample estimates:
odds ratio 
 0.1054685 
```

The similar (slightly old-fashioned but still serviceable) 
[test of proportion](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/prop.test)
confirms that result:  
```R
> prop.test(mx)

	2-sample test for equality of proportions with continuity correction

data:  mx
X-squared = 61.448, df = 1, p-value = 4.546e-15
alternative hypothesis: two.sided
95 percent confidence interval:
 -0.004973602 -0.002923622
sample estimates:
   prop 1    prop 2 
0.9956127 0.9995613 
```

If we think like a Bayesian for a moment, we realize that each arm took a bunch of people,
did something to them, and then measured the probability per unit time, $p$, of getting infected
in each group.  We can start from a prior uniform distribution for $p$, where we assume we
know nothing at all about the likely value of $p$: $\Pr(p) \sim \mbox{Uniform}(0, 1)$.  
Then [the Bayesian posterior distributions are Beta distributions](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading14a.pdf):

$$
\begin{align*}
Pr(pP | \mbox{placebo})    & \sim Beta(KP + 1, NP - KP + 1) \\
Pr(pT | \mbox{treatment})  & \sim Beta(KT + 1, NT - KT + 1) \\
\end{align*}
$$

We can compute values for each of those distributions, and get a 
[MAP estimator](https://en.wikipedia.org/wiki/Maximum_a_posteriori_estimation) ("maximum a
posteriori probability", here basically the mode of the posterior Beta distribution), and
see if the two distributions are visually distinct when plotted as the above tests hint
they should be.  

```R
> ps  <- seq(from = 0.0, to = 0.01, length.out = 1000)
> pPs <- dbeta(ps, shape1 = KP + 1, shape2 = NP - KP + 1)
> pTs <- dbeta(ps, shape1 = KT + 1, shape2 = NT - KT + 1)

> source("~/Documents/laboratory/tools/graphics-tools.r")

> withPNG("./images/2020-11-09-vaccine-efficacy-data.png", 600, 300, FALSE, function() { withPars(function() { matplot(ps, matrix(c(pTs, pPs), byrow = FALSE, ncol = 2), type = "l", lty = "solid", col = c("blue", "black"), xlab = "p", ylab = "Density", main = "Posterior Beta Distribution: Infection Probability by Trial Arm"); legend("topright", inset = 0.01, bg = "antiquewhite", legend = c(sprintf("Treatment MAP: %.5f", ps[which.max(pTs)]), sprintf("Control MAP:      %.5f", ps[which.max(pPs)])), col = c("blue", "black"), lty = "solid", lwd = 2) }, pty = "m", bg = "transparent", ps = 16, mar = c(3, 3, 2, 1), mgp = c(1.7, 0.5, 0)) })
```

<a href="{{ site.baseurl }}/images/2020-11-09-vaccine-efficacy-data.png" target="_blank"><img src="{{ site.baseurl }}/images/2020-11-09-vaccine-efficacy-data.png" height="150" width="300" alt="Bayesian posteriors" title="Bayesian posteriors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Here we see that the distributions are indeed quite distinct; the equiprobability point is
way out in the tails of both.  The MAP estimators of the probability of infection per time
(here we're rashly assuming all patients are in the trial for the same time which is
wrong, but not horribly so) differ by about a factor of 10: 0.4% vs 0.04% (per whatever
time interval it is between now and the average enrollment date.  

That method, of course, is wrong!  The statistically principled way to do this is using
something called a [Cox proportional hazard
model](https://en.wikipedia.org/wiki/Proportional_hazards_model), 
a [Kaplan Meier plot](https://en.wikipedia.org/wiki/Kaplan%E2%80%93Meier_estimator),
and a logrank $p$-value.  Of course the press release doesn't report enough information to
do that (and if it did, the media would immediately garble it).  So we are forced to use
more dubious methods, in adherence with the long-held tradition:  

> "If people aren't given well-founded methods &hellip;, they'll just use dubious ones instead."  &mdash; [Jonathan Tawn](https://www.lancaster.ac.uk/maths/people/jon-tawn), professor of  statistics at Lancaster University & medalist of the Royal Statistical Society, on extreme value theory  

So while this is wrong, it's not great, whacking-stupid wrong.  It does indeed confirm
that even with just a few infections observed so far, the vaccine seems to work.  It's
highly likely that the Moderna vaccine, which is also an mRNA vaccine against the same
viral spike protein, will also work.  It's pretty likely that the other vaccines, using
different technology, will also work.  

And it's dead certain that we're going to have a sea change in the vaccine industry,
moving to more mRNA vaccines in the future.  That's even more good news.  

---

## Notes &amp; References  

<a id="fn1">1</a>: Pfizer & BioNTech, ["Pfizer and Biontech announce vaccine candidate against COVID-19 achieved success in first interim analysis from Phase 3 study"](https://www.pfizer.com/news/press-release/press-release-detail/pfizer-and-biontech-announce-vaccine-candidate-against), Pfizer.com press releases, 2020-Nov-09.[↩](#fn1a)  

<a id="fn2">2</a>: D Lowe, ["Vaccine Efficacy Data!"](https://blogs.sciencemag.org/pipeline/archives/2020/11/09/vaccine-efficacy-data), _In the Pipeline_ blog at _SciTranslMed_, 2020-Nov-09.[↩](#fn2a)  
