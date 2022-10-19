---
layout: post
title: On COVID-19 Antivirals&colon; Real-World Experience
tags: COVID JournalClub PharmaAndBiotech Statistics
comments: true
commentsClosed: false
---

Our newest COVID-19 antiviral medicines, molnupiravir and paxlovid, have been out for a
while now.  What's the real-world experience on efficacy?  


## Molnupiravir is doubtful  

Molnupiravir has, since the beginning, had a bit of an odor about it.  The clinical trial
had a couple fishy things going on, like the fact that the initial and completion cohorts
had _vastly_ different efficacies.  It doesn't hit the news much, but when 
[we worked out the details on this Crummy Little Blog That Nobody Reads]({{ site.baseurl }}/efficacies-dont-average),
we found the completion cohort had _negative_ efficacy!  So everybody wants good data on
molnupiravir's efficacy, to remove the uncertainty and let us use it properly if it really
works.  

Also, the molnupiravir initial trial was done on unvaccinated participants!  We'd like to
know how it works on a multiply vaccinated population more likely to represent who we are
today.  

Also also, the original trial was conducted at a time when the SARS-CoV2 variants were
different.  How does it stack up against Omicron?  

<img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-medpage-1.jpg" width="400" height="158" alt="Hein @ Medpage Today: Molnupiravir fails to cut hospitalization risk" title="Hein @ Medpage Today: Molnupiravir fails to cut hospitalization risk" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-ssrn-1.jpg" width="400" height="201" alt="Butler, et al. @ SSRN: open-label multicenter adaptive trial of molnupiravir" title="Butler, et al. @ SSRN: open-label multicenter adaptive trial of molnupiravir" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
With those questions in mind, our first source is a news article on _Medpage Today_ <sup id="fn2a">[[2]](#fn2)</sup> which
reports (and more importantly points us to the original source for) a "very large,
open-label, multi-center, multi-arm, adaptive, randomized, controlled trial" of
molnupiravir on people hospitalized in the UK. <sup id="fn3a">[[3]](#fn3)</sup>  

<a href="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-ssrn-2.jpg"><img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-ssrn-2-thumb.jpg" width="400" height="239" alt="Butler, et al. @ SSRN: Participant flow diagram" title="Butler, et al. @ SSRN: Participant flow diagram" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now, that's a lot of adjectives!  But it really just comes down to the authors advertising
that they understand what a trial should be like, and they've ticked all the boxes to make
a good, high-quality dataset on which we can rely.  The patients were selected from a very
large initial population, and still managed to track a large cohort:  
- 112,759 patients screened for eligibility by various careful-appearing criteria.  
- 68,364 passed to see if their doctors would enroll them.  
- 26,288 registered in the trial.  
- 12,821 got SOC + molnupiravir / 12,962 got SOC alone / 505 other treatments in other
  arms arms.  
- A very few patients were lost (16 in each arm) for various reasons, so the final
  comparison of molnupiravir plus standard of care vs standard of care alone were 12,516
  and 12,484.  

The outcomes measured were:  
- all-cause hospitalization or death within 28 days  
- time to first self-reported recovery.  

They analyzed it with "Bayesian methods", but frustratingly there are no equations in the
paper's text!  I declined to chop my way through the 43 pages of word salad to find the
details.  Sorry, there's only so much I can do with still a little bit of post-COVID brain
fog.  

So it's a big, complicated trial on the order of size of the orginal vaccine trials.
They're really not playing around here: this was expensive to do!  

Let's take a look at their results (as they reported; given they've obscured all the math,
I'm not going to check it).
- All-cause hospitalization or death by 28 days was pretty rare: 0.8% in both arms.  
  - You measure the difference here with an
    [_odds ratio_ (OR)](https://en.wikipedia.org/wiki/Odds_ratio).  Getting OR = 1 says
    both arms work about the same.  To get a significant result, you want to see an odds
    ratio on either side of 1, and with a 95% confidence interval that bounds it away
    from 1.  That is, one treatement is better (OR different from 1) and you're very sure
    about that (confidence interval says the worst case is still on the same side of 1,
    i.e., the confidence interval doesn't include 1.  
  - They did something slightly different technically, called the Bayes credible interval
    (BCI).  But for our purposes, it does the same job: quantify the uncertainty on the
    odds ratio.  
- With that as background, they report OR = 1.06 with 95% BCI of 0.8 - 1.40.  That means
  there is _no statistically significant contribution by molnupiravir when added to
  standard of care_.  This held across the various subgroups.  
<a href="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-ssrn-3.jpg"><img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-ssrn-3-thumb.jpg" width="400" height="303" alt="Butler, et al. @ SSRN: KM curve for time to recovery with and without molnupiravir" title="Butler, et al. @ SSRN: KM curve for time to recovery with and without molnupiravir" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Graphically, we see the same in the KM  curve shown here for self-reported time to first
  recovery.  Molnupiravir is a _little_ faster, but not by much.  It's 9 days with
  molnupiravir and 15 days with standard of care.  That gives a Hazard Ratio of 1.36 and a
  95% BCI of 1.30 - 1.40.  So that, at least, is statistically significant even though
  it's a small effect.
  
__Summary:__ There was no benefit for hospitalization or death, and only a tiny benefit in
time to recovery.  Given the risks of driving resistance and wasting medical resources,
molnupiravir may be doing more harm than good when used on vaccinated people in the time
of the Omicron variant.


## Paxlovid really works; molnupiravir sort of works  

<img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-1.jpg" width="400" height="196" alt="Wong, et al. @ Lancet: Efficacy of molnupiravir and paxlovid" title="Wong, et al. @ Lancet: Efficacy of molnupiravir and paxlovid" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Next up is a similar study in Hong Kong, this time of _both_ molnupiravir and paxlovid.
Unlike the preprint above, this one has made it through peer review in the top-shelf
journal _The Lancet._ <sup id="fn4a">[[4]](#fn4)</sup>  

<a href="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-2.jpg"><img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-2-thumb.jpg" width="400" height="290" alt="Wong, et al. @ Lancet: participant flow diagram" title="Wong, et al. @ Lancet: participant flow diagram" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
In China, and hence in Hong Kong, they take COVID-19 diagnosis _very_ seriously!  Now,
that has number of downsides.  But, on the upside, it means they have superb data on
COVID-19 incidence in the general public.  In this case, they started with 5383 patients
on molnupiravir and 6464 on paxlovid, and a control cohort of 917,319.  As you can see
from the participant flow diagram shown here, they started with an impressive cohort of
1,074,856 people!  They did all the usual things: randomized selection, case-control
sampling for sensitivity analyses, matching patient risk categories & Charlson Comorbidity
score, and so on.  

The study outcomes were death, COVID-19 related hospitalization, in-hospital disease
progression, and ICU admission.  Then the usual statistical armamentarium: Cox regression,
hazard ratios, logistic regression, and odds ratios.  

<a href="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-3.jpg"><img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-3-thumb.jpg" width="400" height="51" alt="Wong, et al. @ Lancet: Summary of hazard ratios" title="Wong, et al. @ Lancet: Summary of hazard ratios" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-4.jpg"><img src="{{ site.baseurl }}/images/2022-10-18-covid-antivirals-rwd-lancet-4-thumb.jpg" width="400" height="469" alt="Wong, et al. @ Lanceet: KM curves" title="Wong, et al. @ Lanceet: KM curves" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
They've somewhat buried their results in a paragraph or so of word salad.  But sifting
through it, we can make the table we see here.  
- In agreement with the study above, the Hazard Ratio for molnupiravir vs hospitalization
  was not statistically significant.  However, in-hospital disease progression and death
  were statistically significant with molnupiravir.  
- Paxlovid was statistically significant on all 3 measures, with hazard ratios either
  comparable or strictly superior to molnupiravir.  

The Kaplan-Meier curves show the same results graphically: molnupiravir doesn't work vs
hospitalization, but everything else works.  Paxlovid generally is better.  


## The Weekend Conclusion  

So we have 2 large, well-powered, carefully designed and analyzed studies.  The
conclusions are pretty clear:  
- Molnupiravir doesn't work much against hospitalization.  
- Molnupiravir _does_ work, somewhat, against death and in-hospital progression.  
- Paxlovid works everywhere, and generally better than molnupiravir.  

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

<a id="fn1">1</a>: Weekend Editor, ["Mea Culpa: Efficacies Don't Average!"](https://www.someweekendreading.blog/efficacies-dont-average/), _SomeWeekendReading_ blog, 2021-Dec-02. [↩](#fn1a)  

<a id="fn2">2</a>: I Hein, ["Authorized COVID Antiviral Fails to Cut Hospitalization Risk"](https://www.medpagetoday.com/infectiousdisease/covid19/101172), _Medpage Today_, 2022-Oct-11. [↩](#fn2a)  

<a id="fn3">3</a>: C Butler, _et al.,_ ["Molnupiravir Plus Usual Care Versus Usual Care Alone as Early Treatment for Adults with COVID-19 at Increased Risk of Adverse Outcomes (PANORAMIC): Preliminary Analysis from the United Kingdom Randomised, Controlled Open-Label, Platform Adaptive Trial"](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4237902), _SSRN_ preprint, 2022-Oct-17. Clinical trial registration: ISRCTN30448031. [↩](#fn3a)  

<a id="fn4">4</a>: CKH Wong, _et al.,_ ["Real-world effectiveness of molnupiravir and nirmatrelvir plus ritonavir against mortality, hospitalisation, and in-hospital outcomes among community-dwelling, ambulatory patients with confirmed SARS-CoV-2 infection during the omicron wave in Hong Kong: an observational study"](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(22)01586-0/fulltext), _The Lancet_ 400:10359, pp. 1213-1222, 2022-Oct-08. DOI: [10.1016/S0140-6736(22)01586-0](https://doi.org/10.1016/S0140-6736(22)01586-0). [↩](#fn4a)  
