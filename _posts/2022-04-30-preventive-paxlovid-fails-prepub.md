---
layout: post
title: Paxlovid for Prevention Fails
tags: COVID PharmaAndBiotech
comments: true
---

Pfizer just read out a Phase 2/3 trial of paxlovid for preventing transmission of COVID-19
to other members of a household when one member is infected.  Alas, nope.  


## Preventive paxlovid  

This is a trial that Pfizer start last October, so it's run for about 7 months now and a
top-line readout has become available.  They're testing paxlovid for _prevention_ of
COVID-19 in people who are exposed because they live with someone who has tested
positive.  Best of all, they recruited during the Omicron wave, so any results are
relevant to the current variant.  

If this had worked, it would have been big news: a way to _stop the spread_ of the virus!  

Alas:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Pfizer Inc on Friday said a large trial found that its COVID-19 oral antiviral
    treatment Paxlovid was not effective at preventing coronavirus infection in people
    living with someone infected with the virus.
    <a href="https://t.co/qRDEX4LlJ1">https://t.co/qRDEX4LlJ1</a>
  </p>&mdash; Reuters Health (@Reuters_Health) 
  <a href="https://twitter.com/Reuters_Health/status/1520285595062476800?ref_src=twsrc%5Etfw">April 30, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

<img src="{{ site.baseurl }}/images/2022-04-30-preventive-paxlovid-fails-reuters-1.jpg" width="400" height="235" alt="Beasley @ Reuters: Pfizer trial of preventive paxlovid fails" title="Beasley @ Reuters: Pfizer trial of preventive paxlovid fails" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-04-30-preventive-paxlovid-fails-pfizer-1.jpg" width="400" height="193" alt="Pfizer Media Relations: trial of preventive paxlovid fails" title="Pfizer Media Relations: trial of preventive paxlovid fails" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-04-30-preventive-paxlovid-fails-clinical-trial.jpg" width="400" height="180" alt="Pfizer: Clinical trial NCT05047601 of paxlovid for post-exposure prevention of COVID-19" title="Pfizer: Clinical trial NCT05047601 of paxlovid for post-exposure prevention of COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Ok, but tweets just talk, not evidence.  

That points us to a summary article at _Reuters_ <sup id="fn1a">[[1]](#fn1)</sup>, which
has some more information, but still not much.  A bit of digging uncovered the same-day
press release from Pfizer <sup id="fn2a">[[2]](#fn2)</sup>, which as a primary source is
the best authority we're gonna get today.  Yes, it's just a press release, but they're
still analyzing the rest of the data and the real scientific publication is yet to come.
The press release points us at the actual clinical trial <sup id="fn3a">[[3]](#fn3)</sup>,
which was only modestly helpful because they haven't entered the result data yet.  

Here's Pfizer's summary (our emphasis added):  

> In this trial, compared to placebo, Pfizer observed __risk reductions of 32% and 37%__ in
> adults who received PAXLOVID for five and ten days, respectively, to prevent
> infection. These results, however, were __not statistically significant__ and, as such, the
> primary endpoint of reducing the risk of confirmed and symptomatic COVID-19 infection in
> adults who had been exposed to the virus through a household contact was not met.  

Now, observe: a 32% - 37% risk reduction is not _nothing._  However, the statement that it
is not statistically significant means that it _might be nothing_, i.e., we could have
seen efficacy this large by chance.  So, by clinical trial standards, we embrace the null
hypothesis that there is no effect.  

They didn't say exactly what statistic they used to assess statistical significance.  At
some level, it just tells them that the 95% confidence interval on the risk ratio with
respect to controls includes 0% efficacy.  

There's not _quite_ enough data revealed in the press release to calculate this for
ourselves:  
- The number of participants was $N = 2957$.  
- They were randomized into 3 arms: placebo for 10 days, paxlovid for 10 days, and
  paxlovid for 5 days.  
- The randomization was 1:1:1, so the number in each arm was $N_i \sim 2957 / 3 = 986$.  
- The number in each arm who got sick, $K_i$, was not reported.  
- The risk ratios were 32% and 37%.  Let $N_1$ be the control arm, and $N_2$ and $N_3$ be
  the 5 day and 10 day paxlovid courses.  Then this means:  
  $$
  \left\{
	\begin{align*}
	  \frac{(K_2/N_2)}{(K_0/N_0)} &= 0.32 \\
	  \frac{(K_3/N_3)}{(K_0/N_0)} &= 0.37
	\end{align*}
  \right.
  $$
- Since $N_1 = N_2 = N_3$ (1:1:1 randomization), the $N$'s drop out:  
  $$
  \left\{
	\begin{align*}
	  \frac{K_2}{K_0} &= 0.32 \\
	  \frac{K_3}{K_0} &= 0.37
	\end{align*}
  \right.
  $$

That leaves us with 2 equations in 3 unknowns ($K_1$, $K_2$, and $K_3$), so we can't
move further to checking statistical significance.  Guess we'll have to wait for the
paper.  
  
Reuters can't resist reporting the judgement of the stock market, for all the usual silly
reasons:  

> Shares of Pfizer, which fell 3% in regular trading, were down another 1% at \$48.53
> after hours.  


## The Weekend Conclusion  

It was a great idea, with the potential to stop the spread of COVID-19 in its tracks.  It
was a noble effort in testing, with a trial both large enough and properly controlled.  It
just turned out not to work.  

So&hellip; we should proceed to the next great idea.  For my money, that would be a paxlovid/fluvoxamine combination trial.  (I am biased, as I used to be an expert on assessing synergy of drug combinations in oncology.  Still, I think it's a good idea. Since [we know fluvoxamine works]({{ site.baseurl }}/partisan-covid-deaths/#the-partisan-divide-in-drug-repurposing), why isn't it more widely prescribed?)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: D Beasley, ["Pfizer says COVID treatment Paxlovid fails to prevent infection of household members"](https://www.reuters.com/business/healthcare-pharmaceuticals/pfizer-says-covid-treatment-paxlovid-fails-prevent-infection-household-members-2022-04-29/), _Reuters_, 2022-Apr-29. [↩](#fn1a)  

<a id="fn2">2</a>: Pfizer Media Relations, ["Pfizer Shares Top-Line Results from Phase 2/3 EPIC-PEP Study of PAXLOVID™ for Post-Exposure Prophylactic Use"](https://www.pfizer.com/news/press-release/press-release-detail/pfizer-shares-top-line-results-phase-23-epic-pep-study), Pfizer Press Releases, 2022-Apr-29. [↩](#fn2a)  

<a id="fn3">3</a>: Pfizer, Inc., ["A Study of a Potential Oral Treatment to Prevent COVID-19 in Adults Who Are Exposed to Household Member(s) With a Confirmed Symptomatic COVID-19 Infection"](https://clinicaltrials.gov/ct2/show/NCT05047601), _ClinicalTrials.gov_ id NCT05047601, retrieved 2022-Apr-30. [↩](#fn3a)  
