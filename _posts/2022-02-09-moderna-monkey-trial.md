---
layout: post
title: On the Moderna Omicron-Specific Booster Monkey Trial
tags: COVID MathInTheNews PharmaAndBiotech SomebodyAskedMe Statistics
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about a report that
Moderna's monkey trial of an Omicron-specific booster wasn't any better than the existing
vaccine.  What should we think about that?  


## Omicron-specific boosters!  

<a href="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-mwra.jpg"><img src="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-mwra-thumb.jpg" width="400" height="291" alt="MWRA Deer Island Treatment Plant: Viral levels in wastewater" title="MWRA Deer Island Treatment Plant: Viral levels in wastewater" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Everybody's worried about Omicron, in spite of the fact that it's almost over.  Omicron
is _so_ infectious that it burns through a population pretty quickly.  

Since, apparently, here at Chez Weekend we're all about sewage lately, have a look at the
viral RNA levels detected by Boston's MWRA as of today.  See that big peak at the right,
almost back down to background?  That's the Omicron wave.  Cases, hospitalizations, and
deaths will still be peaking, but the Omicron viral wave is coming to a close.  

So it's with a sad sense of irony that we contemplate Omicron-specific boosters, as a
classic case of too little, too late.  Though to be fair, given Omicron emerged last
November, _nothing_ could be fast enough.  Don't blame the vaccine companies for that.  

