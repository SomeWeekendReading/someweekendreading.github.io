---
layout: post
title: COVID-19 Continues to Kill Conservatives
tags: COVID Politics Statistics
comments: true
---

Charles Gaba has updated his county-level COVID-19 vax rates and death rates, versus
percentage of Trump voters.  It's not pretty.  


## Previously&hellip;  

Last April, [we did some regressions of state vaccination rates on state % Trump margins]({{ site.baseurl }}/politics-vs-mask-and-vaccine-use/#statistical-hypothesis-testing).
It showed a depressingly statistically significant result: Trump states were not only less
vaccinated, they weren't even _using_ the doses they had, back when they were scarce.  

Then last July, [Charles Gaba on acasignups.net showed the horrifying county-level data]({{ site.baseurl }}/vaccinations-vs-votes/#a-july-4th-meditation-on-willful-ignorance-on-the-american-right).
The county level data was difficult to assemble properly and completely, but the trend of
Trumpiness against vaccination was blunt and clear.  

Then at the end of October,
[Gaba updated with a simple bar plot]({{ site.baseurl }}/partisan-covid-deaths/#the-partisan-divide-in-death-rates):
stratify counties by deciles of % Trump voters and see the death rate in the most
Republican is 6x higher than the most Democratic.  

Now he's updated to the latest data, in both vax rates and death rates.  Oy, vey.  


## The ugliness of the present moment  

<a href="{{ site.baseurl }}/images/2021-11-16-covid-dead-partisans-gaba-county-vax.jpg"><img src="{{ site.baseurl }}/images/2021-11-16-covid-dead-partisans-gaba-county-vax-thumb.jpg" width="400" height="457" alt="Gaba: Vax rates by county vs % Trump votes by county" title="Gaba: Vax rates by county vs % Trump votes by county" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
First, consider the 2021-Nov-15 update on county vaccination levels vs county % Trump 
votes. <sup id="fn1a">[[1]](#fn1)</sup>  We can see several interesting things from this
plot of 3,144 US counties: 
- There is a definite negative trend of vaccination rates with increasing Republican
  voting.  In fact, the regression coefficient is a whopping -0.45 between the horizontal
  and vertical percentages (0% &ndash; 100%, so they're on the same scale).  So for every
  percent increase in Trumpiness, there's about half a percent _decrease_ in vaccination!  
- The radius of the bubble around each point shows the county population.  There are
  large-radius circles around the blue Democratic points, and tiny little circles around
  the red Republican ones.  Democrats cluster in cities, while Republicans live in small
  towns and rural areas.  We're geographically segregated.  Another acquaintance of mine
  says people in rural areas _never even hear_ progressive messages in the news, other
  than Republican distortions into horror fictions.  

<a href="{{ site.baseurl }}/images/2021-11-16-covid-dead-partisans-gaba-county-decile-deaths.jpg"><img src="{{ site.baseurl }}/images/2021-11-16-covid-dead-partisans-gaba-county-decile-deaths-thumb.jpg" width="400" height="320" alt="Gaba: Death rates barplot by county % Trump deciles" title="Gaba: Death rates barplot by county % Trump deciles" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Next, let's look at COVID death rates in a simple bar chart <sup id="fn2a">[[2]](#fn2)</sup>: 
divide up the counties into deciles by % Trump vote, then plot the death rate per 100,000
for each.  Color them by voting status, and observe the trend:  
- Again, the very strong correlation of high Republican votes associated with high death
  rates!  Honestly, I thought people who used phrases like "GOP death cult" were
  exaggerating, but now it's just the literal truth.  
- And it's not a small effect: the reddest decile has a 5.74x higher death rate than the
  bluest decile.  I'm happy to live in the bluest decile, but horrified at the
  self-inflicted wounds in the red areas.  _It doesn't have to be that way!_  

<a href="{{ site.baseurl }}/images/2021-11-16-covid-dead-partisans-gaba-county-death.jpg"><img src="{{ site.baseurl }}/images/2021-11-16-covid-dead-partisans-gaba-county-death-thumb.jpg" width="400" height="480" alt="Gaba: Vax rates by county vs % Trump votes by county" title="Gaba: Vax rates by county vs % Trump votes by county" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Finally, and most devastatingly, consider the vax rate scatterplot above, but now redo it
wit the COVID-19 death rate. <sup id="fn3a">[[3]](#fn3)</sup>  These data are through
2021-Nov-12:  
- There's a brutal trend, nonlinearly increasing upward very fast, of death rates with
  Trump voters.  _It's even worse than the vax rates!_  
- As the trend is nonlinear, a linear regression or use of Pearson correlation is likely
  inappropriate.  Quantile regression would have worked, as would a Spearman rank-order
  correlation.  (Hint, hint.)  
- The geographic separation into blue cities and red small towns/rural areas is
  confirmed.  


## The Weekend Conclusion  

Being Republican is hazardous to your health.  And your neighbor's health.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: C Gaba, ["Weekly Update: U.S. #COVID19 Vaccination Levels By COUNTY & Trump 2020 Vote"](https://acasignups.net/21/11/15/weekly-update-us-covid19-vaccination-levels-county-trump-2020-vote), ACASignups.net blog, 2021-Nov-15. [↩](#fn1a)  

<a id="fn2">2</a>: C Gaba, ["Weekly Update: #COVID19 Case/Death Rates By County, Partisan Lean & Vaccination Rate"](https://acasignups.net/21/11/15/weekly-update-covid19-casedeath-rates-county-partisan-lean-vaccination-rate), ACASignups.net blog, 2021-Nov-15. [↩](#fn2a)  

<a id="fn3">3</a>: C Gaba, ["America 2021 in one image"](https://twitter.com/charles_gaba/status/1459565881214836743), _Twitter_, 2021-Nov-13. [↩](#fn3a)  
