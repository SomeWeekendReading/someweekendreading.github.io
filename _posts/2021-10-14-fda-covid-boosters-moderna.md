---
layout: post
title: FDA Considers COVID-19 Boosters for Moderna Spikevax
tags: COVID Math MathInTheNews PharmaAndBiotech SomebodyAskedMe Statistics
comments: true
---

Today the FDA's Vaccines and Related Biological Products Advisory
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
  whackaloon who accused scientists of "sedition".  I wonder what wingnuttery will show its
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
hospitalization.  That's a disease you can _ignore._  (He showed similar resuts for Pfizer
and J&amp;J.  BTW: I couldn't find the slide deck Marks is showing here on the VRBPAC
meeting web site, so this is a partial screen capture from the YouTube livestream.  Later:
found 'em; looks like he uploaded them the next day. <sup id="fn13a">[[13]](#fn13)</sup>
The screen capture shown here is slide 5.)  

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

There was one sort of interesting question, as pointed out by Helen Branswell: given the
proposed booster dose is half the original dose, should people classified as
immunocompromised get a third full dose or half dose?  Life is complicated, and it's hard
to cover all the possibilities without getting confused.  Opinion seemed to be, e.g., from
Agnihothram, that the simple answer was the immunocompromised get a full third dose.
_Maybe_ they'd in the future get a 4th half-dose.  But then Marks jumped in and said that
was far in the future, and he didn't want the FDA to make a definitive statement now,
though the committee could discuss it later in the discussion section.  


