---
layout: post
title: Politics vs mask use &amp; vaccine uptake in the US
tags: COVID MathInTheNews PharmaAndBiotech Politics Statistics
comments: true
---

Does political alignment in the US inform medically-relevant behaviors like mask use and vaccine
uptake?  Alas, yes: but not in a good way.  


## The basic question  

!["Axios: White Republican vaccine hesitancy"]({{ site.baseurl }}/images/2021-03-08-i-guess-i-like-dolly-parton-axios.jpg "Axios: White Republican vaccine hesitancy")
<img src="{{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-wapo-fishnet-mask.jpg" width="400" height="309" alt="WaPo: malicious compliance fishnet mask at CPAC" title="WaPo: malicious compliance fishnet mask at CPAC" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">  

We know that some things help people avoid COVID-19, and hence avoid a pretty awful level
of danger of disability or death: mask usage and vaccination.  Unfortunately, we know
that both of those are
[deeply, desperately, angrily resisted in the US in the red states]({{ site.baseurl }}/republicans-vs-herd-immunity/).
Their reasons almost don't matter: their behaviors lead to death and disability, as well
as the spread of increasingly vaccine-resistant variants to the rest of us, so they are public
health problems for all of us.  

Can we quantify that relationship statistically?  


## Mask usage  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-plos-one.jpg" width="400" height="146" alt="Fischer: mask usage, COVID-19 rates, and US states" title="Fischer: mask usage, COVID-19 rates, and US states" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-plos-one-fig1.jpg" width="400" height="560" alt="Fischer: early mask adherence helps avoid COVID-19" title="Fischer: early mask adherence helps avoid COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-plos-one-fig2.jpg" width="400" height="304" alt="Fischer: early mask adherence and strength of policy helps avoid COVID-19" title="Fischer: early mask adherence and strength of policy helps avoid COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
For no particularly obvious reason, the efficacy of masks is constantly under challenge.
So, first up is a paper by Fischer, _et al._ <sup id="fn1a">[[1]](#fn1)</sup> in 
[_PLoS ONE_](https://journals.plos.org/plosone/)
documenting the effect of masking over the last year.  Their work is nicely summarized by
2 figures from their paper, reproduced here:  

- Figure 1 shows the effect of mask adherence and the date of adopting a mask policy.  The
  vertical axis is proportion of states with high COVID-19 rates.  On the left are the
  states with bottom-quartile adherence, and on the right the top quartile.  Clearly high
  mask adherence saved lives.  Within each group, they show the date at which a mask
  policy was adopted.  Clearly early mask policy saved lives.  
- Figure 2 similarly shows the strength of the mask policy in 4 groups: nothing, any policy at all,
  recommended but voluntary masking, and required masking.  Clearly, required masking
  saved lives.  In each group, they show the date of adoption of the policy.  Clearly
  early required masking saved lives.  
  
__Conclusion:__ The empirical data on high COVID-19 rates indicate that compliance with mask policy
saved lives, early mask policy saved lives, and required mask policy saved lives.  Anybody
who argues otherwise has other priorities than saving lives, and that is _bad._  

I'm kind of surprised we need the scientific literature to tell us things this obvious.
But&hellip; here we are.  


## Low vaccine uptake in red states  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-ap.jpg" width="400" height="113" alt="Bynum: Red states lag in vaccine uptake/usage" title="Bynum: Red states lag in vaccine uptake/usage" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
We
[previously remarked that vaccine uptake in red areas seemed lower](https://www.someweekendreading.blog/that-didnt-take-long/), 
to the point that people were capitalizing on it to escape shortages in their blue areas.
It appears that this is continuing, according to an AP report on red state vaccine 
uptake. <sup id="fn2a">[[2]](#fn2)</sup>  

The reporter, Russ Bynum, noted that in the CDC's list of states with their rates of
vaccine uptake, the top states were blue and the bottom states were red.  This appears to
be directly linked to partisanship: citing an AP poll, 36% of Republicans said they would
resist getting vaccinated, vs 12% of Democrats.  

This _matters_.  Quoting Dr Howard Forman, professor of public health and management at the
Yale School of Medicine:  

>"We could see substantial outbreaks for a long time," Forman said. "It will determine
>whether we go back to normal in some cases."  


## A suspicious look at actual data  

Here at Chez Weekend, we wondered if that anecdotal report would really withstand
statistical scrutiny: can we quantitatively related usage of vaccine supply &amp; fraction
of population vaccinated with partisanship at the state level?  

Why, yes.  Yes, we can.  

### The available data  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-cdc.jpg" width="400" height="190" alt="CDC: Vaccination usage &amp; uptake by US states" title="CDC: Vaccination usage &amp; uptake by US states" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- We can get state vaccination rates directly from the CDC. <sup id="fn3a">[[3]](#fn3)</sup>
  They offer the usual complex spreadsheet, which we simplify down to the state, the % of
  vaccine supply used, the % of population with at least 1 dose, and the % of population
  fully vaccinated.  
- The state voting data we previously curated from the Wikipedia summary of the 2020
  election <sup id="fn4a">[[4]](#fn4)</sup>, for our January 
  [impeachment vote analysis]({{ site.baseurl }}/republican-impeachment-votes/).  So we'll
  re-use that.  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-omnibus.jpg" width="400" height="131" alt="Omnibus dataset: state, voting data, vaccine uptake/usage data" title="Omnibus dataset: state, voting data, vaccine uptake/usage data" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
We combined those 2 datasets into a single omnibus dataset <sup id="fn5a">[[5]](#fn5)</sup>,
a sample of which is shown here.  It shows the state name, the voting data (Biden %, Trump
%, Trump Margin, and whether it was a Trump state, and the vaccine usage data (%
population with at least 1 dose, % population fully vaccinated, and % of vaccine supply
already in people's arms).  The voting data is for the 2020 election, and is final.  The
vaccination data was updated by the CDC as of 2021-Apr-16.  

We wrote an [R](https://www.r-project.org) script to load &amp; standardize the datasets,
combine them with a left outer join into the omnibus dataset, and do the following
statistical analyses.  <sup id="fn6a">[[6]](#fn6)</sup>  A transcript of running it is
also available in the references, for peer review.  


### Statistical hypothesis testing  

We did both discrete and continuous analyses:  
- _Discrete analysis:_ we binned up the states into those whose popular vote was for Trump
  and those which were not (boolean column "TrumpState" in the omnibus dataset).  We then
  did [1-sided, unequal variance, $t$-tests](https://en.wikipedia.org/wiki/Student%27s_t-test) 
  to determine if % vaccination uptake, % population with 1 dose,
  and % population with full doses were greater in non-Trump states.  The resulting
  $p$-values were multiple hypothesis test corrected to 
  [FDR](https://en.wikipedia.org/wiki/False_discovery_rate)s using the 
  [Benjamini-H&ouml;chberg method](https://en.wikipedia.org/wiki/False_discovery_rate#Benjamini%E2%80%93Hochberg_procedure).  
- _Continuous analysis:_  Mollified that the discrete analysis was significant (_q.v._),
  we then did a regression analysis of the vaccination variables on the % Trump margin in
  the popular vote in each state.  This tells us whether the effect is a step function, or
  whether just a little increment in partisanship has an effect as well.  We report the
  overall $R^2$ of the regression, as well as the $p$-value of the slope coefficient and 
  its multiple hypothesis test corrected FDR.  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-significances.jpg" width="400" height="105" alt="Hypothesis test significances: % doses used, % population vaccinated vs Trump Margin" title="Hypothesis test significances: % doses used, % population vaccinated vs Trump Margin" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Here is a summary of the statistical significance of the relationship between Trump margin
and the 3 vaccine usage measures:  
- The column tTest.FDR tells us that the $t$-test is significant for all 3 measures of
  vaccine usage, with $\mathrm{FDR} \sim 10^{-6} - 10^{-3}$.  There _is_ a real vaccine
  hesitancy in the red states.   
- The continuous analysis confirms this.  The regression $R^2 \sim 13\% - 37\%$ values are not
  huge, indicating significant variance in the data, but a degree of real trend nonetheless.
  The slope coefficient in the regression model has highly significant 
  $\mathrm{FDR} \sim 10^{-6} - 10^{-3}$, indicating that there's not a chance in hell this
  is accidental.  

<img src="{{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-plot-boxplot.png" width="400" height="600" alt="Discrete: % doses used, % population vaccinated vs Trump Margin" title="Discrete: % doses used, % population vaccinated vs Trump Margin" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Here's what the boxplot of regression measures vs Trump margin looks like.  The bar shows
the median, the box shows the upper &amp; lower quartile, and the whisker shows the range
of the data.  In all cases, the outcome is _worse_ in Trump states.  The difference is 
statistially significant by $t$-test.  

<img src="{{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-plot.png" width="400" height="400" alt="Continuous: % doses used, % population vaccinated vs Trump Margin" title="Continuous: % doses used, % population vaccinated vs Trump Margin" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Here's what the regression of vaccine measures vs Trump margin looks like:  
- Each state is a circle on the plot.  The Trump popular vote margin in the state is on
  the horizontal axis.  
- The colors indicate the vaccine measure: % of doses actually used vs sitting in a
  freezer in blue, % population with at least 1 dose in green, and % population with full
  doses in red.  
- The considerable scatter around each regression line explains why the $R^2$  values were
  significant, though not spectacular.  
- In each case, we see a downward trend with Trump margin: states with more Trump voters
  use less vaccine, and have less of their population protected.  
- The effect is weakest with % population fully vaccinated, as expected from having the
  smallest $R^2$ in the table above.  That's because it's hard at this point to have a lot
  of people fully vaccinated, given the chronic vaccine shortages, bungled sign-up
  mechanisms, and glacial sped of vaccination.  

## The Weekend Conclusion  

Yes, the Trumpy areas of the US are both less likely to use the vaccines they have on
hand, and consequently have less of their population partially or fully protected.  The
effects are statistically significant in both discrete and continuous measures.  The
effect size is large enough to be bothersome from a public health perspective, as Howard
Forman said above re delaying the return to some form of normalcy.  

Worst of all, we're all stuck with the consequences of this knuckleheadery.  


## What to do?  

Beats me.  I wish I could figure out how to persuade people not to be self-destructive.
(In this, as in _so many_ other matters!)  

The consequences of slow/low vaccination rates are that viral variants are inevitably
taking over, one of which will eventually have an escape mutation to evade current
vaccines.  Then we'll need _booster_ vaccines again.  Fortunatley, we know that those
are [already under development]({{ site.baseurl }}/variants-vs-vaccines/#mrna-vaccines-and-boosters-for-variants),
and that
[the FDA is prepared for accelerated approvals like the yearly flu virus variant vaccines]({{ site.baseurl }}/variants-vs-vaccines/#what-about-the-fda).  

Personally, I was putting the probability of the need for boosters this fall at about
60%.  It might be time to raise this estimate, as it's beginning to dawn even on the
mainstream media:  
<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    The U.S. is preparing for the possibility that a booster shot will be needed between
	nine to 12 months after people are initially vaccinated against COVID-19, a White
	House official said <a href="https://t.co/kOHpRdm672">https://t.co/kOHpRdm672</a> 
    <a href="https://t.co/e0CM8TgF2j">pic.twitter.com/e0CM8TgF2j</a> 
  </p>&mdash; Reuters (@Reuters) <a href="https://twitter.com/Reuters/status/1382978318534868992?ref_src=twsrc%5Etfw">April 16, 2021</a>
</blockquote> 
<script async src="https://platform.twitter.com/widgets.js"></script>

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
	Moderna plans to have third vaccine booster shot ready by fall. Pfizer announced plans
	for a 3rd shot a few days ago. Moderna&#39;s vax is more than 90% effective 6 months
	after the 2nd shot. What remains unclear is how long immunity lasts 
	<a href="https://t.co/ExonaUxTcZ">https://t.co/ExonaUxTcZ</a>
  </p>&mdash; delthia ricks 🔬 (@DelthiaRicks) <a href="https://twitter.com/DelthiaRicks/status/1383498543348867075?ref_src=twsrc%5Etfw">April 17, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

One could wish for the times to be less fraught with self-inflicted wounds from stupidity.
But again&hellip; here we are.  


## Addendum late 2021-Apr-19  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-nyt-1.jpg" width="400" height="161" alt="NYT: Least vaccinated US counties have most Trump voters" title="NYT: Least vaccinated US counties have most Trump voters" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
I just discovered, after writing the above, that the _New York Times_ is also on the
case. <sup id="fn7a">[[7]](#fn7)</sup>  Here we did a state-level analysis; the _NYT_
reporters show a somewhat more fine-grained county-level analysis that reaches the same
conclusion.  (Though oddly, except for a county-level map, their graphics are all
state-level.  Hmpf.  _NYT_, I guess.)  Also, it does not appear they did any statistical
hypothesis testing to assess the significance of the relationship, as we did here; they're
busy with compelling _story_ aspects of individuals.  

Their graph on the right is approximately the same as the green regression line in our plot
above:  
!["NYT: Trumpy voters more vaccine hesitant and less vaccinated"]({{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-nyt-2.jpg "NYT: Trumpy voters more vaccine hesitant and less vaccinated")

Normally, we'd expect older people to be more conservative than younger groups, and to see
that reflected in vaccination rates.  Not so; the _NYT_ shows us the resistance effect persists
across age (though the youngs who _do_ accept vaccination (dark blue bar) appear to do so in slightly
higher numbers):  
!["NYT: Vaccination rates by age and partisanship"]({{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-nyt-3.jpg "NYT: Vaccination rates by age and partisanship")

[_O tempora, o mores!_](https://en.wikipedia.org/wiki/O_tempora,_o_mores!)  It appears that [_Jacobson v Massachusetts_](https://en.wikipedia.org/wiki/Jacobson_v._Massachusetts) may become a regrettable inevitability, just for survival.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: C Fischer, _et al.,_ ["Mask adherence and rate of COVID-19 across the United States"](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0249891), [_PLoS One_](https://journals.plos.org/plosone/) 16:4, e0249891, 2021-Apr-14.  DOI: [10.1371/journal.pone.0249891](https://doi.org/10.1371/journal.pone.0249891).[↩](#fn1a)  

<a id="fn2">2</a>: R Bynum, ["Red states on U.S. electoral map lagging on vaccinations"](https://apnews.com/article/joe-biden-donald-trump-alabama-georgia-savannah-941ef2bf9b60ee39d6b9fd5e2ce861f7), _AP News_, 2021-Apr-14. [↩](#fn2a)  

<a id="fn3">3</a>: Centers for Disease Control, ["COVID Data Tracker (Vaccinations): Data table for COVID Vaccinations in the United States"](https://covid.cdc.gov/covid-data-tracker/#vaccinations), _CDC COVID Data Tracker_, data as of 2021-Apr-16 6:00am ET.  Archived in [a simple CSV file here]({{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-covid19_vaccinations_in_the_united_states.csv).[↩](#fn3a)  

<a id="fn4">4</a>: Wikipedia, ["2020 United States presidential election (results by state)"](https://en.wikipedia.org/wiki/2020_United_States_presidential_election#Results_by_state), retrieved 2021-Feb-15. [↩](#fn4a)  

<a id="fn5">5</a>: Weekend Editor, [Omnibus dataset of state popular vote and vaccine usage]({{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-omnibus.tsv), from ["Why did Republicans block a Trump impeachment guilty verdict?"](https://www.someweekendreading.blog/republican-impeachment-votes/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Feb-24. [↩](#fn5a)  

<a id="fn6">6</a>: Weekend Editor, [R script for analysis of vaccine uptake vs Trump margin]({{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use.r), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Apr-19.  There is also [a text file transcript of running the script]({{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use.txt), for peer review. [↩](#fn6a)  

<a id="fn7">7</a>: D Ivory, L Leatherby, &amp; R Gebeloff, ["Least Vaccinated U.S. Counties Have Something in Common: Trump Voters"](https://www.nytimes.com/interactive/2021/04/17/us/vaccine-hesitancy-politics.html), _New York Times_, 2021-Apr-17. [↩](#fn7a)  
