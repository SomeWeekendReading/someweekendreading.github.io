---
layout: post
title: AstraZeneca/Oxford vaccine interim readout (and its discontents)
tags: COVID MathInTheNews R SomebodyAskedMe
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about the early readout this
week of the AstraZeneca/Oxford vaccine Phase 3 trial.  Initially they said 70% efficacy.
It's not a stunningly good 95% result like Pfizer or Moderna; still, it's a good, 
craftsmanlike bit of work.  But then&hellip; things got _weird_.  

Yet another round of science by press release &ndash; here at Chez Weekend we understand
the tight schedule constraints &amp; are prepared to be reasonably sympathetic.  But we
are getting a bit testy at having to comb through the vague, blurred, and ambiguous
pronouncements of managers, lawyers, and PR people instead of scientific evidence.  In the
recent cases of [Pfizer](https://www.someweekendreading.blog/pfizer-vaccine-efficacy-data/) and
[Moderna](https://www.someweekendreading.blog/moderna-vaccine-efficacy-data/), this
seems to have worked out mostly ok.  

But not this time.  


## How the AZ/OX vaccine works (_vastly_ oversimplified)  

<img src="{{ site.baseurl }}/images/2020-11-27-astrazeneca-oxford-vaccine-readout-moa.jpg" width="400" height="203" alt="AZ/OX Mechanism of Action" title="AZ/OX Mechanism of Action" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Recall that the AZ/OX vaccine is much more complex.  It uses a viral vector: they take an
existing virus capable of infecting humans, scoop out its genetic material using a
mind-bendingly complex and careful process, then give it the genetic material of _only_
the SARS-COV-2 virus spike protein.  This little chimeric monster is capable of infecting
exactly 1 cell, 1 time, using the protein envelope of the vector virus.  That causes the
SARS-COV-2 spike protein to be made in some quantity in the infected cell.  Your immune
system, theoretically, then reacts to the spike protein and produces immunity.  

The point of the viral vector is to have a protein envelope which (a) preserves the mRNA
in your blood long enough to do something, since bare mRNA is quickly degraded, and (b)
gain entry to 1 cell per virus.  Pfizer, Moderna, and even Sanofi have a lipid nanocapsule
technology that does this without having to use an existing vector virus.  

But&hellip; if you use an existing human virus, some of your population will already be immune
to it (like cold viruses: old people have had a lot of colds).  So they used a simian
adenovirus, ChAdOx1 (basically monkey colds).  Unless you live in close proximity to chimps and
somehow exchange nasal fluids with them, you probably aren't immune to this one.
<sup id="fn1a">[[1]](#fn1)</sup> 

There are a few other differences, like changing an amino acid to stabilize the spike
protein and replacing thei viral leader sequence with human TPA.  These appear to be
engineering concessions to pragmatism, and look pretty reasonable.  

But the simian adenovirus will, sort of, infect human cells. So&hellip; _maybe_ it'll work?  


## The AZ/OX press releases  

<img src="{{ site.baseurl }}/images/2020-11-27-astrazeneca-oxford-vaccine-readout-az-pr.jpg" width="400" height="206" alt="AZ Press Release" title="AZ Press Release" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2020-11-27-astrazeneca-oxford-vaccine-readout-ox-pr.jpg" width="400" height="328" alt="Oxford Press Release" title="Oxford Press Release" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
First up is the press release from AstraZeneca, and the Oxford version.
<sup id="fn2a">[[2]](#fn2)</sup> <sup id="fn3a">[[3]](#fn3)</sup>
They claim 70% efficacy, which is actually pretty good, albeit not quite like the 95%
efficacies seen by Pfizer &amp; Moderna.  But&hellip; there were 2 dosing regimens (and
controls):
- One group got a full dose initially, and a full dose in the second booster.  This group
  had a 62% efficacy rate ($N = 8895$).  
- The other group got a _half dose initially_, and a full dose on the second booster.
  This group had a 90% efficacy rate ($N = 2741$).  

Combining these 2 groups &ndash; _somehow_ <sup id="fn4a">[[4]](#fn4)</sup> &ndash; is
claimed to have an efficacy of 70%.  

One nice thing is that people in the control arm didn't just get an injection of saline,
they got a meningococcal vaccine MenACWY on the first dose, and saline on the second.
Assuming they haven't had MenACWY (or a meningococcus infection), they'll have some
reaction to the first dose and thus won't know they're in the control arm.  Good for
AstraZeneca! (But&hellip; apparently the subjects at the Brazilian sites got saline?!)  

But (again)&hellip; the smell of the rest of the press release immediately raises questions:
- __Why are they doing multiple doses?__  You're supposed to _know the dose_ by the time you
  start Phase 3.  That's what Phases 1 &amp; 2 are _for_: to test safety and find a dose,
  along with any efficacy you can pick up along the way.  The press release is silent
  about why this might be: is it a clever design or an error?  
- __Why is the *high* efficacy response in the *low* dose group?__  Normally you like to see
  the efficacy be dose-responsive, i.e., increase along with the dose (though there are some
  exceptions, which are called instances of
  [_hormesis_](https://en.wikipedia.org/wiki/Hormesis)).  There could be a thousand
  reasons (see below), but the press release just glosses over this like it's No Big
  Deal.  
- __Why do the different dose groups have different age cutoffs?__  The press release
  _does not admit this_, which is a serious breach of truth-telling.  It says COV002 and
  COV003 both require ages 18 or older.  But if you dig a little deeper, you find that the
  lower-dose arm had an upper age cutoff of 55 (so no elders) while the other did not (and
  had elders enrolled).  This means _the dose difference is hopelessly convoluted_ with
  the age of the test population!  Also, the way this was designed, one population was in
  Brazil and the other in the UK, so local habits of living are also convolved with dose.  

That sobbing sound you hear in the background is statisticians all over the world, gently
weeping.  

Ok, we gotta dig deeper!  


## Why does the _lower_ dose get _higher_ efficacy?  

<img src="{{ site.baseurl }}/images/2020-11-27-astrazeneca-oxford-vaccine-readout-in-the-pipeline.jpg" width="400" height="232" alt="Derek Lowe, In the Pipeline" title="Derek Lowe, In the Pipeline" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2020-11-27-astrazeneca-oxford-vaccine-readout-nature.jpg" width="400" height="215" 
alt="Ewen Callaway, Nature" title="Ewen Callaway, Nature" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Our next 2 stops are Derek Lowe's blog 
[_In the Pipeline_](https://blogs.sciencemag.org/pipeline/) at 
[_Science Translational Medicine_](https://stm.sciencemag.org/) <sup id="fn5a">[[5]](#fn5)</sup>, 
and a news article at [_Nature_](https://www.nature.com) by Ewen
Callaway.<sup id="fn6a">[[6]](#fn6)</sup>  Both posit similar
mechanisms to explain why the _lower_ dose had the _higher_ efficacy:  
- Immune systems are highly complex and nonlinear, so maybe there's a feedback mechanism
  to throttle down T cell reactionsn to the high dose?  
- Maybe a high initial dose also induced an immune reaction against the viral vector, so
  those patients were primed to _resist_ the second dose?  
- Maybe there were a lot of asymptomatic but infected people in the trial, who would then,
  according to the trial protocol, be excluded from the endpoint?  
- Crazily, one dose arm included elders while the other did not!  Isn't that a good reason
  to expect different effiacies?  

In some ways, this is satisfyingly perverse: biology is just _maddening_ in the way that
everything interacts with everything else, all the time.  This is the sort of roadblock
you'd expect&hellip; but why didn't the Phase 1/2 dose finding trials find this?  

Now the story takes a slightly darker turn, for 2 reasons:  
1. Nowhere in the AZ/OX press releases did they mention that the low dose group had an age
   cap of 55, while the high dose group did not.  It would be madness to design a trial
   this way, and we only find out about it through other sources.  In this case, it comes
   to us from Moncef Slaoui, the head of Operation Warp Speed. <sup id="fn7a">[[7]](#fn7)</sup>
   So the efficacy difference is hopelessly entangled with age differences in the test
   populations.  
2. It turns out the 2 doses in a Phase 3 trial were not some clever thing, but a blunder
   in manufacturing and delivery: _an accident_. 
   <sup id="fn8a">[[8]](#fn8)</sup> <sup id="fn9a">[[9]](#fn9)</sup> <sup id="fn10a">[[10]](#fn10)</sup>
   Apparently, when this was discovered, AZ &amp; OX went to the regulatory authorities
   (FDA, EMA, &hellip; and whatever the Brazilian equivalent is) and dsclosed this.  Good
   for them; that's the right thing to do.  The regulatory bodies said to continue as if
   it had been designed as a 2-dose vs placebo trial, which is about as much as you can do
   to salvage the situation.  

However, the data are now pretty weird.  Kirka's article <sup>[[10]](#fn10)</sup>
quotes David Salisbury, an associate fellow of the global health program at 
[Chatham House](https://www.chathamhouse.org/):  
>"You've taken two studies for which different doses were used and come up with a
>composite that doesn't represent either of the doses,″ he said of the figure. "I think
>many people are having trouble with that.″  

Indeed!  


## The Bottom Line(s)  

There are 2 bottom lines that I see here:  
1. _We don't really know the efficacy._  One simply cannot average different doses given
   to different age populations living in different countries!  
2. _There is now a trust gap._  Neither AstraZeneca nor Oxford mentioned in their press
   releases that the multi-dose design was the result of an _error_, nor did they admit
   the efficacy difference could be partially explained by _younger test subjects_.  
   
This is the problem with science by press release: the PR is always wordsmithed by PR
people, managers, and lawyers to give it "good spin", sometimes (I hope inadvertently) at
the expense of truth.  I'd be much more understanding if the initial PR had said, "Hey, we
kind screwed up a few things, but the underlying efficacies are still pretty
good some of the time."  But they chose instead to tell just _part_ of the truth.  

Both Pfizer/BioNTech and Moderna/Lonza were pretty convincing.  AZ/OX&hellip; not so
much.  As of yesterday, the AstraZeneca CEO is admitting they might have to do another
Phase 3 clinical trial to clean up the mess. <sup id="fn11a">[[11]](#fn11)</sup>  

Sounds about right.  

## Added 2020-Dec-01  

[A little birdie whispered in my ear](https://blogs.sciencemag.org/pipeline/archives/2020/11/23/oxford-az-vaccine-efficacy-data#comment-333535)
that, based on the _Lancet_ publication of the Phase 2/3 COV002 (UK) trial, AZ/OX had the
doses for their trial sites manufactured by 2 different CMOs.  

A Contract Manufacturing Organization (CMO) will make small to medium-sized batches of
medications for you, to your specifications, under GMP guidelines.  (GMP means Good
Manufacturing Practice, i.e., survivable under FDA auditors.)  This makes sense if you
don't have your large-scale manufacturing line up and going yet.  In exchange for only
somewhat disturbingly large piles of money, you can get enough to run your trial _now_,
rather than later.  Thus in the case of a pandemic, being early to market means fewer
people die.  In more pedestrian cases, it means earlier market entry, with all the revenue
and first-mover advantage implied.  

It's a defensible thing for AZ/OX to have done.  

But&hellip; COBRA Biologics supplied the drug for the 18-55 year old cohort, and Advent
supplied the doses for all the rest.  COBRA apparently messed up and made the first batch
at half strength.  

That explains the source of the half-dose blunder.  It does _not_ explain other blunders:  
- __Why didn't they assay a random sample of the doses they got back from the CMOs?__
  Just a little in-house QC to make sure they had what they think they had could have
  saved a world of grief!  
- __Why didn't they randomize the CMO batches between cohorts?__  One of the things that
  regularly made me tear my hair out in frustration was that some of my experimentalist
  colleagues would resist randomization.  "Too much work", they would say&hellip; and then
  it was somehow _my_ fault when their treatment effect was hopelessly tangled up with
  batch effects.  C'mon, this is _basic_; that's why they call it a _randomized_ clinical
  trial.  You randomly assign patients (from the same age cohort!) to treatment _vs_
  control arms, you randomly assign batches to trial sites, you keep the trial at least
  double-blind (the patient doesn't know what they're getting, the doc doesn't know what
  he's injecting, only the bar codes are recorded and then unblinded at the end).  
- __Why did some cohorts have a 55 year old age cap, while others did not?__  Of _course_ the
  younger cohort responds better!  But now it's all convolved with dose levels, so you
  can't tell what's going on.  
- __Why didn't this come out in their press release, but only after persistent digging?__
  Getting the whole truth out early is fundamental to establishing trust.  

So it's a bit more understandable&hellip; but no prettier.  The AZ/OX vaccine _probably_
works&hellip; but we won't _know_ until there's another trial.  

---

## Notes &amp; References  

<a id="fn1">1</a>: And if you _do_ regularly exchange nasal fluids with monkeys, I don't want to hear about it.  Go make your own _Monkey Snot Blog_, not here. [↩](#fn1a)  

<a id="fn2">2</a>: AstraZeneca, ["AZD1222 vaccine met primary efficacy endpoint in preventing COVID-19"](https://www.astrazeneca.com/media-centre/press-releases/2020/azd1222hlr.html), AstraZeneca press releases, 2020-Nov-23. [↩](#fn2a)  

<a id="fn3">3</a>:  Oxford Univesity, ["Oxford University breakthrough on global COVID-19 vaccine"](https://www.ox.ac.uk/news/2020-11-23-oxford-university-breakthrough-global-covid-19-vaccine), _Oxford University News &amp; Events_, 2020-Nov-23. [↩](#fn3a)  

<a id="fn4">4</a>: The method used must involve Cox regression/Kaplan-Meier curves, for
which the data was not released.  Naïve combination methods don't match the result:  
```R
> (62+90)/2
[1] 76
> (62*8895 + 90*2741) / (8895 + 2741)
[1] 68.59574
```
[↩](#fn4a)  

<a id="fn5">5</a>: D Lowe, ["Oxford/AZ Vaccine Efficacy Data"](https://blogs.sciencemag.org/pipeline/archives/2020/11/23/oxford-az-vaccine-efficacy-data), _In the Pipeline_ at _Science Translational Medicine_, 2020-Nov-23. [↩](#fn5a)  

<a id="fn6">6</a>: E Callaway, ["Why Oxford's positive COVID vaccine results are puzzling scientists"](https://www.nature.com/articles/d41586-020-03326-w), _Nature_, 2020-Nov-23. [↩](#fn6a)  

<a id="fn7">7</a>: J Lauerman &amp; A LaVito, ["Astra Vaccine’s 90% Efficacy in Covid Came
in Younger Group"](https://www.bloomberg.com/news/articles/2020-11-24/astra-vaccine-s-90-efficacy-in-covid-came-in-younger-population), _Bloomberg_, 2020-Nov-24. [↩](#fn7a)  

<a id="fn8">8</a>: L Burger &amp; K Kelland, ["Dosing error turns into lucky punch for
AstraZeneca and Oxford"](https://www.reuters.com/article/us-health-coronavirus-astrazeneca-dosing/dosing-error-turns-into-lucky-punch-for-astrazeneca-and-oxford-idUSKBN28327Q), _Reuters_, 2020-Nov-23.  __NB:__ They can still call it "lucky", since the different age caps were not revealed until the next day, and the efficacy difference could still be called "serendipity". [↩](#fn8a)  

<a id="fn9">9</a>: J Paton &amp; S Ring, ["AstraZeneca Faces More Vaccine Questions After Manufacturing Error"](https://www.bloomberg.com/news/articles/2020-11-26/astra-faces-more-vaccine-questions-after-manufacturing-error), _Bloomberg_, 2020-Nov-26. [↩](#fn9a)  

<a id="fn10">10</a>: D Kirka, ["AstraZeneca manufacturing error clouds vaccine study results"](https://medicalxpress.com/news/2020-11-astrazeneca-error-clouds-vaccine-results.html), _MedicalXPress_, 2020-Nov-25. [↩](#fn10a)  

<a id="fn11">11</a>: S Ring &amp; J Paton, ["Astra Eyes Extra Global Vaccine Trial as Questions Mount"](https://www.bloomberg.com/news/articles/2020-11-26/astra-likely-to-run-fresh-global-covid-vaccine-trial-ceo-says), _Bloomberg_, 2020-Nov-26. __NB:__ It appears the AZ CEO still insists the manufacturing/delivery error was "not a mistake" because they amended the trial protocol to accomodate it.  A rigid insistence on being always right does not inspire confidence, at least not from me. [↩](#fn11a)  
