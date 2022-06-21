---
layout: post
title: FDA VRBPAC Meeting&colon; Novavax COVID-19 Vaccine
tags: COVID PharmaAndBiotech Politics Statistics
comments: true
commentsClosed: false
---

Today the FDA's Vaccines and Related Biological Products Advisory Committee (VRBPAC) met
to advise the FDA on whether to approve Novavax's more traditional protein (non-mRNA)
vaccine against COVID-19.  Want to know who said what?  

## Why another vaccine, so late in the day?  

First, enough with the "late" stuff.  It's only 2 1/2 years since the outbreak was widely
recognized, around January 2020.  In the past, vaccines have taken about 10 years to
develop.  Now we're all spoiled with the absolutely _amazing_ speed of the Pfizer/BioNTech
and Moderna mRNA vaccines.  But this is a more traditional protein-based vaccine, growing
the spike protein in a culture of insect cells (used to be chicken eggs, now it's usually
some kind of caterpillar cell culture).  And it only too 2.5 years, not 10.  So cut them a
break.  

Ok, not "late" _per se_, but why another?  As near as I can make out, 3 reasons:  
- _General diversification principle:_ we want as many _different_ ways of fighting the
  pandemic as we can get, in the event we have to drop some for safety or just supply
  chain failure.  
- _mRNA Vaccine holdouts:_ As a traditional protein vaccine, this may lure in some vaccine
  hesitant persons who attach too high an "ick" factor to mRNA vaccines.  I'm suspicious
  of this, as it seems most vaccine resisters are pretty dug in at this point and are
  likely unreachable. Still, there's a chance, so why not take a chance that has little
  downside and might save the lives of a few stubborn holdouts?  
- _Cold chain requirements:_ mRNA is a ridiculously fragile molecule, initially requiring
  storage at -80&deg;C &ndash; -60&deg;C which is rare outside big city hospitals and
  medical research institutions, and unattainable in the developing world.  (It's slightly
  better now.)  
  
  But NVX-CoV2373/Nuvaxovid can be stored at +2&deg;C &ndash; +8&deg;C (albeit in
  purpose-built vaccine refrigerators).  This is much more manageable, especially in the
  developing world.  
  
