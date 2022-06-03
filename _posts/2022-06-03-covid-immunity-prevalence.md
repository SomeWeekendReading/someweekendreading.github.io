---
layout: post
title: COVID-19&colon; Immunity Types and Real Prevalence
tags: COVID JournalClub Math PharmaAndBiotech SomebodyAskedMe
comments: true
---

Two questions: what do we know about disease-induced vs vaccine-induced immunity, and what
is the actual prevalence of COVID-19 beyond "officially reported" cases?  Now there's some
data to think about here, though we can't _completely_ answer those questions.  


## Anti-nucleocapsid antibodies and vaccination  

<img src="{{ site.baseurl }}/images/2022-06-03-covid-immunity-prevalence-medrxiv-1.jpg" width="400" height="219" alt="Follmann, et al. @ medrXiv: Anti-nucleocapsid antibodies in the vaccinated and unvaccinated" title="Follmann, et al. @ medrXiv: Anti-nucleocapsid antibodies in the vaccinated and unvaccinated" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe), indirectly via a friend,
about a recent _medR&chi;iv_ preprint on anti-nucleocapsid antiobodies in vaccinated
versus unvaccinated people. <sup id="fn1a">[[1]](#fn1)</sup>  A little
r&eacute;cherch&eacute;, I thought, but it turned out the friend-of-a-friend's _real_
question was far, far more bizarre than even my pessimistic imagination suggested:  

> &hellip; It's not peer-reviewed yet, but there was a bombshell working paper released
> this month by the National Institute of Health, using Moderna's own clinical trial data,
> that shows unvaccinated people develop significantly better immunity after Covid than
> people who have been vaccinated.  
> &hellip;   
> The study all-but-proves the mRNA shots themselves &ndash; and not whatever reduction in viral
> loads they may cause &ndash; are impeding the development of the anti-nucleocapsid
> antibodies.  
> &hellip;  
> According to the study, this could explain why vaccinated people get sick over and over,
> sometimes only months apart. The vaccine is a narrow defense for one specific virus
> mutation. Our natural antibodies are a broad defense. If the vaccine is messing with it,
> I think that’s ominous.  

First impression: this looks like pure anti-vax madness from someone who doesn't
understand what an anti-nucleocapsid antibody is, when it is or is not relevant for
immunity, and why it's used in assays to measure community infection rates but _not_ in
vaccines.  _And_ who is willing to throw around wildly dangerous claims, very
irresponsibly.  

Still, let's check out the paper to be sure.  

The paper is _in no way_ about the disease resistance of vaccinated versus unvaccinated
people.  Instead, it's about measuring something called anti-nucleocapsid antibodies
(antibodies to another part of the virus away from the spike protein) to get some idea of
what fraction of the population has been exposed to the actual virus, not just the
vaccine.  That is, _it's about a public health assay._  

Now it turns out that vaccinated people, when they have a breakthrough infection, generate
less anti-nucleocapsid antibodies than the unvaccinated.  So if you're calibrating an
assay to run on the population, there will be a lower positive-calling threshold in
vaccinated people than in the vaccinated.  The study is about getting this right.  

There are lower anti-nucleocapsid antibodies in vaccinated people after breakthrough
infection, because:
- Vaccinated people get sick less often (ample data to support this, so I can't even
  imagine how an informed person would think otherwise),  
- When they do get sick they have lower viral loads, clear the infection faster, and have
  less severe disease (again, ample data on hospitalization rates supports this), and  
- Because they have such strong immune response via spike protein antibodies they more or
  less don't bother forming anti-nucleocapsid antibodies.  

Basically, for a vaccinated person there's _no point_ in making anti-nucleocapsid
antibodies, because (a) the spike antibodies which they make in great quantity are usually
enough to clear the infection, and (b) the nucleocapsid protein is _inside the viral
envelope_ where your immune system can't see it until it's infected a cell.  So it's
pretty useless as a first-line defense.  

The unvaccinated immune system just wildly makes antibodies to _everything_ that looks
viral, hoping something will work.  The vaccinated immune system has been educated to
attack the spike protein.  So _of course_ unvaccinated immune systems produce more of the
relatively useless anti-nucleocapsid antibodies&hellip; to pretty much no effect.  

Let's examine some of the quantitative results from the paper:  
- __PCR-confirmed COVID-19 rates:__ Looking at all patients in either arm, how many got sick?
  648/1298 = 49.9% of the placebo arm vs 21/491 = 4.3% of the vaccine arm.  That is,
  __vaccinated people ran about a 4% chance of infection vs 50% for unvaccinated__ over the
  same time period.  Vaccinated people were 10x less likely to be infected!  Vaccines are
  really, really good at suppressing sickness.  
- __Nucleocapsid ab levels:__ Looking at just the PCR-confirmed sickness cases, how many had
  nucleocapsid antibodies?  605/648 = 93% of the placebo arm vs 21/52 = 40% of the
  vaccinated arm.  I checked using a statistical test called Fisher's Exact Test, and yes
  this is statistically significant (not likely to be a fluke).  However, all it means is
  that __the immune systems of unvaccinated people struggled harder to clear the infection,
  making antibodies &ndash; even relatively useless ones like nucleocapsid antibodies.__   (Recall
  the nucleocapsid protein is inside the viral envelope, hence more or less useless to
  your immune system until the virus is actually inside a cell.  The spike protein is
  outside the viral envelope, so your immune system can stop the virus _before_ it gets in.)  

<a href="{{ site.baseurl }}/images/2022-05-18-million-us-dead-stat-3.jpg"><img src="{{ site.baseurl }}/images/2022-05-18-million-us-dead-stat-3-thumb.jpg" width="400" height="237" alt="Parker @ STAT: Vaccinated vs unvaccinated death rates, once vaccines were available" title="Parker @ STAT: Vaccinated vs unvaccinated death rates, once vaccines were available" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Vaccines do not lower your immunity.  They are designed to do the opposite, and they do a
very good job of it.  Consider the death rate in the US in the most recent wave,
stratified by vaccination status.  The plot shown here, from _STAT News_, is the one we
used in [a blog post on the day the US crossed 1 million official deaths]({{ site.baseurl }}/million-us-dead/).
It shows _very clearly_ that very few of the deaths were among the vaccinated, and even
fewer among the boosted.  This a stage of the pandemic in which _the unvaccinated are
responsible for substantially all the deaths._  Remaining unvaccinated is volunteering to
die, and attempting to bring down the rest of society with you.  

_The bad news:_  Anti-vax crazies are wildly misinterpreting this paper, turning the
calibration of a public health assay into some weird theory that unvaccinated people have
better immunity.  They do _not._  

_The good news:_  The good guys are calibrating public health assays so we can get good,
hard, reliable numbers on the rate of infection in the population in general.  That's hard
now that everybody has at-home tests whose results they never report!  

My friend's informant is propagating dangerously nonsensical disinformation.  I hope it's
through not understanding, rather than deliberate.  


## Limited cross-variant immunity from Omicron infection  

<img src="{{ site.baseurl }}/images/2022-06-03-covid-immunity-prevalence-genengnews-1.jpg" width="400" height="310" alt="Gen Eng &amp; Biotech News: Omicron without vaccination gives little cross-variant immunity" title="Gen Eng &amp; Biotech News: Omicron without vaccination gives little cross-variant immunity" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-06-03-covid-immunity-prevalence-nature-1.jpg" width="400" height="235" alt="Suryawanshi, et al. @ Nature: Omicron infection gives little cross-variant immunity" title="Suryawanshi, et al. @ Nature: Omicron infection gives little cross-variant immunity" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Still, that raises a question: is disease-induced immunity much good, even if it's not as
good as vaccine-induced immunity?  

An article a couple weeks ago in _Genetic Engineering &amp; Biotechnology News_ <sup id="fn2a">[[2]](#fn2)</sup>
pointed to a paper in _Nature_ <sup id="fn3a">[[3]](#fn3)</sup> which addresses this.  

The title is so good you (almost!) don't need the rest: if you're unvaccinated, you _will_
get Omicron, and the Omicron-induced immunity has little effect on other variants.  So you
_will_ get sick again.  

Still, let's listen to their words, not mine:  

> The question arises whether widespread Omicron infections could lead to future
> cross-variant protection, accelerating the end of the pandemic. Here we show that
> without vaccination, infection with Omicron induces a limited humoral immune response in
> mice and humans.  
> &hellip;  
> Sera from unvaccinated, Omicron-infected individuals show the same limited
> neutralization of only Omicron itself.  
> &hellip;  
> Our results demonstrate that __Omicron infection enhances preexisting immunity elicited by
> vaccines but, on its own, may not confer broad protection__ against non-Omicron variants
> in unvaccinated individuals.  

In other words: be safe, get vaccinated.  And boosted.  


## A survey of COVID-19 incidence and paxlovid awareness  

<img src="{{ site.baseurl }}/images/2022-06-03-covid-immunity-prevalence-medrxiv-2.jpg" width="400" height="241" alt="Qasmieh, et al. @ medRxiv: Real prevalence of COVID-19 and knowledge of paxlovid, NYC April-May 2022" title="Qasmieh, et al. @ medRxiv: Real prevalence of COVID-19 and knowledge of paxlovid, NYC April-May 2022" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Another question raised by the valiant attempt to make a nucleocapsid assay to measure
population infection rates: what _is_ the real infection rate, anyway?  Not just the
official, PCR-confirmed rate, because people test at home and the _don't report_ the
results.  

Another _medR&chi;iv_ preprint landed last week, with a survey of New York City that
attempts to answer this question. <sup id="fn4a">[[4]](#fn4)</sup>  Basically, they
surveyed $N = 1030$ NYC residents of age over 18 years, by either smartphone or
interactive land-line phone calls.  I won't go into the details, but they were careful to
create a _reasonably_ representative sample broken down by age, ethnicity, race, language
spoken, borough of residence, and all the usual things.  

There were a lot of survey questions, because it was carefully designed, but mostly it
came down to verifying answers to a couple questions:  
- Have you had COVID-19?  
- Do you know about paxlovid therapy for COVID-19?  

Some topline results:  
- 22.1% (CL: 17.9% - 26.2%) had COVID in the last 2 weeks, about 1.5 million adults.  
- 55.9% (CL: 44.9% - 67.0%) were unaware of paxlovid, so they could not ask for it.  
- 15.1% (CL: &nbsp;7.1% - 23.1%) received paxlovid, a small fraction of the obvious need.  

<a href="{{ site.baseurl }}/images/2022-06-03-covid-immunity-prevalence-medrxiv-3.jpg"><img src="{{ site.baseurl }}/images/2022-06-03-covid-immunity-prevalence-medrxiv-3-thumb.jpg" width="400" height="211" alt="Qasmieh, et al. @ medRxiv: Family size and presence of children as risk factors" title="Qasmieh, et al. @ medRxiv: Family size and presence of children as risk factors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Interestingly, they call out 2 particular risk factors in Figure 1, shown here: living in
a larger group (e.g., family size), and the presence of children under 18 in the
household.  More people probably means more chances to infect each other. Kids go
everywhere (not always masked), and can be asymptomatic carriers back to their families.  

Also: higher infection in the Hispanic group and those less educated.  Income,
surprisingly, didn't seem to matter much, nor did which borough of residence in NYC.

  
## The Weekend Conclusion  

1. Anti-nucleocapsid antibodies are for a public health assay measuring population
   infection rates.  They are meaningless about vaccination and disease resistance.  You
   should still get vaccinated.  
2. Immunity from Omicron infection is pretty weak, and will not protect you from other
   variants much at all.  You should still get vaccinated.  
3. A lot more people have COVID-19 than we think, and about half don't know there is an
   effective therapy, which is being given out _very_ reluctantly anyway.  You don't want
   to need paxlovid but not be able to get it.  You should still get vaccinated.  
   
Did I mention you should still get vaccinated?  

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

<a id="fn1">1</a>: D Follmann, _et al.,_ ["Anti-nucleocapsid antibodies following SARS-CoV-2 infection in the blinded phase of the mRNA-1273 Covid-19 vaccine efficacy clinical trial"](https://www.medrxiv.org/content/10.1101/2022.04.18.22271936v1), _medR&chi;iv_ preprint, 2022-Apr-19.  DOI: [10.1101/2022.04.18.22271936](https://doi.org/10.1101/2022.04.18.22271936). [↩](#fn1a)  

<a id="fn2">2</a>: GenEngNews Staff, ["Omicron Infections, Without Vaccinations, Provide Little Immunity"](https://www.genengnews.com/news/omicron-infections-without-vaccinations-provide-little-immunity/), _Genetic Engineering &amp; Biotechnology News_, 2022-May-19. [↩](#fn2a)  

<a id="fn3">3</a>: RK Suryawanshi, _et al.,_ ["Limited cross-variant immunity from SARS-CoV-2 Omicron without vaccination"](https://www.nature.com/articles/s41586-022-04865-0), _Nature_, 2022-May-18. DOI: [10.1038/s41586-022-04865-0](https://doi.org/10.1038/s41586-022-04865-0). [↩](#fn3a)  

<a id="fn4">4</a>: SA Qasmieh, ["The prevalence of SARS-CoV-2 infection and uptake of COVID-19 antiviral treatments during the BA.2/BA.2.12.1 surge, New York City, April-May 2022"](https://www.medrxiv.org/content/10.1101/2022.05.25.22275603v1), _medR&chi;iv_ preprint, 2022-May-26. DOI: [10.1101/2022.05.25.22275603](https://doi.org/10.1101/2022.05.25.22275603). [↩](#fn4a)  
