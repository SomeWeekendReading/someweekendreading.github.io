---
layout: post
title: The Highest-Vaccination Ethnic Group in the US, Redux
tags: COVID MathInTheNews PharmaAndBiotech Politics R Statistics
comments: true
---

Remember last year when we noted the highest-vaccination ethnic group in the US?  They're
still winning, and it shows in the statistics.  

## COVID-19 Vaccination and Native Americans

Remember last July, when we noted with approval that the highest-vaccination ethnic group
in the US was Native Americans, and how they did so in sensible culturally attuned ways,
and how they were generous with vaccines to their neighbors and
friends?  <sup id="fn1a">[[1]](#fn1)</sup>  

(Yeah, I know you probably don't remember.  It's ok: we've all had other things to think
about since then.)  

Via Eric Topol comes word that they're still winners:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Arizona was the only state last year where vaccination rates in rural counties topped those in urban counties, according to the CDC. Public health experts say vaccine outreach and a community-first spirit among Native Americans is what made difference. <a href="https://t.co/hmPtphmbWt">https://t.co/hmPtphmbWt</a>
  </p>&mdash; The Associated Press (@AP) <a href="https://twitter.com/AP/status/1522992600411623424?ref_src=twsrc%5Etfw">May 7, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

<img src="{{ site.baseurl }}/images/2022-05-08-highest-vax-group-in-us-redux-ap-1.jpg" width="400" height="173" alt="Tang @ AP: Native Americans boost rural vaccinations in Arizona" title="Tang @ AP: Native Americans boost rural vaccinations in Arizona" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
He refers us to an article by Terry Tang at _AP News_. <sup id="fn2a">[[2]](#fn2)</sup>
Very interestingly, the article points out that not only was there abundant community
spirit to encourage vaccinations, but that it was done in alliance between Navajo and Hopi
peoples together.  They have not always had frictionless relations in the past, so it's
just beautiful to see that kind of solidarity.  

They pushed for vaccination as "an act of selflessness" and cultural preservation, in
which all community members protect each other.  Combine that with consistent, easily
understood leadership communications (sometimes in native languages) and you've got a
_working strategy._  

<img src="{{ site.baseurl }}/images/2022-05-08-highest-vax-group-in-us-redux-mmwr-1.jpg" width="400" height="239" alt="Saelee, et al. @ CDC MMWR: Rural vs urban county vaccine uptake" title="Saelee, et al. @ CDC MMWR: Rural vs urban county vaccine uptake" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Arizona is, as a result, the only US state where rural vaccinations outpaced urban.  At
least partial vaccination rates 2020-Dec-14 through 2022-Jan-31 were 86.1% in rural counties vs
69.3% in urban counties in Arizona.  For comparison, the US national figures are the other
way 'round: 58.5% rural vs 75.4% urban according to the CDC's
_MMWR._ <sup id="fn3a">[[3]](#fn3)</sup>  

|            || _Urban_ || _Rural_ |  
| :--------: || :----: || :----: |  
| _Arizona_   || 69.3%  || 86.1%  |  
| _National_  || 75.4%  || 58.5%  |  

We can test statistically whether the urban/rural vaccination counts are different between
Arizona and the US.  First we'll have to convert the table above, which contains
proportions, to actual counts of persons.
- _Statista Research Service_ says the US had 272.91 million people in urban areas and
  57.23 million in rural areas.  <sup id="fn4a">[[4]](#fn4)</sup> Given the proportions in
  the above table, that means there are in the US overall:  
  - 0.754 * 272.91 million US urban vaccinees, and  
  - 0.585 * 57.23 million US rural vaccines.  
- According to the US Census Bureau, Arizona has a population of 7,276,316 (2021-Jul-01
  estimate). <sup id="fn5a">[[5]](#fn5)</sup>  According to 2 other sources, both
  estimating for 2010, the population of Arizona is 89.8% urban and 10.2%
  rural. <sup id="fn6a">[[6]](#fn6)</sup> <sup id="fn7a">[[7]](#fn7)</sup>  Given the
  proportions in the above table, that means there are in Arizona overall:  
  - 0.693 * 0.898 * 7.276 million AZ urban vaccinees, and  
  - 0.861 * 0.102 * 7.276 million AZ rural vaccinees.  

From that, we can build a 2x2 contingency table, i.e., a table like the one above but with
actual counts of people, for analysis in [R](https://www.r-project.org/):  

```R
> usUrban <- 272.91e+06
> usRural <-  57.23e+06

> azPopln <-   7.276e+06
> azUrban <- 0.898 * azPopln
> azRural <- (1 - 0.898) * azPopln

> mx <- matrix(round(c(0.693 * azUrban, 0.861 * azRural, 0.754 * usUrban, 0.585 * usRural)), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("Arizona", "US"), c("Urban", "Rural"))); mx
            Urban    Rural
Arizona   4527957   638993
US      205774140 33479550
```

Armed with that, we can test the null hypothesis that the rows are pretty much the same
against the alternative hypothesis that they are different.  We'll do both a fancy-pants
Fisher exact test and an old-fashioned but reliable Pearson $\chi^2$ test:  

```R
> fisher.test(mx)

	Fisher's Exact Test for Count Data

data:  mx
p-value < 2.2e-16
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 1.149884 1.155938
sample estimates:
odds ratio 
  1.152893 

> chisq.test(mx)

	Pearson's Chi-squared test with Yates' continuity correction

data:  mx
X-squared = 11139, df = 1, p-value < 2.2e-16
```

As you can see, both tests are wicked statistically significant: $p \lt 2.2 \times
10^{-16}$ is the smallest $p$-value [R](https://www.r-project.org/) will report without
coercion (the actual value is even smaller).  So Arizona is _quite_ different from the US,
i.e., the effect is very real and extremely unlikely to be due to chance.  

Another oddity: Santa Cruz county, which is rural but has little Native American
population, had a vaccination rate of 146%!  This is because it borders Mexico, and lots
of Mexicans, sensible folk that they are, crossed the border to get vaccinated but were
not counted as part of population.  

Interestingly, you can see the US national urban/rural divide in Charles Gaba's data on
vaccination and Trump voting at the county level.  <sup id="fn8a">[[8]](#fn8)</sup>  Last
February, [we wrote about his result as Reason #4 to be pessimistic]({{ site.baseurl }}/pessimism-and-optimism/#reason-4-republican-vaccine-defiance):

![Charles Gaba @ ACASignups: animation over time of vax status vs county Trump lean]({{ site.baseurl }}/images/2022-02-23-pessimisim-and-optimism-acasignups-gaba-red-blue-county-animation.gif "Charles Gaba @ ACASignups: animation over time of vax status vs county Trump lean")

The obvious point is the blue-vs-red slope, indicating Republican vaccine refusal.  But
more to the point today, consider the radius of each of the circles: it's proportional to
the county population.
- Note the large blue circles on the left, indicating largely Democratic urban counties
  with high vaccine uptake.  
- Note the tiny red circles on the right, indicating largely Republican rural counties
  with low vaccine uptake.  
  
That's the national flow, and it's stupid.  The Arizona Navajo and Hopi tribes swam
upstream against that flow, and they're brilliant.  


## The Weekend Conclusion  

We should learn from the practical community spirit of our Native American brothers and
sisters.  It's not only the right thing to do, it just plain makes practical sense.  

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

<a id="fn1">1</a>: Weekend Editor, ["The Highest-Vaccination Ethnic Group in the US"](https://www.someweekendreading.blog/highest-vax-group-in-us/), _Some Weekend Reading_ blog, 2021-Jul-16.[↩](#fn1a)  

<a id="fn2">2</a>: T Tang, ["Tribes credited with elevating vaccinations in rural Arizona"](https://apnews.com/article/covid-health-pandemics-public-arizona-19b7d4293982fafccbf58c5375c49f2a), _Associated Press News_, 2022-May-07. [↩](#fn2a)  

<a id="fn3">3</a>: R Saelee, _et al.,_ ["Disparities in COVID-19 Vaccination Coverage Between Urban and Rural Counties — United States, December 14, 2020–January 31, 2022"](https://www.cdc.gov/mmwr/volumes/71/wr/mm7109a2.htm), _CDC Morbidity and Mortality Weekly Report_ 71:9, 335-340, 2022-Mar-04. [↩](#fn3a)  

<a id="fn4">4</a>: Statista Research Department, ["Size of the urban and rural population of the United States from 1960 to 2020"](https://www.statista.com/statistics/985183/size-urban-rural-population-us/), _Statista Research Service_, retrieved 2022-May-08. [↩](#fn4a)  

<a id="fn5">5</a>: US Census Bureau Staff, ["US Census QuickFacts for Arizona"](https://www.census.gov/quickfacts/AZ), US Census Bureau, retrieved 2022-May-08. [↩](#fn5a)  

<a id="fn6">6</a>: Iowa Community Indicators Program Staff, ["Urban Percentage of the Population for States, Historical"](https://www.icip.iastate.edu/tables/population/urban-pct-states), _Iowa State University Community Indicators Program_, retrieved 2022-May-08.  __NB:__ 2010 numbers sourced from the US Census. [↩](#fn6a)  

<a id="fn7">7</a>: ASU Morrison Institute for Public Policy Staff, ["Revisiting the Urban-Rural Relationship in Arizona"](https://morrisoninstitute.asu.edu/sites/default/files/urban-rural_relationship.pdf), Arizona State University Morrison Institute for Public Policy, 2019-Nov, retrived 2020-May-08. __NB:__ Also an estimate dated to 2010. [↩](#fn7a)  

<a id="fn8">8</a>: C Gaba, ["Updated: A Full Year Of U.S. COVID Vaccinations By Partisan Lean...Animated"](https://acasignups.net/22/02/22/updated-full-year-us-covid-vaccinations-partisan-leananimated), _ACA Signups_, 2022-Feb-02. [↩](#fn8a)  

