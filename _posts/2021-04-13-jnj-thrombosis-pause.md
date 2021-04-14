---
layout: post
title: US pauses JnJ vaccine on thromboses
tags: COVID MathInTheNews PharmaAndBiotech 
comments: true
---

Today the US regulatory agencies "paused" the use of the JnJ COVID-19 vaccine to
investigate thromboses, similar to what's been seen with the AZ/OX vaccine.  How many, how
bad, and what will a pause do?  


## What's the sitch in general?  

We've been 
[following closely the situation in Europe, where the AstraZeneca/Oxford vaccine has been scrutinzed for clotting disorders]({{ site.baseurl }}/azox-vaccine-thrombo/), 
specifically cerebreal sinus vein thromboses:  
- Initially, it looked like nonsense because the rate of thromboses in the vaccinated
  population was _lower_ than the background rate in the general population.  
- Then it was restricted to a particularly rare cerebral sinus vein thrombosis (CSVT; aka
  cerebral venous sinus thrombosis, or CVST), but that looked like a statistical failure
  to do multiple hypothesis test correction.  
- Then it was isolated into a specific population (younger women), and there were some
  mechanisms observed (PF4-heparin antibodies) and some unique characteristics (low
  platelet count/thrombocytopenia)&hellip; and I decided it was [now so far outside any
  minor expertise of mine that I should back off &amp; admit there might be something rare,
  but real happening here]({{ site.baseurl }}/azox-vaccine-thrombo/#addendum-2021-mar-30-more-on-a-possible-clot-mechanism).  
  
It still looked in the case of AZ/OX like the risks of _not_ vaccinating the general
population were far higher than the risks of thromboses, so vaccination should continue.
But once there was a particular population identified (younger women) whose risk of dying
from COVID was less than their risk of dying from thromboses, stopping was the right thing
to do.  So now the European authorities recommend AZ/OX for older patients with an age
threshold depending on the country.  


## What happened to the JnJ vaccine today in the US?  

<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-globe-1.jpg" width="400" height="218" alt="Boston Globe: CDC, FDA pause JnJ vaccine for clots" title="Boston Globe: CDC, FDA pause JnJ vaccine for clots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-nyt-1.jpg" width="400" height="236" alt="NYT: CDC, FDA pause JnJ vaccine for clots" title="NYT: CDC, FDA pause JnJ vaccine for clots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-stat.jpg" width="400" height="233" alt="STAT News: US pauses JnJ for blood clots" title="STAT News: US pauses JnJ for blood clots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-fda.jpg" width="400" height="159" alt="FDA: Pause JnJ vaccine for clots" title="FDA: Pause JnJ vaccine for clots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Today, though, the US authorities announced similar, but _very_ rare, effects from the JnJ
vaccine.  Both JnJ and AZ/OX are viral vector vaccines (JnJ uses a human adenovirus,
whereas AZ/OX uses a simian adenovirus; the Russian Sputnik V vaccine uses two different 
human adenoviruses).  Perhaps the problem is related to viral vector
vaccines (called a "class effect"), since no such effect is seen for the mRNA vaccines
from Pfizer &amp; Moderna? After all, there's only 1 other viral vector vaccine approved
(JnJ's Ebola vaccine, approved in Europe), so the data are thin on the ground.  

It's all over the popular media; I used reports from the venerable 
_Globe_ <sup id="fn1a">[[1]](#fn1)</sup> and the _New York Times_ <sup id="fn2a">[[2]](#fn2)</sup>.
For somewhat higher technical accuracy and less of a miserable focus on "story", we turn
to the reliable Helen Branswell at _STAT News_ <sup id="fn3a">[[3]](#fn3)</sup> and
the press release from the CDC's director of CBER himself, 
Peter Marks <sup id="fn4a">[[4]](#fn4)</sup>.  

Synthesizing the reports from these 4 articles, with of course more emphasis on the last 2,
the situation is pretty clear:  
- First, a weirdness: the FDA and CDC can say "hey, stop using this emergency medication
  while we figure out a safety problem", but _the states don't have to listen!_  At the state
  level, boards of health can continue to do whatever they want with the vaccine they
  already have on hand.  That's&hellip; nuts.  To my readers outside the US who may be thinking
  that health care in the US is crazy: why yes; yes, are correct in that conclusion.  
- The precipitating event was noticing CSVT (like the AZ/OX thromboses in Europe) in 6
  women, aged 18-48.  There had been 6.8 million JnJ doses given at that point, so we're
  talking about a rare event:  
$$
\begin{align*}
  d/dt \Pr(\mathrm{thrombosis.death} | \mathrm{vax}) & = (6/\mathrm{fortnight}) / 6.8 \times 10^{+6} \\ 
                                                     & = 8.82 \times 10^{-7}/\mathrm{fortnight}
\end{align*}
$$
- The CDC Advisory Committee on Immunization Practice (ACIP) meets tomorrow.  The FDA is
  investigating causes of the thromboses, oddly combined with low platelet counts 
  (thrombocytopenia).  The theory is that the vaccine might induce antibodies that
  activate platelets, leading to clots and low platelet counts.  
- Signs to watch for in vaccinees: severe headache, shortness of breath, pain in
  legs/abdomen.  All indicate a trip to the local ER.  
- Heparin (an anti-coagulant)therapy is standard for thromboses, but inadvisable or even
  deadly here. Platelets are depleted and there may be PF4-heparin antibodies formed as
  the mechanism; non-heparin anti-coagulants are the order of the day. If so, might 
  PF4-heparin antibodies be a tox biomarker to use for diagnosis?  
- JnJ is about 5% of doses given in US so far.  Pfizer &amp; Moderna deliver 23 million doses/week 
  without notable safety concerns (though with difficult cold chain requirements).  The
  Biden administration is confident there will be enough vaccine _in the US_, even if we restrict it
  to Pfizer &amp; Moderna.  Outside the US, particularly in the developing world where
  AZ/OX and JNJ are preferred because of handling issues, it's an uglier story.  


## Some risk comparisons  

Ok, so how serious is that risk of a probability rate of thromboses of
$8.82 \times 10^{-7}$ per fortnight?  Let's compare with other risks to see if this is
something to worry about, or do you have a greater chance of being run over by a car on
your way to your vaccine appointment?  

Some less silly comparisons:  

- _Compare with COVID-19 death risk in US:_ In the first year of the pandemic, there were
  roughly 500k deaths in the US, in a population of about 328 million.  Since we're
  looking here at thromboses within 2 weeks of vaccination, we have to convert that to a
  probability per fortnight.  __Conclusion:__ There's about _100x higher risk_ of COVID-19 death
  from not being vaccinated.  
$$
\begin{align*}
  d/dt \Pr(\mathrm{covid.death} | \mathrm{no.vax}) & = (500,000/\mathrm{yr}) / (328 \times 10^{+6} \cdot 26 \mathrm{fortnight}/\mathrm{yr}) \\
                                                   & = 5.86 \times 10^{-5}/\mathrm{fortnight}
\end{align*}
$$

- _Compare with thrombosis risk in general in the US:_ The NYT article above cites the CDC
  saying there are 300k &ndash; 600k thrombosis cases per year in the US.  Ok, so let's
  convert that to a probability per person per fortnight for comparison.  __Conclusion:__
  There's about _100x higher risk_ of thrombosis in the general population.  
$$
\begin{align*}
  d/dt \Pr(\mathrm{thrombosis}) & = (300,000/\mathrm{yr} - 600,000/\mathrm{yr}) / (328 \times 10^{+6} \cdot 26 \mathrm{fortnight}/\mathrm{yr}) \\
                                & = 3.52 \times 10^{-5} - 7.04 \times 10^{-5}/\mathrm{fortnight}
\end{align*}
$$

<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-stroke.jpg" width="400" height="228" alt="Stroke: CSVT incidence 15.7 per million per year" title="Stroke: CSVT incidence 15.7 per million per year" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- _Compare specifically CSVT type thrombosis risk per year:_  Ok, so the risk of
  thrombosis in general is higher, but what about specifically cerebral sinus vein
  thromboses, which are rarer?  Are we seeing too many of those?  An article in _Stroke_
  <sup id="fn5a">[[5]](#fn5)</sup> places the risk (3-5x higher than previously believed)
  at 15.7 per million per year.  Convert that to risk per person per fortnight for
  comparison.  __Conclusion:__ This is _comparable to what's being seen in the vaccinee population_, 
  so it's _not_ obvious that we're seeing abnormally many CSVT's.  
$$
\begin{align*}
  d/dt \Pr(\mathrm{CSVT}) & = 15.7 \times 10^{-6}/\mathrm{yr} \cdot 1\mathrm{yr}/26 \mathrm{fortnights} \\
                          & = 6.04 \times 10^{-7}/\mathrm{fortnight}
\end{align*}
$$

<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-webmd.jpg" width="400" height="119" alt="WebMD: blood clot risk from birth control pills" title="WebMD: blood clot risk from birth control pills" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- _Compare with risk of blood clots from birth control pills:_ It's well-known that birth
  control pills carry a risk of blood clots for younger women, approximately the
  population at risk here.  An article on _WebMD_ <sup id="fn6a">[[6]](#fn6)</sup>
  quantifies this risk for us at 0.3% to 1% for 10 years of exposure.  Let's convert that
  to a risk per person per fortnight, to compare.  __Conclusion:__ Birth control pills
  present _100x higher risk_ of blood clots than this vaccine.  
$$
\begin{align*}
  d/dt \Pr(\mathrm{clot} | \mathrm{birthcontrol}) & = (0.003 - 0.01)/10 \mathrm{year} \cdot 1 \mathrm{year}/26 \mathrm{fortnights} \\
                                                  & = 1.15 \times 10^{-5} - 3.85 \times 10^{-5}/\mathrm{fortnight}
\end{align*}
$$

<img src="{{ site.baseurl }}/images/2021-04-13-jnj-thrombosis-pause-cdc.jpg" width="400" height="183" alt="CDC: Frequency of anaphylaxis after 1 dose of Pfizer" title="CDC: Frequency of anaphylaxis after 1 dose of Pfizer" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- _Compare anaphylactic shock risk in Pfizer or Moderna vaccines:_ The mRNA vaccines
  appear to be quite safe, especially with no apparent thrombosis risk.  There is,
  however, a slight risk of potentially lethal anaphylactic shock (basically an allergic
  reaction from Hell) within the first 15 minutes.  Is that any worse than the CSVT risk
  of JnJ?  The CDC's _Mortality and Morbidity Weekly Report_ (how's _that_ for a periodical
  title!) puts that risk at 21 cases in a sample of 1,893,360 first doses of 
  Pfizer. <sup id="fn7a">[[7]](#fn7)</sup>  __Conclusion:__ This is about 100x the risk of
  CSVT from JnJ.  
$$
\begin{align*}
  \Pr(\mathrm{anaphylaxis} | \mathrm{mRNA}) & = 21 / 1,893,360 \\
                                            &  = 1.1 \times 10^{-5}
\end{align*}
$$

- _Compare with the thrombosis risk in the AZ/OX vaccine:_  The _STAT News_ source <sup>[[3]](#fn3)</sup>
  says in the UK, EU, and 3 other countries there have been 222 thromboses (moslty younger
  women) seen in 34 million vaccinees.  Let's assume that's 222 observed in a fortnight of
  observation after vaccination, which is the only reasonable interpretation.
  __Conclusion:__ This is about 10x the risk with JnJ.  
$$
\begin{align*}
  d/dt \Pr(\mathrm{thromb} | \mathrm{vax}) & = (222/\mathrm{fortnight}) / 34 \times 10^{+6} \\
                                           & = 6.53 \times 10^{-6}/\mathrm{fortnight}
\end{align*}
$$


## Conclusion&hellip; for now  

It looks like the risks are in favor of using the JnJ vaccines.  Comparing the rate of
events in the 2 weeks post vaccination:
- You're 100x more likely to die of COVID than of a JnJ associated CSVT.  
- You're 100x more likely to get a general thrombosis than anything associated with JnJ.  
- You're at about the same risk of CSVT whether you take the JnJ vaccine or not.  
- You're 100x more likely to get blood clots from birth control pills than JnJ.  
- You're 100x more likely to get anaphylactic shock from mRNA vaccines than CSVT from JnJ.  
- You're about 10x more likely to get CSVT from AZ/OX than from JnJ.  

So overall, the risk of CSVT from the JnJ vaccine looks _less than_ the risks of other
reasonable behaviors, and _no worse than_ the general risk of CSVT anyway.  

__However:__ Those are the risks to the _general population_; if the identification of
younger women as a higher risk group for CSVT holds up (see ACIP meeting tomorrow!) then
it makes sense to pause _briefly_ and put in place 2 things:   

1. Direct patients experiencing severe headaches, difficulty breathing, or pain in
   legs or abdomen within 2 weeks of vaccination to go immediately to an ER; say what
   happened and mention the usual heparin therapy is _not_ a good idea.  
2. Direct younger women away from JnJ and toward either Pfizer or Moderna.  

The pause needs to be brief, because every day we force people to go unvaccinated, they're
exposed to risk of death or disability from COVID-19, and that risk is 100x the risk of
CSVT from the JnJ vaccine.  

We can't tell if that's _exactly_ what's happening now, but it does appear to be.  Or so
one may hope.  

__TBD:__ I really should add 95% confidence limits on the above probabilities, given how often
I've whined at other people for _not_ doing so!  The 100x differences in probability are
likely to be significant, but it's always good to be explicit about that.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->


<a id="fn1">1</a>: Z Miller, ["US recommends pausing Johnson & Johnson COVID-19 vaccine to investigate clotting reports"](https://www.bostonglobe.com/2021/04/13/nation/us-recommends-pause-single-dose-johnson-johnson-covid-19-vaccine-investigate-clotting-reports/), _Boston Globe_, 2021-Apr-13. [↩](#fn1a)  

<a id="fn2">2</a>: N Weiland, S LaFraniere, C Zimmer, ["U.S. Calls for Pause on Johnson & Johnson Vaccine After Clotting Cases"](https://www.nytimes.com/2021/04/13/us/politics/johnson-johnson-vaccine-blood-clots-fda-cdc.html), _New York Times_, 2021-Apr-13. [↩](#fn2a)  

<a id="fn3">3</a>: H Branswell, ["U.S. urges pause on use of Johnson & Johnson Covid-19 vaccine after rare blood clotting cases"](https://www.statnews.com/2021/04/13/u-s-urges-pause-on-use-of-johnson-johnson-covid-19-vaccine-after-rare-blood-clotting-cases/), _STAT News_, 2021-Apr-13. [↩](#fn3a)  

<a id="fn4">4</a>: P Marks (Director, CBER), ["Joint CDC and FDA Statement on Johnson & Johnson COVID-19 Vaccine"](https://www.fda.gov/news-events/press-announcements/joint-cdc-and-fda-statement-johnson-johnson-covid-19-vaccine), _US FDA Press Announcements_, 2021-Apr-13. [↩](#fn4a)  

<a id="fn5">5</a>: S Devasagayam, _et al.,_ ["Cerebral Venous Sinus Thrombosis Incidence Is Higher Than Previously Thought: A Retrospective Population-Based Study"](https://www.ahajournals.org/doi/10.1161/STROKEAHA.116.013617), _Stroke_, 47 (2016-Jul-19), 2180-2182.  DOI: [10.1161/STROKEAHA.116.013617](https://doi.org/10.1161/STROKEAHA.116.013617).[↩](#fn5a)  

<a id="fn6">6</a>: N Todd, ["Birth Control Methods and the Risk of Blood Clots"](https://www.webmd.com/sex/birth-control/birth-control-methods-blood-clot-risk), _WebMD_, 2020-Mar-03. [↩](#fn6a)  

<a id="fn7">7</a>: CDC COVID-19 Response Team, ["Allergic Reactions Including Anaphylaxis After Receipt of the First Dose of Pfizer-BioNTech COVID-19 Vaccine — United States, December 14–23, 2020"](https://www.cdc.gov/mmwr/volumes/70/wr/mm7002e1.htm), _CDC Morbidity and Mortality Weekly Report_, 2021-Jan-15. [↩](#fn7a)  
