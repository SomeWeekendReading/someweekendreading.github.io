---
layout: post
title: Paxlovid in the Wild
tags: COVID JournalClub Math PharmaAndBiotech
comments: true
---

An Israeli group has studied the use of paxlovid to treat COVID in a large group of
age-stratified patients vs the SARS-CoV2 Omicron variant.  The results are interesting,
and a bit different from what I'd expected.  


## Paxlovid in actual practice  

We've spilled a lot of ink on this crummy little blog that nobody reads about the
[discovery and clinical trial results of paxlovid]({{ site.baseurl }}/veni-veni-paxlovid/).
But as with many things in life, lab and trial results sometimes do not reflect the
results you'd get in actual combat use.  For example, paxlovid was tested only on:
- unvaccinated people; does it work as well on the vaccinated?  
- older viral variants; does it work as well on Omicron?  

So it's always interesting to know if actual patients see the benefits we thought.  

A study doing exactly that was first brought to our attention by the indispensable Eric
Topol:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    A new real-world effectiveness report of Paxlovid during the Omicron wave: in people
	age 65+ an 81% reduction in death and 67% reduction in hospitalizations
    <a href="https://t.co/ZNohKWmTK6">https://t.co/ZNohKWmTK6</a>
    <a href="https://twitter.com/ArbelRonen?ref_src=twsrc%5Etfw">@ArbelRonen</a> 
    <a href="https://twitter.com/ClalitHealth?ref_src=twsrc%5Etfw">@ClalitHealth</a> and
	colleagues <a href="https://t.co/MbakbgkbAJ">pic.twitter.com/MbakbgkbAJ</a> 
  </p>&mdash; Eric Topol (@EricTopol) <a href="https://twitter.com/EricTopol/status/1532089787493937152?ref_src=twsrc%5Etfw">June 1, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

<img src="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-1.jpg" width="400" height="361" alt="Arbel, et al.: Paxlovid results in Israel" title="Arbel, et al.: Paxlovid results in Israel" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
It's from an Israeli group associated with Clalit Health Services and Ben-Gurion
University who did the study <sup id="fn1a">[[1]](#fn1)</sup>, now available as a
pre-print pending peer review.  Israel has _actual_ universal health care with compatible
EMR systems, so they can do research that here in the benighted US we simply cannot do.  

Let's see what it says!  


## The topline result  

First, while paxlovid was developed during the Delta variant, they wanted to test
the most relevant threat, namely the current Omicron variant:  

> Therefore, our objective was to assess the effectiveness of nirmatrelvir therapy for
> preventing mortality and hospitalizations due to Covid-19 in high-risk patients __during
> the omicron surge.__  

Good for them.  Much more relevant data in that case.  (You can also tell this from the
use of "omicron" in their title.)  

<a href="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-3.jpg"><img src="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-3-thumb.jpg" width="400" height="104" alt="Arbel, et al.: Topline results of paxlovid study in Israel" title="Arbel, et al.: Topline results of paxlovid study in Israel" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Their abstract mentions 109,213 participants, which they stratified into 2 eligible
populations: 42,819 age 65 or above, and 66,394 patients ages 40-64.  Then some in
each group got paxlovid, while the rest did not.  

I took the numbers from their abstract and formatted them in the table shown here.  
- The group sizes all add up properly to the total number of patients, so no issue there.
  (Though I _did_ have to infer the number in each group not getting paxlovid by
  subtraction.  Given censoring effects, this isn't _quite_ right, but the more subtle Cox
  proportional hazards analysis they did is in fact the right thing.)  
- Pretty clearly there's a dramatic benefit for those over 65: 3x less hospitalization %
  and 4x less death %.  
- Also pretty clearly, there's _no_ such benefit for the 40-64 crowd: hospitalizations and
  deaths were within 0.1% of each other, well within the noise limits for a study like
  this.  
  
<a href="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-2.png"><img src="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-2-thumb.jpg" width="400" height="648" alt="Arbel, et al.: Paxlovid vs no treatment, KM curves for hospitalization and death, by age" title="Arbel, et al.: Paxlovid vs no treatment, KM curves for hospitalization and death, by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
We could do our usual Fisher Exact Test here, to prove that quantitatively.  However,
Arbel, _et al._ did a more sophisticated analysis using Cox regression to handle censoring
issues, which is the much More Correct Thing to Do (and which we cannot duplicate with
just the data in the paper).  

Have a look at the Kaplan-Meier curves, taken here from their Figure 2:  
- The figure doesn't say so, but matching number of events to the table we see this is for
  hospitalization rates in each arm.  They apparently didn't do a similar set of KM curves
  for the death rate, though it probably would have looked similar to this.  
- The top plot is for ages 65+: 
  - Clearly the blue curve (paxlovid) and its 95% confidence interval stay well below the
    red curve (no paxlovid) and its 95% confidence interval.  
  - They quote a Hazard Ratio of 0.33 (95% CL: 0.19 &ndash; 0.55) for hospitalization and
    0.19 (95% CL: 0.05 &ndash; 0.76) for death.  Being bounded well below 1, these are
    highly statistically significant and have a meaningful effect size.  
- The bottom plot is for ages 40-64:  
  - Note that the blue and red curve do not meaningfully separate; not only are they not
    outside each other's 95% confidence limit, they're practically on top of each other.  
  - They quote a Hazard Ratio of 0.78 (95% CL: 0.40 &ndash; 1.53) for hospitalization and
    1.64 (95% CL: 0.40 &ndash; 12.95).  Being _not_ bounded below 1, these are not
    statistically significant (which you can just see from the plot, too).  
	

## The Weekend Conclusion  

This is pretty nifty: it's relevant to the current Omicron strain, and it's on a heavily
vaccinated population (Pfizer, mostly, in Israel).  It's high-quality data because they
have a unified EMR system.  

It says:
1. _For ages 65+:_ Paxlovid had a dramatic positive effect in reducing hospitalization and death rates.  
2. _For ages 40-64:_ Paxlovid had not much effect at all on either hospitalization or death
   rates.  
   
Though to be fair, the risk rates on younger people were much lower in the first place!
Perhaps a fair summary would be that paxlovid made older people have the same risk rate as
younger people?  

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

<a id="fn1">1</a>: R Arbel, _et al.,_ ["Oral Nirmatrelvir and Severe Covid-19 Outcomes During the Omicron Surge"](https://www.researchsquare.com/article/rs-1705061/v1), _Research Square_ preprint, 2022-Jun-01.  DOI: [10.21203/rs.3.rs-1705061/v1](https://doi.org/10.21203/rs.3.rs-1705061/v1).  [↩](#fn1a)  
