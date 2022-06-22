---
layout: post
title: Ivermectin vs Strongyloidiasis Paper Published
tags: COVID JournalClub MathInTheNews PharmaAndBiotech SomebodyAskedMe Statistics
comments: true
commentsClosed: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about the evidence
associating putative ivermectin effects with worms, not COVID-19.  Seems like it's been
finally published!  


## Remember those ivermectin meta-analyses?  

Remember last fall when we looked at claims ivermectin worked against COVID-19, but the
effect was pretty hinky when we [looked at credible reviews?]({{ site.baseurl }}/ivermectin-takedowns/)
One of the main findings from Scott Alexander's review <sup id="fn1a">[[1]](#fn1)</sup> was from
Avi Bitterman, showing the studies that showed an effect were in parts of the world with
worm infestations:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Fully baked analysis here: 
    <a href="https://t.co/BWPJxtVjVK">pic.twitter.com/BWPJxtVjVK</a>
  </p>&mdash; Avi Bitterman, MD (@AviBittMD) <a href="https://twitter.com/AviBittMD/status/1461076939192602628?ref_src=twsrc%5Etfw">November 17, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

Basically, worm infestations make everything more terrible, including COVID-19; removing
the worms if present makes surviving COVID-19 more likely.  But _if you don't have worms,_
then ivermectin does nothing for you.  


## Now it's official!  

Well, now Bitterman's work has made it through peer review and is now officially in the
scentific literature.  <sup id="fn2a">[[2]](#fn2)</sup>  Let's have a quick look through
it:  
<a href="{{ site.baseurl }}/images/2022-04-18-ivermectin-bitterman-published-study-selection.png"><img src="{{ site.baseurl }}/images/2022-04-18-ivermectin-bitterman-published-study-selection-thumb.jpg" width="400" height="196" alt="Bitterman @ JAMA: Study selection" title="Bitterman @ JAMA: Study selection" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a> 
- First, while there in theory a large number of studies available (199), only 12 made the final cut for inclusion, [as we previously saw]({{ site.baseurl }}/ivermectin-takedowns/#taking-stock-of-ivmmetacom):  
  - 11 were duplicates,  
  - a whopping 175 were not proper randomized clinical trials (e.g., not randomized or no
    controls) or did not measure all-cause mortality as their primary outcome,  
  - 2 were excluded for outright fraud or randomization failure  
- Statistically, the finding was pretty much that ivermectin looks like it might work if
  your COVID-19 patients might have worms, but does _not_ work in patients unlikely to
  have worms.  This is quantified by the Risk Ratio ($RR$), basically the ratio of rates of death
  in ivermectin vs control arms.  To achieve statistical significance, you'd like to see
  $RR \le 1$ and the 95% confidence interval bounded below 1.  This happenes 
  _only in studies conducted in areas of the world with high worm infestations:_  
  > Ivermectin trials performed in areas of low regional strongyloidiasis
  > prevalence18,19,29-32,35,37 were not associated with a statistically significant
  > decreased risk of mortality (RR, 0.84 [95% CI, 0.60 - 1.18]; P=.31).  By contrast,
  > ivermectin trials that took place in areas of high regional strongyloidiasis
  > prevalence17,33,34,36 were associated with a significant decreased risk of mortality
  > (RR, 0.25 [95% CI, 0.09 - 0.70]; P=0.008).  
<a href="{{ site.baseurl }}/images/2022-04-18-ivermectin-bitterman-published-RR-vs-worms.png"><img src="{{ site.baseurl }}/images/2022-04-18-ivermectin-bitterman-published-RR-vs-worms-thumb.jpg" width="400" height="261" alt="Bitterman @ JAMA: Ivermectin Risk Rato vs Strongyloides prevalence " title="Bitterman @ JAMA: Ivermectin Risk Rato vs Strongyloides prevalence" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- Graphically, it looks like this: $RR$ is on the vertical axis, _Strongyloides_
  infestation rate is on the horizontal axis, and each study is a dot (circle proportional
  to study size).  
  - The curve is a regression model whose details I didn't investigate (mixed-effects
    regression of $\log RR$ on _Strongyloides_ infection rates). But note more
    importantly the confidence limits on $RR$: they're only statistically significant in
    favor of ivermectin (i.e., below 1) in areas with more than about 8% of the population
    having worm infestations.  
  - The regression was statistically significance, and predicts a 38% drop in $RR$ for
    each 5% increase in worm prevalence.  


## The Weekend Conclusion  

There's more in the paper, but as far as I can tell the conclusion is that this finally,
definitively closes the door on ivermectin as a COVID-19 therapeutic.  

Ivermectin is for worms.  

For COVID-19, seek first vaccination!  Then, if you _still_ get sick: seek paxlovid, molnupiravir, fluvoxamine, and monoclonal antibodies (one of the few remaining ones still effective against the Omicron variant, like [bebtelovimab](https://www.fda.gov/news-events/press-announcements/coronavirus-covid-19-update-fda-authorizes-new-monoclonal-antibody-treatment-covid-19-retains)).  

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

<a id="fn1">1</a>: SA Siskind, ["Ivermectin: Much More Than You Wanted To Know"](https://astralcodexten.substack.com/p/ivermectin-much-more-than-you-wanted), _Astral Codex Ten_ Blog, 2021-Nov-07. [↩](#fn1a)  

<a id="fn2">2</a>: A Bitterman, CP Martins, and A Cices, ["Comparison of Trials Using Ivermectin for COVID-19 Between Regions With High and Low Prevalence of Strongyloidiasis: A Meta-analysis"](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2790173), _JAMA Netw Open_ 5:3, 2022-Mar-21, e223079. DOI: [10.1001/jamanetworkopen.2022.3079](https://dx.doi.org/10.1001/jamanetworkopen.2022.3079) [↩](#fn2a)  
