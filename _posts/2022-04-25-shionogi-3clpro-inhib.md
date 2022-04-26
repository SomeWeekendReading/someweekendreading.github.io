---
layout: post
title: Japan's Shionogi Ltd. Has Another COVID-19 Antiviral in Late-Stage Trials
tags:  COVID PharmaAndBiotech
comments: true
---

Some good news: there's now _another_ COVID-19 antiviral drug candidate that has the same
target as paxlovid in late clinical trials.  


## Shionogi's announcement  

<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-reuters-1.jpg" width="400" height="179" alt="Reuters: Shionogi COVID-19 pill shows rapid virus clearance" title="Reuters: Shionogi COVID-19 pill shows rapid virus clearance" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-shionogi-1.jpg" width="400" height="157" alt="Shionogi: S-217622 shows rapid virus clearance" title="Shionogi: S-217622 shows rapid virus clearance" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-clinicaltrials-1.jpg" width="400" height="145" alt="NCT05305547 @ ClinicalTrials.gov: S-217622 vs placebo in non-hospitalized high-risk COVID-19 (SCORPIO-HR)" title="NCT05305547 @ ClinicalTrials.gov: S-217622 vs placebo in non-hospitalized high-risk COVID-19 (SCORPIO-HR)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
_Reuters_ reported yesterday <sup id="fn1a">[[1]](#fn1)</sup> that the Japanese
pharmaceutical company Shionogi has some results from a COVID-19 antiviral therapy,
currently in Phase 2/3.  Known variously by its internal id, generic name, and commercial
name as [S-217622, ensitrelvir, or Xocova](https://en.wikipedia.org/wiki/Ensitrelvir), 
it apparently showed rapid clearance of virus.  It apparently shortened the time course of
disease, but didn't alter symptoms much in the short run, which sounds odd.  

Reluctantly digging into the Shionogi press release <sup id="fn2a">[[2]](#fn2)</sup>
(despite our aversion to corporate press releases), we find that the results were
presented at a conference, the 32nd European Congress of Clinical Microbiology &
Infectious Diseases (ECCMID) in Lisbon, 23 – 26 April reporting the Phase 2/3 trial results:
- The drug inhibits 3CLpro, the same target as paxlovid.  
- In the paxlovid trial subjects were unvaccinated; here 85% were vaccinated, which is a
  good reflection of reality.  
- The subjects had no particular risk factors.  
- Treatment had to start within a 5-day window of symptoms (also like paxlovid).  
- There was rapid virus clearance.  After 3 doses, there were 90% fewer patients with a
  positive viral titer compared to placebo.  
- The infectious period was shortened by 1-2 days.  
- Symptoms didn't get much better than placebo, except for "respiratory and feverish"
  symptoms (measured _post hoc,_ for some reason).  
- There were no serious adverse events.  

A Phase 3 trial <sup id="fn3a">[[3]](#fn3)</sup> is in progress: NCT05305547, apparently
known as SCORPIO-HR, because all clinical trials must by law have a cute but irrelevant
mnemonic.  


## The inevitable Nimrod  

<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-shionogi-2.jpg" width="400" height="204" alt="Shionogi: Fetal development reports are not relevant" title="Shionogi: Fetal development reports are not relevant" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Of course, it's not all roses.  Inevitably, some Nimrod decided that there
might be evidence of fetal skeletal abnormalities in pregnant people.  <sup id="fn4a">[[4]](#fn4)</sup>
According to _Reuters_, that drove the stock price down 16%.  So the company politely pointed out
that:  
- These abnormalities in _preclinical animal studies_ occurred only at doses much higher
  than would be used in humans, and  
- Pregnancy is very easy to screen for ahead of therapy, in case it _does_ turn out to matter.  

So&hellip; basically irrelevant as far as _actual_ humans are concerned.  


## Some thoughts on the mechanism  

<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-orf1ab.jpg" width="400" height="205" alt="EntrezGene: Viral polyprotein gene ORF1ab" title="EntrezGene: Viral polyprotein gene ORF1ab" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-3clpro.jpg" width="400" height="362" alt="Wikipedia: 3-chymotrypsin-like protease/nsp5" title="Wikipedia: 3-chymotrypsin-like protease/nsp5" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The mechanism is apparently the same mechanism as nirmatrelvir, one of the 2 components of
paxlovid.  

Basically, many viruses, including coronaviruses, have a giant gene called
[ORF1ab](https://www.ncbi.nlm.nih.gov/gene/43740578).  ("ORF" stands for "Open Reading
Frame", which is a genetic pattern signalling that a gene starts here.)  Unlike most
genes, this makes a _polyprotein:_ several proteins strung together in a long string of
amino acids.  

Since it can't function like that, it has to be snipped up into pieces that form the
individual functional proteins.  That's the function of a protease (the "ase" ending indicates an
enzyme, i.e., a protein that acts in some other chemical reaction, here like snipping up a
polyprotein).  The protease in question is
[3C-like protease/3CLpro/Mpro](https://en.wikipedia.org/wiki/3C-like_protease): gum this
up, and ORF1ab can't make several proteins crucial to viral reproduction.  

<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-S-217622_structure.jpg" width="400" height="279" alt="Wikipedia: Structure of ensitrelvir/Xocova/S-217622" title="Wikipedia: Structure of ensitrelvir/Xocova/S-217622" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So Shionogi's scientists came up with ensitrelvir, shown here.  (Compare with the
[structure of nirmatrelvir in paxlovid]({{ site.baseurl }}/how-to-discover-paxlovid/).)  

It messes up the function of 3CLpro, so it can't cleave the output of ORF1ab, and several
crucial viral proteins can't be made.  The nice bit is that there is no human 3CLpro, so
you've got a nice wide dose window before you start hitting human proteins off-target.  


## The Weekend Conclusion  

So why bother making another paxlovid?  At least 2 reasons:  
1. Inevitably, there will be differences where __some people respond to one drug but not the
   other.__  We see this all the time, for example with cholesterol lowering drugs or blood
   pressure lowering drugs.  Best to have a broad armamentarium.  
2. Paxlovid is actually 2 compounds: nirmatrelvir to block 3CLpro, and ritonavir to block
   the liver's efforts to degrade it.  The ritonavir makes the effect last
   longer by prolonging the lifetime of nirmatrelvir in the blood.  BUT: this makes the
   liver break down more or less _every other drug_ more slowly too, causing annoying
   drug-drug interactions!  If &ndash; and it's a big, unchecked "if" &ndash; ensitrelvir
   can do without an adjuvant like ritonavir, then it __might evade those drug-drug
   interactions,__ physicians will prescribe it more easily, more people will get it and not
   die.  

Still, it won't be up for approval until later this year.  

<img src="{{ site.baseurl }}/images/2022-04-25-shionogi-3clpro-inhib-test-to-treat.jpg" width="400" height="502" alt="US COVID-19 Test-to-Treat Locator" title="US COVID-19 Test-to-Treat Locator" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
In the meantime, should you find yourself so unfortunate as to test positive for COVID-19
or even have symptoms, see your doc immediately and ask about either paxlovid or a
monoclonal antibody infusion of bebtelovimab (the one that still works against Omicron).  

If you have trouble finding paxlovid or somebody willing to write a scrip for it, use the
federal test-to-treat program: you show up, get tested, and if positive get prescribed.
The US Federal test-to-treat locator <sup id="fn5a">[[5]](#fn5)</sup> will help you find a
place to do that.  

It just now found 305 locations within 10 miles of Chez Weekend, outside Boston.  That's a
target-rich environment, but you should be able to find something nearby in most areas in
the US with reasonable population density.  

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

<a id="fn1">1</a>: _Reuters_ Staff, ["Japan's Shionogi says COVID-19 pill shows rapid clearance of virus"](https://www.reuters.com/business/healthcare-pharmaceuticals/japans-shionogi-says-covid-19-pill-shows-rapid-clearance-virus-2022-04-24/), _Reuters_, 2022-Apr-24. [↩](#fn1a)  

<a id="fn2">2</a>: Shionogi Corporate Communications, ["New Data for Shionogi’s COVID-19 Once-Daily Oral Antiviral S-217622 Show Rapid Virus Clearance"](https://www.shionogi.com/global/en/news/2022/04/20220424.html), Shionogi &amp; Co., Ltd. Press Releases, 2022-Apr-24. [↩](#fn2a)  
<!-- Almost exactly the same: https://www.shionogi.com/us/en/news/2022/04/new-data-for-shionogis-covid-19-once-daily-oral-antiviral-s-217622-show-rapid-virus-clearance.html -->

<a id="fn3">3</a>: Shionogi &amp; Co., Ltd., ["A Study to Compare S-217622 With Placebo in Non-Hospitalized High-Risk Participants With COVID-19 (SCORPIO-HR)"](https://clinicaltrials.gov/ct2/show/NCT05305547), _ClinicalTrials.gov_ trial id NCT05305547, retrieved 2022-Apr-25. [↩](#fn3a)  

<a id="fn4">4</a>: Shionogi Corporate Communications, ["Notice Regarding the Media Coverage about S-217622, a Therapeutic Drug for COVID-19"](https://www.shionogi.com/global/en/news/2022/04/e-20220413.html), Shionogi &amp; Co., Ltd. Press Releases, 2022-Apr-13. [↩](#fn4a)  

<a id="fn5">5</a>: HHS Office of the Assistant Secretary for Preparedness and Response, ["COVID-19 Test to Treat Locator"](https://aspr.hhs.gov/testtotreat/Pages/default.aspx), Office of the Assistant Secretary for Preparedness &amp; Response, US Department of Health &amp; Human Services, retrieved 2022-Apr-25. [↩](#fn5a)  
