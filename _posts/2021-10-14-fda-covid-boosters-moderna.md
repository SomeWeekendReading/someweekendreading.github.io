---
layout: post
title: FDA Considers COVID-19 Boosters for Moderna Spikevax
tags: COVID Math MathInTheNews PharmaAndBiotech SomebodyAskedMe Statistics
comments: true
---

__UNFINISHED DRAFT:__ Today the FDA's Vaccines and Related Biological Products Advisory
Committee meets to review the Moderna application for 3rd dose boosters of their COVID-19
vaccine, Spikevax.  Wonderful name aside, there should be a good case to be made as well.  


## What's the Sitch?  

If you read this blog, you know we're in favor of vaccination here at Chez Weekend.  We're
also in favor of boosters: your humble Weekend Editor got his the first day they were
available, and the Weekend Editrix will get hers later this month.  

But then, we got the Pfizer vaccine, yclept "Comirnaty".  It was pure chance.  What about
the folks who got Moderna, which was both higher in dose and better spaced out first 2
shots?  That's what the FDA VRBPAC will meet about today.  

They'll make a (non-binding, but usually followed) recommendation to the FDA, which will
then make a ruling.  Then (presumably; I haven't checked) the CDC's ACIP will meet and
make a (non-binding, but usually followed) recommendation to the CDC, which will then make
a ruling.  Absent any failure in that process, Spikevax boosters will be good to go.  

(Tomorrow the FDA VRBPAC is meeting on both the J&amp;J booster application and
mix-and-match vaccinations with all possible vaccines in all possible orders.)  

__Prediction:__ They'll probably recommend doing approximately, or even exactly, the same
thing as the Pfizer booster decision.  


## The Data Sources  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-stat.jpg" width="400" height="223" alt="STAT: Tracking FDA advisory panel on Moderna booster" title = "STAT: Tracking FDA advisory panel on Moderna booster" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Today, as previously, we will be guided by "the old reliables", Helen Branswell and
Matthew Herper who are live-blogging it at _STAT News_. <sup id="fn1a">[[1]](#fn1)</sup>
We'll be reading their running commentary and going through the slide presentations to
pick out the particularly interesting bits.

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-1.jpg" width="400" height="236" alt="FDA VRBPAC Meeting Announcement" title = "FDA VRBPAC Meeting Announcement" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<iframe width="400" height="224" src="https://www.youtube.com/embed/BhlshZ7Lkr0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
The primary source material is provided on the FDA web page for this 
meeting. <sup id="fn2a">[[2]](#fn2)</sup>  Everything else we're presenting here today
comes either from _STAT News_ or directly from the FDA documents, the former serving as a
guide to where to read in the roughly 500 pages of the latter.  

The whole thing is being livestreamed on a couple of video platforms, notably YouTube,
which we've embedded here.  I find that watching these things minute-by-minute is either
skull-breakingly boring, or absolutely terrifying if it's your drug under discussion.  So
I'm going to go through the materials separately, letting Helen &amp; Matt direct my
attention.  They've earned that respect from me.  


## The Agenda  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-2.jpg" width="400" height="93" alt="FDA/CBER Agenda for VRBPAC on Moderna Boosters" title = "FDA/CBER Agenda for VRBPAC on Moderna Boosters" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Of course there's an agenda. <sup id="fn3a">[[3]](#fn3)</sup> Important meetings full of
strongly opinionated participatns often possessed of ego who each think they are in
charge&hellip; well, let's just say things go better with a set agenda.  

This agenda is more or less what you'd exepct:  
- The usual welcome and call to order.  
- Then the big cheeses give some introductory and background materials.  
- Then the Israeli data on vaccine efficacy waning again, just like for Pfizer, but now
  with data that's had a few more weeks to mature.  I wonder if it will be more clear now?  
- Then the Moderna presentation and the FDA presentation on boosters.  That's how this
  works: when you submit to the FDA, they throw away your conclusions and dig into your
  data using the trial's specified analysis procedure.  Then they write up their own
  results, and both of you present.  If there are discrepancies, that's where trouble
  starts.  Serious discrepancies get you a warning letter and you never get to the
  committee meeting in the first place, so probably there are only minor discrepancies to
  be found here.  
- Then the usually dreary open public hearings.  Last time we heard from a Trump
  whackaloon who accused scientists of "sedition".  I wonder what wingnuttery will its
  face this time?  
- Then there's some Q&amp;A and discussion.  The topic the big kahunas at the FDA want to
  see discussed is pre-defined.  I like how they expressly ruled out discussion of people
  under 18, since _twice now_ (for the original Pfizer EUA and Pfizer booster) Pfizer has
  nearly fouled up the whole thing by digging down to age 16, for which their studies were
  completely inadequately powered (or in the case of the booster, _no subjects at all!_)
  So there'll be no more of that: <sup id="fn4a">[[4]](#fn4)</sup>  
> 10/14 Discussion Question:  
>  
> Question 1) Considering the information presented today and at the meeting of the VRBPAC
> on September 17, 2021, including updated information on effectiveness of mRNA COVID-19
> vaccines, please discuss whether available data support use of a mRNA COVID-19 vaccine
> (Pfizer-BioNTech or Moderna) booster dose administered at least 6 months after completion
> of the same mRNA COVID-19 vaccine primary series in the general population of adults in an
> age group less than 65 years.  
>  
> • For the purposes of this question, age groups below 18 years should not be considered  
- Then finally it's time to vote.  The question is very explicit, and suggests a booster
  at half the original dose (which may have been a bit too high, by some opinions?).  It
  also calls out the same groups for boosting as were approved for Pfizer, so at least we
  won't get the complexity of the 2 mRNA vaccines boosting different 
  populations: <sup id="fn5a">[[5]](#fn5)</sup>  
> 10/14 Voting Question:  
>  
> Question 1) Do available data support the safety and effectiveness of Moderna COVID-19
> Vaccine for use under EUA as a booster dose (50 mcg mRNA-1273) at least 6 months after
> completion of a primary series in the following populations:  
>  
> • Individuals 65 years of age and older,  
> • Individuals 18 through 64 years of age at high risk of severe COVID-19, and  
> • Individuals 18 through 64 years of age whose frequent institutional or occupational exposure to SARS-CoV-2 puts them at high risk of serious complications of COVID-19 including severe COVID-19.  

So, yeah: about what you'd expect.  


## Opening Remarks  

First up is Peter Marks, Director of CBER, who introduced the general background
information.  Nothing terribly new, here:  
- Expressions of thanks to the staff.
- Stuff like the fact that COVID-19 spans a spectrum from asymptomatic infection, to symptomatic,
  to hospitalization, to ventilation, to death.  
- Also, there's some evidence of the 2-shot protocol's vaccine efficacy waning over time
  (though with complicating factors, as always).  
- Delta is _bad._  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-marks-1.jpg" width="400" height="226" alt="Tartof et al., Lancet: Infection VE wanes but hospitalization VE is robust" title = "Tartof et al., Lancet: Infection VE wanes but hospitalization VE is robust" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
However, vaccine efficacy is still high against serious disease and hospitalization.  I'm
glad he showed this: while it's nice to avoid any infection whatsoever, it's perfectly
acceptable to get briefly, mildly infected, and then clear the infection quickly with no
hospitalization.  That's a disease you can _ignore._  (BTW: I couldn't find the slide deck
Marks is using on the VRBPAC meeting web site, so this is a partial screen capture from
the YouTube livestream.  He showed similar resuts for Pfizer and J&amp;J.)  

Ok, got that; just a rehash of what we've known for a while.  Still, I suppose it's nice
to get everybody on the same page.

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-agnihothram-1.jpg" width="400" height="225" alt="Agnihothram: Background for Moderna booster EUA application" title = "Agnihothram: Background for Moderna booster EUA application" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Next was a presentation from Sudhakar Agnihothram, of hte Office of Vaccines Research and
Review at CBER &amp; FDA. <sup id="fn6a">[[6]](#fn6)</sup>  Honestly, not much new here
either: and that's a good thing, it says everybody's on the same page.  
- This is the first place in the meeting though, where it's officially said the original
  Moderna doses were 100&mu;g but the booster will be half that at 50&mu;g.  
- There were 171 clinical trial participants for the booster (compared with roughly 27,000
  in the original clinical trial).  So there's some emphasis an small and fast to get this
  done, the major safety tests having already been performed.  
- Waning or not, Delta is one of the booster rationales.  
- People worry that waning neutralizing antibody titers herald a future waning of VE
  against hospitalization &amp; death, so everybody wants to get out in front of that.  

&hellip;More TBD&hellip;

<!-- *** Conclusion: Next step should be full approval? -->

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title = "***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: H Branswell &amp; M Herper, ["Tracking the FDA advisory panel meeting on Moderna’s Covid vaccine booster"](https://www.statnews.com/2021/10/14/fda-advisory-panel-meeting-moderna-covid-vaccine-booster/), _STAT News_, 2021-Oct-14. [↩](#fn1a)  

<a id="fn2">2</a>: FDA Staff, ["Vaccines and Related Biological Products Advisory Committee October 14-15, 2021 Meeting Announcement"](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), FDA VRBPAC 2021-Oct-14 Materials, retrieved 2021-Oct-14. [↩](#fn2a)  

<a id="fn3">3</a>: FDA Staff, ["169th Meeting of the Vaccines and Related Biological Products Advisory Committee October 14-15, 2021 DRAFT AGENDA"](https://www.fda.gov/media/152949/download), FDA VRBPAC 2021-Oct-14 Materials, retrieved 2021-Oct-14. [↩](#fn3a)  

<a id="fn4">4</a>: FDA Staff, ["10/14 Discussion Question"](https://www.fda.gov/media/153091/download), FDA VRBPAC 2021-Oct-14 Materials, retrieved 2021-Oct-14. [↩](#fn4a)  

<a id="fn5">5</a>: FDA Staff, ["10/14 Voting Question"](https://www.fda.gov/media/153092/download), FDA VRBPAC 2021-Oct-14 Materials, retrieved 2021-Oct-14. [↩](#fn5a)  

<a id="fn6">6</a>: S Agnihotram, ["Moderna COVID-19 Vaccine Application for Emergency Use Authorization of a booster dose"](https://www.fda.gov/media/153088/download), FDA VRBPAC 2021-Oct-14 Materials, retrieved 2021-Oct-14. [↩](#fn6a)  
