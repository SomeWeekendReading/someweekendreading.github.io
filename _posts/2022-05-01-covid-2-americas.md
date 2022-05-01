---
layout: post
title: It's Always Been 2 Americas for COVID-19
tags: COVID JournalClub MathInTheNews PharmaAndBiotech Politics Sadness
comments: true
---

COVID-19 has brought to light a lot of disparities in the US.  Today's scientific paper is
about just how certainly we know the Trumpy parts of the country, especially the South,
were COVID-19 disasters: hundreds of thousands of excess deaths due to mask defiance,
vaccine refusal, and malign conservative disinformation.  


## Source material  

The choice of paper for today's [JournalClub]({{ site.baseurl }}/tags/#JournalCLub) started
with a tweet.  I don't use Twitter, nor do I tolerate much about it.  (I hear 
[some unpleasant rich dudebro](https://en.wikipedia.org/wiki/Elon_Musk) bought it.  But I
hated Twitter _before_ it was fashionable to hate Twitter.  Just a fashion-forward
curmudgeon, that's me.)  Still, somebody saw it, pointed somebody else at it, who then
pointed me at it.  

And here we are, as all the existentialists say.  

(Or: And so it goes, in the [_malebolge_](https://en.wikipedia.org/wiki/Malebolge) of social media.)  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    <a href="https://twitter.com/hashtag/Covid?src=hash&amp;ref_src=twsrc%5Etfw">#Covid</a>
	death rates have been higher in the South—the Old Confederacy—due to behavioral
	differences, a new study has found. Shunning masks &amp; vaccines resulted in &gt;316k
	deaths could have been avoided nationwide. 62% of the avoidable deaths were in the
	South <a href="https://t.co/LLow2AnMbK">https://t.co/LLow2AnMbK</a> 
    <a href="https://t.co/2v6tOo874O">pic.twitter.com/2v6tOo874O</a> 
  </p>&mdash; delthia ricks 🔬 (@DelthiaRicks) <a href="https://twitter.com/DelthiaRicks/status/1520317953245392896?ref_src=twsrc%5Etfw">April 30, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

That certainly _sounds_ interesting, and indeed in line with some of our own work
[on state-level voting patterns and vaccine uptake](https://www.someweekendreading.blog/politics-vs-mask-and-vaccine-use/#statistical-hypothesis-testing)
as well as [the spectacular county-level data analyzed by Charles Gaba](https://www.someweekendreading.blog/pessimism-and-optimism/#reason-4-republican-vaccine-defiance).
But now we're talking peer-reviewed scientific journal papers, use of excess mortality
instead of wildly inaccurate/delayed death reports, and all that.  What's the source?  

<img src="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-medxpress-1.jpg" width="400" height="184" alt="Med Xpress: Georgetown study shows excess COVID-19 deaths in south due to behavior" title="Med Xpress: Georgetown study shows excess COVID-19 deaths in south due to behavior" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-1.jpg" width="400" height="164" alt="Stoto, et al. @ PLoS ONE: COVID-19 excess mortality in the South" title="Stoto, et al. @ PLoS ONE: COVID-19 excess mortality in the South" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The tweet itself points us at a short article in _Medical Xpress_ <sup id="fn1a">[[1]](#fn1)</sup>,
which frankly reads more like a press release from the Georgetown University Medical
Center.  I mean, it's not exactly _wrong,_ but it _is_ cheerleading.  

Fortunately they planted enough clues to track down the article in 
_PLoS ONE_ by a crew from Georgetown. <sup id="fn2a">[[2]](#fn2)</sup>  (__Disclosure:__ Once
upon a time, I was a referee who peer-reviewed a couple papers in _PLoS ONE._  But it was
only a couple times, and it was almost 2 decades ago.  Can you forgive me?)  

Let's look through the paper!  


## A read-through of the paper  

The general situation is, appropriately enough, summarized in the abstract:  

- Using _excess mortality_ (all-cause deaths observed, minus expected deaths from something
  like a 10 year trailing average) gets around the problems with delayed reports, death
  certificate shenanigans, and so on.  Whatever's different _this_ year from the trailing
  10 year average is a suspicious factor for causative analysis.  
- Their excess mortality model says there were 895,693 excess deaths attributable to COVID-19 from
  2020-Jan-03 through 2021-Sep-26.  
  - That's 26% more than the officially reported COVID-19 deaths, i.e.,
    _COVID-19 deaths are woefully under-reported._  
  - The Northeast was most honest about reporting COVID-19 deaths (reports match excess
    mortality), and the South was the worst (COVID-19 severely under-reported compared to
    excess mortality).  
- Initially, there were a lot of deaths in the Northeast, but that was when the virus was
  new &amp; unknown, and there were no vaccines.  Once enough was known, the Northeast
  improved but the South had the most deaths: 48% of deaths, with only 38% of the population.  
- The Northeast's death rate was 42% lower than the nation, while the South's was 26%
  higher.  
- Subtracting off the excess mortality of the best-performing region (the Northeast) leads
  to an estimate of "avoidable" deaths, if each region had used masks and vaccinated like
  the Northeast.  
  - There were 316,234 avoidable deaths (270 per 100,000 population).  
  - 62% of those were in the South.  
- The authors used pre-defined census regions, to avoid any suspicion that they were
  fishing for a result by isolating high-performance and low-performance areas to
  exaggerate differences.  

There's a lot of technique behind the paper, only glancingly mentioned in the text.  

For example, they used "Farrington surveillance algorithms, which use over-dispersed
Poisson generalized linear models with spline terms to model trends in counts, accounting
for seasonality," but sadly showed no equations in the paper itself.  I'm not going to dive
into the math behind that just to _guess_ at what they _might_ have done, so instead I'll just
spot them the usual credit for having cleaned up their data appropriately, with standard algorithms.  

Their references are also fascinating, such as how exactly they sourced their excess
mortality data from the CDC.  I won't go into that here, but if you're a data junkie (and
you know who you are!) then this is a good paper to mine.  

<a href="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-fig1.jpg"><img src="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-fig1-thumb.jpg" width="400" height="353" alt="Figure 1: Excess mortality per 100,000 vs time, by census region of the US, in 5 periods" title="Figure 1: Excess mortality per 100,000 vs time, by census region of the US, in 5 periods" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-fig2.jpg"><img src="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-fig2-thumb.jpg" width="400" height="573" alt="Figure 2: Excess mortality by census region and 5 periods; note red contribution from South" title="Figure 2: Excess mortality by census region and 5 periods; note red contribution from South" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-fig3.jpg"><img src="{{ site.baseurl }}/images/2022-05-01-covid-2-americas-plos-one-fig3-thumb.jpg" width="400" height="581" alt="Figure 3: Avoidable deaths (excess mortality above Northeast's level) by census region and 5 periods; note red contribution from the South" title="Figure 3: Avoidable deaths (excess mortality above Northeast's level) by census region and 5 periods; note red contribution from the South" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now let's have a look at their figures, reproduced here.  (Click to embiggen.)  

- Figure 1 shows excess mortality per 100,000 population vs time, color coding each of the
  4 census districts.  
  - Previously, when 
    [we did regression of hospitalization and death rates on wastewater viral mRNA]({{ site.baseurl }}/wastewater-reredux/),
    we found that each wave was _sui generis._  These authors have found more or less the
    same thing, and thus have divided up the study period into 5 periods.  
  - Note that the first wave was before vaccines, and really before we understood much
    about how SARS-CoV2 is transmitted or how to treat it.  Nothing much could be done
    then.  That's when the Northeast looked pretty bad, mostly because we had more contact
    with the outside world and just got it first.  
  - But after that, once the pandemic had spread to the South, they were consistently
    either the worst or second worst in terms of excess mortality.  
- Figure 2 breaks down the time course of Figure 1 into total deaths by census region and
  5 periods.  Note that in each bar after the first, the red band for the South is the
  largest.  
- Figure 3, to me, is the real meat of the matter.  It's all about the amount of excess
  mortality (honestly reported COVID-19 deaths minus the Northeast) that is _avoidable_
  via better policy.  
  - Period 1 was the start of the pandemic before we knew how it was
    transmitted, how to treat the infection, or had any vaccines.  They viewed none of the
    excess mortality there as avoidable.  We were still figuring it out.  (However, they
    did later do a rudimentary sensitivity analysis using period 1, but I'll leave it to
    those interested to read the paper to find out the details.  Basically, it worked.)  
  - For periods 2 - 5, they could identify the best-performing region (it was always
    the Northeast) and subtract that from the excess mortality for the other regions.
    Presumably if other regions had followed the policies of the best-performing region,
    they could have reduced their excess mortality to similar levels.  
  - Here it becomes really obvious: the South had _enormous_ levels of avoidable excess
    mortality!  

While the authors wisely and delicately refrained from attributing this difference to anything in
particular, we all cannot help but notice the rampant disinformation, denial that COVID-19
is real, mask defiance, and vaccine refusal as possible causes.  
- A follow-on analysis would use this "avoidable excess mortality" as a dependent
  variable in some sort of predictive regression model.  
- The prediction covariates, the independent variables, would be degree of mask
  compliance, degree of vaccination, whether schools were shifted to remote learning, etc.  
- An honest version of such a model would also include confounding factors like age
  distribution, income, and education where the South is different.  Regressing on those
  as well would (partially) control for their effects.  A LASSO model would help in
  feature selection.  


## The Weekend Conclusion  

You might, with some reason, accuse me of being a proud New Englander.  The Northeast is
my home, for 45+ years now.  I _am_ happy to live here.  As a card-carrying member of
the classic liberal intellectual east coast elite, I'm not particularly happy about the
South and its politics.  _But I do not want those people to die!_  

Add up the butcher's bill: 316,234 avoidable deaths, 62% of which were in the South.
That's 316,234 * 0.62 = _196,065 dead Southerners,_ victims of their malign conservative
governments and outright disinformation &amp; superstition.  196,065 Southerners would have
lived and not died, had their governments only encouraged the COVID-19 policies of the Northeast.  

Add to that the rampant under-reporting of COVID-19 deaths in the South, as evidenced by
the excess mortality model's higher numbers than the deaths "officially" reported as COVID-19.  

The conservative policies of the South and other red areas of the US _killed their own
citizens._  And then their _institutions lied about it,_ by under-reporting COVID-19 deaths.  

I may not love the South, and Southerners may not love me.  But _nobody_ deserves that!  

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

<a id="fn1">1</a>: Georgetown University Medical Center, ["Higher COVID-19 death rates in the southern U.S. due to behavior differences"](https://medicalxpress.com/news/2022-04-higher-covid-death-southern-due.html), _Medical Xpress_, 2022-Apr-28. [↩](#fn1a)  

<a id="fn2">2</a>: M Stoto, S Schlageter, JD Kraemer, ["COVID-19 mortality in the United States: It’s been two Americas from the start"](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0265053), _PLoS ONE_ 17:4, e0265053, 2022-Apr-28.  DOI: [10.1371/journal.pone.0265053](https://doi.org/10.1371/journal.pone.0265053).  

There's also [my personal marked-up PDF]({{ site.baseurl }}/assets/2022-05-01-covid-2-americas-journal.pone.0265053.pdf), if for some reason you're curious about what I highlighted on my first read-through. [↩](#fn2a)  
