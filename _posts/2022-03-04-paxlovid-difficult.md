---
layout: post
title: On the Difficulty of Making Paxlovid
tags:  COVID PharmaAndBiotech SomebodyAskedMe
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) why we don't have enough
paxlovid or bebtelovimab to go around.  After mumbling "something something supply chain",
they ask another question: why can't we just make more, and faster?  Far from being
na&iuml;ve, that's a very good question.  


## Why You Should Care  

Who cares how fast anybody can make paxlovid or bebtelovimab?  Well, _you_ should care: Omicron
is not done with us, and the next variant might be immune/vaccine-evasive.  In that case,
an oral protease inhibitor like paxlovid or the last Omicron/BA.2-effective antibody
infusion like bebtelovimab is the difference between living and dying.  

<img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-nature-1.jpg" width="400" height="242" alt="Iketani, et al. @ Nature: Omicron sublineages and antibody evasion" title="Iketani, et al. @ Nature: Omicron sublineages and antibody evasion" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
A rather frightening paper out yesterday by Iketani, _et al._ in 
_Nature_ <sup id="fn1a">[[1]](#fn1)</sup> documents that the Omicron/BA.2 variant
(a.k.a. B.1.1.529.2) is indeed resistant to the last then-authorized antibody infusion,
sotrovimab.  It does seem to be sensitive to bebtelovimab, but that was only licensed a
few weeks ago and thus has severely limited availability.  

<img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-sn-1.jpg" width="400" height="71" alt="Saey @ Science News: Why Omicron is so infectious" title="Saey @ Science News: Why Omicron is so infectious" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
But _why_ is Omicron so nasty?  An semi-popular science article in _Science News_ by Tina
Saey <sup id="fn2a">[[2]](#fn2)</sup> gives us a quick overview, with pointers to the
primary scientific literature.  

Reducing her article to a bullet list and not diving deeply into each paper, I get this summary:  

- Since 2021-Dec, Omicron has infected about 90 million people in about 10 weeks, more
  than all other COVID-19 cases in all of 2020.  It's _just that_ contagious!  (Though
  somewhat less deadly.)  
- There are 42 mutations in the spike protein alone, which is important since all the
  vaccines prime the immune system with the original spike protein.  
- Those mutations mean it can infect nearly 10x as many cells as earlier
  versions. <sup id="fn3a">[[3]](#fn3)</sup>  
- The spike protein ends in something like a 3-fingered claw (like a
  [_thrint_ hand](https://larryniven.fandom.com/wiki/Thrint#Biology)?!) to grab the human
  ACE2 receptor.  The Omicron variant curls in the knuckes a bit, somewhat hiding the antibody
  attack surfaces. <sup id="fn4a">[[4]](#fn4)</sup>  
- The Omicron spike protein contains multiple mutations stabilizing it through additional
  H bonds, which also help the virus stay together. <sup id="fn5a">[[5]](#fn5)</sup>  
  <a href="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-gan.jpg"><img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-gan-thumb.jpg" width="400" height="254" alt="Gan, et al. @ bioR&chi;iv: improved negative charge distribution in Omicron spike" title="Gan, et al. @ bioR&chi;iv: improved negative charge distribution in Omicron spike" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Omicron arrays more polar amino acids in a way to increase electrostatic attraction to
  the negative charges displayed by ACE2, 3-5x more so than Delta. <sup id="fn6a">[[6]](#fn6)</sup>  
<a href="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-hui.jpg"><img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-hui-thumb.jpg" width="400" height="270" alt="Hui, et al. @ Nature: Omicron uses cathepsin L endosome" title="Hui, et al. @ Nature: Omicron uses cathepsin L endosome" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Omicron uses the TMPRSS2 entry pathway less often <sup id="fn7a">[[7]](#fn7)</sup>,
  favoring instead the cathepsin L endosome method. <sup id="fn8a">[[8]](#fn8)</sup>  This means it
  doesn't _quite_ merge as well as Delta.  But on the other hand, it means cells don't try
  to merge with each other and die, leaving the virus with no way to reproduce.  
- Both Delta and Omicron get past the IFTIM proteins that guard
  entry. <sup id="fn9a">[[9]](#fn9)</sup>  
- Unvaccinated people are the most likely to get infected: about 3% of the unvaccinated
  contracted Omicron by January 8, as reported in the CDC COVID Data Tracker as of 
  2022-Mar-01. <sup id="fn10a">[[10]](#fn10)</sup>  
- Omicron is _especially_ good at spreading from cell to cell by preventing immune
  surveillance, estimated at 5x better than earlier versions. <sup id="fn11a">[[11]](#fn11)</sup>
  Some of this may be due to the increased positive charge that binds to the ACE2 receptor
  better, while simultaneously repelling some antibodies.  
- Also, some particularly cunning placement of a sugar in Omicron's spike may guard
  against the immune system. <sup id="fn12a">[[12]](#fn12)</sup>  
- People keep saying Omicron is "milder", though there are a number of problems in
  figuring out the extent to which that is true. <sup id="fn13a">[[13]](#fn13)</sup>
  But vaccines still work pretty well against Omicron <sup id="fn14a">[[14]](#fn14)</sup>,
  as does, to some degree, breakthrough infection. <sup id="fn15a">[[15]](#fn15)</sup>
  Overall, the UK's Health Security Agency estimated the risk of death from Omicron at
  about 60% of the risk from Delta. <sup id="fn16a">[[16]](#fn16)</sup>  
- Some reasons for mildness may be that it doesn't replicate as well in 
  lung <sup>[[8]](#fn8)</sup> and that it triggers interferon 
  responses <sup id="fn17a">[[17]](#fn17)</sup> which invoke antiviral immunity.  

Overall, Omicron is a nasty bit of work.  Now that the BA.2 variant of Omicron is here, we
stand in need of therapies for breakthrough infections, or, Heaven forbid, vaccine-evasive
variants.  

Because the _next_ coronavirus pandemic, whether it's SARS or something else, _will_
come.  When it does, having something like paxlovid that appears to be active against
coronaviruses generally (acting on a highly conserved protease target), will be
essential.  


## MBAs Have Shackled the World in Supply Chains  

So&hellip; paxlovid still has a long, complicated, global supply chain, eh?  Why haven't
we learned anything about the consequences of always doing that yet?  

Yeah, I know: it's cheaper in an NPV sense to stitch together a long, complicated supply
chain, because
[Ricardo's law of comparative advantage](https://en.wikipedia.org/wiki/Comparative_advantage)
is a thing.  

But: a global supply chain only works when (a) countries want to cooperate in trade &amp;
currency exchange markets, (b) global shipping works quickly &amp; doesn't emit so much
CO2 that climate change kills everybody, and (c) there's not a pandemic causing worker
shortages with shipping containers piling up in ports.  

Have you noticed how all 3 of those propositions are a bit dubious lately?  

So these fancy supply chains are like what people in the stock market say of a high-priced
stock, that it's "priced for perfection".  That is: if everything goes pefectly, then this
high price is rational; but at the first stumble it's priced too high and people will sell,
causing the share price to crash.  Global supply chains are "priced for perfection", not
for robustness in the face of international trade/currency friction, climate change, and
pandemics.  

What do you think: will the future have more or less of international friction, climate
change, and pandemics?  If you think _more_, then you should also believe we need to
shorten supply chains and do more domestic production even if it's at higher prices.  Not
complete autarky, just _shorter_ supply chains and _more_ domestic production.  

Robustness is not free, after all.  


## Some things are hard to make, others slow, and some both  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Pfizer's new COVID-19 pill can take months to make.  Company officials say they plan to expand production this year.<br><br>

    Why does it take so long? <a href="https://twitter.com/thpmurphy?ref_src=twsrc%5Etfw">@thpmurphy</a> explains: <a href="https://t.co/MqPgaWxmIi">https://t.co/MqPgaWxmIi</a> <a href="https://t.co/8NNuynIkL5">pic.twitter.com/8NNuynIkL5</a>
  </p>&mdash; The Associated Press (@AP) <a href="https://twitter.com/AP/status/1499126568697970689?ref_src=twsrc%5Etfw">March 2, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

I don't, and won't, read Twitter.  The short attention span takes of the uninformed are
not useful to _anybody,_ and that's most of what Twitter is about.  Sure, there are a few
entertaining souls, and a few well informed sorts.  But I wait for _other_ people to find
those, and bring them to my attention in a blog or an article or something.  

The AP tweet above is one such, indicating that somebody had done a small bit of digging
&ndash; basically asking Pfizer &ndash; into why paxlovid takes a long time.  It's really
interesting and we're going to move to the AP article itself next, but&hellip; do not,
under any circumstances, read the reply tweets!  The level of stupidity is well beyond
toxic:  
- Multiple assertions that this is just a cash cow for Pfizer to get money from dying
  people, and anybody who disagrees is a stockholder.  
- Sly assertions that vaccines "just don't work", so somehow this won't work either.  
- Even more blatant assertions that the Pfizer vaccine is somehow harmful, so one
  shouldn't take a pill from the same company.  
- Repeated, and I mean _repeated_, implications that somehow both paxlovid and
  molnupiravir are just ivermectin, 
  [studiously rebunked despite repeated debunking](https://www.someweekendreading.blog/ivermectin-takedowns/#but-covid-19).
  These really seem to be fact-proof beliefs on the dimwitted right.  
- Utterly bogus assertions that a viral therapeutic "isn't needed", and "COVID's over".  
- A few _really_ weird off-topic religious assertions that aren't even _internally_
  consistent.  
- Outlandish claims that side-effects are being hidden, similar to outlandish claims of
  hidden side-effects in vaccines.  
- Wild assertions that vacines cause Parkinson's-like body tremors, so maybe this
  medication will cause some horrible side-effect.  

&hellip;and so on, _ad nauseam._  Now you know why I refuse to touch Facebook or Twitter.  

<img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-ap-1.jpg" width="400" height="172" alt="Murphy @ AP: Why making paxlovid takes a long time" title="Murphy @ AP: Why making paxlovid takes 
a long time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<iframe width="400" height="224" src="https://www.youtube.com/embed/8GHvJPr-Tpg" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
Having re-learned that valuable lesson, let's move on the the _actual_
journalism, curated by a science journalist showing signs of
actual sanity.  <sup id="fn18a">[[18]](#fn18)</sup>

Ironically, the first thing I learned is that Pfizer-folk pronounce paxlovid with the
accent on the 2nd syllable ("paxLOvid"), whereas out here in the wild I've only heard the
accent on the first syllable ("PAXlovid").  Would that this were our main problem!  

- Paxlovid is actually [a pair of drugs](https://en.wikipedia.org/wiki/Nirmatrelvir/ritonavir),
  taken together:  
  - [_Nirmatrelvir_](https://en.wikipedia.org/wiki/Nirmatrelvir) is the novel protease
    inhibitor which is the current pain in the rear end to manufacture in quantity.  
  - [_Ritonavir_](https://en.wikipedia.org/wiki/Ritonavir) is taken with it, mostly to
    block the liver enzyme CYP3A which would break 
    down nirmatrelvir, so it makes nirmatrelvir stay resident in the body longer.  It's
    also a mild protease inhibitor on it's own, but the main effect is as an adjuvant to
    make other drugs stronger.  That's its role in the current AIDS/HepC cocktails, and
    also the main problem that it interacts with all kinds of other drugs.  Still, it's
    already manufactured in quantity, so it's not the supply problem.  
- It initially took about 9 months to synthesize nirmatrelvir, though after some process
  optimization (somebody's losing sleep over this in a serious way!), that's now down to
  about 7 months.  You can make mRNA vaccine doses faster than this!  
- It takes about 3 months just to do the chemical synthesis to get the starting
  materials.  Some reactions take days to complete, and have to be held rigorously at a
  certain temperature.  
- There is also a gnarly supply chain problem.  This is partly because MBAs have stitched
  together global supply chains that are marginally cheaper in good times (but fail
  utterly in stressed times; they are "priced for perfection" and perfection only!).  But
  it's also because you'd only build a centralized, specialized plant if you knew you were
  going to sell in volume for enough years to pay back the maybe \$1 billion cost in
  building the plant.  So the different components to the reaction network get made in
  different places, and shipped around a lot.  
  - Paxlovid is made in 20 sites in 10 countries, so it depends a lot on air freight!  
  - By comparison, Merck's molnupiravir is made at 17 sites in 8 countries, so pretty much
    the same story.  
- The 7-9 month synthesis/packaging pipeline is actually shorter than a number of other
  drugs, so this is not especially unusual.  Though it _is_ especially frustrating!  

Still, with all that: Pfizer's Chief Global Supply Officer, Mike McDermott says in the
interview above that they expect to have 30 million courses available by mid-2022 and 120
million by the end of 2022.  

That's&hellip; not a _lot_,  when shared among 8 billion people.  Though my hope we'll share is
perhaps yet another celestial delusion about what telestial people will actually do.  

Still: things are getting better, with higher vaccination rates (glacially slowly) and
treatment alternatives like paxlovid/bebtelovimab/molnupiravir (slowly improving supply).
If we somehow learn to get those universally available even to the developing world (or
the poor in the developed world), then maybe we'll have learned a number of important
lessons.  Only some of them will be about COVID-19.  


## The Weekend Conclusion  

<img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-chesterton-wrong.jpg" width="300" height="455" alt="Project Gutenberg: Chesterton's 'Whats Wrong With the World?'" title="Project Gutenberg: Chesterton's 'Whats Wrong With the World?'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
> The Christian ideal has not been tried and found wanting; it has been found difficult
> and left untried. &mdash; [G. K. Chesterton](https://en.wikipedia.org/wiki/G._K._Chesterton),
> [__What's Wrong with the World?__ (1910), Chapter 5](http://www.gutenberg.org/etext/1717).  

<img src="{{ site.baseurl }}/images/2022-03-04-paxlovid-difficult-chesterton-thursday.jpg" width="300" height="283" alt="Project Gutenberg: Chesterton's 'The Man Who Was Thursday'" title="Project Gutenberg: Chesterton's 'The Man Who Was Thursday'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
(Sure, Chesterton's a bit preachy.  Sometimes more than a bit.  But he's also brilliantly 
funny.  <sup id="fn19a">[[19]](#fn19)</sup>  For example, try out
[_The Man Who Was Thursday_](https://www.gutenberg.org/files/1695/1695-h/1695-h.htm).
Just see if the opening scene of law enforcement vs terrorists duelling by poetry in a
park, followed by adjournment to the restaurant in the bad guy's HQ draws your interest.)  

Making paxlovid has also been found difficult&hellip; but worthwhile.  We're _trying._  

Now if only we can also _try_ to deliver universal health care to all of humanity, before we
breed a more serious variant that starts wiping us out.  

Oh, and let's not start a nuclear war, ok?  (Just in case Putin reads this.  Worth a shot,
nanyway.)  

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

<a id="fn1">1</a>: S Iketani, _et al.,_ ["Antibody evasion properties of SARS-CoV-2 Omicron sublineages"](https://www.nature.com/articles/s41586-022-04594-4), _Nature_, 2022-Mar-03.  DOI: [10.1038/s41586-022-04594-4](https://doi.org/10.1038/s41586-022-04594-4). [↩](#fn1a)  

<a id="fn2">2</a>: TH Saey, ["How omicron’s mutations make it the most infectious coronavirus variant yet"](https://www.sciencenews.org/article/covid-coronavirus-omicron-variant-mutation-infectious), _Science News_, 2022-Mar-01. [↩](#fn2a)  

<a id="fn3">3</a>: X Zhang, _et al.,_ ["SARS-CoV-2 Omicron strain exhibits potent capabilities for immune evasion and viral entrance"](https://www.nature.com/articles/s41392-021-00852-5), _Sig Transd Targ Ther_ 6:430, 2021-Dec-07.  DOI: [10.1038/s41392-021-00852-5](https://doi.org/10.1038/s41392-021-00852-5). [↩](#fn3a)  

<a id="fn4">4</a>: S M-C Gobeil, _et al.,_ ["Structural diversity of the SARS-CoV-2 Omicron spike"](https://www.biorxiv.org/content/10.1101/2022.01.25.477784v1), _bioR&chi;iv_, 2022-Jan-06.  DOI: [10.1101/2022.01.25.477784](https://doi.org/10.1101/2022.01.25.477784). [↩](#fn4a)  

<a id="fn5">5</a>: D Mannar, _et al.,_ ["SARS-CoV-2 Omicron variant: Antibody evasion and cryo-EM structure of spike protein–ACE2 complex"](https://www.science.org/doi/10.1126/science.abn7760), _Science_ 375:6582, 760-764, 2022-Jan-20.  DOI: [10.1126/science.abn7760](https://doi.org/10.1126/science.abn7760). [↩](#fn5a)  

<a id="fn6">6</a>: HH Gan, _et al.,_ ["Omicron Spike protein has a positive electrostatic surface that promotes ACE2 recognition and antibody escape"](https://www.biorxiv.org/content/10.1101/2022.02.13.480261v1), _bioR&chi;iv_, 2022-Feb-14.  DOI: [10.1101/2022.02.13.480261](https://doi.org/10.1101/2022.02.13.480261). [↩](#fn6a)  

<a id="fn7">7</a>: B Meng, _et al.,_ ["Altered TMPRSS2 usage by SARS-CoV-2 Omicron impacts tropism and fusogenicity"](https://www.nature.com/articles/s41586-022-04474-x), _Nature_, accelerated review articles, 2022-Jan-26.  DOI: [10.1038/s41586-022-04474-x](https://doi.org/10.1038/s41586-022-04474-x).  [↩](#fn7a)  

<a id="fn8">8</a>: KPY Hui, _et al.,_ ["SARS-CoV-2 Omicron variant replication in human bronchus and lung ex vivo"](https://www.nature.com/articles/s41586-022-04479-6), _Nature_ accelerated review articles, 2022-Jan-27.  DOI: [10.1038/s41586-022-04479-6](https://doi.org/10.1038/s41586-022-04479-6).  [↩](#fn8a)  

<a id="fn9">9</a>: TP Peacock, _et al.,_ ["The SARS-CoV-2 variant, Omicron, shows rapid replication in human primary nasal epithelial cultures and efficiently uses the endosomal route of entry"](https://www.biorxiv.org/content/10.1101/2021.12.31.474653v1), _bioR&chi;iv_, 2022-Jan-03.  DOI: [10.1101/2021.12.31.474653](https://doi.org/10.1101/2021.12.31.474653). [↩](#fn9a)  

<a id="fn10">10</a>: CDC Staff, ["Rates of COVID-19 Cases and Deaths by Vaccination Status"](https://covid.cdc.gov/covid-data-tracker/#rates-by-vaccine-status), CDC _COVID Data Tracker_, 2022-Mar-01. [↩](#fn10a)  

<a id="fn11">11</a>: C Zeng, _et al.,_ ["Neutralization and Stability of SARS-CoV-2 Omicron Variant"](https://www.biorxiv.org/content/10.1101/2021.12.16.472934v1), _bioR&chi;iv_, 2021-Dec-20.  DOI: [10.1101/2021.12.16.472934](https://doi.org/10.1101/2021.12.16.472934). [↩](#fn11a)  

<a id="fn12">12</a>: DS Roberts, _et al.,_ ["Distinct Core Glycan and O-Glycoform Utilization of SARS-CoV-2 Omicron Variant Spike Protein RBD Revealed by Top-Down Mass Spectrometry"](https://www.biorxiv.org/content/10.1101/2022.02.09.479776v1), _bioR&chi;iv_, 2022-Feb-10.  DOI: [10.1101/2022.02.09.479776](https://doi.org/10.1101/2022.02.09.479776). [↩](#fn12a)  

<a id="fn13">13</a>: RP Bhattacharyya, _et al.,_ ["Challenges in Inferring Intrinsic Severity of the SARS-CoV-2 Omicron Variant"](https://www.nejm.org/doi/full/10.1056/NEJMp2119682), _N Engl J Med_ 386:e14, 2022-Feb-17.  DOI: [10.1056/NEJMp2119682](https://doi.org/10.1056/NEJMp2119682). [↩](#fn13a)  

<a id="fn14">14</a>: JM Ferdinands, _et al.,_ ["Waning 2-Dose and 3-Dose Effectiveness of mRNA Vaccines Against COVID-19–Associated Emergency Department and Urgent Care Encounters and Hospitalizations Among Adults During Periods of Delta and Omicron Variant Predominance — VISION Network, 10 States, August 2021–January 2022"](https://www.cdc.gov/mmwr/volumes/71/wr/mm7107e2.htm?s_cid=mm7107e2_w), CDC _Morbidity and Mortality Weekly Report_, 71:7, 255-263, 2022-Feb-18.  DOI: [10.15585/mmwr.mm7107e2](http://doi.org/10.15585/mmwr.mm7107e2). [↩](#fn14a)  

<a id="fn15">15</a>: JP Evans, _et al.,_ ["Neutralizing antibody responses elicited by SARS-CoV-2 mRNA vaccination wane over time and are boosted by breakthrough infection"](https://www.science.org/doi/10.1126/scitranslmed.abn8057), _Science Translational Medicine_, 2022-Feb-15.  DOI: [10.1126/scitranslmed.abn8057](https://doi.org/10.1126/scitranslmed.abn8057). [↩](#fn15a)  

<a id="fn16">16</a>: UK Health Security Agency, ["SARS-CoV-2 variants of concern and variants under investigation in England"](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1056487/Technical-Briefing-36-22.02.22.pdf), Technical Briefing 36, 2022-Feb-11. [↩](#fn16a)  

<a id="fn17">17</a>: D Bojkova, _et al.,_ ["Reduced interferon antagonism but similar drug sensitivity in Omicron variant compared to Delta variant of SARS-CoV-2 isolates"](https://www.nature.com/articles/s41422-022-00619-9), _Cell Research_ 32:319-321, 2022-Jan-21. [↩](#fn17a)  

<a id="fn18">18</a>: T Murphy, ["EXPLAINER: Why Pfizer needs time to make COVID-19 treatment"](https://apnews.com/article/coronavirus-pandemic-science-business-health-medication-2f84fdd8eab845606d05f7f9d1fe3e0b), _AP News_, 2022-Mar-02. [↩](#fn18a)  

<a id="fn19">19</a>: The _London Times_ in 1908 asked writers for essays on the subject of
"What is Wrong with the World?"  Chesterton's reply was this letter:  

> Dear Sirs:  
>  
> I am.  
>  
> Sincerely yours,  
> G. K. Chesterton  

There's apparently no actual evidence this happened, at least as told.  But anybody who's
read more than a bit of Chesterton will find it utterly plausible.  

<a href="{{ site.baseurl }}/images/chesterton-wrong-daily-news-1905-aug-16.jpg"><img src="{{ site.baseurl }}/images/chesterton-wrong-daily-news-1905-aug-16-thumb.jpg" width="400" height="110" alt="Chesterton @ Daily News 1905-Aug-16: What is wrong? I am wrong." title="Chesterton @ Daily News 1905-Aug-16: What is wrong? I am wrong." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
There _was_ [a piece in the _Daily News_ of 1905-Aug-16, dug up by Jordan Poss](https://www.jordanmposs.com/blog/2019/2/27/whats-wrong-chesterton), saying something similar, if a bit more prolix:  

> In one sense, and that the eternal sense, the thing is plain. The answer to the question
> "What is Wrong?" is, or should be, "I am wrong." Until a man can give that answer his
> idealism is only a hobby. But this original sin belongs to all ages, and is the business
> of religion.  

[↩](#fn19a)  