Still&hellip; it makes sense to use the nimble mRNA technology to update vaccines.  Even last March, when the [Big Bad](https://buffy.fandom.com/wiki/Big_Bad) _du jour_ was the Beta variant (remember Beta?), [both Moderna and Pfizer were working on variant-specific vaccines]({{ site.baseurl }}/variants-vs-vaccines/#mrna-vaccines-and-boosters-for-variants), and the [FDA had pledged expedited review akin to an annual vaccine for flu variants]({{ site.baseurl }}/variants-vs-vaccines/#what-about-the-fda).  

So it's only natural to expect work on an Omicron vaccine.  If it were available now, I'd
certainly take it!  

Let's check in on the progress of that work.  


## Some claims about the Moderna Monkey Trial for Omicron  

(I can't resist the slightly improper phrase "Moderna Monkey Trial", because it evokes the ["Scopes Monkey Trial"](https://en.wikipedia.org/wiki/Scopes_Trial) when American fundamentalists got whupped. Maybe we need to do that again, to suppress the right-wing hysterical irrationality here in the US?)  

<img src="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-at-1.jpg" width="400" height="126" alt="Mole @ Ars Technica: Moderna Omicron booster 'only as good as' original in monkeys" title="Mole @ Ars Technica: Moderna Omicron booster 'only as good as' original in monkeys" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-biorxiv.jpg" width="400" height="361" alt="Gagne @ bioRxiv: booster in macaques has comparable B cell expansion nAbs and protection vs Omicron" title="Gagne @ bioRxiv: booster in macaques has comparable B cell expansion nAbs and protection vs Omicron" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

My correspondent asked me about an article in _Ars Technica_ 
<sup id="fn1a">[[1]](#fn1)</sup> claiming that the result of the Moderna Monkey Trial
showed vaccine efficacy in monkeys 'only as good as' the current vaccines.  Now, 2 things
immediately stood out to me:  
1. It frosts my cheese when someone sneeringly dismisses something as 'only as good as'
   the _most effective vaccines in human history, developed in record time._  That's like
   saying you're only a so-so skier, because you're 'only as good as' a gold medalist.
   That phrase 'only as good as' is doing a lot of lifting here, and not in a good way.  
2. Animal trials are not about showing efficacy in the first place!  They're about safety
  ("did any of the monkeys catch fire and explode?") and about PK/PD ("did the drug levels
  in the blood go down about like you thought?", and "did the drug get into the right
  compartment, at the right time, at the right level, and for the right duration?"), and
  about dose-finding.  Sure, if you see efficacy, it's fine to report that.  But it's not
  the main thing.  
  
So some digging is required, to route around the damage caused by bad science journalism.
The actual scientific report is still a preprint <sup id="fn2a">[[2]](#fn2)</sup>, but
it's available to read.  Sure enough, it only uses the word "efficacy" in the introduction
and in justifying the use of a primate model.  It's all about memory B cells, T cells, and
the like.  The conclusion is more or less, "No monkeys currently on fire.  All monkeys
show immune stimulation.  Sure looks like a vaccine."  And that's what you should
_expect!_  

So&hellip; one reasonable reaction would be: "move along kid, nothin' to see here."  

But that's boring.  Let's examine the reasonableness of making _any_ claim about efficacy
based on the Moderna Monkey Trial.  (Gee, I love that phrase.)  


## What efficacy means for $N = 8$  

<img src="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-at-2.jpg" width="400" height="127" alt="Mole @ Ars Technica: Unvaccinated vs vaccinated and Omicron" title="Mole @ Ars Technica: Unvaccinated vs vaccinated and Omicron" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-mmwr-1.jpg" width="400" height="241" alt="Johnson @ MMWR: COVID-19 incidence &amp; death rates vs boosters" title="Johnson @ MMWR: COVID-19 incidence &amp; death rates vs boosters" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-mmwr-2.jpg" width="400" height="261" alt="Thompson @ MMWR: Effectiveness of 3rd dose of mRNA vacccines" title="Thompson @ MMWR: Effectiveness of 3rd dose of mRNA vacccines" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

Our intrepid journalist at _Ars Technica_ cites herself as a source for efficacy of the
current vaccines against Omicron. <sup id="fn3a">[[3]](#fn3)</sup>  She claims Omicron efficacy
against the need for urgent care of 82%, and efficacy against hospitalization of 94%.
That seems to be fine, sourced from 2 _MMWR_'s from the 
CDC. <sup id="fn4a">[[4]](#fn4)</sup> <sup id="fn5a">[[5]](#fn5)</sup>  

So: can we conclude _anything_ statistically significant about vaccine efficacy in
comparison to those values of 82% or 94%?  After all, finding a result _better than 94%_
would probably require a lot of samples, since there's not much room up at the top there!  

Did we have a lot of samples in this study?  No.  We had $N = 8$.  

Upon seeing that, we'd be within our rights to throw up our hands in disgust and go see
what's on TV.  That would be about as productive as anything else.  But&hellip; here at
Chez Weekend, we like to dig.  So let's dig.  

There were 4 treatment animals who got 2 ordinary Moderna shots and the Omicron booster,
and 4 control animals who got 3 ordinary Moderna shots.  That means there are only 25
possible outcomes, if you're measuring who got COVID-19 and who did not: 0-4 in the
control arm, and 0-4 in the treatment arm.  (__NB:__ This is _not_ what the paper is
about!  The paper is about measuring B cells and T cells and 
[lions &amp; tigers &amp; bears, oh my](https://www.youtube.com/watch?v=-HrfbV16-FQ) in
both arms.  They concluded the results were comparable, as you would 
expect, and thus could proceed to human trials.)  

So we wrote a little [R script](https://www.r-project.org/) to check what the observed
efficacies and their 95% confidence limits would be in those 25
cases. <sup id="fn6a">[[6]](#fn6)</sup>  The confidence intervals are computed with a
simple binomial confidence interval, not
[my fancy-pants beta ratio method]({{ site.baseurl }}/beta-ratios/), which I
_still_ have not finished.  Feel free to berate me about that.)  

Recall that for $N_c$ controls and $N_t$ treatment animals, of whom $K_c$ and $K_t$,
respectively, get COVID-19, the point estimate of efficacy is defined as:  

$$
\begin{align*}
\mbox{Efficacy} &= 1 - \frac{\Pr(\mbox{COVID-19} | \mbox{treatment})}{\Pr(\mbox{COVID-19} | \mbox{control})} \\ 
                &= 1 - \frac{K_t / N_t}{ K_c / N_c}
\end{align*}
$$

Here's what the 25 possible outcomes look like:  

![Efficacies and 95% confidence intervals for Moderna Monkey Trial]({{ site.baseurl }}/images/2022-02-09-moderna-monkey-trial-efficacies.jpg "Efficacies and 95% confidence intervals for Moderna Monkey Trial")  

- All efficacy computations are for $N_c = 4$ controls and $N_t = 4$ treatment animals.  
- The rows are $K_c$, the number of sick animals in the control group; the columns are
  $K_t$, the number of sick animals in the treatment group.  
- The values in each cell are the efficacy point estimate from the equation above and the
  95% confidence limits based on a scaled binomial confidence interval.  
- The first row is peculiar but sensible, since it reflects $K_c = 0$, no sick controls:  
  - The upper left corner is sensibly NaN because it's computing 0/0, i.e., what happens if you run
    a COVID-19 trial and there's no COVID-19.  
  - The other elements are sensibly $-\infty$, because $K_c = 0$ means dividing by 0,
    i.e., given the nonzero cases in the treatment arm, the treatment arm was infinitely
    more risky than the control arm.  

A few things should stand out:  
- In no case was it possible to say the 95% confidence interval was greater than 80% or
  94%, the efficacy of the existing vaccine.  
- In fact, only in the 3 outcomes in the lower left, in bold and red, was it possible to
  say with 95% confidence that efficacy was greater than 0!  
  
__Summary:__ With an $N = 4 + 4$ trial, it is _simply not possible mathematically_ to show
that efficacy was statistically significantly better than the existing vaccines.  To
complain otherwise is a misleading canard.  


## The Weekend Conclusion  

Sure, the trial didn't prove the omicron booster was better.  It 
_could not possibly have done so_, and _was not designed to do that._  Journalism hinting
that this constitutes failure is just ignorant.  

The trial _did succeed_ at doing the sensible thing: demonstrating safety in primates, and
demonstrating immune reaction in the all-important memory B cells and T cells that we want
to see.  A result like this should, and probably will, clear the way for a human trial.  

Good job on this experiment.  Somewhat less good job on the science journalism.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: B Mole, ["Moderna’s omicron booster was only as good as current vaccine in monkey study"](https://arstechnica.com/science/2022/02/monkey-study-casts-doubt-on-need-for-an-omicron-specific-booster/), _Ars Technica_, 2022-Feb-07. [↩](#fn1a)  

<a id="fn2">2</a>: M Gagne, _et al.,_ ["mRNA-1273 or mRNA-Omicron boost in vaccinated macaques elicits comparable B cell expansion, neutralizing antibodies and protection against Omicron"](https://www.biorxiv.org/content/10.1101/2022.02.03.479037v1), _bioR&chi;iv_, posted 2022-Feb-02.  DOI: [10.1101/2022.02.03.479037](https://doi.org/10.1101/2022.02.03.479037).[↩](#fn2a)  

<a id="fn3">3</a>: B Mole, ["Unvaccinated 5X more likely to get omicron than those boosted, CDC reports"](https://arstechnica.com/science/2022/01/unvaccinated-5x-more-likely-to-get-omicron-than-those-boosted-cdc-reports/), _Ars Technica_, 2022-Jan-21. [↩](#fn3a)  

<a id="fn4">4</a>: AG Johnson, _et al.,_ ["COVID-19 Incidence and Death Rates Among Unvaccinated and Fully Vaccinated Adults with and Without Booster Doses During Periods of Delta and Omicron Variant Emergence — 25 U.S. Jurisdictions, April 4–December 25, 2021"](https://www.cdc.gov/mmwr/volumes/71/wr/mm7104e2.htm?s_cid=mm7104e2_w), US CDC _Mortality and Morbidity Weekly Report_ 71:4, 132-138, 2022-Jan-28. [↩](#fn4a)  

<a id="fn5">5</a>: MG Thompson, ["Effectiveness of a Third Dose of mRNA Vaccines Against COVID-19–Associated Emergency Department and Urgent Care Encounters and Hospitalizations Among Adults During Periods of Delta and Omicron Variant Predominance — VISION Network, 10 States, August 2021–January 2022"](https://www.cdc.gov/mmwr/volumes/71/wr/mm7104e3.htm?s_cid=mm7104e3_w), US CDC _Mortality and Morbidity Weekly Report_ 71:4, 139-145, 2022-Jan-28.[↩](#fn5a)  

<a id="fn6">6</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script for vaccine efficacy in Moderna Monkey Trial"]( {{ site.baseurl }}/assets/2022-02-09-moderna-monkey-trial.r), [_Some Weekend Reading_]({{ site.baseurl }}/), 2022-Feb-09. [↩](#fn6a)  
