---
layout: post
title: JnJ Revenant
tags: COVID MathInTheNews PharmaAndBiotech Politics
comments: true
commentsClosed: true
---

Today the Advisory Committee on Immunization Practices (ACIP) today recommended restoring
use of the JnJ COVID-19 vaccine with warnings, and thrombosis treatment guidelines for clinicians.
The CDC &amp; FDA agreed, and lifted the restrictions.  This seems to be very much the correct
conclusion, albeit one arrived at far too slowly.  


## The ACIP meeting  

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-stat.jpg" width="400" height="212" alt="STATNews: ACIP backs JnJ vaccine, with caveats" title="STATNews: ACIP backs JnJ vaccine, with caveats" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Today the full ACIP met, in a day-long series of talks presenting the risks and benefits
of the JnJ vaccine, and the reasonable policy choices that could be made.  Helen Branswell
of _STAT News_ comes through again with a pretty good summary 
piece: <sup id="fn1a">[[1]](#fn1)</sup>   

- The committee voted 10-4-1 in favor of lifting the restriction, with 1 abstention.  I'm
  curious about who abstained and why; I can understand disagreement somewhat, but not
  indifference.  
- Originally there were 6 cases of cerebral venous sinus thrombosis (CVST) with
  thrombocytopenia (low platelet count).  Now, after a data review, there are 15.  There
  are potentially almost 10 more cases that "might" be called in the next few days.  
- The identifying features are a thrombosis, typically in the brain, with a simultaneous
  low platelet count (thrombocytopenia).  This happens approximately never.  So an
  important diagnostic method: if you see a patient with a probable thrombosis and the
  blood work shows a low platelet count, then it might be one of these weird
  vaccine-associated thromboses.  
- That's important because these patients have antibodies to PF4-heparin.  PF4 is a
  protein associated with platelets, and heparin is the drug of choice to treat clots like
  this.  It makes heparin work _backward_ and cause more clots!  So clinicians have to
  know _not to use heparin_ when they see thrombosis with thrombocytopenia.  It's a good
  outcome that we know this now.  
- People are now worried this could be a _class effect_ of viral vector vaccines, since it
  was seen in both JnJ and AZ/OX.  
  - Of course the Russian Sputnik V vaccine is a viral vector vaccine too.  The Gamaleya
    Center, which developed it, denies there's any problem.  But the Russian data has been
    so thoroughly compromised we can't really make anything of that.  
  - The Chinese CanSino vaccine is also in this class.  CanSino denies any such effect,
    but did so in an announcement to the Hong Kong stock exchange, which is just a weird
    way to get medical news out.  

Let's do a little probability here.  Just about 6.8 million people have gotten the JnJ
vaccine.  We now have, worst case, 25 cases of CVST with thrombocytopenia.  So that's a
probability per unit time (2 weeks observation after vaccination) of:  
$$
\begin{align*}
  d/dt \Pr(\mathrm{thrombosis.death} | \mathrm{vax}) & = (25/\mathrm{fortnight}) / 6.8 \times 10^{+6} \\ 
                                                     & = 3.68 \times 10^{-6}/\mathrm{fortnight}
\end{align*}
$$

This is our updated baseline rate of CVSTs within 2 weeks of getting JnJ, assuming all of them are
associated with the vaccine.  As we discussed 
[before]({{ site.baseurl }}/jnj-thrombosis-pause/#some-risk-comparisons),
this is _notably less than_ numerous other risks, all extremely relevant to a
vaccine-eligible person (with the notable exception of CVST from other non-vaccine causes):  

- _COVID-19 death risk in US:_  
$$
\begin{align*}
  d/dt \Pr(\mathrm{covid.death} | \mathrm{no.vax}) & = (500,000/\mathrm{yr}) / (328 \times 10^{+6} \cdot 26 \mathrm{fortnight}/\mathrm{yr}) \\
                                                   & = 5.86 \times 10^{-5}/\mathrm{fortnight}
\end{align*}
$$

- _Thrombosis risk in general in the US:_  
$$
\begin{align*}
  d/dt \Pr(\mathrm{thrombosis}) & = (300,000/\mathrm{yr} - 600,000/\mathrm{yr}) / (328 \times 10^{+6} \cdot 26 \mathrm{fortnight}/\mathrm{yr}) \\
                                & = 3.52 \times 10^{-5} - 7.04 \times 10^{-5}/\mathrm{fortnight}
\end{align*}
$$

- _Specifically risk of CVST type thrombosis from other causes:_  
$$
\begin{align*}
  d/dt \Pr(\mathrm{CVST}) & = 15.7 \times 10^{-6}/\mathrm{yr} \cdot 1\mathrm{yr}/26 \mathrm{fortnights} \\
                          & = 6.04 \times 10^{-7}/\mathrm{fortnight}
\end{align*}
$$

- _Risk of blood clots from birth control pills:_  
$$
\begin{align*}
  d/dt \Pr(\mathrm{clot} | \mathrm{birthcontrol}) & = (0.003 - 0.01)/10 \mathrm{year} \cdot 1 \mathrm{year}/26 \mathrm{fortnights} \\
                                                  & = 1.15 \times 10^{-5} - 3.85 \times 10^{-5}/\mathrm{fortnight}
\end{align*}
$$

- _Anaphylactic shock risk in Pfizer or Moderna vaccines:_ 
$$
\begin{align*}
  \Pr(\mathrm{anaphylaxis} | \mathrm{mRNA}) & = 21 / 1,893,360 \\
                                            &  = 1.1 \times 10^{-5}
\end{align*}
$$

__Conclusion:__ Even if all these terrible CVST with thrombocytopenia cases are
attributed to the JnJ vaccine, _you're still saving lives compared to the other risks
patients face, especially COVID-19 itself_.  So resuming its use seems eminently
sensible.  


## A quick trawl through the slides presented to the ACIP  

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-slides.jpg" width="400" height="191" alt="ACIP: slides for talks about JnJ risk model and recommendations" title="ACIP: slides for talks about JnJ risk model and recommendations" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The ACIP put all the slides used in the discussion up for public view, along with a video
feed of the meeting. <sup id="fn2a">[[2]](#fn2)</sup>

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-tts.jpg" width="400" height="195" alt="ACIP: characteristics of JnJ patients with thromboses" title="ACIP: characteristics of JnJ patients with thromboses" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-mechanism.jpg" width="400" height="216" alt="ACIP: TTS mechanism similar to autoimmune heparin induced thrombocytopenia" title="ACIP: TTS mechanism similar to autoimmune heparin induced thrombocytopenia" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Some characteristics of the people who had the thromboses:
- They estimate a frequency of 1 case per 100,000 &ndash; 250,000 vaccinees.  This is
  either comparable with our result above (1/250,000) or about 4x larger (1/100,000).  I
  don't know why theh have a range like that; somebody may have been doing Bayesian
  posterior Beta function error bars and didn't report it?  That would be an interesting
  person to listen to!  
- 90% of victims are under 60, and the female/male ratio is about 2.5 to 1.  So mostly
  younger women.  
- They have PF4 antibody assays come back positive, so they all have some oddball
  antibodies running around messing with platelets and clotting.  That's nice to know,
  since it means we have some idea _how_ it works.  
- The mechanism looks startlingly similar to autoimmune heparin induced thrombocytopenia,
  right down to the PF4 antibodies.  
- __Major point:__ It's crucial for clinicians to treat these patients with non-heparin anti-clotting
  drugs.  

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-risk-groups.jpg" width="400" height="214" alt="ACIP: TTS risk rates broken down by age and sex" title="ACIP: TTS risk rates broken down by age and sex" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-time.jpg" width="400" height="234" alt="ACIP: TTS time of onset" title="ACIP: TTS time of onset" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The reporting rates broken down by age and sex really point the finger toward young women
being the at-risk group here.  The symptoms also seem to come on within 6-15 days, so the
monitoring period is fairly short.  

The speaker from JnJ did some similar risk comparisons to the ones we did above.  The risk
of TTS after their vaccine is about 1.9/million, using their numbers.  The mRNA vaccines
have about 1.2/million chance of anaphylaxis, the H1N1 flu vaccine might cause
Guillan-Barr&eacute; syndrom about 3.4/million, and so on.  So the risks are already
something that we find accceptable in other, similar medical situations.  They even did
the comparison with birth control pills that we did above!  (No, I don't think they read
this crummy little blog, but it would be funny if they did.)  

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-variants.jpg" width="400" height="219" alt="ACIP: variants in the US" title="ACIP: variants in the US" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-acip-benefits.jpg" width="400" height="449" alt="ACIP: COVID-19 benefits and TTS risks" title="ACIP: COVID-19 benefits and TTS risks" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The last speaker, Sara Oliver, had [the best presentation (well worth your time)](https://www.cdc.gov/vaccines/acip/meetings/downloads/slides-2021-04-23/06-COVID-Oliver-508.pdf).
They went on for a bit about their "Evidence to Recommendations framework",
which apparently is a semi-formal method for making policy recommendations based on the
evidence of adverse events.  Seems like a good thing to have, given that we want to
minimize overall risk from both thromboses and from COVID-19 itself.  

One risk for the US is that the variants from around the world are starting to show up in
the US.  This is a consequence that will keep coming back, until we get pretty much 
_the entire world's population_ vaccinated and suppress SARS-CoV-2.  A similar thing
happened in South Africa: within 8 weeks of its initial appearance, B.1.351 became almost
the only variant seen!  

They looked at case rates, hospitalization rates, and mortality rates broken down by age,
sex and race.  So it looks like they fairly thoroughly assessed the risks of _not_ getting
vaccinated along with the risks of TTS, which is the proper thing to have done.  

They looked at scenarios in which the mRNA vaccines continue, but the JnJ is either not
resumed, resumed only for age 50+ adults (with 50% of the former vaccination rate or 100% of the
former vaccination rate, or resumed for 18+ adults (with the same 2 subscenarios for
vaccination rates).  

They used a [compartmental model](https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology)
(presumably a modified SIR model) with strata for ages, essential workers, underlying
conditions.  It was fitted to data through the present.  The various scenarios in the
models told them the time to complete vaccination in the US, depending on which vaccines
are available and are administered at which rates (74 - 88 days).  

Generally speaking, these are just mathematical ways of trading off the risks (number of
vaccine-related TTS cases) vs benefits (prevention of COVID-19 cases, hospitalizations,
and deaths).  Though they regrettably didn't show any beautiful equations, I like the
thoroughness and clarity of the risk/benefit modeling.  

They also commendably addressed equity, noting that many hard-to-reach groups are really
only reachable with a single-shot vaccine and that JnJ is really our only option there.  

This presentation really reassured me that the risk/benefit assessment was well done.  


## The regulatory agencies' reaction  

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-globe.jpg" width="400" height="242" alt="Boston Globe: FDA, CDC lift restrictions on JnJ vaccine" title="Boston Globe: FDA, CDC lift restrictions on JnJ vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The FDA and the CDC are jointly responsible for the
pause.  They don't _have_ to listen to the ACIP recommendations, but they usually do.  Not
to do so here would be egregiously bad.  

So we were gratified to read in the venerable _Globe_ <sup id="fn3a">[[3]](#fn3)</sup>
that later in the evening the regulatory agencies did just that, ending the 11 day pause.
Women 18-49 are now to be advised of the thrombosis risk, and told to go to an ER if they
have them.  Emergency medicine folk have been told not to use heparin for thromboses if
the patient has recently been vaccinated, or has a low platelet count.  (I would have gone
for vectoring women 18-49 to an mRNA vaccine, but this one is still probably a very good
strategy.)   

<img src="{{ site.baseurl }}/images/2021-04-23-jnj-revenant-wapo.jpg" width="400" height="146" alt="Washington Post: JnJ manufacturing woes at Emergent plant" title="Washington Post: JnJ manufacturing woes at Emergent plant" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
So that all looks pretty good.  Now if only JnJ can get their manufacturing act
straightened out&hellip;  <sup id="fn4a">[[4]](#fn4)</sup> because 
[as Abba Eban remarked on another subject](https://en.wikiquote.org/wiki/Abba_Eban), 
we "never miss an opportunity to miss an opportunity" to do things right with COVID-19
vaccines.  (Though that's good snark, it's slightly too pessimistic here.  We did _amazingly well_
at making vaccines with unheard-of-efficacy at record speed, in spite of the US lacking a
functional federal government at the time, so it was an international effort.  The
distribution, though, has been more problematic.)  


## The weekend assessment  

This seems like more or less the correct decision: the vaccine benefits outweigh the
risks, so we save more lives by using it.  Adding a warning for women 18-49 about symptoms
of thrombosis is entirely appropriate, or even steering them to an mRNA vaccine, if
available.  Warning clinicians _not to use heparin_, the therapy of choice for thrombosis,
if the patient was recently JnJ vaccinated or shows thrombocytopenia, will save more lives
as well.  

The bug in the salad here, though, was _speed_: it took way to long to reach this conclusion.
One could have looked at the frequency of thromboses last week and concluded more or less
the same thing, adding the instructions about heparin as they were discovered.  We lost a
week of potential vaccinations, and stimulated still more supertitious fear among the ignorant.  

Self inflicted wounds are the slowest to heal.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: H Branswell, ["CDC advisory panel backs J&J’s Covid-19 vaccine, clearing way for pause to be lifted"](https://www.statnews.com/2021/04/23/cdc-advisory-panel-backs-jjs-covid-19-vaccine-clearing-way-for-pause-to-be-lifted/), [_STAT News_](https://www.statnews.com), 2021-Apr-23. [↩](#fn1a)  

<a id="fn2">2</a>: J Romero, A Cohn, B Bell, M Streiff, T Shimabukuro, G Lee, &amp; S Oliver, ["ACIP Presentation Slides: April 23, 2021 Meeting"](https://www.cdc.gov/vaccines/acip/meetings/slides-2021-04-23.html), Advisory Committee on Immunization Practices, 2021-Apr-23.  The meeting agenda is [here](https://www.cdc.gov/vaccines/acip/meetings/downloads/agenda-archive/agenda-2021-04-23-508.pdf).  There was also a video livestream [here](https://www.ustream.tv/channel/VWBXKBR8af4), but it seems to be gone as of the evening of the 23rd.  They tend to show up eventually on [the CDC's YouTube channel](https://www.youtube.com/c/CDC/videos), though.[↩](#fn2a)  

<a id="fn3">3</a>: L Neergaard &amp; M Stobbe, ["Health officials lift pause on Johnson & Johnson vaccine following panel recommendation"](https://www.bostonglobe.com/2021/04/23/nation/federal-health-panel-reviews-johnson-johnson-vaccine-pause-over-rare-clots/?event=event12), _Boston Globe_, 2021-Apr-23. [↩](#fn3a)  

<a id="fn4">4</a>: C Rowland, ["Johnson & Johnson suffers another setback as FDA tells Md. vaccine maker to suspend production"](https://www.washingtonpost.com/business/2021/04/19/johnson-johnson-covid-vaccine-emergent/), _Washington Post_, 2021-Apr-19.[↩](#fn4a)  
