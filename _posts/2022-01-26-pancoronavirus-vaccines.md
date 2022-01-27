---
layout: post
title: Pan-Coronavirus Vaccines
tags: COVID PharmaAndBiotech 
comments: true
---

Last October, [we noted that NIAID had granted \$36 million for the development of a pan-coronavirus vaccine]({{ site.baseurl }}/covid-misc/#research-on-a-pan-coronavirus-vaccine).  Time for an report: how's that working out?  


## Current news on the pan-coronavirus vaccine front  

Back in October, we noted that the NIAID grants were given to University of Wisconsin at
Madison, Brigham & Women’s Hospital in Boston, and Duke University.  Ironically, the
reports we have today come from none of them, though we didn't dig into exactly why that
is. It could well be that they all did the fundamental research, which fed into the
clinical trials at Walter Reed which are today's subject.  I hope so.  (_Later:_
Apparently not.  All those efforts seem to be independent, and today we're seeing
_another_ effort funded mostly by the US Army.)  

Let's see what's going on!  


## What's the sitch?  

In a word, the sitch is bad.  

<a href="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-owid-1.jpg"><img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-owid-1-thumb.jpg" width="400" height="246" alt="Our World in Data: US weekly COVID-19 death rates by vax status" title="Our World in Data: US weekly COVID-19 death rates by vax status" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-owid-2.jpg"><img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-owid-2-thumb.jpg" width="400" height="247" alt="Our World in Data: US COVID-19 death rates by vax status, week of 2021-Dec-04" title="Our World in Data: US COVID-19 death rates by vax status, week of 2021-Dec-04" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
[From _Our World in Data_](https://ourworldindata.org/covid-deaths-by-vaccination) come
disturbing, though predictable, data on death rates and vaccination status.  Nearly
_every_ media outlest gets confused about this; even this crummy little blog that
nobody reads (_CLBTNR_) has documented the fact:
[the fraction of dead who are vaccinated tells you _nothing_, while the fractoin of the vaccinated who die is what matters]({{ site.baseurl }}/covid-simpson/#but-whats-that-got-to-do-with-covid-19-vaccination-rates-and-hospitalization-rates).
That is, you shouldn't care about $\Pr(\mbox{vaccinated} | \mbox{death})$ (which would be
100% if 100% of the population were vaccinated, so it's clearly meaning-free).
Instead you should care about $\Pr(\mbox{death} | \mbox{vaccinated})$.  The relevant
knowledge is the chance of dying if you're vaccinated vs the chance of dying if you're
not!  

_Our World in Data_ is showing us how to learn this important lesson:  
- Up top is the time series for US deaths _per 100,000_ (so it's normalized to population
  sizes), over time, and broken down by vax status.  (__NB:__ The unvaxed are in a
  frustratingly difficult to see gray line that is much higher, so be sure to find it.)
  You can see clearly that, over 2021-Sep through 2021-Dec, the risk to fully vaccinated
  and fully vaccinated + boosted populations is negligible.  _Almost all the risk of death
  is among the unvaccinated_.  There is something that is cheap (free), easy, and reliable
  you can do so you're not in that high-risk group: get vaccinated &amp; boosted!  
- The lower plot shows us the same data as a bar chart, for the week of 2021-Dec-04.  The
  conclusion is the same, namely that the unvaccinated are at much greater risk.  How much
  more?  Aggregating the vaxed groups, we see it's about 12x:  

$$
\begin{align*}
  \mbox{Risk Ratio} &= \frac{\Pr(\mbox{death} | \mbox{unvaxed})}{\Pr(\mbox{death} | \mbox{vaxed})} \\
                    &= \frac{9.74\%}{0.71\% + 0.10\%} = \frac{9.74\%}{0.81\%} \\
					&= 12.02
\end{align*}
$$

Something cheap, easy, and reliable can reduce your risk of death by 12x; maybe you should
_do_ that thing?  

Many others have had a few tart thoughts on these data, mostly of the form: if you think
there's no point to vaccination, we're completely done tolerating your BS.  As this blog says
right up top that it is devoted to occasional tart thoughts, let's look at one.  Gerry
Doyle of _Reuters_, for example, reminds us that _we can do much better_, using the
example of Singapore:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    singapore is massively vaccinated and is seeing case numbers go up too, but you know what
    isn&#39;t going up? the tiny bit of this pie that isn&#39;t green 
    <a href="https://t.co/ns0F0pPewW">pic.twitter.com/ns0F0pPewW</a>
  </p>&mdash; Gerry Doyle (@mgerrydoyle) <a href="https://twitter.com/mgerrydoyle/status/1486220926400462850?ref_src=twsrc%5Etfw">January 26, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

The green part of the pie chart is people who got asymptomatic or mildly symptomatic COVID,
vs everything else in the miniscule rest of the pie chart.  Singapore is massively
vaccinated, and that's the cause.  

So try to be like them, at least in this respect, ok?  Yeah, I know: the US is not
Singapore.  Before you trot out some American-exceptionalist, hyper-patriot nonsense, let
me point out that I completely understand public health campaigns must be culturally
sensitive.  Consider, for example, France and Germany, 2 of my favorite countries outside
the US:  
<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Both our countries have reputations to uphold.
    <a href="https://t.co/nDp8GCSLvr">https://t.co/nDp8GCSLvr</a>
  </p>&mdash; Bruno Tertrais (@BrunoTertrais) <a href="https://twitter.com/BrunoTertrais/status/1486069786916364290?ref_src=twsrc%5Etfw">January 25, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

Yes, by all means: do whatever the _zeitgeist_ and _l'esprit du temps_ nudge you to do, so
long as you get your people vaccinated.  (On the left, in German: "Impfen hilft, auch
allen die du liebst", or "Vaccination helps, also everyone you love".  On the right, in
French: "Oui, le vaccin put avoir des effets d&eacute;sirables", or "Yes, the vaccine can
have desireable effects".  Indeed.)  

So that's the sitch.  The sitch is not good.  


## Some thngs are happening (slowly, but at least happening)  

<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-nyt.jpg" width="400" height="109" alt="Mueller @ NYT: Pfizer/BioNTech omicron specific vax trial expected to read out in 1H 2022" title="Mueller @ NYT: Pfizer/BioNTech omicron specific vax trial expected to read out in 1H 2022" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-pfizer.jpg" width="400" height="280" alt="Pfizer/BioNTech press release: omicron-specific vax trials started" title="Pfizer/BioNTech press release: omicron-specific vax trials started" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
We are, in fact, developing Omicron-specific vaccines.  Ever since back in 2021-Mar we've
been working on variant-specific vaccines, starting with Delta.  Again, even this _CLBTNR_
has documented
[the then-variant-specific efforts by both Pfizer &amp; Moderna]({{ site.baseurl }}/variants-vs-vaccines/#mrna-vaccines-and-boosters-for-variants)
and [the FDA's then-promise of rapid review, comparable to annual flu vaccines]({{ site.baseurl }}/variants-vs-vaccines/#what-about-the-fda).  

Of course, since then things have moved on &ndash; and not in a good way &ndash; with the
advent of the Omicron variant.  From the _New York Times_ comes a brief piece yesterday
<sup id="fn1a">[[1]](#fn1)</sup>, documenting that clinical trials are happening for the
Pfizer/BioNTech version specific to Omicron.  It's based on a joint Pfizer/BioNTech press
release. <sup id="fn2a">[[2]](#fn2)</sup>  

The trial is mid-sized ($N = 1420$), not one of the monsters with 30,000 enrollees for the
original vaccines.  So it will go faster, even just for that reason.  There are 3 cohorts:  
- $n = 615$: 2 doses current Pfizer vaccine followed by 2 doses Omicron-specific vaccine.
  I.e., this is for fully vaxed _but not boosted_ people.  
- $n = 600$: 3 doses current Pfizer vaccine (fully vaxed and boosted), followed by
  _either_ a fourth dose of the same or the new Omicron-specific vaccine.  This answers
  the question of whether the new vaccine is much better than the old, in a fully vaxed
  and boosted population.  
- $n = 305$: Completely unvaccinated folks get 3 doses of the Omicron vaccine.  This tells
  us about the vaccine na&iuml;ve population, which at this point is still most of the
  world.  Sadly.  That's important, because this is one of the populations where future
  variants will occur, so even selfish people should want to see them vaccinated!  

We can expect a readout of that trial before mid-year, followed by _extremely_ rapid
FDA/VRBPAC review and CDC/ACIP review.  Of course, by next month Omicron will have burned
its way through the US, so I sadly grant that this is not of much immediate utility.  On
the other hand, Pfizer and BioNTech are projecting a capacity to produce _4 billion doses
this year_, enough to re-vaccinte 1/4th of humanity
in the first year of availability.  So there's that.  

Still, we're doing something about Omicron (too slowly), and learning to get better for
the next time.  


## What about 'the next time'?  

And the next&hellip; and the next&hellip; and the next?  I'm tired of the _next pandemic_
always hanging over me!  Can't we do something about that?  

Why, yes.  Yes, we can.  

That's where today's blog post comes in:  

<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-defenseone.jpg" width="400" height="374" alt="Copp @ DefenseOne: Army efforts toward pan-coronavirus vaccine" title="Copp @ DefenseOne: Army efforts toward pan-coronavirus vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-army.jpg" width="400" height="186" alt="US Army: preclinical results on pan-coronavirus" title="US Army: preclinical results on pan-coronavirus" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-cnet.jpg" width="400" height="303" alt="Butler @ c|net: Army effort to end all future COVID pandemics" title="Butler @ c|net: Army effort to end all future COVID pandemics" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
NIAID issued some grants last year for research on pan-coronavirus vaccines, that will
confer immunity to all variants of SARS-CoV2, including the ones that haven't cropped up
yet.  _Probably_ also to the other 6 coronaviruses that infect humans (see this CLBTNR's discussion
[here]({{ site.baseurl }}/really-long-covid/#some-history) and
[here]({{ site.baseurl }}/covid-misc/#research-on-a-pan-coronavirus-vaccine)).  Probably
_not_ (yet) also to the bajillions of coronaviruses currently in animal populations that might
cause yet another pandemic someday, next time we do something stupid to an animal habitat.  

While we haven't come across research reports from the original grantees, things have
apparently been moving along swimmingly elsewhere in the time since 2020-Nov-01 when the
grants were proposed.  We're now reaching the state of human clinical trials.  The early
reports were, frustratingly, non-technical and military (or derived exclusively from
military sources). <sup id="fn3a">[[3]](#fn3)</sup> <sup id="fn4a">[[4]](#fn4)</sup> <sup id="fn5a">[[5]](#fn5)</sup>  
- At least some of the research is happening at Walter Reed, which although definitely a
  military site, is also a very fine research institution.  This effort is 2 years of work
  by approximately 2000 people, so it's _massive_.  
- Animal challenge trials have included the Omicron variant as well as Delta and earlier
  variants, with good outcomes.  
- Phase 1 human clinical trials finished last month, but is as yet unpublished (and
  probably not yet fully analyzed).  Recall that Phase 1 is very early,
  mostly just looking for a safety signal in a small group of people.  Phase 2 will find
  doses and timing, then Phase 3 will verify efficacy.  Those will happen in 2022.
- It's called a "spike ferritin nanoparticle", and because the military requires acronyms,
  it's known as SpFN.  It's variously (and maddeningly vaguely) described as like 
  "a 24-sided soccer ball", which presents mulitple different variant spike proteins on
  its faces.  (That leads to 12-24 variants simultaneously, though I don't see how it can
  be universal to all coronaviruses?)  (Also parenthetically, a soccer ball is a 
  [Goldberg polyhedron](https://en.wikipedia.org/wiki/Goldberg_polyhedron), but has 32
  faces instead of 24. And that's as much as this nerd knows about sportsball, due to a
  lifelong sports aversion induced by beatings by jocks during childhood.)  
- It has an undemanding cold chain, unlike the mRNA vaccines: 36 - 46&deg;F for up to 6
  months and at room temperature for up to 1 month.  
- The best current guess at a dose schedule is 2 primers separated by 28 days and then a
  booster at 6 months after that.  So&hellip; like the mRNA vaccines, pretty much.  
- There's a "smaller" version of the vaccine, which concentrates on the Receptor Binding Domain
  (RBD) subset of the spike protein.  


## A deep(er) dive  

That's about as much as we can learn from press releases and fawning interviews from the
military press.  For a deeper look, we're going to have to find the scientists involved
and see what they think.  

<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-yle.jpg" width="400" height="127" alt="Your Local Epidemiologist: pan-coronavirus 'super' vaccine" title="Your Local Epidemiologist: pan-coronavirus 'super' vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-science.jpg" width="400" height="157" alt="Joyce, et al. @ Science Transl Med: SpFN response in nonhuman primates" title="Joyce, et al. @ Science Transl Med: SpFN response in nonhuman primates" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-pnas.jpg" width="400" height="270" alt="King, et al. @ PNAS: RFN response in nonhuman primates" title="King, et al. @ PNAS: RFN response in nonhuman primates" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Our guides here will be:  
1. Katelyn Jetelina's blog _Your Local Epidemiologist_, who wrote about this 
   2021-Dec-26 <sup id="fn6a">[[6]](#fn6)</sup>.  Eric Topol of Scripps collaborated with
   Jetelina on this post.  
2. The _Science Translational Medicine_ publication of the preclinical data for the SpFN vaccine in 
   primates <sup id="fn7a">[[7]](#fn7)</sup>.  
3. The _PNAS_ publication of the preclinical data for the RFN vaccine in 
   primates <sup id="fn8a">[[8]](#fn8)</sup>.  

### One approach: 'elite neutralizers'  

Some people, for reasons not understood, produce 'broadly neutralizing antibodies' (bnAbs)
tht bind all over the relevant virus.  In the case of SARS-CoV2 this means beyond the
spike protein.  

<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-stm.jpg" width="400" height="205" alt="Martinez et al. @ Science Transl Med: a broadly neutralizing antibody against sarbecoviruses" title="Martinez et al. @ Science Transl Med: a broadly neutralizing antibody against sarbecoviruses" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-26-pancoronavirus-vaccines-stm-fig1e.jpg" width="400" height="243" alt="Martinez et al. @ Science Transl Med: DH1047 dose-response neutralization curve vs 4 coronaviruses" title="Martinez et al. @ Science Transl Med: DH1047 dose-response neutralization curve vs 4 coronaviruses" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
About 10 research groups have found such bnAb examples, and isolated them for study.  A
group at Duke <sup id="fn9a">[[9]](#fn9)</sup> has isolated an antibody with broad
activity agains the RBD of broad families of sarebecoviruses (a viral subgenus containing
SARS-CoV1 and SARS-CoV2, among other things you don't want to hear about).  Their
antibody, DH1047, seems to be an excellent candidate for monoclonal antibody infusion
therapy, if DH1047 can be manufactured at scale.  


### How to cheat  

It's ok, this is a virus.  You can cheat against a virus.  It's allowed.  It's virtuous,
even: it's [_pikuach nefesh_](https://en.wikipedia.org/wiki/Pikuach_nefesh).  

Basically, they've built a ferritin nanoparticle (nanometer scale struture involving iron
atoms), which has "24 sides like a soccer ball".  A soccer ball, as you of course all
remember from gym class, is a
[Goldberg polyhedron](https://en.wikipedia.org/wiki/Goldberg_polyhedron) (a very clever
way of tesselating the unit sphere, mostly with regular hexagons plus 12 distinct
pentagons).  The soccer ball is the Goldberg polyhedron of order $G(1, 1)$, which makes it
a [truncated icosahedron](https://en.wikipedia.org/wiki/Truncated_icosahedron) of 32
faces, not 24.  

So "24 faces like a soccer ball" must be regarded as&hellip; illiteracy, of a sort.  

There are [various solids with 24 faces](https://www.polyhedra.net/en/result.php?type_fev=faces&operator=%3D&number=24&B1=Submit), though, so let's let that one pass.  

If you plant viral antigens on each of those faces (somehow!), you can expose the
patient's immune system to up to 24 variants.  (More likely 8-12, so each variant is on 2
or 3 faces.)  This has been done both with the full spike protein (SpFN) and with just the
receptor binding doman (RBD, so it's called the RFN vaccine).  By that point, you've built
what viruses can only regard as the vaccination [death star](https://en.wikipedia.org/wiki/Death_Star).  

In animal trials, they both induced antibody responses, and at sufficiently high doses
also induced T-cell responses in a pseudovirus neutralization assay.  

The human clincal trials started in 2021-Apr, with trial id 
NCT04784767 <sup id="fn10a">[[10]](#fn10)</sup>.  This proved somewhat difficult to
recruit: participants must not have been previously vaccinated nor had COVID-19!  So you
had to find people who are still unvaccinated, but willing to participate in a vaccine
trial!  I'm pleasantly surprised they could do this.  

That trial has gotten to data lock, and is currently being analyzed.  Chez Weekend, we're
all waiting excitedly.  (Ok, not the cat.  He's&hellip; a cat.)  


## The Weekend Conclusion  

Ok, maybe we can process multiple variants in parallel: a 24-sided ferritin nanoparticle
with 8-12 variant spike proteins/RBDs, at a redundancy factor of 2-3.  

I guess it's come to that: we have to be _that_ clever to evade all the viruses we're
dumping into our population via climate change and animal habitat invasion.  

We might not be this clever for the next one.  Or we might be as bletcherously slow as we
were for this one.  Or we might be done in by great steaming buckets of superstitious
vaccine defiance.  

Heaven help us.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: B Mueller, ["Pfizer and BioNTech begin a study of an Omicron vaccine, with initial results expected in the first half of the year."](https://www.nytimes.com/live/2022/01/25/world/omicron-covid-vaccine-tests#pfizer-and-biontech-begin-a-study-of-an-omicron-vaccine-with-initial-results-expected-in-the-first-half-of-the-year), _New York Times_,  2022-Jan-25. [↩](#fn1a)  

<a id="fn2">2</a>: [Pfizer Media Relations](mailto:PfizerMediaRelations@pfizer.com) & [BioNTech Media Relations](mailto:Media@biontech.de), ["Pfizer and BioNTech Initiate Study to Evaluate Omicron-Based COVID-19 Vaccine in Adults 18 to 55 Years of Age"](https://www.pfizer.com/news/press-release/press-release-detail/pfizer-and-biontech-initiate-study-evaluate-omicron-based), _Pfizer_ press releases, 2022-Jan-25. [↩](#fn1a)  

<a id="fn3">3</a>: T Copp, ["US Army Creates Single Vaccine Against All COVID & SARS Variants, Researchers Say"](https://www.defenseone.com/technology/2021/12/us-army-creates-single-vaccine-effective-against-all-covid-sars-variants/360089/), _Defense One_, 2021-Dec-21. [↩](#fn3a)  
  
<a id="fn4">4</a>: Walter Reed Army Institute of Research, ["Preclinical studies support Army's pan-coronavirus vaccine development strategy"](https://www.army.mil/article/252890/series_of_preclinical_studies_supports_the_armys_pan_coronavirus_vaccine_development_strategy), _US Army_, 2021-Dec-16. [↩](#fn4a)  
  
<a id="fn5">5</a>: P Butler, ["The Army's 'universal vaccine' aims to end all COVID pandemics"](https://www.cnet.com/health/could-a-universal-vaccine-put-an-end-to-covid-pandemics-the-army-is-counting-on-it/), _c_\|_net_, 2022-Jan-22. [↩](#fn5a)  

<a id="fn6">6</a>: K Jetelina, ["Pan-coronavirus "super" vaccine"](https://yourlocalepidemiologist.substack.com/p/pan-coronavirus-super-vaccine), _Your Local Epidemiologist_ blog, 2021-Dec-26. [↩](#fn6a)  

<a id="fn7">7</a>: MG Joyce, ["A SARS-CoV-2 ferritin nanoparticle vaccine elicits protective immune responses in nonhuman primates"](https://www.science.org/doi/10.1126/scitranslmed.abi5735), _Science Translational Medicine_, 2021-Dec-16. [↩](#fn7a)  

<a id="fn8">8</a>: H King, _et al.,_ ["Efficacy and breadth of adjuvanted SARS-CoV-2 receptor-binding domain nanoparticle vaccine in macaques"](https://www.pnas.org/content/118/38/e2106433118.short), _Proc Natl Acad Sci_ 118:38, 2021-Sep-21.  DOI: [10.1073/pnas.2106433118](https://doi.org/10.1073/pnas.2106433118).[↩](#fn8a)  

<a id="fn9">9</a>: D Martinze, _et al.,_ ["A broadly cross-reactive antibody neutralizes and protects against sarbecovirus challenge in mice"](https://www.science.org/doi/10.1126/scitranslmed.abj7125), _Science Translational Medicine_, 14:629, 2021-Nov-02.  DOI: [10.1126/scitranslmed.abj7125](https://doi.org/10.1126/scitranslmed.abj7125). [↩](#fn9a)  

<a id="fn10">10</a>: US Army Medical Research and Development Command, ["SARS-COV-2-Spike-Ferritin-Nanoparticle (SpFN) Vaccine With ALFQ Adjuvant for Prevention of COVID-19 in Healthy Adults"](https://clinicaltrials.gov/ct2/show/NCT04784767), _ClinicalTrials.gov_, 2021-March-05. [↩](#fn10a)  
