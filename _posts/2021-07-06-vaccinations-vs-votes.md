---
layout: post
title: Vaccinations vs Votes
tags: COVID MathInTheNews PharmaAndBiotech Politics Statistics
comments: true
---

Back in April, we did some [statistical analysis showing Trumpy states tended to have dramatically lower vaccination rates]({{ site.baseurl }}/politics-vs-mask-and-vaccine-use/).  Is that still the case?  Regrettably, yes: more than ever.  


## Where We Last Left Off in April  

Let's recap our analysis of last April. <sup id="fn1a">[[1]](#fn1)</sup>  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-omnibus.jpg" width="400" height="131" alt="Omnibus dataset: state, voting data, vaccine uptake/usage data" title="Omnibus dataset: state, voting data, vaccine uptake/usage data" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
We looked at, among other things, vaccination data from the CDC and the state popular vote
margins for Trump vs Biden.  We assembled all that from a couple disparate sources into an
omnibus dataset. <sup id="fn2a">[[2]](#fn2)</sup>  

<img src="{{ site.baseurl }}/images/2021-04-19-politics-vs-mask-and-vaccine-use-significances.jpg" width="400" height="105" alt="Hypothesis test significances: % doses used, % population vaccinated vs Trump Margin" title="Hypothesis test significances: % doses used, % population vaccinated vs Trump Margin" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-plot-boxplot.png" width="400" height="600" alt="Discrete: % doses used, % population vaccinated vs Trump Margin" title="Discrete: % doses used, % population vaccinated vs Trump Margin" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-plot.png" width="400" height="400" alt="Continuous: % doses used, % population vaccinated vs Trump Margin" title="Continuous: % doses used, % population vaccinated vs Trump Margin" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Using that dataset, we did a discrete analysis by $t$-test to see if the mean vaccination
level differed between Trump states and Biden states by popular vote, and a continuous
regression analysis of vaccination percent on the Trump - Biden margin.  Both analyses
came up statistically significant: the Trump states are less vaccinated (1st or 2nd shot),
and this effect is highly unlikely to be due to chance.  The effect size was large enough
to be bothersome, as confirmed by public health officials.  


## A July 4th Meditation on Willful Ignorance on the American Right  

So why revisit this now?  

Basically, Biden promised (actually more like "hoped" and promised to "work real hard")
that 70% of the US _adult_ population would be vaccinated by the 4th of July, so we could all have
barbecues or something.  That was ambitious, but with the vaccination rates seen in March
or April, it could have been achieved.  

_Could_ have.  

Since then, vaccination rates have leveled off and then steeply declined.  Everybody who
was easy to vaccinate has been vaccinated.  We have a couple of problems:  
- The JnJ vaccine was taken out of use for too long, and people never quite understood the
  thrombosis risk compared to anything else.  We quantified those a 
  bit <sup id="fn3a">[[3]](#fn3)</sup> <sup id="fn4a">[[4]](#fn4)</sup> <sup id="fn5a">[[5]](#fn5)</sup> <sup id="fn6a">[[6]](#fn6)</sup>,
  but this is just a crummy little blog with about 6 readers worldwide (one of whom is my
  cat).  So that didn't help much, other than personally, to soothe my mathematical itch.  
- We've reached everybody who's easy to reach, worldwide. <sup id="fn7a">[[7]](#fn7)</sup>
  Now we have to do _serious_ outreach: in other languages, using local community leaders,
  using local trusted physicians, &hellip; basically using all sorts of outreach to
  communities that are sometimes justifiably suspicious of the US medical establishment.
  We're doing all that, but&hellip;
- Now we're down to hard-core right-wing vaccine resistance, verging on outright refusal
  and deeply irrational rage.  
  
So of all those potential things, is the last one really a driver?  Our state-level
regression analysis in April said yes.  We could do that again, but I was very gratified
to find that Charles Gaba at _ACA Signups_ (odd name for a blog!) had done 
this <sup id="fn8a">[[8]](#fn8)</sup>, and at the county level to boot!  (All 3100+
counties in the US, which is&hellip; _special_.)  

Here's what his regression of % of total population vaccinated vs Trump/Biden % popular vote
margin looks like:  

![Gaba: Vaccination level vs Trump margin, county-level data]({{ site.baseurl }}/images/2021-07-06-vaccinations-vs-votes-county-regression.jpg "Gaba: Vaccination level vs Trump margin, county-level data")  

Each data point is a county.  Those further to the right voted for Trump, while those
further to the left voted for Biden.  The higher points had more vaccination, while the
lower ones had less.  Note that each axis goes from 0% &ndash; 100%, so there's no
suspicious zooming in to make small effects look larger; this is the whole picture.  

<!-- 
If herd immunity is at p = 0.85 resistance, then R0 is about:
p = 1 - 1/R0
1/R0 = 1 - p
R0 = 1/(1-p)
   = 1/0.15 = 6.67
-->

Note the negative sloping trend: Trump counties did _terribly worse_ on vaccination
levels!  The regression line confirms this:  
- The negative slope of the line is -0.4224.  That is, for every 1% increase in Trump
  voters, a bit under half of them will refuse vaccination.  Also, this is a stronger
  effect than we found at the state level, where the regression coefficient was at most
  -0.165.  So the county data, updated from April to July, is _even more_ convincing.  
- The model explains $R^2 \sim 42\%$ of the variance in the data, which is about as good as models
  like this ever get.  _Trumpiness is a good explainer of vaccine resistance._  
- Note the horizontal line labelled "TARGET: 53.9%".  This was Biden's goal: 70% of
  American _adults_ works out to 53.9% of all Americans, once you fold in children.  The
  current vaccination level is 50.8%&hellip; missing by 3.1%, which is oh-so-very-close!  
- Note the horizontal line at 85% vaccination: Gaba's estimating this as the level of
  vaccination (or previous infection) required for herd immunity.  From that, we infer
  that he thinks COVID-19 has $R_0 \sim 6.7$ or so.  This is apparently based on some data
  from the Yale School of Medicine. <sup id="fn9a">[[9]](#fn9)</sup>  I'd have thought
  that a bit high, but the Delta (and Delta+) variants are a bit more virulent.  For once
  I'm _insufficiently_ pessimistic!    (However: if there were sufficient "natural" immunity
  from people who'd already had COVID, that would be added to the immune fraction.
  But in order for us to be at herd immunity now, with about 50% vaccination, we'd need an
  additional 35% of natural immune people.  We don't have that.  Get vaccinated.  It's
  better than getting COVID!)  
- __Important point:__ _Nobody is yet at herd immunity!_  This means the unvaccinated _cannot_
  walk around hoping to be protected by the vaccinated around them.  

Since the population of unvaccinated is slowly shrinking, but the case rate is leveling
off, that means the rate of infection of unvaccinated people is going up.  If you're
unvaccinated, this should _terrify_ you.  (But if you're vaccinated, relax for now:
especially the mRNA vaccines work against all current variants.)  

So basically: there are a lot of knuckleheads refusing to get vaccinated for incredibly
stupid reasons.  They risk their own lives, sure.  But more importantly, they are
volunteering their bodies as collaborators against humanity in the war against COVID by
being factories for new variants.  

Sooner or later, one of those variants will escape our current vaccines.  And do you know
what happens then?  We start _all over again_, having to re-vaccinate _everybody_.  And I
mean _everybody_, planet-wide, not just in the US.  

All over again.  

It was hard the first time, even when we played nice and just asked people to accept a
free vaccine.  Next time, we probably won't play nice, and will have to use
[_Jacobson v Massachusetts_](https://en.wikipedia.org/wiki/Jacobson_v._Massachusetts)
to impose a vaccination mandate.  


## The Weekend Conclusion  

What to do?  Honestly, I just don't know.  

Ever since Reagan, the Republicans in the US have become increasingly irrational.  Today,
they're more or less fact-proof.  

How do you persuade a fact-proof knucklehead to do the right thing for the safety of
_everybody_, when they'd rather believe &mdash; and I am _not_ exaggerating here &mdash;
that the vaccine is a plot by Bill Gates to implant a chip so the government can reprogram us
by 5G?  

Thanks, Republicans.  If not for you, we could have been more or less over COVID-19 in the
US by now.  But you're acting as though you _want_ a variant that'll preferentially kill
you, and then make us do this all over again.  Why would you _possibly_ want that?!  


## Addendum 2021-Jul-07  

Last April, when we did the analysis of vaccination vs Trump margin, [we found the next day that the _New York Times_ published a similar analysis (with an almost identical plot)]({{ site.baseurl }}/politics-vs-mask-and-vaccine-use/#addendum-late-2021-apr-19).  

<img src="{{ site.baseurl }}/images/2021-07-06-vaccinations-vs-votes-wapo.jpg" width="400" height="149" alt="WaPo: Republicans prevent America from reaching vaccination goal" title="WaPo: Republicans prevent America from reaching vaccination goal" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Not to be outdone, yesterday the _Washington Post_ published an article by Max Boot, very
similar to this post <sup id="fn10a">[[10]](#fn10)</sup> (__emphasis__ added):  

> In December, I argued that the coronavirus vaccination campaign would be a test of who
> had the upper hand in the United States: the geniuses (not all of them American) who
> invented and produced these safe and effective vaccines in record time or the
> conspiratorial crackpots who believe Internet rumors that vaccines are unsafe and
> unnecessary. More than six months later, it's evident that __the forces of ignorance and
> irrationality are so strongly entrenched that no amount of scientific evidence and
> public exhortation will sway them.__  

> While young people and African Americans exhibit vaccine hesitancy, the most problematic
> group by far is Republicans. According to a new Post-ABC News poll, 86 percent of
> Democrats have gotten at least one vaccine shot, compared with only 45 percent of
> Republicans. __Forty-seven percent of Republicans say they likely won’t get vaccinated,
> compared with only 6 percent of Democrats.__  

> The states that have the lowest vaccination rates — Mississippi, Alabama, Arkansas,
> Louisiana, Wyoming — are all Republican redoubts. It’s no coincidence that many red
> states are also seeing the worst outbreaks of the disease in recent weeks: The average
> number of daily cases in the past 14 days has surged 145 percent in South Carolina, 137
> percent in Nebraska and 121 percent in Arkansas. __The Centers for Disease Control and
> Prevention calculates that 99.5 percent of U.S. covid-19 deaths in the past six months
> were among unvaccinated people.__  

Note that crucial fact: _almost all_ the deaths in the last 6 months were among
unvaccinated people.  So&hellip; _get vaccinated!_  

> __Sadly, roughly one-third of the country is impervious to science and even
> self-interest.__ That’s a big problem for the rational rest. Widespread vaccine resistance
> ensures that covid-19 will continue circulating as more virulent strains emerge. The
> only way we are likely to achieve "herd immunity" now is the hard way — by having a lot
> more people fall ill and die from the delta variant. The anti-vaxxers have a lot to
> answer for.  

At least _some_ of the big-time journalists seem to grasp the problem correctly.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Weekend Editor, ["Politics vs mask use & vaccine uptake in the US"](https://www.someweekendreading.blog/politics-vs-mask-and-vaccine-use/), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2021-Apr-19. [↩](#fn1a)  

<a id="fn2">2</a>: Weekend Editor, [Omnibus dataset of state popular vote and vaccine usage]({{ site.baseurl }}/assets/2021-04-19-politics-vs-mask-and-vaccine-use-omnibus.tsv), from ["Why did Republicans block a Trump impeachment guilty verdict?"](https://www.someweekendreading.blog/republican-impeachment-votes/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Feb-24. [↩](#fn2a)  

<a id="fn3">3</a>: Weekend Editor, ["JnJ Revenant"]({{ site.baseurl }}/jnj-revenant/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Apr-23.[↩](#fn3a)  

<a id="fn4">4</a>: Weekend Editor, ["Another study of clotting and COVID vaccines"]({{ site.baseurl }}/covid-vaccines-and-clots/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Apr-16.[↩](#fn4a)  

<a id="fn5">5</a>: Weekend Editor, ["US pauses JnJ vaccine on thromboses"]({{ site.baseurl }}/jnj-thrombosis-pause/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Apr-13.[↩](#fn5a)  

<a id="fn6">6</a>: Weekend Editor, ["The AstraZeneca/Oxford Vaccine vs Blood Clots"]({{ site.baseurl }}/azox-vaccine-thrombo/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Mar-17.[↩](#fn6a)  

<a id="fn7">7</a>: Weekend Editor, ["The Billionth Dose"]({{ site.baseurl }}/billionth-dose/), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Apr-24.[↩](#fn7a)  

<a id="fn8">8</a>: C Gaba, [Happy Independence Day. Here's U.S. &#x23;COVID19 Vaccination Levels BY COUNTY](https://acasignups.net/21/07/04/happy-independence-day-heres-us-covid19-vaccination-levels-county), [_ACA Signups_](https://acasignups.net/), 2021-Jul-04.[↩](#fn8a)  

<a id="fn9">9</a>: C MacMillan, ["Herd Immunity: Will We Ever Get There?"](https://www.yalemedicine.org/news/herd-immunity), [_Yale School of Medicine News_](https://www.yalemedicine.org/news/herd-immunity), 2021-May-21.[↩](#fn9a)  

<a id="fn10">10</a>: M Boot, ["Opinion: Republicans are preventing America from reaching Biden’s vaccination goal"](https://www.washingtonpost.com/opinions/2021/07/06/republican-antivaxxers-biden-vaccination-goal/), [_Washington Post_](https://www.washingtonpost.com/), 2021-Jul-06. [↩](#fn10a)  