## The Israeli Case for Boosters  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-1.jpg" width="400" height="223" alt="Israeli MoH: Case for boosters for waning vaccine efficacy" title = "Israeli MoH: Case for boosters for waning vaccine efficacy" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Next was a presentation of the evidence for waning vaccine efficacy and the good effect of
boosters from Israel, by Sharon Alroy-Preis and Ron Milo <sup id="fn7a">[[7]](#fn7)</sup>,
who are between them affiliated with basically all the great Israeli research
institutions.  This is the same pair who presented at the 
[Pfizer booster hearing]({{ site.baseurl }}/fda-covid-boosters/#is-vaccine-efficacy-really-waning),
and today we'll see an update on their data.  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-2.jpg" width="400" height="225" alt="Israeli MoH: Booster rates stratified by age" title="Israeli MoH: Booster rates stratified by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-3.jpg" width="400" height="226" alt="Israeli MoH: Boosters at the hinge in death rates" title="Israeli MoH: Boosters at the hinge in death rates" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I was immediately impressed by 2 very convincing bits at the start (which is probably
_why_ they put them at the start):  
1. The Israelis have been _aggressive_ about rolling out boosters, starting with the
   elders and working their way downward in age.  The graphs of percent boosted vs time,
   stratified by age, are just _impressive._  You can say a lot of things about their
   booster policy, but "hesitant" is not one of them.  They went to, with a will.  
2. And it made a difference.  Look at the PCR-confirmed case rates vs time, for
   those over 60 who got boosted, compared with those under 60 who had not (yet).  The
   curves are indistinguishable until 2 weeks after boost, when the boosted case rates
   took a _dramatic_ decline.  
   
They showed similar results (which I won't reproduce here, but are in the slides) for a
decrease in positive test rates and decrease in serious disease.  These data cover 
_most of the Israeli population over age 16_ (4.6 million subjects).  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-4.jpg" width="400" height="224" alt="Israeli MoH: Post-booster confirmed infection rates, stratified by age" title="Israeli MoH: Post-booster confirmed infection rates, stratified by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-5.jpg" width="400" height="224" alt="Israeli MoH: Post-booster severe disease rates, stratified by age" title="Israeli MoH: Post-booster severe disease rates, stratified by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-6.jpg" width="400" height="226" alt="Israeli MoH: Post-booster death rates for 60+ (too few deaths below 60)" title="Israeli MoH: Post-booster death rates for 60+ (too few deaths below 60)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Three more slides cover age-stratified results for infection, severe infection, and
death.  At least 2 things are worth learning here:  
1. Boosters aren't just about lowering the generally medically trivial asymptomatic
   infections.  They _also_ lower severe infection and the associated hospitalization, and
   the lower death rates.  It's the latter part we really care about: keeping people out
   of the hospital and out of the grave.  For each of those variables, they show us the
   time course graphically, but then objectively report the risk ratio _and the 95% CI_,
   so we can be sure of it.  The risk ratios typically show a 10-fold reduction or more.
   This is well done.  
2. They've age-stratified everything.  Say what you will, these guys have learned the 
   lesson of [Simpson's paradox]({{ site.baseurl }}/covid-simpson/)!  Sure, it's
   theoretically nice when people don't make mistakes; but it's _delightful_ when people
   _learn_ from mistakes and do better.  These guys are _good_.  

The adverse event reporting was pretty good news, too.  It looks like the adverse event
rate is similar to, or even _better than_, the first two doses.  That may be because your
immune system is starting to get the joke by the time of the third dose, and the third
dose is half the size anyway.  Perhaps this will trigger some investigation as to whether
the initial dosing was a bit too high?

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-7.jpg" width="400" height="226" alt="Israeli MoH: Rates of adverse events by category and age cohort" title="Israeli MoH: Rates of adverse events by category and age cohort" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-israel-8.jpg" width="400" height="224" alt="Israeli MoH: Myocarditis and pericarditis rates by age and dose" title="Israeli MoH: Myocarditis and pericarditis rates by age and dose" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The first slide shown here shows the rate of adverse events, broken out by (a) category
(systemic, local, neurological, allergic, &hellip;), (b) by age, and (c) by 1st/2nd/3rd
dose.  Just looking at the heights of the bars shows that the general level of side
effects was medium for dose 1, higher for dose 2, and much lower for dose 3.  That is: if
you accept the safety of doses 1 and 2, then you must also accept the safety of dose 3.

The second slide shown here summarizes the results for myocarditis and pericarditis in
particular.  At the time of the Pfizer booster hearing, they hadn't collected enough data
for young men to be of much use.  However, due to the lightning speed of their booster
campaign, they now _do_ have enough data.  

These data are encouraging: there were 17 myocarditis/pericarditis events out of 3.7
million vaccinees, of which 11 were in males under 30 ($N$ = 369,195).  That gives us a
probability of myocarditis/pericarditis in young males of about 3 chances in 100,000:  

$$
\Pr(\mbox{myocarditis/pericarditis}|\mbox{male under 30}) = \frac{11}{369195} = 2.98 \times 10^{-5}
$$

(No idea why nobody wanted to do that particular calculation, but here at Chez Weekend we
have no such inhibitions.  Sure, we could calculate a 95% confidence interval on this with
a posterior Beta distribution.  But that wouldn't change the result that it's _small_.)  

It's impressive: only a country with a truly integrated EMR system and universal health
care could have done this.  America can't even _approach_ this, with our fragmented health
care system.  

We come in with 3 questions about boosters:  
1. Are boosters _needed?_  
2. Do boosters _work?_  
3. Are boosters _safe?_  

For the first question, I was on the fence the last time about need, thinking that the
case for waning was weak and doses might be better spent on the as-yet-unvaccinated,
domestically and globally.  While I still think that, it seems that they've eliminated a
lot of the confounders and shown that there indeed was some waning, even for serious
disease.  COVID-19 may join the ranks of other vaccines that also require 3 doses (HPV,
HepA, HepB, DTaP, Hib, PCV13, IPV, &hellip;).  

After reading their data, my answer to the first question is now "yeah, probably".  

For the remaining 2 questions, they've clearly nailed the answer, and it is "yes".  


## The Moderna presentation  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-1.jpg" width="400" height="297" alt="Moderna: VRBPAC briefing document" title="Moderna: VRBPAC briefing document" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-2.jpg" width="400" height="132" alt="Moderna: Errata for VRBPAC briefing document" title="Moderna: Errata for VRBPAC briefing document" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-3.jpg" width="400" height="223" alt="Moderna: Slides for VRBPAC presentation" title="Moderna: Slides for VRBPAC presentation" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
There are 3 primary documents here: the Moderna briefing document (66 pages) and its
errata/supplement (3 pages) <sup id="fn8a">[[8]](#fn8)</sup>, and the Moderna slide 
deck (49 slides). <sup id="fn9a">[[9]](#fn9)</sup>  

Apparently the main point of the sightly unusual errata document was to put 1 more line in
a table, and to report a single, late-breaking adverse event.  The event was renal failure
due to rhabdomyolosis (basically muscle damage) consequent to a fall.  It was ruled
unrelated to the vaccine, but of course is reported anyway, as is good practice.  

Here we're going to concentrate on the slides, because it's just too much for me to go
through the briefing document as well.  But hey, you can go to the references and knock
yourself out, if that's your thing.  

Also, we won't trudge through their safety data, since it's largely comparable to the
Israeli safety data for Pfizer, reported above.  Basically, there were no SAEs reported
(though one came up after the report, though it was judged unrelated).  Also, the FDA
presentations (_q.v._) will have some data on myocarditis/pericarditis.  So the safety
case is quite good.  

I'd rather hear about efficacy, particularly with Delta.  There are 4 slides in particular
from the Moderna presentation that bear on this in ways that look interesting to me for
that reason:  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-4.jpg"
width="400" height="225" alt="Moderna: Original vaccine 98.2% efficacy vs severe disease
at 5.3 months followup" title="Moderna: Original vaccine 98.2% efficacy vs severe disease
at a median of 5.3 months followup" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Slide 12 is a follow-up on efficacy from the original clinical trial of 2 doses.  
- It shows the familiar Kaplan-Meier curve for infections in placebo vs vaccine arm, this
  time amended with a plateau as the infections saturate the placebo arm.  
- The significant result is: 98.2% efficacy against severe COVID-19 at 5.3 months of
  followup after the second dose.  This is still _excellent_ news, even if waning against
  infection has started.  
- Still&hellip; one might wonder: does this include very many months of exposure to
  Delta, and if not, would that change anything?  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-5.jpg" width="400" height="223" alt="Moderna: Original vaccine marginal vs Delta at 2 doses, effective at 3 doses" title="Moderna: Original vaccine marginal vs Delta at 2 doses, effective at 3 doses" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
That question of the relation with the rise of Delta is addressed in slide 14.  It shows
antibody titers against various variants, by time after the 2nd dose, and again after
the 3rd dose.  (It only shows Delta after the 3rd dose, since it hadn't shown up early
enough for the first 2 doses.)
- Note the neutralizing abs on the vertical axis are on a log scale, so these changes
  are huge.  
- Antibodies vs WT, Beta, and Gamma are high after dose 1.
- But 6-8 months after dose 2, they are still high against WT, but marginal against Beta,
  Gamma, and most importantly Delta.  
- However, 2 weeks after the dose 3 booster, they are high again for all variants,
  including Delta.  
- So the booster restores antibody levels against classic variants, and adds in Delta.
  (It remains to be seen if antibody levels are what we should be measuring, instead of
  things like properties of memory B cells or T cells.)  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-6.jpg" width="400" height="224" alt="Moderna: Breakthrough infections start Jul/Aug, with Delta" title="Moderna: Breakthrough infections start Jul/Aug, with Delta" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Delta is a vexing question: it comes upon the scene in July and August, just when we
_also_ decide vaccine efficacy might be waning.  Is it waning, or is it seeing Delta?
- Slide 16 addresses this, showing the increase in breakthrough cases is back-end
  loaded, i.e., in July and August when Delta showed up.  
- This makes me believe that immunity to Delta is the only important thing here.
  Fortunately, the data on slide 14 shows a 3rd dose confers high antibodies to Delta,
  which we _hope_ will translate into teaching memory B-cells and activated T-cells how
  to generate long-term immunity (you'll still get briefly infected, but antibodies will
  be ramped up quickly).

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-moderna-7.jpg" width="400" height="224" alt="Moderna: Breakthrough infections start Jul/Aug, with Delta" title="Moderna: Breakthrough infections start Jul/Aug, with Delta" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Finally, slide 41 hits this point pretty hard, again.  They show geometric mean titers
of neutralizing antibodies against Delta, _stratified by age_.  (Hey, they seem to have
learned about Simpson's paradox, too.  Lotta that goin' around these days.  Good thing,
too.)  
- Again, note the vertical axis is on a log scale, so these are large differences.  
- In a very hopeful sign, the ID50 levels for 18-64, &ge;65, and overall are pretty much
  the same, 28 days after boost.  I like the fact that the booster has overcome any
  confounding age effect.  At least, at 28 days out &mdash; nobody knows about
  durability across age cohorts.  
- Your humble Weekend Editor notes with some personal interest that he was boosted 17
  days ago.  So 11 days to go.  

So here we are:  
- Boosters are safe, as shown in the Israeli data and in the FDA data below.  
- Boosters are effective against a spectrum of viral variants.  (Though durability is unknown.)  
- Boosters are needed, in the sense of limited efficacy vs Delta 6 months after the first
  2 doses, and impressive immunity against Delta after the boost.  Delta is a _problem._
  Boosters work the problem.  


## The FDA presentations  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-3.jpg" width="400" height="55" alt="FDA: VRBPAC briefing document" title="FDA: VRBPAC briefing document" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-4.jpg" width="400" height="222" alt="FDA: VRBPAC slide deck 1" title="FDA: VRBPAC slide deck 1" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-5.jpg" width="400" height="226" alt="FDA: VRBPAC slide deck 2" title="FDA: VRBPAC slide deck 2" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
There are 3 primary sources here: the 45 page FDA briefing 
document <sup id="fn10a">[[10]](#fn10)</sup>, a slide deck of 31 slides which discusses
immunogenicity and broad safety outcomes <sup id="fn11a">[[11]](#fn11)</sup>, and another
slide deck of 19 slides which specifically examines safety with regard to myocarditis and
pericarditis <sup id="fn12a">[[12]](#fn12)</sup>.  

As with the Moderna presentation, we'll concentrate on the slides since they are the
things for which we can observe discussion in the video, if needed.  But the briefing
document is there for any completists among us.  

### Immunogenicity and General Safety  

The first slide deck has a _lot_ more detail on the study design, how it dovetails with
the original clinical triall, censorship events, and so on.  It kind of surprised me that
Moderna concentrated on the results and left this part to the FDA.

The success criterion is based on looking at the geometric mean titers of antibodies after
dose 2 and after dose 3.  They calculate a ratio and its 95% confidence limits, using
ANCOVA to clean up the dose 2 estimates of antibody levels and adjusting for age groups
(because, hey, Simpson's paradox).  Success is declared when the ratio met 2 criteria:
central estimate &ge; 1 and lower confidence limit &ge; 0.67.  

They also did some analysis for sensitivity to Delta by comparing those who completed the
study early (pre-Delta) vs those who completed it late (post-Delta).  

They reported the usual reactogenic events (fever, fatigue, headache, &hellip;) in
about the usual proportions.  

There were no SAEs before the time cutoff, and 5 after the cutoff (none deemed vaccine
related).  There were a few AEs, most of which were also unrelated and the related ones
were slightly more serious headache and fatigue.  

Final results (slide 29):  
- Success against the D614G variant was seen in antibody levels, though not with the more
  complex seroresponse measurements.  
- Post-hoc, subjects who had weak response to the first 2 doses were more likely to achive
  the threshold &ge; 4 fold rise in neutralizing abs.  
- The Delta data was too sketchy since Delta emerged late in the trial.  
- No evidence of any worse safety profile than the first 2 doses.  

### Specific Safety from Myocarditis/Pericarditis  

From the FDA fact sheet for Moderna:  
- Myocarditis &amp; pericarditis most often occur within 7 days, particularly after the
  2nd dose.  
- The observed risk is highest in males 18-24 years of age.  
- It generally resolves quickly under conservative treatment.  
- Whether there are long-term sequelae is not yet known.  

Ok, so something to worry about, but at least we (a) know the risk is mostly for younger
males, and (b) they tend to recover relatively quickly.  Still, we don't know if there are
long-term consequences for this particular myocarditis &amp; pericarditis.  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-6.jpg" width="400" height="224" alt="FDA: BEST system mRNA COVID-19 vax data reporting by data partner and maker" title="FDA: BEST system mRNA COVID-19 vax data reporting by data partner and maker" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-7.jpg" width="400" height="224" alt="FDA: Myocarditis/pericarditis per million person-days, by age" title="FDA: Myocarditis/pericarditis per million person-days, by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The FDA does active safety surveillance of biologics at FDA/CBER in what's called the BEST
system, which stands for Biologics Effectiveness and Safety with a T at the end for no
obvious reason.  Yeah, I'd probably call it "BEST" too, but I'd at least have an excuse
for putting the T in there.  

As you can see, they've recorded _stupendous_ quantities of data from a variety of data
partners.  It looks like about 13 million for Pfizer and 9 million for Moderna.  So
they're statistically powered to hunt bears.  

Slide 11 shows the incidence of myocarditis/pericarditis per million person-days, broken
out by age groups (and, somewhat uselessly, FDA data provider).  The bars in the plot are
at very thin stroke weights, so you may have to click through to the original to see
clearly.  
- The rate in men age 18-25 looks to be about 5 events/million person-days with a 95%
  confidence interval of about 1 &ndash; 10 events/million person-days.  
- The background rate in every other age group and for women appears to be around 
  2 events/million person-days, with 95% CI of 0 &ndash; 5 events/million person-days.  

So&hellip; still pretty rare, but definitely slightly less rare in young men.  As we
thought, all along.  

<img src="{{ site.baseurl }}/images/2021-10-14-fda-covid-boosters-moderna-fda-8.jpg" width="400" height="285" alt="FDA: Pfizer vs Moderna myocarditis/pericarditis risk ratio in males 18-24" title="FDA: Pfizer vs Moderna myocarditis/pericarditis risk ratio in males 18-24" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
They also, with admirable skepticism, compared the risk ratio for myocarditis/pericarditis
in males 18-25 between Pfizer and Moderna.  Shown here on a log scale, the risk ratio
hovers around 1.  Data partner 4 was an outlier for unknown reasons, but when all data
were combined in meta-analysis, the bottom bar was obtained: still around 1, with the 95%
confidence intervals bracketing 1.  

The conclusion is that, modulo data partner 4 and even with that if you combine all data
partners, Pfizer and Moderna are indistinguishable in myocarditis/pericarditis risk for
males 18-24.  

This is good news for Moderna, since Pfizer was approved (for boosters and indeed full
approval) at this risk level, so there's no need to hold back Moderna.  


## The Vote  

The vote came at 3:15pm: a unanimous 19 Yes, 0 No, and 0 Abstain.  Nice to see broad
agreement.  So now the Pfizer and Moderna booster authorizations are the same.  

However, from the tone of the discussion, it appears there is no appetite for universal
boosters, as in Israel.  That will apparently take some _more_ evidence to move people.  


## The Weekend Conclusion  

It looks a third mRNA booster shot is safe &amp; effective based on the Moderna/FDA data,
and now probably necessary based on the Israeli MoH data.  So approval made perfect
sense.  

### A "Chilling Postscript"  

There was one "chilling postscritpt", as Helen Branswell put it.  A question was asked
both of the Israeli presenters (questioner unknown) and again at the end by panelist
Michael Kurilla: is this just a temporary bump in antibody levels that will fade in 6
months indicating bi-yearly boosters, or is this the awakening of permanent immunity like
the other 3-dose vaccines?  

The answer is unknown, but important.  We'd like to know, if durability is limited, whether
that's a property of coronaviruses, or of mRNA vaccines, or &hellip; _something._

### Next Steps  

1. The FDA has to decide what official action to take based on the VRBPAC result.
   Approval of boosters is expected, but not guaranteed.  
2. Next week, the CDC's ACIP committee will meet to decide what practice recommendation to
   make for US physicians.  
3. Moderna has yet to be fully approved, so that should happen since Pfizer seems nearly
   identical in mechanism, safety, and efficacy.  

We'll see!  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: H Branswell &amp; M Herper, ["Tracking the FDA advisory panel meeting on Moderna's Covid vaccine booster"](https://www.statnews.com/2021/10/14/fda-advisory-panel-meeting-moderna-covid-vaccine-booster/), _STAT News_, 2021-Oct-14. [↩](#fn1a)  

<a id="fn2">2</a>: FDA Staff, ["Vaccines and Related Biological Products Advisory Committee October 14-15, 2021 Meeting Announcement"](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), FDA VRBPAC 2021-Oct-14 Materials, retrieved 2021-Oct-14. [↩](#fn2a)  

<a id="fn3">3</a>: FDA Staff, ["169th Meeting of the Vaccines and Related Biological Products Advisory Committee October 14-15, 2021 DRAFT AGENDA"](https://www.fda.gov/media/152949/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn3a)  

<a id="fn4">4</a>: FDA Staff, ["10/14 Discussion Question"](https://www.fda.gov/media/153091/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn4a)  

<a id="fn5">5</a>: FDA Staff, ["10/14 Voting Question"](https://www.fda.gov/media/153092/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn5a)  

<a id="fn6">6</a>: S Agnihotram, ["Moderna COVID-19 Vaccine Application for Emergency Use Authorization of a booster dose"](https://www.fda.gov/media/153088/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn6a)  

<a id="fn7">7</a>: S Alroy-Preis &amp; R Milo, ["Booster protection across ages &ndash; data from Israel"](https://www.fda.gov/media/153086/download), Israeli Ministry of Health, Weizmann Institute, Technion, Gertner Institute, and Hebrew University slides for VRBPAC 2021-Oct-14 meeting, 2021-Oct-14. [↩](#fn7a)  

<a id="fn8">8</a>: ModernaTX, ["mRNA-1273 BOOSTER DOSE SPONSOR BRIEFING DOCUMENT VACCINES AND RELATED BIOLOGICAL PRODUCTS ADVISORY COMMITTEE"](https://www.fda.gov/media/152953/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14.  __NB:__ There was also an errata document supplied, which basically adds 1 row to a table and reports the single adverse event in the trial (unrelated to vaccine). [↩](#fn8a)  

<a id="fn9">9</a>: J Miller, ["Safety and Immunogenicity of a 50 µg Booster Dose of mRNA-1273 (Moderna COVID-19 Vaccine)"](https://www.fda.gov/media/153089/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn9a)  

<a id="fn10">10</a>: FDA Staff, ["FDA Briefing Document EUA amendment request for a booster dose of the Moderna COVID-19 Vaccine"](https://www.fda.gov/media/152991/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn10a)  

<a id="fn11">11</a>: T Mongeau, ["FDA Review of Effectiveness and Safety of Moderna COVID-19 Vaccine (mRNA-1273) Booster Dose Emergency Use Authorization Amendment"](https://www.fda.gov/media/153087/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn11a)  

<a id="fn12">12</a>: H-L Wong, ["Surveillance Updates of Myocarditis/Pericarditis and mRNA COVID-19 Vaccination in the FDA BEST System"](https://www.fda.gov/media/153090/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-14. [↩](#fn12a)  

<a id="fn13">13</a>: P Marks, ["Welcome Remarks"](https://www.fda.gov/media/153097/download), [FDA VRBPAC 2021-Oct-14 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-14-15-2021-meeting-announcement), retrieved 2021-Oct-15.  Looks like it was uploaded a day late. [↩](#fn13a)  
