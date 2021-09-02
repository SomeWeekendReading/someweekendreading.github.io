---
layout: post
title: Vaccination vs Hospitalization Rates&colon; Simpson's Paradox
tags: COVID MathInTheNews PharmaAndBiotech SomebodyAskedMe Statistics 
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about why the vaccines are
high efficacy with rare breakthrough infections, but we can see a high fraction of the
hospitalized are vaccinated?  Right, very puzzling.  Then 
[somebody else asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) what I thought of an
article about [Simpson's paradox](https://en.wikipedia.org/wiki/Simpson's_paradox) in the
context of COVID.  Ding, ding, ding, ding!  


## Who asked what now?  

Commenter Kto [asked in a comment](https://www.someweekendreading.blog/vaccine-delta-cdc/#comment-bf28ee60-fd6f-11eb-b304-af21ae997490)
on 
[Vaccine Efficacy, Delta Variant, and CDC changes](https://www.someweekendreading.blog/vaccine-delta-cdc/)
about why we're seeing reports of so many vaccinated people being hospitalized with
COVID-19, if breakthrough infections are supposed to be so rare.  I thought the Israeli
and Qatari data said otherwise, but Kto produced a reference to some UK data that
disagreed.  Very puzzling&hellip;

Then [Gary Cornell](https://garycornell.com/) asked if I'd seen an article at 
[COVID-19 Data Science](https://www.covid-datascience.com/) on applying the Simpson
paradox to explaining exactly that thing!  

This is why you always listen to people.  


## Ok, what's this Simpson's paradox thing?  

Simpson's paradox is one of those delightful and maddening things about statistics where
you _think_ there's a clear conclusion, but when you look closer everything either falls
apart or goes the other way.  There's an elementary introduction in _Wikipedia_ that's
pretty good <sup id="fn1a">[[1]](#fn1)</sup>, and a more detailed technical summary in the 
_Stanford Encyclopedia of Philosophy_ <sup id="fn2a">[[2]](#fn2)</sup>.

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-pearson.jpg" width="400" height="180" alt="Pearson et al. on the paradox in 1899" title="Pearson et al. on the paradox in 1899" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-yule.jpg" width="400" height="156" alt="Yule on the paradox in 1903" title="Yule on the paradox in 1903" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-simpson.jpg" width="400" height="288" alt="Simpson on the paradox in 1951" title="Simpson on the paradox in 1951" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I'd always heard of this as the Yule-Simpson paradox, and wondered who the various people
were.  It turns out to be a fascinatingly weird bit of history: first published by Karl
Pearson in 1899 <sup id="fn3a">[[3]](#fn3)</sup>, then by Yule in 
1903 <sup id="fn4a">[[4]](#fn4)</sup>, it was more or less ignored or not understood for 
the next half century!  When Simpson finally published about it in 
1951 <sup id="fn5a">[[5]](#fn5)</sup>, it finally stuck in the minds of scientists.
Moral: for anything that took the scientific community half a century to wrap their brains
around, we should probably expect it to be a slippery little git that's hard to
understand.  

Is that gonna stop us from trying?  No, of course not.  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-berkeley.jpg" width="400" height="184" alt="Bickel, et al.: Simpson's paradox and the Berkeley sex bias case" title="Bickel, et al.: Simpson's paradox and the Berkeley sex bias case" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
For one thing, it's _important_: Simpson's paradox was at the root of a famous lawsuit
alleging that Berkeley discriminated against women in grad school 
admissions <sup id="fn6a">[[6]](#fn6)</sup>.  While it's a long and tangled tale, the gist
seems to be:  
- A na&iuml;ve look at overall admissions said that women who applied to grad school were
  less likely to get in than men, and that this was statistically significant.  
- However, women at that time tended to apply to very competitive departments who admitted fewer
  applicants, though all well-qualified, of either gender.  
- Men at that time tended to apply to somewhat less competitive departments who admitted more
  applicants, though well-qualified, of either gender.  
- So even though neither of those 2 groups of deparments was particularly biased, the
  overall numbers _looked_ biased under na&iuml;ve aggregation.  
- So a na&iuml;ve aggregation without taking into account men's and women's department
  preferences and the competitiveness of those departments made it look like Berkeley was
  discriminating.  But a closer look said men and women were subjecting themselves to
  different levels of scrutiny, and the effect went away.  
  
People feel strongly about sex discrimination, and for excellent reasons.  But if you don't look
at the details, you'll see discrimination where there is none&hellip; and miss it where it
really is.  Neither mistake serves the interest of fairness.  


## Yeah, yeah&hellip; c'mon, what really is it?  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-wikipedia-simpson.jpg" width="400" height="267" alt="Wikipedia: Example of Simpson's paradox" title="Wikipedia: Example of Simpson's paradox" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Consider this plot from the Wikipedia article.  
- If you sample from the blue group, you'll think there's a positive trend between
  whatever the vertical and horizontal axes are.  
- If you sample from the red group, you'll think the same thing.  
- But if you aggregate the red &amp; blue groups overall, the trend reverses and becomes
  negative.  
  
The source of this problem is that there's some confounding variable which makes the red
&amp; blue groups _different_.  If you happen to sample just one or the other, you don't
get to see that confounding variable.  But if you aggregate the red &amp; blue groups, the
confounder _overwhelms_ any in-group effect and indeed reverses it.  


## But what's that got to do with COVID-19 vaccination rates and hospitalization rates?  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-morris.jpg" width="400" height="142" alt="Morris @ Covid-19 Data Science: Simpson's paradox on vaccinations, hospitalizations, and age" title="Morris @ Covid-19 Data Science: Simpson's paradox on vaccinations, hospitalizations, and age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Heh&hellip; watch this!  

A brilliant article by Jeffry Morris at _Covid-19 Data Science_ <sup id="fn7a">[[7]](#fn7)</sup>
looks at an apparent paradox: how can you say the vaccines are effective, when 60% of 
people hospitalized for COVID-19 are vaccinated?!  

Let's go through his paper in some detail, since it's a very good invocation of Simpson's
paradox to explain _why the vaccines work better than you think._  Which is, after all,
good news.  And we can't afford to pass up good news.  

He's aggregated data from the Israeli government dashboard, snapshotted below in the
references.  The part getting the nervous side-eye is the fraction of hospitalized
patients who are vaccinated:  

| __Age__ | | | __Severe Unvax__ | | | __Severe Vax__ |
|--------:|-|-|-----------------:|-|-|---------------:|
| All     | | |            214   | | |       301      |
|---------|-|-|------------------|-|-|----------------|

People jump, without justification, to 2 frightening but erroneous or irrelevant conclusions:  
- _Vaccine Efficacy:_ It looks like _more_ vaccinated people are sick, so the vaccine
  efficacy is _negative_!  
- _Wrong Probability_: It looks like 301 / (301 + 214) = 58% of the hospitalized are
  vaccinated!  

In some ways, this is just a basic blunder with Bayes Rule.  They've computed 
$\Pr(\mathrm{vax} | \mathrm{hospitalized})$, when the relevant thing to know is instead 
$\Pr(\mathrm{hospitalized} | \mathrm{vax})$.  

But there are 2 more serious errors that are at the root of Simpson's paradox:  
- The first is a blunder from not understanding vaccine efficacy: both the vaccinated rate
  and the unvaccinated rate have to be normalized by the _sizes of their populations_, not
  just the hospitalized populations.  Israel right now has about 78% vaccinated (below), so you'd
  _expect_ to see more cases from among the vaccinated!  
- The second error is to ignore age groups.  The elderly are both more likely to
  be vaccinated, and more likely to be hospitalized if they _do_ get infected anyway.  


## Adjusting for population sizes of vaccinated and unvaccinated  

So first, let's adjust for the population sizes of vaccinated and unvaccinated, and
compute the probabilities, not the frequencies:

| __Age__ | | | __Population Unvax__ | | | __Population Vax__ | | | __Severe Unvax__ | | | __Severe Vax__ |
|--------:|-|-|---------------------:|-|-|-------------------:|-|-|-----------------:|-|-|---------------:|
| All     | | | 1,302,912 (18.2%)    | | | 5,634,634 (78.7%)  | | | 214 (0.0164%)    | | | 301 (0.0053%)  |
|---------|-|-|----------------------|-|-|--------------------|-|-|------------------|-|-|----------------|

So we see that the fraction of population vaccinated is estimated as:  

$$
\Pr(\mathrm{vax}) = 5{\small,}634{\small,}634 / (1{\small,}302{\small},912 + 5{\small,}634{\small,}634) = 81.2\%
$$

(The table above reports a slightly different number, because sometimes youths age 0-12
were not included, and the partially immunized with only 1 shot are not included.  But
ballpark&hellip; 78% - 81%.)  So there were a _lot_ more vaccinated than unvaccinated
people.  

The probabilities we want are now calculable too:  

$$
\begin{align*}
  \Pr(\mathrm{hospitalized} | \mathrm{unvax}) &= 214 / 1{\small,}302{\small,}912 &= 0.0164\% \\
  \Pr(\mathrm{hospitalized} | \mathrm{vax})   &= 301 / 5{\small,}634{\small,}634 &= 0.0053\% 
\end{align*}
$$

Clearly, the vaccinated are in a better position as far as lower chance of
hospitalization, since the unvaccinated are about 3.1x more likely to be hospitalized!
Also, the vaccine efficacy is still pretty good:  

$$ 
VE = 1 - \frac{\Pr(\mathrm{hospitalized} | \mathrm{vax})}{\Pr(\mathrm{hospitalized} | \mathrm{unvax})} = 1 - 0.0053 / 0.0164 = 67.6\% 
$$

That's certainly better&hellip; but not good enough yet!  


## Still not good enough: stratify by age  

Even though that looks much better after accounting for the much larger vaccinated
population, it's still way too pessimistic!  

That's because in the Israeli population, 2 things are true:  
- The older people are _vastly_ more likely to be vaccinated than the younger.  
- Older people, vaccinated or not, if they get an infection are more likely to be
  hospitalized.  
  
That means _age is an underlying correlate of both vaccination and hospitalization!_  If
you don't factor out age, then you're going to think vaccinated people get hospitalized
more often, only because vaccinated people tend to be older.  Conversely, you will
underestimate the efficacy of vaccination, because the unvaccinated population are
hospitalized less _because they are younger, not because they are unvaccinated!_  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-morris-stratified.jpg" width="400" height="165" alt="Morris: Israeli COVID data stratified by vax status and by age" title="Morris: Israeli COVID data stratified by vax status and by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Rather than work through each row of a table of age strata with our own R scripts, let's
just jump to Morris's very clear table.  This is stratified by _both_ vaccination status
_and_ by age.  What can we see from it?  
- The next to last column compares the severe disease risk of an age cohort versus the
  30-39 year olds.  While the elders are at more risk than the youngers, it's clear that
  is almost exclusively due to sickness in the unvaccinated subset (from inspection of the
  2 columns to the left).  
- The last column shows the vaccine efficacy, comparing like for like by age & vax
  stratification, ranges from a worst case 81% for 80-89 year olds, to best case 100%.  
  
__Conclusion:__ So we see that the hospitalization risk is mostly explained by age, once
you properly normalize by the population sizes of vaccinated and unvaccinated.  

<!-- *** IWBNI we could add 95% confidence limit bars to the vaccine efficacies. -->
<img src="{{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-by-age.png" width="400" height="400" alt="Israeli vaccine efficacy, properly normalized by population and stratified by age" title="Israeli vaccine efficacy, properly normalized by population and stratified by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

In fact, the vaccine efficacies are still quite high.  Let's plot the vaccine efficacy by
age cohort, using a little [R](https://www.r-project.org) 
script <sup id="fn8a">[[8]](#fn8)</sup>.  Here we plotted the vaccine efficacies from Morris's table
above, properly normalized by vax/unvax population size and stratified by age.  Only the
elderly have a vaccine efficacy below 90%, and even then not by much.  

That doesn't look so bad, now does it?  

Simpson's paradox is _important_: you will think your data means something other than the
truth, if you attempt to ignore it!  Here, the crucial fact is that age is correlated
_both_ with having been vaccinated _and_ with likely to be hospitalized when infected.


## The Weekend Conclusion  

The Israeli data is quite hopeful.  After declining to commit the blunder of aggregating
data with an underlying correlate (age correlates with vax status and hospitalization),
and after declining to commit the blunder of computing the wrong Bayesian posterior, we
find we have evaded Simpson's paradox.  The vaccine efficacies are still quite high.  

So get vaccinated.  

## Addendum 2021-Aug-30: Mainstream media catch on  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-nyt.jpg" width="400" height="183" alt="NYT: Vaccine immunity not waning, it's Simpson's paradox" title="NYT: Vaccine immunity not waning, it's Simpson's paradox" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
This morning I woke to a _New York Times_ newsletter touting an 
article <sup id="fn9a">[[9]](#fn9)</sup> noting that vaccine efficacy isn't really waning,
it's just Simpson's paradox.  This is very satisfying; the mainstream media are catching
up, a bit.  

> At first glance, the Israeli data seems straightforward: People who had been vaccinated
> in the winter were more likely to contract the virus this summer than people who had
> been vaccinated in the spring.  
>  
> Yet it would truly be proof of waning immunity only if the two groups — the winter and
>spring vaccine recipients — were otherwise similar to each other. If not, the other
>differences between them might be the real reason for the gap in the Covid rates.  
>  
> As it turns out, the two groups were different. The first Israelis to have received the
> vaccine tended to be more affluent and educated. By coincidence, these same groups later
> were among the first exposed to the Delta variant, perhaps because they were more likely
> to travel. Their higher infection rate may have stemmed from the new risks they were
> taking, not any change in their vaccine protection.  
>  
> Statisticians have a name for this possibility — when topline statistics point to a
> false conclusion that disappears when you examine subgroups. It’s called
> [Simpson's Paradox](https://towardsdatascience.com/simpsons-paradox-and-interpreting-data-6a0443516765).  
>  
> This paradox may also explain some of the U.S. data that the C.D.C. has cited to justify
> booster shots. Many Americans began to resume more indoor activities this spring. That
> more were getting Covid may reflect their newfound Covid exposure (as well as the
> arrival of Delta), rather than any waning of immunity over time.  

Indeed.  


## Addendum 2021-Aug-31: More mainstream media: Jordan Ellenberg in _WaPo_  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-ellenberg.jpg" width="400" height="161" alt="Jordan Ellenberg in WaPo: Vaccines work, see past Simpson's paradox" title="Jordan Ellenberg in WaPo: Vaccines work, see past Simpson's paradox" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I was gratified to see another piece in the _WaPo_ on the subject, this time by prominent
mathematician Jordan Ellenberg. <sup id="fn10a">[[10]](#fn10)</sup>  I don't know him
personally, but know people who know him and by reputation.  His reputation is that he is
very smart, very careful, and a remarkably good person.  I particularly liked the
shout-out to his mom, who pointed him at Morris's blog post.  

> Simpson’s paradox is a warning that the whole of the data often looks weirdly different
> than the sum of its parts. In the case of Israel — as a number of epidemiologists and
> other scholars have pointed out — what explains the surprising hospitalization figures is
> largely the relative ages of vaccinated and unvaccinated people.  
> &hellip;  
> If _everyone_ were vaccinated, then all hospitalized people would be vaccinated — and that
> obviously wouldn’t mean vaccination was useless.  

Nailed it.  


## Addendum 2021-Sep-02: Vaccine confidence intervals  

<img src="{{ site.baseurl }}/images/2021-08-29-covid-simpson-israeli-popln.jpg" width="400" height="125" alt="Morris data: Israeli population stratified by age and dose status" title="Morris data: Israeli population stratified by age and dose status" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-confidence-intervals-by-age.png" width="400" height="400" alt="Israeli vaccine efficacies with confidence intervals, normalized and age-stratified" title="Israeli vaccine efficacies with confidence intervals, normalized and age-stratified" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I just realized that we can take Morris's spreadsheet and extract the Israeli population
counts, stratified by age and vaccination status.  That's important because we can
calculate the vaccine efficacies _ab initio_, along with their confidence intervals.  So I
did that, with a little R script. <sup id="fn11a">[[11]](#fn11)</sup>  (Note that the
calculation of the confidence intervals has a few problems when one of the arms has 0
infections, so don't take seriously the confidence intervals when the efficacy is 100%.)  

Here's the resulting plot.  Other than the artifacts around the CI's at 100% efficacy, you
can see that the vaccines remain strong across all ages, and that we are quite certain
that is the case.  

Simpson's paradox is really, _really_ misleading people here.  There may be arguments for
a booster shot, but apparently these data are not one of those arguments.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Wikipedia contributors, ["Simpson's paradox"](https://en.wikipedia.org/wiki/Simpson's_paradox), _Wikipedia_, retrieved 2021-Aug-27.[↩](#fn1a)  

<a id="fn2">2</a>: J Sprenger &amp; N Weinberger, ["Simpson's Paradox"](https://plato.stanford.edu/archives/sum2021/entries/paradox-simpson/), _Stanford Encyclopedia of Philosophy_ (Summer 2021 Edition), Edward N. Zalta (ed).[↩](#fn2a)  

<a id="fn3">3</a>: K Pearson, ["On the Theory of Genetic (Reproductive) Selection"](https://www.jstor.org/stable/90782), _Phil Trans Roy Soc_ Series A, 192 (1899), 260–278. [↩](#fn3a)  

<a id="fn4">4</a>: GU Yule, ["Notes on the Theory of Association of Attributes in Statistics"](https://academic.oup.com/biomet/article-abstract/2/2/121/207363), _Biometrika_ 2:2 (1903), 121–134. DOI:10.1093/biomet/2.2.121. [↩](#fn4a)  

<a id="fn5">5</a>: EH Simpson, ["The Interpretation of Interaction in Contingency Tables"](https://rss.onlinelibrary.wiley.com/doi/10.1111/j.2517-6161.1951.tb00088.x), _Jnl Roy Stat Soc_ Series B (Methodological), 13:2 (1951), 238–241. DOI:10.1111/j.2517-6161.1951.tb00088.x. [↩](#fn5a)  

<a id="fn6">6</a>:  PJ Bickel, EA. Hammel, JW O'Connell, ["Sex Bias in Graduate Admissions: Data From Berkeley"](https://homepage.stat.uiowa.edu/~mbognar/1030/Bickel-Berkeley.pdf), _Science_ 187:4175 (1975), 398–404. DOI:10.1126/science.187.4175.398, PMID:17835295.[↩](#fn6a)  

<a id="fn7">7</a>: J Morris, ["Israeli data: How can efficacy vs. severe disease be strong when 60% of hospitalized are vaccinated?"](https://www.covid-datascience.com/post/israeli-data-how-can-efficacy-vs-severe-disease-be-strong-when-60-of-hospitalized-are-vaccinated), _Covid-19 Data Science_, 2021-Aug-17.  I've snapshotted [his aggregated, translated, and normalized data from the Israeli government data dashboard on 2021-Aug-15 here]({{ site.baseurl }}/assets/2021-08-29-covid-simpson-Israeli_data_August_15_2021.xlsx). [↩](#fn7a)  

<a id="fn8">8</a>: Weekend Editor, [R script to plot normalized, age stratified Israeli vaccine efficacies]({{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-by-age.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2021-Aug-29. [↩](#fn8a)  

<a id="fn9">9</a>: D Leonhardt, ["Is Vaccine Immunity Waning?"](https://www.nytimes.com/2021/08/30/briefing/vaccine-immunity-booster-shots.html), _New York Times_, 2021-Aug-30. [↩](#fn9a)  

<a id="fn10">10</a>: J Ellenberg, ["Coronavirus vaccines work. But this statistical illusion makes people think they don't."](https://www.washingtonpost.com/outlook/2021/08/31/covid-israel-hospitalization-rates-simpsons-paradox/), _Washington Post_, 2021-Aug-31.[↩](#fn10a)  

<a id="fn11">11</a>: Weekend Editor, ["R script to plot normalized, stratified Israeli vaccine efficacies and confidence intervals"]({{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-confidence-intervals-by-age.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2021-Aug-29.  The [tab-separated value file used as an input]({{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-confidence-intervals-by-age.tsv) was derived from [Morris's data]({{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-confidence-intervals-by-age.xlsx).  There is also a [transcript]({{ site.baseurl }}/assets/2021-08-29-covid-simpson-ve-confidence-intervals-by-age.txt) of running the script. [↩](#fn11a)  
