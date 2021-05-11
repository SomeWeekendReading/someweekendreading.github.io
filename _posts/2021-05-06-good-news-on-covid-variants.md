---
layout: post
title: Good news on vaccines vs variants!
tags: COVID MathInTheNews PharmaAndBiotech Statistics
comments: true
---

Some good news, for once: the Pfizer/BioNTech vaccine is now known to work quite well
against the British &amp; South African variants in the real world.  Especially in preventing
hospitalization and death.  


## What's the Sitch?  

This exceptionally annoying virus is continuing to mutate.  These were the high points of
the mutation situation last February <sup id="fn1a">[[1]](#fn1)</sup>, and since then it's
only gotten worse, with more variants:  

![Economist: Public Health England's estimate of SARS-CoV-2 phylogenetic tree]({{ site.baseurl }}/images/2021-03-30-variants-vs-vaccines-variant-tree.jpg "Economist: Public Health England's estimate of SARS-CoV-2 phylogenetic tree")

There are 3 things to worry about with a new variant:  
1. __Does it spread faster?__  Increased affinity of the spike protein's receptor binding domain (RBD) for human ACE2 protein will cause this.  More cases, more deaths.  
2. __Is it more deadly?__  A higher replication efficiency will do this.  Same number of cases, but more deaths.  
3. __Is it an escape mutation, i.e., evading vaccine protection?__  The vaccines are trained on the spike protein of "corona classic" (with [some very clever modifications we wrote about previously]({{ site.baseurl }}/reading-mrna-vaccines/)).  A modified spike protein could get around that.  
   
So far, we've seen pretty good evidence of worry #1, higher spread, in both the B.1.1.7
(British, or as a British friend puts it "the Kent strain" for the county where it was
found) and B.1.351 (South African) variants.  

Fortunately, there doesn't _yet_ seem to be strong evidence of #2, higher mortality.  

But what about worry #3, vaccine escape mutations?  The evidence so far has been
equivocal, and largely _in vitro_:  
<img src="{{ site.baseurl }}/images/2020-12-31-coronavirus-mutation-vs-vaccine-hou-neutralization.jpg" width="400" height="328" alt="Hou, et al.: Abs neutralizing wild-type SARS-CoV-2 also work vs mutant" title="Hou, et al.: Abs neutralizing wild-type SARS-CoV-2 also work vs mutant" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-03-30-variants-vs-vaccines-ofid-tcells-variants.jpg" width="400" height="292" alt="OFID: CD8+ T cells from COVID infection target conserved epitopes" title="OFID: CD8+ T cells from COVID infection target conserved epitopes" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- Last December, [we looked at a paper in _Science_ by Hou, _et al._]({{ site.baseurl }}/coronavirus-mutation-vs-vaccine/)<sup id="fn2a">[[2]](#fn2)</sup> showing that antibodies still had good neutralization curves against a D614G variant.  That's nice; a beautiful bit of work, even.  But it's not in people, or even in an animal, and it's not one of the exact variant's that are so scary.  So it's a glimmer of hope, but just a glimmer.  
- Then in March, [we looked at some news analysis by Wise in the _BMJ_]({{ site.baseurl }}/variants-vs-vaccines/) <sup id="fn3a">[[3]](#fn3)</sup> which was far less hopeful.  Apparently the required antibody concentration for neutralization of the E484K variant was much higher.  Ruh roh&hellip;  
- Fortunately, in that same post we also saw some evidence from Redd of NIAID <sup id="fn4a">[[4]](#fn4)</sup> that CD8+ T cells were still active against the British, South African, and Brazilian variants.  So even if it takes more antibodies, your immune system remembers and knows it can kill cells infected with variants.  


## Today's Good News  

So&hellip; mixed evidence, all of it in the lab and not in people or even animals.  

<img src="{{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-nyt.jpg" width="400" height="190" alt="NYT: Pfizer/BioNTech protects against severe outcomes of some variants" title="NYT: Pfizer/BioNTech protects against severe outcomes of some variants" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
That's why I was _very_ happy to see a news report in the 
_New York Times_ <sup id="fn5a">[[5]](#fn5)</sup> alleging they had evidence that the
Pfizer/BioNTech vaccine worked to prevent the most severe outcomes (hospitalization &amp;
death: remember, the goal is _not to die_) in some SARS-CoV-2 variants.  The summary:  
- These 2 studies were done on large, real-world popuations in Qatar and Israel.  So it's not 
  _in vitro_ lab data, but actual human beings going about their lives, misbehaving in
  various virus-sensitive ways, and so on.  The real world.  
- Sequencing indicated most of the infections in those countries were variants of concern:
  B.1.1.7 and B.1.351.  
- While [the AZ/OX vaccine appears to be somewhat less effective against
  B.1.351](https://www.nytimes.com/2021/02/07/world/south-africa-astrazeneca-vaccine.html),
  Pfizer/BioNTech had good efficacy against infection and near-perfect efficacy at
  preventing severe disease and death.  

<img src="{{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-nejm.jpg" width="400" height="151" alt="NEJM: Pfizer/BioNTech vs British and South African variants in Qatar" title="NEJM: Pfizer/BioNTech vs British and South African variants in Qatar" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-lancet.jpg" width="400" height="146" alt="Lancet: Pfizer/BioNTech vs British and South African variants in Israel" title="NEJM: Pfizer/BioNTech vs British and South African variants in Israel" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
While the _NYT_ has its problems with rampant both-siderism, this looked worth digging
into.  So I had a look at the papers: the Qatari study by Abu-Raddad, _et al._ is pubished
in the _NEJM_ <sup id="fn6a">[[6]](#fn6)</sup>, and the Israeli study by Haas, _et al._ is
published in _The Lancet_. <sup id="fn7a">[[7]](#fn7)</sup>

Each of them follows real-world populations, country-wide.  This leads to very good
statistics indeed: 265,410 Qataris had both doses and more than 230,000 Israeli cases.
(That's the sort of good stuff that happens when you have a well-integrated national
healthcare system with good electronic medical records.  Maybe one day the US will do
that, and rejoin the developed world.)  

Each of them looks, at first glance, to be statistically sound: they did near-universal sampling of their national healthcare system to avoid bias, they calculated 95% confidence limits on their efficacies, and all that.  (We've [looked at how to calculate vaccine efficacy confidence limits before]({{ site.baseurl }}/pfizer-vaccine-efficacy-confidence-intervals/), so this is checkable.)  While I haven't looked through their methodologies with a fine-tooth comb, it looks great to me and they're publishing in _extremely_ high quality academic journals anyway.  

So if we decided to believe them, what would we end up believing?

Here's the summary table from the Qatari study:  
![Abu-Raddad, et al.: Vaccine efficacy against variant infection or severe disease]({{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-nejm-table.jpg "Abu-Raddad, et al.: Vaccine efficacy against variant infection or severe disease")
- It first looks at efficacy against any COVID-19 infection at all.  It looks like, 14
  days after the second dose of Pfizer, the efficacy is 89.5% (CL: 85.9% - 92.3%) against
  the British variant, and 75.0% (CL: 70.5% - 78.9%) against the South African.  (Check
  out those beautifully narrow confidence limits!  Large sample size, my dudes.  Large
  samples size.)  
- That's less than the 95% from the original clinical trial, but recall that annual flu
  vaccines save lives with 50% - 60% efficacy.  This is _way_ more than enough!  
- If you restrict attention to severe, critical, or fatal disease (defined in the paper),
  then the efficacy is 100% against both variants (with wider confidence limits, as
  appropriate for something that almost never happens).  
- Best of all: the efficacy against severe disease from _any SARS-CoV2 at all_ is 97.4%
  (CL: 92.2% - 99.5%).  That's _spectacular._  

Here's the similar result table from the Israeli study:  
![Haas, et al.: Vaccine efficacy against B.1.1.7 infection or severe disease by age group]({{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-lancet-table.jpg "Haas, et al.: Vaccine efficacy against B.1.1.7 infection or severe disease by age group")
- First, we note that they are talking about a population infected by B.1.1.7 in almost
  95% of the cases.  Fast-spreading variants crowd out all the others.  
- Note also that they break down their results by age group and by severity (any
  infection, asymptomatic, symptomatic, hospitalized, critical, and deadly).  So you can
  look at all sorts of strata, depending on your interest.  We should be most interested
  in hospitalization or worse, because: the goal is _not to die._  (I dunno why I have to
  keep repeating that, but here we are.)  
- I like this table: it makes it easy to answer questions that are of great concern to
  me.  For example, as mid-60s sort of people who are 2 weeks past our 2nd dose of Pfizer,
  what's the efficacy of our vaccine against COVID-19 death due to B.1.1.7?  See the last
  row of the table: 96.7% (confidence limit: 96.0% - 97.3%).  Very reassuring.  (Though,
  maybe we have to emigrate to Israel to make this apply to us?  Hmmm.)  

Absolutely fabulous result!  Both scientifically (big, clean datasets analyzed clearly)
and in in terms of the good news they bring.  This, dear readers, is _how it is done._  


## The Weekend Conclusion  

In particular, the table above from the Abu-Raddad study is hopeful: if you can get to 14 days
past the second dose of Pfizer/BioNTech (though really, Moderna is likely to be nearly
identical), then your risk is virtually eliminated for severe/critical/fatal disease with
SARS-CoV2 classic, British, or South African variants.  

The table from the Haas study is also chock-full of good news for us here at Chez Weekend,
as sixty-somethings: the efficacy vs severe disease from the British variants is 96% - 97%
in our age group.  

I'm relieved to note that both
[your humble Weekend Editor]({{ site.baseurl }}/immunity-freedom-day/) and 
[Weekend Editrix]({{ site.baseurl }}/immunity-freedom-editrix/) are now fortunate enough
to find ourselves in that position (as we hope all humanity can be soon).  Maybe we can
venture forth out of our front yard sometime?  

We don't know yet about the Indian or Brazilian variants, and we don't know about the JnJ
or AZ/OX vaccines.  _But at least one thing is working well._


## Addendum 2021-May-09: Moderna, too.  Also, P.1 from Brazil.  

<img src="{{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-moderna-pr.jpg" width="400" height="165" alt="Moderna PR: Initial look at boosters and variants" title="Moderna PR: Initial look at boosters and variants" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-moderna-preprint.jpg" width="400" height="341" alt="Moderna preprint: Initial look at boosters and variants" title="Moderna preprint: Initial look at boosters and variants" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

Moderna issued a press release <sup id="fn8a">[[8]](#fn8)</sup> and an (not yet peer
reviewed) paper <sup id="fn9a">[[9]](#fn9)</sup> on the medR$\chi$iv preprint server.  
- This is a preliminary readout from a Phase 2 trial of 3 different strategies:  
  - Just a 3rd booster shot of mRNA-1273 (the Moderna vaccine now in use)  
  - A booster called mRNA-1273.351, which is tailored to the South African strain's spike protien  
  - A combined booster mixing both of those 1:1, to be called mRNA-1273.211  
- They measured neutralizing antibody titers with a pseudovirus neutralization assay,
  using classic SARS-CoV-2, the South African variant (B.1.351) and the Brazilian variant
  (P.1).  Response was good in all cases: 12x - 35x higher, if I'm reading their figure right.  
- The statistics were nice and straightforward: geometric mean titer on log-tansformed
  titers, with a 95% CI calcluated from a $t$-distribution and significance from a
  Wilcoxon matched-pairs signed rank test.  
- The side effects were comparable to the previous doses.  

![Moderna: neutralizing ab titers response to boost in 3 coronavirus variants]({{ site.baseurl }}/images/2021-05-06-good-news-on-covid-variants-moderna-preprint-figure.jpg "Moderna: neutralizing ab titers response to boost in 3 coronavirus variants")

This, combined with similar news from Pfizer and a promise from the FDA of rapid review
(comparable to the review done on an annual flu vaccine), makes for very good news.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Public Health England graphic, ["The same covid-19 mutations are appearing in different places"](https://www.economist.com/graphic-detail/2021/02/27/the-same-covid-19-mutations-are-appearing-in-different-places), _The Economist_, 2021-Feb-27. [↩](#fn1a)  

<a id="fn2">2</a>: Y Hou, _et al._, ["SARS-CoV-2 D614G variant exhibits efficient replication ex vivo and transmission in vivo"](https://science.sciencemag.org/content/370/6523/1464), _Science_ 370:6253 (2020-Dec-18), pp 1464-1468. DOI: 10.1126/science.abe8499 [↩](#fn2a)  

<a id="fn3">3</a>: J Wise, ["Covid-19: The E484K mutation and the risks it poses"](https://www.bmj.com/content/372/bmj.n359), _BMJ_ 2021, 372:n359. [↩](#fn3a)  

<a id="fn4">4</a>: A Redd, _et al._, ["CD8+ T cell responses in COVID-19 convalescent individuals target conserved epitopes from multiple prominent SARS-CoV-2 circulating variants"](https://academic.oup.com/ofid/advance-article/doi/10.1093/ofid/ofab143/6189113), _Open Forum Infectious Diseases_ ofab143, 2021-Mar-30.  [DOI: 10.1093/ofid/ofab143](https://doi.org/10.1093/ofid/ofab143).[↩](#fn4a)  

<a id="fn5">5</a>: E Anthes, ["Covid-19: Studies Indicate Pfizer-BioNTech Vaccine Protects Against the Most Severe Outcomes of Some Virus Variants"](https://www.nytimes.com/live/2021/05/05/world/covid-vaccine-coronavirus-cases#pfizer-vaccine-variants-covid), _New York Times_ live blog, 2021-May-06.[↩](#fn5a)  

<a id="fn6">6</a>: L Abu-Raddad &amp; A Butt, ["Effectiveness of the BNT162b2 Covid-19 Vaccine against the B.1.1.7 and B.1.351 Variants"](https://www.nejm.org/doi/10.1056/NEJMc2104974), Letters to _The New England Journal of Medicine_, 2021-May-05.  DOI: 10.1056/NEJMc2104974.[↩](#fn6a)  

<a id="fn7">7</a>: EJ Haas, _et al.,_ ["Impact and effectiveness of mRNA BNT162b2 vaccine against SARS-CoV-2 infections and COVID-19 cases, hospitalisations, and deaths following a nationwide vaccination campaign in Israel: an observational study using national surveillance data"](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(21)00947-8/fulltext), _The Lancet_ (in press, corrected proof) 397:10285, 2021-May-1-7.  DOI:[10.1016/S0140-6736(21)00947-8](https://doi.org/10.1016/S0140-6736(21)00947-8). [↩](#fn7a)  

<a id="fn8">8</a>: C Hussey (media contact), ["Moderna Announces Positive Initial Booster Data Against SARS-CoV-2 Variants of Concern"](https://investors.modernatx.com/news-releases/news-release-details/moderna-announces-positive-initial-booster-data-against-sars-cov), Moderna Press Releases, 2021-May-05.[↩](#fn8a)  

<a id="fn9">9</a>: K Wu, _et al.,_ ["Preliminary Analysis of Safety and Immunogenicity of a SARS-CoV-2 Variant Vaccine Booster"](https://www.medrxiv.org/content/10.1101/2021.05.05.21256716v1.full-text), medR$\chi$iv, 2021-May-06. [↩](#fn9a)  