<img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-nejm-1.jpg" width="400" height="209" alt="Nohynek, et al. @ NEJM: Does the world still need new COVID-19 vaccines?" title="Nohynek, et al. @ NEJM: Does the world still need new COVID-19 vaccines?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I'm not the only one wondering about this; just last week there was an article in the
_New England Journal of Medicine_ also asking whether another vaccine is
needed! <sup id="fn1a">[[1]](#fn1)</sup>  

Some of their arguments:  
- It looks like we're on track to get 70% vaccination world-wide by the end of 2022.
  (Though it seems to me that herd immunity to Omicron is going to need &gt; 90%
  vaccination?)  
- There are at least 344 COVID-19 vaccines developed or in late development.  
- There are 31 vaccines already in large-scale use in some country.  
- They use a variety of platforms: mRNA, viral vector, inactivated whole-virus, protein
  subunits, and plasmid DNA are the ones that come to mind.  Never in human history have
  we done anything like that!  
- __But, considerations beyond efficacy and safety apply:__ ease of schedules, integration with
  routine vaccinations, need for boosters, cost, cold-chain logistics, scaling of
  manufacturing, community acceptance, and possibility of local production.  
  
All excellent points, and illustrate several reasons I hadn't thought about.  Yes, the
newer vaccines tend to have efficacies ranging from 69% &ndash; 85%, and that's less than
the mRNA vaccines at 95% or so.  But if you can't get the mRNA vaccine in position because
of cold chain problems, or people won't accept it because of mRNA distrust, then the
next-best vaccine is the way to save lives.  

Remember, with a pandemic, nobody is safe until everybody is safe.  We need to care
about the developing world because it's what decent people do, but it's also in our
interest to suppress the proliferation of new variants.  


## A quick early look  

The FDA VRBPAC meeting page <sup id="fn2a">[[2]](#fn2)</sup> has links to all the meeting
materials.  The voting question <sup id="fn3a">[[3]](#fn3)</sup> is short and sensible:  

> Based on the totality of scientific evidence available, do the
> benefits of the Novavax COVID-19 Vaccine when administered
> as a 2-dose series outweigh its risks for use in individuals 18
> years of age and older?  

Last Friday, the Novavax briefing document and the FDA briefing document
became suddenly available (though not much
else). <sup id="fn4a">[[4]](#fn4)</sup> <sup id="fn5a">[[5]](#fn5)</sup>  

The slide presentations will have all the good stuff, but the briefing docs have at least
a hint at what's going down:  
<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-fda-km-curve.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-fda-km-curve-thumb.jpg" width="400" height="161" alt="FDA document: Kaplan-Meier curve of vax/unvax populations" title="FDA document: Kaplan-Meier curve of vax/unvax populations" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- First comes the now-expected beautiful Kaplan-Meier curve (p. 26 in the FDA document),
  shown here.  The blue curve is the unvaccinated population, and the red is the
  vaccinated.  The effect doesn't kick in until about day 20 or 28 after the first dose,
  but the red curve does flatten admirably.  
- Next, vaccine efficacy (p. 23ff in the FDA document):  
  - All participants: &nbsp;&nbsp;90.41% (CL: 83.81% &ndash; 94.32%)  
  - Age 18 - &lt; 65 yr: 91.06% (CL: 84.44% &ndash; 94.87%)  
  - Age &ge; 65yr: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;78.63% (CL: -16.64% &ndash; 96.08%)  
  
The prespecified success criterion is the same as was given 2 years ago for the mRNA
vaccine efficacies: median(VE) &ge; 50% and lower confidence limit LCL(VE) &ge; 30%.  So
everything looks pretty good, _except_ the age 65+ cohort, where we don't meet the LCL
criterion!  That's a problem, but:  
1. There were only 6 cases in this cohort (2/2044 vax _vs_ 4/968 placebo), which makes the
   confidence limits very, very wide.  
2. The FDA requested post-hoc analysis of antibody levels in the 50-64 vax arm and the 65+
   vax arm.  The ratio was 0.91 (CL: 0.68 &ndash; 1.2), so the seniors _do_ have pretty
   significant antibodies, roughly comparable with their juniors.  
   
So we _might_ try to assign the alarming lower confidence limit in elders to rare events
and take comfort in the comparable geometric mean titer antibody levels (both good things).  

The other issue is there were 4-5 cases of myocarditis or pericarditis in the vax arm.
(Novavax says 4, the FDA says 5 including one case whose symptoms were likely
myocarditis.)  The mRNA vaccines have seen this post-approval, but the rate was low enough
that it wasn't really seen much in the trials.  So that's potentially a stumbler.  

In adverse events, the Novavax document reports "gin shot wound" (p. 59, Table 15), by
which I think they mean "gun shot wound"!  These documents are gone over so carefully by
so many people, I'm slightly surprised at the spelling gaffe.  Still, gunshot is unlikely
vaccine related.  (Previously, we blogged about how
[Moderna had to report getting struck by lightning for one participant]({{ site.baseurl }}/moderna-struck-by-lightning/).
The FDA sensibly gave them a pass on that one.)  

So it might get approval pretty quickly, or there might be a food fight because we already
have such good mRNA vaccines.  

Honestly, I couldn't predict which.  

That's why they have the meeting.  


## Agenda and conflicts of interest  

The agenda <sup id="fn6a">[[6]](#fn6)</sup> looks pretty straightforward:  
- the usual welcome and introductions,  
- a formal statement of the EUA question by the FDA,  
- a couple CDC presentations reminding us we still have to take COVID-19 seriously and myocarditis is
  potentially a risk,  
- the Novavax presentation analyzing their trial results,  
- the FDA presentation independently analyzing the same data,  
- some public hearings which are _always_ skippable,  
- discussion &amp; voting.  

Slightly more interesting is the waivers for potential conflicts of interest, almost
always because they need some expertise from industry or some doctor happens to have some
relevant investments <sup id="fn7a">[[7]](#fn7)</sup>:  

> No waivers were issued for conflicts of interest for this meeting

<img src="{{ site.baseurl }}/images/hmpf.png" width="400" height="160" alt="Hmpf." title="Hmpf." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I've never before seen them say there were _no_ conflicts of interest.  Or, more
technically, no _waivers_ for such conflicts were issued, so if there is one then I guess it's on
the person with the conflict, not the FDA?  

Hmpf.  Maybe I'm too suspicious.  


## Our usual safari guides (via an unusual channel)  

No liveblog at _STATNews_ today, but Helen Branswell is live-tweeting, if you want
to follow along for another perspective:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    1. <a href="https://twitter.com/hashtag/VRBPAC?src=hash&amp;ref_src=twsrc%5Etfw">#VRBPAC</a>
	is meeting today to review Novavax&#39;s submission for an EUA for its Covid vaccine. Often 
    <a href="https://twitter.com/matthewherper?ref_src=twsrc%5Etfw">@matthewherper</a> &amp;
	I live blog VRBPAC meetings but not today. I&#39;ll try to live tweet.<br>

    Gonna be an interesting day. <br>If you want to watch the meeting: 
    <a href="https://t.co/DPR3XqbOrH">https://t.co/DPR3XqbOrH</a> 
  </p>&mdash; Helen Branswell 🇺🇦 (@HelenBranswell) <a href="https://twitter.com/HelenBranswell/status/1534153958041739266?ref_src=twsrc%5Etfw">June 7, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>


## Setting the stage  

<img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-sen-1.jpg" width="400" height="230" alt="G Sen @ VRBPAC: The situation, the vaccine, the question, and the agenda" title="G Sen @ VRBPAC: The situation, the vaccine, the question, and the agenda" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First up is a presentation by Goutam Sen <sup id="fn8a">[[8]](#fn8)</sup>, documenting:  
- the general situation of the pandemic,  
- what the Novavax vaccine is,  
- what the considerations for an EUA are,  
- what other vaccines are available in the US,  
- the meeting agenda, and
- the all-important voting question above.  

The content was unsurprising, generally.  But a few things struck me oddly:  
1. Novavax contains the spike protein for the original Wuhan strain, not anything more
   recent.  That's what I expected, but I'm still impatient for an Omicron-specific
   vaccine.  
2. It's cultured in [Sf9 cells](https://en.wikipedia.org/wiki/Sf9_(cells)), a cell culture
   derived from the caterpillars of a certain moth.  They take transfection of a foreign
   gene &ndash; say, the spike protein &ndash; from a
   [baculovirus](https://en.wikipedia.org/wiki/Baculoviridae) which people like to use in
   the lab because it cannot replicate in mammalian cells.  The point of interest: people
   are squeamish about mRNA from a synthesizer, but _not_ about proteins generated in a
   viral-transfected insect cell culture?!  
3. It also uses a saponin-based adjuvant (Chilean soap tree extract and some bacterial surface
   antigens), which is basically something to irritate the immune system into reacting
   more strongly to the spike protein.  This is standard.  
4. The EUA application was received 2022-Feb-01.  Why are we only acting on it now?!   


## CDC on the public health situation  

<img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-1.jpg" width="400" height="225" alt="Scobie @ CDC: US COVID-19 epidemiology &amp; vaccination rates" title="Scobie @ CDC: US COVID-19 epidemiology &amp; vaccination rates" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
CDR Heather Scobie (it still freaks me out that the US Public Health Service) uses
military ranks!) presented next on the general state of COVID-19 epidemiology and
vaccination in the US. <sup id="fn9a">[[9]](#fn9)</sup>  

This turned out to be really interesting, giving a picture of where we are with
vaccination and viral variants that is seldom put together in one place like this.  Summary:  
<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-2.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-2-thumb.jpg" width="400" height="247" alt="Scobie @ CDC: Nothing but Omicron subvariants since February" title="Scobie @ CDC: Nothing but Omicron subvariants since February" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- All Omicron, all the time.  It used to be all Delta, all the time.  Now Omicron has
  bigfoot-stomped Delta into extinction, and Omicron sub-variants are competing to
  bigfoot-stomp each other out of existence.  I never thought this would get to be as
  contagious as measles, but&hellip; nonetheless, here we are.  Her slide shown here tells
  us graphically that nothing other than Omicron variants matters; BA.2.12.1 is likely to
  dominate soon.  (After that, BA.4 and BA.5 out of South Africa?)  
<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-3.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-3-thumb.jpg" width="400" height="228" alt="Scobie @ CDC: Seroprevalence evidence of infection by age group in US" title="Scobie @ CDC: Seroprevalence evidence of infection by age group in US" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- [As we've mentioned before]({{ site.baseurl }}/covid-immunity-prevalence/), you can
  measure the population who have been infected (even briefly and asymptomatically) with
  the virus by looking at oddball antibodies, like the seroprevalence of the nucleocapsid
  antibody.  The CDC is, unsurprisingly, on top of this.  The evidence is that 58% of the
  US population has had some level of COVID-19 infection in the past, though for most of
  them vaccination has helped them clear it quickly.  As you can see here, it's highly
  stratified by age, with 0-18 years being by far the dominant subgroup.  
  - Basically, kids go everywhere, congregate in groups, and you can't impose 100%
    effective masking or social distancing on them.  
  - Also, among the elderly, the death rate is higher: they're not around for
    retrospective blood draws to see if they were previously infected.  
  Talk about inter-generational conflict!  
<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-4.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-4-thumb.jpg" width="400" height="222" alt="Scobie @ CDC: Vax &amp; boost rates in US, by time and age cohort" title="Scobie @ CDC: Vax &amp; boost rates in US, by time and age cohort" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Vaccination rates in the US have _definitely_ reached their plateau, as seen here by the
  plots of vax and boost rates vs time, stratified by age.  Again, age group seems to be
  the driving factor.  I wish I knew what we could do to raise the plateau of younger
  people!  
<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-5.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-5-thumb.jpg" width="400" height="225" alt="Scobie @ CDC: Death rates by vax status over time, per capita" title="Scobie @ CDC: Death rates by vax status over time, per capita" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Next, consider death rates.  Here Scobie shows us death rates by vaccination status,
  normalized by the age-adjusted population size for each vax status.  I often say
  metaphorically that something is "brutally clear", but this is not metaphorical.  The
  death rates are almost exclusively the unvaccinated, tiny among the vaccinated, and
  almost negligible among the boosted.  Refusing vaccination/boosting is volunteering to
  die, and attempting to take down the rest of society with you.  
<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-6.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-scobie-6-thumb.jpg" width="400" height="224" alt="Scobie @ CDC: Fold reduction wrt wild-type in vaccine sera neutralization of variants" title="Scobie @ CDC: Fold reduction wrt wild-type in vaccine sera neutralization of variants" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Finally, let's consider vaccine efficacy as the virus has evolved.  What the plot shows
  here is a _fold reduction_ in how well vaccine sera neutralize the variants.  That is,
  higher is worse: 2x means the vaccine sera are 1/2 as effective.  The fold reduction in
  efficacy generally rises with later variants.  The curious part is the J&amp;J vaccine,
  which did _better?_  No idea what's going on there!  
  - Note that the graph shows only for vaccination _without_ boosting.  
  - But boosting works: 25x weaker without boosting becomes only 6x weaker with boosting.  
  - However, _6x weaker is no fun:_ we need, apparently, variant-specific vaccines now.  I
    wish I understood the hold-up in the Omicron-specific vaccines, but that will
    apparently be [debated at a VRBPAC toward the end of this month]({{ site.baseurl }}/upcoming-vrbpac/).  

<img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-shimabukuro-1.jpg" width="400" height="226" alt="Shimabukuro @ CDC: Myocarditis and mRNA COVID-19 vaccination" title="Shimabukuro @ CDC: Myocarditis and mRNA COVID-19 vaccination" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Next CAPT Tom Shimabukuro (again, military rank in  US Public Health Service!) presented on
the state of myocarditis in relation to mRNA COVID-19 vaccines. <sup id="fn10a">[[10]](#fn10)</sup>
The relevance, of course, is to compare with myocarditis in the Novavax vaccine, about
which more later.  

<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-shimabukuro-2.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-cdc-shimabukuro-2-thumb.jpg" width="400" height="225" alt="Shimabukuro @ CDC: Myocarditis and mRNA vaccination vs viral myocarditis" title="Shimabukuro @ CDC: Myocarditis and mRNA vaccination vs viral myocarditis" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
I got rather less out of this, other than:  
- While there is now evidence of a causal relation between mRNA vaccination and
  myocarditis, it happens at a pretty low rate and that rate is lower than the rate caused
  by actually getting COVID-19 (see table).  So you're still better off vaccinated.  
- It's primarily, though not completely, a phenomenon in younger males, who tend to
  recover pretty nicely.  Better recovery, in fact, than if they'd had COVID-19.  


## The Novavax presentation &amp; the FDA presentation  

<img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-nv-1.jpg" width="400" height="178" alt="Novavax staff: NVX-CoV2373 EUA application" title="Novavax staff: NVX-CoV2373 EUA application" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-1.jpg" width="400" height="205" alt="Lee @ FDA: NVX-CoV2373 EUA application" title="Lee @ FDA: NVX-CoV2373 EUA application" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
This presentation <sup id="fn11a">[[11]](#fn11)</sup> has all the goods, but it's a bit
verbose in the way that multi-presenter slide decks sometimes get.  I'm just going to hit
the high points from both this and the FDA presentation on the same
data. <sup id="fn12a">[[12]](#fn12)</sup>  

There's (appropriately) a lot of stuff about the design of the clinical trials: Phase I in
Australia ($N = 29$), Phase 2 in South Africa ($N = 2211$, including HIV+), Phase 2 in the
US &amp; Australia ($N = 513$), Phase 3 in the UK ($N = 7569$), and another Phase 3 in the
US ($N = 19735$).  So lots of people: at least 27k in the combined Phase 3's alone.  Sure,
Pfizer &amp; Moderna had like 40k, but this is quite sufficient to prove the point.  

Alas, however: the clinical data is from almost entirely before Delta, let alone before
Omicron.  So the application to the current situation may be questioned; this is the price
of moving slowly against a virus that evolves quickly.  

Also, there seem to have been enough manufacturing problems that the vaccine going forward
may not be entirely identical with the vaccine used in the trial.  Novavax says they have
enough compatibility data between old &amp; new versions; the FDA thinks otherwise.  This
would normally be a huge black flag dooming the project, but apparently not here.  

Also also, everybody wonders what "emergency use authorization" means, when there are 2
vaccines that are fully approved and already in place.  VRBPAC member Eric Rubin in fact
brought this up at the start of the meeting; apparently the statutes allow a lot of leeway
for "unmet medical need."  

So, plenty to wonder about.  

<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-nv-km-curve.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-nv-km-curve-thumb.jpg" width="400" height="225" alt="Novavax: KM curve" title="Novavax: KM curve" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Why bother with the heavy lift of all that wondering?  Pretty much the beautiful KM curve
from Novavax slide 25, shown here:  
- The horizontal axis is time, and the vertical axis is the fraction of patients getting
  COVID-19.  
- The blue curve is the vaccinated patients, and the gray curve is the placebo patients.  
- The vertical marks on each curve are _censorship_ events, when a person drops out of the
  trial.  Cox proportional hazard regression was invented pretty much to handle that
  properly.  (We can't reproduce it with the data in the paper, so we'll use cruder
  methods.)  
  
The brutally obvious fact, of course, is that the vaccinated participants clearly did
better.  There are ways to quantify that, e.g., with hazard ratios and logrank $p$-value
tests, and they do that, but it's clear visually here.  

<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-2.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-2-thumb.jpg" width="400" height="228" alt="Lee @ FDA: Novavax efficacies" title="Lee @ FDA: Novavax efficacies" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The other way to quantify that the vaccinated participants did better is by calculating
vaccine efficacy and its 95% confidence limits.  We've gone over that ground before, so we
won't do that again here.  But slide 15 of the FDA presentation makes a powerful case that
the efficacy is generally high and well bounded above the 30% threshold demanded by the
FDA.  

Can we check the FDA/Novavax efficacy numbers and their confidence limits with our cruder scaled
binomial confidence interval method? <sup id="fn13a">[[13]](#fn13)</sup>  Why yes, yes we
can:  
```R
> source("../assets/2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r")
Loading required package: ggplot2
Learn more about the underlying theory at https://ggplot2-book.org/

> signif(efficacyAndCL(17272, 17, 8385, 79), digits = 3) # all participants
  LCL   Eff   UCL 
0.825 0.896 0.938 

> signif(efficacyAndCL(15228, 15, 7417, 75), digits = 3) # 18 to < 65 years
  LCL   Eff   UCL 
0.832 0.903 0.944 

> signif(efficacyAndCL(2044, 2, 968, 4), digits = 3) # >= 65 years
   LCL    Eff    UCL 
-0.104  0.763  0.949 
```

Now, our numbers don't match the FDA's _exactly_, but then the FDA and Novavax did a
sophisticated Cox regression taking into account censorship while we did not.  Generally,
we're within about 1% of each other, with my crude estimates being generally lower.  (The
exception is the miserable lower confidence limit for seniors, where they got -16% and I
got -10% with cruder methods.  Broadly, we agree: there were probably too few cases in this age
cohort to measure very well and thus we got a super-wide confidence interval.  But the
rest of the cases look eminently plausible.)  

<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-3.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-3-thumb.jpg" width="400" height="231" alt="Lee @ FDA: Ab ratio of 65+ with respect to 50-64" title="Lee @ FDA: Ab ratio of 65+ with respect to 50-64" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now, you can't just leave things like that: people will want to know if the vaccine really
failed for age 65+, or if there were just too few deaths in both arms to get good
statistics.  So the FDA asked Novavax to go measure antibodies in the blood of people in
the treatment arm, grouped by age.  When you take the ratio of the geometric mean titer
antibody levels, do you find the seniors are way lower, or comparable?  

The results are shown here on slide 16: the seniors have 91% of the antibody levels of
their juniors (CL: 68% - 120%).  This gives one confidence that immunity really _was_
stimulated in the elder cohort, and the wide confidence interval for efficacy was just
because too few people died in both arms.  

<a href="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-4.jpg"><img src="{{ site.baseurl }}/images/2022-06-07-fda-novavax-lee-4-thumb.jpg" width="400" height="229" alt="Lee @ FDA: SAE frequencies similar in treatment and placebo arms" title="Lee @ FDA: SAE frequencies similar in treatment and placebo arms" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Next, there's a lot of analysis about adverse events.  I don't really have the patience to
wander through it all, but liked this summary on slide 26 from the FDA: serious adverse
event frequencies in both arms are pretty comparable.  (Though the gunshot wound and the 2
deaths from motor vehicle accidents were in the treatment arm, though nobody's fault.
It's weird stuff like this that tells you the data is real.  Nobody fakes weird junk like
this when they fake data!)  

That's generally reassuring.  

There was a lot of arguing back and forth about myocarditis, pericarditis, and so on.
Some thought it was causally related to the vaccine, some not.  What pushed me over the
hump toward "approve and move on" was this statement on slide 37 from the FDA:  

> In a total clinical safety database of ~ 40,000 vaccine recipients, to date, 6 NVX
> recipients have reported myocarditis and/or pericarditis, including 5 events
> within 20-days post-NVX.  

Basically, causally linked or not, it's _rare._  Much rarer than the various dangers posed
by COVID-19, so the risk trade-off is _overwhelmingly_ in favor of vaccination.  


## Discussion &amp; Voting  

Confession time: I went to buy groceries.  Again.  So I didn't listen to all the details
here.  Also, I deliberately skipped the public comment section, because that gives me
nightmares.  (Literally, if you need to know.)  

There was apparently some arguing about myocarditis.  NVX says no relation, the FDA said
"maybe".  Dorian Fink of the FDA said "maybe" is enough to add myocarditis to the
warnings, so they should do that if they approve it.  Seems like a reasonable compromise,
or as reasonable one as you're likely to get.  

Bruce Gellin (former head of HHS national vaccine program, now Chief of Global Public
Health Strategy, The Rockefeller Foundation had some interesting not-quite-accusations:  
1. Novavax has more data than they've shown the FDA, so he wants to know what's in there.  
2. He wants to know more about the different versions due to the manufacturing problems.
   He doesn't buy that Novavax has convincing compatibility data between them, so we'd be
   approving a different vaccine than the one tested.  
3. He also wants to know the efficacy vs Omicron, since this was tested almost entirely
   before even Delta, let alone Omicron.  

All reasonable questions, though it seems to me unreasonable to block the vaccine based on
them.  More apt would be to demand post-approval surveillance to patch up the
compatibility data and get Omicron efficacy numbers, and demand disclosure of this other
data about which I know nothing.  

In the end, the vote was 21 yes, 0 no, and 1 abstention.  The abstention was Gellin, for
the reasons above.  He said he wanted to vote a "conditional yes", but that wasn't an
option.  

So... stamp an EUA on it and get the CDC on the stick.  


## The Weekend Conclusion  

Man, these folk love calling each other "doctor"!  In my corner of the world, where we
have mere PhDs, _nobody_ does that.  In fact, friends who have PhDs but work with
clinicians are always careful to warn you should get your lab coat to say
"Dr. _Your Name_", and never "_Your Name_, PhD".  The latter will ensure that no MD will
ever listen to anything you say.  Medicine is _very_ authoritarian compared to physics
&amp; math!  I wonder if that will change with the next generation?  

The efficacy data looked plenty good enough, and the safety data looked reasonable.  So
approval was reasonable.  

I'm skeptical it will win over the vaccine defiant who get icked out by mRNA.  What will
they say when they find out it's grown in insect cell cultures infected by a genetically
modified virus?  (That's true of almost any other mass-produced virus too, but rationality
doesn't seem to be the sticking point here.)  

The less demanding cold chain will be a good thing, especially in the developing world.
Of course, the FDA has nothing to say about the developing world, but perhaps their
_imprimatur_ will help?  

"Perhaps X will help" is weak sauce, bit seems to be what's on offer in a world where
people refuse the vaccines made available for a year and a half now.  

This is a really weird timeline.  Can I get back to the one I used to know?  

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

<a id="fn1">1</a>: H Nohynke, _et al.,_ ["Does the World Still Need New Covid-19 Vaccines?"](https://www.nejm.org/doi/full/10.1056/NEJMe2204695), _NEJM_ 386:2140-2142, 2022-Jun-02. DOI: [10.1056/NEJMe2204695](https://doi.org/10.1056/NEJMe2204695). [↩](#fn1a)  

<a id="fn2">2</a>: US FDA Staff, ["Vaccines and Related Biological Products Advisory Committee June 7, 2022 Meeting Announcement"](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-june-7-2022-meeting-announcement), US FDA, 2022-Jun-07. Contains meeting presentation materials and both FDA &amp; Novavax analysis documents. [↩](#fn2a)  

<a id="fn3">3</a>: US FDA Staff, ["173rd Vaccines and Related Biological Products Advisory Committee (VRBPAC) Meeting, June 7, 2022: VOTING QUESTION"](https://www.fda.gov/media/158917/download), US FDA, 2022-Jun-07. [↩](#fn3a)  

<a id="fn4">4</a>: FDA Staff, ["FDA Briefing Document: Novavax COVID-19 Vaccine"](https://www.fda.gov/media/158912/download), US FDA, 2022-Jun-07. [↩](#fn4a)  

<a id="fn5">5</a>: Novavax Staff, ["NVX-CoV2373 Vaccine for the Prevention of COVID-19"](https://www.fda.gov/media/158914/download), Novavax, 2022-Jun-07. [↩](#fn5a)  

<a id="fn6">6</a>: FDA Staff, ["173rd Meeting of the Vaccines and Related Biological Products Advisory Committee: June 7, 2022, DRAFT AGENDA"](https://www.fda.gov/media/158987/download), US FDA, 2022-Jun-07. __NB:__ It says "draft" agenda, but I'm looking at it _while the meeting is happening,_ so as drafts go it's pretty dang authoritative. [↩](#fn6a)  

<a id="fn7">7</a>: FDA Staff, ["Waivers for Conflicts of Interest"](https://www.fda.gov/media/158839/download),  US FDA, 2022-Jun-07. [↩](#fn7a)  

<a id="fn8">8</a>: G Sen, ["Novavax COVID-19 Vaccine, Adjuvanted: Request for Emergency Use Authorization"](https://www.fda.gov/media/159006/download), US FDA/CBER/DVRPA, 2022-Jun-07. [↩](#fn8a)  

<a id="fn9">9</a>: H Scobie, ["COVID-19 Epidemiology and Vaccination Rates in the United States"](https://www.fda.gov/media/159005/download), CDC COVID-19 Epidemiology Task Force, 2022-Jun-07. [↩](#fn9a)  

<a id="fn10">10</a>: T Shimabukuro, ["Update on myocarditis following mRNA COVID-19 vaccination"](https://www.fda.gov/media/159007/download), CDC COVID-19 Vaccine Coordination Unit, 2022-Jun-07. [↩](#fn10a)  

<a id="fn11">11</a>: F Dubovsky, R Mallory, D Kim, GA Poland, ["Emergency Use Authorization (EUA) Application for NVX-CoV2373"](https://www.fda.gov/media/159008/download), Novavax, 2022-Jun-07. [↩](#fn11a)  

<a id="fn12">12</a>: L Lee, ["FDA Review of Effectiveness and Safety of Novavax COVID-19 Vaccine in Adults &ge; 18 Years of Age Emergency Use Authorization Request"](https://www.fda.gov/media/159004/download), US FDA Office of Vaccines Research and Review, 2022-Jun-07. [↩](#fn12a)  

<a id="fn13">13</a>: [Weekend Editor](mailto:SomeWeekendReadigEditor@gmail.com), ["R script for efficacy and confidence limits using a scaled binomial model"]({{ site.baseurl }}/assets/2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r), [Some Weekend Reading]({{ site.baseurl }}/) blog, 2021-Nov-12. [↩](#fn13a)  
