---
layout: post
title: How Can Evusheld Possibly Work?!
tags: COVID MathInTheNews PharmaAndBiotech Statistics
comments: true
---

Evusheld is an antibody infusion which confers about 6 months of vaccine-like immunity to
COVID-19.  How can that possibly work, when antibodies last a few days to a few weeks?!  


## Evusheld  

<img src="{{ site.baseurl }}/images/2021-12-09-fda-evusheld-ap-2.jpg" width="400" height="267" alt="AP: Evusheld" title="AP: Evusheld" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Evusheld was approved last December, as we wrote at the time. <sup id="fn1a">[[1]](#fn1)</sup>
Interestingly, it was approved directly by the FDA, bypassing the usual VRBPAC committee
of external experts for review.  

It's 2 antibodies (tixagevimab and cigavimab) given as simultaneous injections.  They
target distinct areas of the SARS-CoV2 spike protein.  

__The interesting bit:__ This confers immunity at efficacy levels of 77% for 6 months,
starting more or less immediately!  

Now, if you're an immunocompromised individual who cannot medically tolerate vaccination
(2% - 3% of the US population), this is a big deal, even if it requires dosing twice a
year forever, at a cost of \$1,000/dose.  

Vaccination is about \$30/dose, for comparison.  

But the puzzle to me was: given that external antibodies last somewhere between days to
weeks in your body since you're not making more, how can you get immunity for 6 months?
Today we'll dive into that question, and get a partial answer.  


## The evidence it works  

First, Eric Topol of Scripps tells us it seems to work pretty well:

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    🆕<a href="https://twitter.com/NEJM?ref_src=twsrc%5Etfw">@NEJM</a><br>

    The large Evusheld (1-dose, intramuscular, combination monoclonal antibody) randomized,
	placebo-controlled Covid prevention trial<br>77% reduction of symptomatic infection;
	⬆️83% at 6 months; all 7 severe cases/deaths in placebo group; works vs BA.2
    <a href="https://t.co/uwDl99TyYi">https://t.co/uwDl99TyYi</a> 
    <a href="https://t.co/nLT3yKqIgH">pic.twitter.com/nLT3yKqIgH</a> 
  </p>&mdash; Eric Topol (@EricTopol) <a href="https://twitter.com/EricTopol/status/1516884411488227329?ref_src=twsrc%5Etfw">April 20, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

By way of evidence, Topol points us at 2 articles in the _New England Journal of Medicine_
<sup id="fn2a">[[2]](#fn2)</sup> and _Science Translational Medicine_ <sup id="fn3a">[[3]](#fn3)</sup>, 
both top-shelf sources for this sort of thing.  

<img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-nejm-1.jpg" width="400" height="204" alt="Levin, et al. @ NEJM: Evusheld for prevention of COVID-19" title="Levin, et al. @ NEJM: Evusheld for prevention of COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First, let's have a look through the _NEJM_ paper, which is the publication of the clinical
trial results for Evusheld.  

We'll check their numbers for efficacy using our kludgey little binomial confidence
interval [R](https://www.r-project.org/) script. <sup id="fn4a">[[4]](#fn4)</sup> They
used a much more sophisticated Poisson regression method with robust variance, but didn't
publish enough details for us to reproduce that exactly.  So we'll be looking for crude
agreement with our crude method, nothing more.  

They report that their 2 antibodies were from the B cells of convalescent patients, with
some modifications discussed below.  Also very interestingly, they dose these antibodies
at 6x - 22x higher than the levels found in convalescent patients!  We'll see why below.  

First up, they assessed mild to moderate adverse events.  Keep in mind that by saying
"mild to moderate", they're counting even if people just report a headache, a cold, or
something minor like that to their doctor.  They saw such mild events in:  
- 1221/3461 patients in the treatment group, or 35.3%  
- 593/1736 patients in the control group, or 34.2%  

We shouldn't expect that to be statistically significant, and indeed it's not; the
efficacy against mild/moderate adverse events was broadly consistent with 0%:  
```R
> efficacyAndCL(3461, 1221, 1736, 593)
        LCL         Eff         UCL 
-0.11874715 -0.03278303  0.04547047 
```

Next, let's look at symptomatic COVID-19 and death rates.  

At an early readout, when 30% of the patients had discovered the arm the trial to which
they'd been assigned, they report:  
- 8/3441 patients in the treatment group  
- 17/1731 patients in the control group  

They report an efficacy of 76.7% (95% CL: 46.0% - 90.0%).  We broadly agree with that,
rounded to 2 significant figures:  
```R
> efficacyAndCL(3441, 8, 1731, 17)
      LCL       Eff       UCL 
0.4649044 0.7632699 0.8952743 
```

<a href="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-nejm-2.jpg"><img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-nejm-2-thumb.jpg" width="400" height="206" alt="Levin, et al. @ NEJM: Kaplan-Meier curve of evusheld trial" title="Levin, et al. @ NEJM: Kaplan-Meier curve of evusheld trial" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The Kaplan-Meier curve, shown here, gives impressive results in terms of the hazard
ratio.  The blue curve is the control group, and we see cases rising; the red curve is the
treatment group where cases rise much more slowly.  They reported results on extended
follow-up at 6 months of 82.8% (95% CL 65.8% - 91.4%).  Taking numbers from the KM plot,
we broadly agree, again to a couple significant figures with our crude methods:  
```R
> efficacyAndCL(3441, 11, 1731, 31)
      LCL       Eff       UCL 
0.6502766 0.8214979 0.9089119 
```

There were 5 deaths, all in the control group.  While they didn't report an efficacy here,
we can crudely estimate it as 100% (95% CL: 61.4% - 100%):

```R
> efficacyAndCL(3441, 0, 1731, 5)
      LCL       Eff       UCL 
0.6137538 1.0000000 1.0000000 
```

<a href="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-nejm-3.jpg"><img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-nejm-3-thumb.jpg" width="400" height="219" alt="Levin, et al. @ NEJM: Pharmakokinetics of blood levels of antibodies" title="Levin, et al. @ NEJM: Pharmakokinetics of blood levels of antibodies" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
But do the antibodies actually stick around for 6 months?  That's an astonishingly long
time, since the normal half-life is days to a week or so.  

The answer is yes, as seen in the pharmacokinetics curve shown here (Supplement figure 2A
in the paper).  It looks like the geometric mean concentration (GMC) goes down by a factor
of about 2.5, maybe a bit more.  
- Elsewhere they make the claim that the half-life is 3 months, so we'd expect them to go
  down by a factor of 4, so apparently the observational data is even better than that.
- But if you dose 6x - 22x higher than the clinically meaningful level found in
  convalescent patients, then after 2 half-lives those should go down by a factor of 4.

In other words, you'd expect the concentration to _remain above the level found in convalescents_
for at least 6 months.  

So there's a partial answer to our question: engineer the antibody to have a longer
half-life, and then dose it really high so after a couple half-lives it's still at an
effective level.  __Sophisticated antibody engineering and brute-force dosing.__  

<img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-scitranslmed-1.jpg" width="400" height="182" alt="Loo, et al. @ Sci Transl Med: Protection and extended half-life" title="Loo, et al. @ Sci Transl Med: Protection and extended half-life" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The second paper covers rather similar ground, so I won't drag you through all of it.  

<a href="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-scitranslmed-2.jpg"><img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-scitranslmed-2.jpg" width="400" height="260" alt="Loo, et al. @ SciTranslMed: % Neutralization vs ab concentration" title="Loo, et al. @ SciTranslMed: % Neutralization vs ab concentration" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-scitranslmed-3.jpg"><img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-scitranslmed-3.jpg" width="400" height="234" alt="Loo, et al. @ Sci Transl Med: Ab half-lives" title="Loo, et al. @ Sci Transl Med: Ab half-lives" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
But there are 2 particular sub-figures I want to highlight, which tell us (a) what
antibody levels seem to be sufficient to neutralize the virus, and (b) how long antibody
levels can be kept above that.  These are Figures 1D and 2B in the paper, shown here.  
1. Figure 1D tells us that the EC50 (concentration at which you get half the maximum
   effect) is 10 - 30 ng/ml, depending on which antibody you're discussing.  But by the
   time you get up to 1000 ng/ml = 1&mu;g/ml you're getting a full kill.  That's a level
   high enough to eliminate the virus, more or less completely, if humans can stand that
   level.  
2. Figure 2B tells us the lifetime of these antibodies.  It looks like the initial doses
   were around 1,000 - 10,000 &mu;g/ml, and declined to 500 - 1,000 &mu;g/ml after 2
   months.  That is, absolutely monstrously effective levels were sustained for months.  
   
Now I can begin to see that it makes sense this thing works: very high doses are
tolerated, and the half-life is long enough to give 6 months of immunity.  


## Antibody engineering  

<img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-asm-1.jpg" width="400" height="219" alt="Robbie, et al. @ Antimicrob Agt &amp; Chemo: YTE modification for extended ab half-life" title="Robbie, et al. @ Antimicrob Agt &amp; Chemo: YTE modification for extended ab half-life" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-jbc-1.jpg" width="400" height="273" alt="WF Dall'Acqua, et al. @ JBC: Engineering human IgG1s" title="WF Dall'Acqua, et al. @ JBC: Engineering human IgG1s" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-05-03-how-evusheld-works-jnlimm-1.jpg" width="400" height="165" alt="WF Dall'Acqua, et al. @ Jnl Immunol: Consequences of enginnering human IgG1" title="WF Dall'Acqua, et al. @ Jnl Immunol: Consequences of enginnering human IgG1" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
But&hellip; but&hellip; but!  _How_ exactly did they get the antibodies to have such
amazingly long half-lives?!  Following the references in their bibliographies led us to 3
papers (actually more, I just ran out of energy at 3) from 2002 - 2013 on this 
subject. <sup id="fn5a">[[5]](#fn5)</sup> <sup id="fn6a">[[6]](#fn6)</sup> <sup id="fn7a">[[7]](#fn7)</sup>  

It appears there's a thing called the "YTE substitution", which in the usual protein
mutation notations makes the triple substitution M252Y/S254T/T256E (hence YTE).  This was
found to extend dramatically the half-life of antibodies, by 2-4x.  Since these are
somewhat older papers, they were of course done with antibodies that had nothing to do
with SARS-CoV2.  The discovery with Evusheld was that the technique carried over to
SARS-CoV2.  

Everybody points back to the Dall'Acqua papers as the source of this magic.  But a quick
read-through was maddening: although the results are _described_, they are not
_motivated_.  How in the world did anybody think to try that?!  I'm mystified.  


## The Weekend Conclusion&hellip; and Some Remaining Puzzles  

So the answer to our question of "how can it possibly work?!" seems to be, at the surface
level:  
- The YTE modification is known to increase antibody half-life in the body, in this case
  around 90 days.  
- They administer it at very high levels, maybe 6x - 22x what is required, so after 2
  half-lives (180 days) it's still well above prevention-effective levels.  

But there are still some questions that bother me:  
- How was the YTE substitution discovered?  They weren't just messing about by chance!  
- How does the YTE substitution work?  What exactly is the _physics_ of why antibodies
  with this triple substitution live so long?  
- Why isn't this substitution done for every antibody infusion?  For example, if we take
  bebtelovimab, the antibody infusion still in use to treat COVID-19 Omicron, would it be
  better if we did the YTE substitution to it?  

So we learned something&hellip; and we learned how little we know.  

That's typical of a day in science.  

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

<a id="fn1">1</a>: Weekend Editor, ["FDA Grants EUA to AstraZeneca's Evusheld for COVID-19 Prevention"]({{ site.baseurl }}/fda-evusheld/), _Some Weekend Reading_ blog, 2021-Dec-09. [↩](#fn1a)  

<a id="fn2">2</a>: MJ Levin, _et al.,_ ["Intramuscular AZD7442 (Tixagevimab–Cilgavimab) for Prevention of Covid-19"](https://www.nejm.org/doi/full/10.1056/NEJMoa2116620), _N Engl Jnl Med_, 2022-Apr-20.  DOI: [10.1056/NEJMoa2116620](https://dx.doi.org/10.1056/NEJMoa2116620). [↩](#fn2a)  

<a id="fn3">3</a>: Y-M Loo, _et al.,_ ["The SARS-CoV-2 monoclonal antibody combination, AZD7442, is protective in nonhuman primates and has an extended half-life inhumans"](https://www.science.org/doi/10.1126/scitranslmed.abl8124), _Sci Transl Med_ 14, eabl8124, 2022-Mar-09. DOI: [10.1126/scitranslmed.abl8124](https://doi.org/10.1126/scitranslmed.abl8124). [↩](#fn3a)  

<a id="fn4">4</a>: Weekend Editor, ["Script to asses efficacy and 95% CL using binomial confidence intervals"]({{ site.baseurl }}/assets/2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r), _Some Weekend Reading_ blog, 2021-Nov-12. [↩](#fn4a)  

<a id="fn5">5</a>: GJ Robbie, _et al.,_ ["A Novel Investigational Fc-Modified Humanized Monoclonal Antibody, Motavizumab-YTE, Has an Extended Half-Life in Healthy Adults"](https://journals.asm.org/doi/10.1128/AAC.01285-13), _Antimicrob Agents Chemother_ 57:12, 6147-6153, 2013-Dec.  DOI: [10.1128/AAC.01285-13](https://doi.org/10.1128/AAC.01285-13). [↩](#fn5a)  

<a id="fn6">6</a>: WF Dall'Acqua, _et al.,_ ["Properties of Human IgG1s Engineered for Enhanced Binding to the Neonatal Fc Receptor (FcRn)"](https://www.sciencedirect.com/science/article/pii/S0021925819463898#FN1), _Jnl Biol Chem_ 281:33, 23514-23524, 2006-Aug-18.  DOI: [10.1074/jbc.M604292200](https://doi.org/10.1074/jbc.M604292200). [↩](#fn6a)  

<a id="fn7">7</a>: WF Dall'Acqua, _et al.,_ ["Increasing the Affinity of a Human IgG1 for the Neonatal Fc Receptor: Biological Consequences"](https://www.jimmunol.org/content/169/9/5171), _Jnl Immunol_ 169:9, 5171-5180, 2002-Nov-01.  DOI: [10.4049/jimmunol.169.9.5171](https://doi.org/10.4049/jimmunol.169.9.5171). [↩](#fn7a)  
