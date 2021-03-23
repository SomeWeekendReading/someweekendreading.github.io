---
layout: post
title: AstraZeneca/Oxford vaccine trial (and its _further_ discontents)
tags: COVID PharmaAndBiotech SomebodyAskedMe Statistics
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about the AstraZeneca press
release on their new Phase 3 vaccine trial.  AstraZeneca has done it again&hellip; just
not in a _good_ way.  

## What's the sitch?  

Perhaps you may recall that this blog has expressed some impatience with AstraZeneca's
previous clinical trial <sup id="fn1a">[[1]](#fn1)</sup>.  The situation seems to have
been:  
- They outsourced the manufacture of doses for this trial to a contract manufacturing
  organization (CMO), which in itself is perfectly reasonable.  
- But they did not assay the CMO's product to make sure they were getting what they
  thought they were getting.  So when one CMO screwed up and made half doses, they didn't
  catch it.  
- They did not randomize the lots from CMOs across the trial sites.  So the trial sites
  and the viral variants circulating there became hopelessly convolved with low vs high
  dose.  
- Stunningly, some sites had an upper age cutoff, while others did not.  In another
  statistical accident, the low/high doses became hopelessly convovled with younger vs
  older subjects.  
  
This is the sort of thing that makes a grizzled old statistician cry.  

Their scientists, we absolutely must note, _did the right thing:_ they went to the
regulatory bodies, explained the situation, and got a protocol amendment to try a 2-dose
Phase 3 trial.  That's unusual, since you're _supposed to know the dose already from Phase 2_, 
but it's the best move to salvage as much as could be salvaged.  

But then, when they read out last November, their management admitted none of this.  They
averaged across trial sites with different doses, different ages, and different viral
variants &ndash; thereby averaging over apples, oranges, and sledgehammers.  None of that came
out until people dug and asked inconvenient questions.  Their CEO, Pascal Soriot, had the
gall to claim it wasn't a mistake because they amended the 
protocol <sup id="fn2a">[[2]](#fn2)</sup>:  

> Soriot disputed the idea that the half-dose regimen was an error, saying that after
> researchers realized the dosing discrepancy they formally changed the trial protocol
> with the blessing of regulators.  
>  
>"I won’t tell you we expected the efficacy to be higher," said Soriot. But "people call
>it a mistake -- it’s not a mistake."  

Yeah.  Taking a pratfall and then saying "I meant to do that" always increases your
credibility.  

You know what _actually_ increases your credibility?  Saying something like: "We screwed
up in a few places here.  We've taken these steps to make sure it doesn't happen again.
In the meantime, here's the most honest case we can make with the slighlty compromised
data.  We think it looks pretty good, and would appreciate peer review."  That has the
virtue of being true, positioning yourself as being honest, and placing reliance on data
rather than personalities.  

This is, we admit, a hard lesson to learn.  


## So what have they done this time?  

### General media reports  

<img src="{{ site.baseurl }}/images/2021-03-23-azox-further-discontents-nyt.jpg" width="400" height="243" alt="NYT: NIH officials question AstraZeneca results" title="NYT: NIH officials question AstraZeneca results" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-23-azox-further-discontents-stat.jpg" width="400" height="235" alt="STAT News: AstraZeneca press release based on outdated information" title="STAT News: AstraZeneca press release based on outdated information" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
For our first pass over the issue, let's look at what the (more or less) general media
have to say.  The report from the _New York Times_ by Robbins, 
_et al._ <sup id="fn3a">[[3]](#fn3)</sup> sets the state in general.  Then, as seems now
to be the custom, we went to the usually more scientifically- and mathematically-literate
_STAT News_ for an article by A Joseph <sup id="fn4a">[[4]](#fn4)</sup>:  
- The press release stands accused of using 'outdated information', apparently
  cherry-picking time points to get data "most favorable for the study as opposed to the
  most recent and most complete." (_NYT_ quoting from the DSMB (Data Safety Monitoring
  Board) letter, the text of which I haven't been able to find.)  AZ says (below) that
  they were just reporting the interim data, not the complete data to be submitted to the FDA.  
- AZ claimed 79% efficacy overall (which is very good), and 80% efficacy above age 65
  (i.e., statistically indistinguishable from younger patients, also very good).  However,
  the DSMB statisticians said their analysis gave a confidence interval of 69% &ndash; 74%,
  below the quoted figure by AZ.  That's a serious problem.  It _could_ have arisen if AZ
  reported the interim dataset, while the DSMB used the full dataset.  But in that case,
  AZ is being misleading by reporting the higher number on the smaller dataset.  
- You _never_ report data that is a surprise to the FDA, especially if they have a bigger
  dataset than you and somehow you report better numbers on the smaller dataset!  
- If you've never seen a knife-flash when scientists duel, here's an example. The _NYT_
  quotes from the DSMB letter to AZ:  
> "Decisions like this are what erode public trust in the scientific process."
- Apparently at the root of the problem is the exact procedure for identifying trial
  subjects who contract COVID-19: symptoms, PCR test, antigen test, etc.  The DSMB twice
  urged AZ to go the more rigorous route, and AZ _apparently ignored this and did what they
  wanted, instead._  If you want to know how to get into deep trouble with the FDA, this
  is _exactly_ how it's done.  
- So AZ's report was (a) on partial data only, and (b) used a more favorable way of
  calling the COVID-19 cases, both of which combine to boost the apparent efficacy.  They
  also didn't inform the DSMB of their intent to make an announcement, so it came as a
  surprise to the DSMB which had different results.  Not a brilliant manuver, as it's
  both misleading _and_ sure to get caught (as it was, within hours of release).  


### Some expert statements  

Eric Topol, clinical trial expert at the Scripps Institute:  
> &hellip; highly irregular &hellip; I've never seen anything like this.  It's so, so
> troubling.  

Tony Fauci, head of NIAID in the NIH:  
> I was sort of stunned.  The data safety and monitoring board were concerned that the
> data that went into the press release by AZ was not the most accurate and up to date
> data. That is what the DSMB communicated to AZ in a rather harsh note. Having seen that
> letter we could not just let it go unanswered.  
> &hellip;  
> We just felt we could not remain silent. Because if we did remain silent, we could be
> understandably accused of covering something up. And we definitely didn’t want to be in
> that position.  
> &hellip;  
> In my mind, it’s an unforced error by the company.  

An "unforced error" for a late-stage drug candidate about to go before approval boards is
very harsh criticism.  Also accurate, as far as I can see.  

Tony Fauci on the potential to undermine public confidence in science and in particular in
the safeguards in place for medical approvals:  

> If you look at it, the data really are quite good, but when they put it into the press
> release, it wasn’t completely accurate.  We have to keep essentially trying
> as hard as we can to get people to understand there are safeguards in place.  
> &hellip;  
> Obviously that’s [public confidence in vaccines] a concern whenever something like this
> happens, that it could erode public trust, yes.  


### Primary sources  

Ok, that's more or less the media situation.  But what do the primary sources say, from
the principals involved in the matter?  

<img src="{{ site.baseurl }}/images/2021-03-23-azox-further-discontents-az-1.jpg" width="400" height="148" alt="AZ: press release on interim readout claiming 79% efficacy, 80% in age 65+" title="AZ: press release on interim readout claiming 79% efficacy, 80% in age 65+" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-23-azox-further-discontents-nih.jpg" width="400" height="246" alt="NIH: AZ press release 'outdated data' makes misleading efficacy claim" title="NIH: AZ press release 'outdated data' makes misleading efficacy claim" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-23-azox-further-discontents-az-2.jpg" width="400" height="145" alt="AZ response to NIH: will work with DSMB" title="AZ response to NIH: will work with DSMB" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
We looked at the AZ press release announcing the 79% efficacy 
result <sup id="fn5a">[[5]](#fn5)</sup>, the NIH statement about the letter they sent to
AZ in response <sup id="fn6a">[[6]](#fn6)</sup>, and the AZ response to 
_that_ <sup id="fn7a">[[7]](#fn7)</sup>.  However, we couldn't find the text of the actual
letter from the DSMB to AZ; that's apparently not public, though the _NYT_ above did quote
a few blistering sentences from it.  
- The relevant clinical trial is [NCT045167](https://clinicaltrials.gov/ct2/show/NCT04516746?term=NCT04516746&draw=2&rank=1).  
- AZ's claims: 79% efficacy overall, 80% efficacy in age 65+, no particular differences
  across ethnicities, and 100% efficacy vs severe disease and hospitalization.  
- They do mention, in fairness to them, that this based on an interim readout, not the
  full and final dataset provided to the regulatory authorities.  
- There were no serious adverse events, including the worrisome thromboembolisms.  
- They're about to submit to the FDA and to a peer-reviewed journal.  
- The doses were 4 weeks apart, though previous data said there was even more immune
  response if they're separated by 12 weeks.  That would support a "first-doses-first"
  strategy, since there's a lot of slack in the time between doses.  
- The cold chain is quite vanilla, like ordinary refrigerators.  This is very encouraging,
  for delivery to rural areas in the developed world and to the entire developing world.  

Overall, this is a very hopeful and good result.  One can totally understand AZ's
eagerness to say this as loudly and publicly as possible.  

Now, we don't know _exactly_ what the DSMB letter to AZ said.  But the NIH/NIAID folks
felt strongly enough about it to comment:
- They were concerned with the use of 'outdated data', giving an 'incomplete view of the
  efficacy'.  
- NIH/NIAID said they 'urge the company to work with the DSMB to review the efficacy data
  and ensure the most accurate, up-to-date efficacy data be made public as quickly as
  possible'.  
  
How serious is that?  The statement itself, issued in the middle of the night, is
unprecedented.  I'd translate it as roughly: "Hey, the DSMB wants to burn you guys at the
stake.  We thought we'd urge you to work it out, while they're gathering firewood."  Given
that they're about to go before the VRBPAC at the FDA, this is serious indeed.  

AZ's response:  
- The press release was based on an analysis pre-specified in the clinical trial protocol,
  on the interim data readout.  
- They thought it would be consistent with the final analysis of the final readout; the
  DSMB thought otherwise.  

> We will immediately engage with the independent data safety monitoring board (DSMB) to
> share our primary analysis with the most up to date efficacy data. We intend to issue
> results of the primary analysis within 48 hours.  


## What does all that mean?  

Basically, it looks like a fine vaccine.  But the AZ management has been a bit of a clown
show with mismanaged communication, lack of transparency, attempts to spin everything to
make themselves look better, and so on.  

The sad part: _they don't need to do this!_  The vaccine is good enough to speak for
itself.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Weekend Editor, ["AstraZeneca/Oxford vaccine interim readout (and its discontents)"](https://www.someweekendreading.blog/astrazeneca-oxford-vaccine-readout/), [_Some Weekend Reading_ blog]({{ site.baseurl }}), 2020-Nov-07.[↩](#fn1a)  

<a id="fn2">2</a>: S Ring &amp; J Paton, ["Astra Eyes Extra Global Vaccine Trial as Questions Mount"](https://www.bloomberg.com/news/articles/2020-11-26/astra-likely-to-run-fresh-global-covid-vaccine-trial-ceo-says), _Bloomberg_, 2020-Nov-26. [↩](#fn2a)  

<a id="fn3">3</a>: R Robbins, S LaFraniere, &amp; N Weiland, ["U.S. Health Officials Question AstraZeneca Vaccine Trial Results"](https://www.nytimes.com/2021/03/23/business/astrazeneca-vaccine-questions.html), _New York Times_, 2021-Mar-23. [↩](#fn3a)  

<a id="fn4">4</a>: A Joseph, ["'I was sort of stunned': Fauci and U.S. officials say AstraZeneca released 'outdated information' from Covid-19 vaccine trial"](https://www.statnews.com/2021/03/23/astrazeneca-may-have-used-outdated-information-in-announcing-covid19-vaccine-results/), _STAT News_, 2021-Mar-23. [↩](#fn4a)  

<a id="fn5">5</a>: AstraZeneca, ["AZD1222 US Phase III trial met primary efficacy endpoint in preventing COVID-19 at interim analysis"](https://www.astrazeneca.com/content/astraz/media-centre/press-releases/2021/astrazeneca-us-vaccine-trial-met-primary-endpoint.html), _AstraZeneca Press Releases_, 2021-Mar-22. [↩](#fn5a)  

<a id="fn6">6</a>: National Institutes of Health, ["NIAID Statement on AstraZeneca Vaccine"](https://www.nih.gov/news-events/news-releases/niaid-statement-astrazeneca-vaccine), _NIH News Releases_, 2021-Mar-23. [↩](#fn6a)  

<a id="fn7">7</a>: AstraZeneca, ["Update following statement by NIAID on AZD1222 US Phase III trial data"](https://www.astrazeneca.com/content/astraz/media-centre/press-releases/2021/update-following-statement-by-niaid-on-azd1222-us-phase-iii-trial-data.html), _AstraZeneca Press Releases_, 2021-Mar-23.[↩](#fn7a)  
