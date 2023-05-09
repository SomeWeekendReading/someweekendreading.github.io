---
layout: post
title: Updated Update&colon; Ukrainian Estimates of Russian Casualties
tags: MathInTheNews R Sadness Statistics
comments: true
commentsClosed: true
---

We've (again) updated our estimate of when Russian casualties will reach 200k, according
to the Ukrainian Ministry of Defence’s published data.  This time with an improved (though
not perfect) prediction method.  


## Ukrainian Ministry of Defence and Russian Casualty Counts  

Background: the Ukrainian Ministry of Defence publishes daily estimates of various sorts
of Russian casualties.  Cursory investigation shows they are higher than the OSInt numbers
from Oryx (where they demand documentation of everything, a high standard in war) but
lower than other media sources.  So&hellip; not really verifiable, but not the most
extreme numbers, either.  

We've previously written <sup id="fn1a">[[1]](#fn1)</sup> <sup id="fn2a">[[2]](#fn2)</sup>
about collecting these data, looking at odd time patterns in cruise missile attacks that
probably say something about Russian supply chains, and building regression models to
project future casualty numbers.  

Today, 2023-May-09, was the upper confidence limit on the date we thought Russian losses
of soldiers would reach 200,000.  Let's check in to see what's going on.  


## Data and Methods  


We've updated the data as of today's report (2023-May-09), and updated the
[R](https://www.r-project.org/) script to do a slightly better prediction of 200k 
day; all are available here for peer review. <sup id="fn3a">[[3]](#fn3)</sup>
As previously observed, the 2023-Apr-30 data is missing.  
## Results  

<a href="{{ site.baseurl }}/images/2023-05-09-russian-casualty-data-update-update-regress-Soldiers-on-DayNum.png"><img src="{{ site.baseurl }}/images/2023-05-09-russian-casualty-data-update-update-regress-Soldiers-on-DayNum-thumb.jpg" width="400" height="400" alt="UKR MoD data on Russian casualties: Soldiers vs DayNum" title="UKR MoD data on Russian casualties: Soldiers vs DayNum" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
For the most part, things look pretty similar to the way they looked last time, with just
a continuation of trends.  

Shown here, for example, is the trend of number of Russian soldiers killed (as counted by
the UKR MoD, of course) versus the day number since 2023-Jan-22.  It's pretty much a
continuation of the trend, with quite tight confidence intervals and prediction
intervals.  The fact that a linear model fits well is a bit surprising, perhaps indicative
of a relatively constant, grinding level of war.   

The fit is indeed excellent:  

```
Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 1.220e+05  3.149e+02   387.5   <2e-16 ***
x           7.123e+02  5.099e+00   139.7   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1613 on 104 degrees of freedom
Multiple R-squared:  0.9947,	Adjusted R-squared:  0.9946 
F-statistic: 1.951e+04 on 1 and 104 DF,  p-value: < 2.2e-16
```

<a href="{{ site.baseurl }}/images/2023-05-09-russian-casualty-data-update-update-FvsLar7aMAAATCN.jpg"><img src="{{ site.baseurl }}/images/2023-05-09-russian-casualty-data-update-update-FvsLar7aMAAATCN-thumb.jpg" width="400" height="653" alt="UKR MoD data on Russian casualties: 2023-May-09 report" title="UKR MoD data on Russian casualties: 2023-May-09 report" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
One feature of the plot above possibly worth noting is that the data points appear to bend
downward, with a slower death rate on about day 60.  The linear fit is approximately an
average of the previous high slope and the new lower slope.  That means any prediction
here will include influence from the early high slope, and hence _underestimate_ time time
to 200k dead.  

Indeed, that's what we observe: we were sure today would be The Very Bad Day, but it is
not.  Today's figure was 195,620.  

We could, of course, implement a nonlinear model to address this.  E.g., a piecewise
linear model with a hinge at day 60 would do the trick, or we could actually let the hinge
date be a fit parameter.  That would lead to a 4-parameter model: 2 slopes, 2 intercepts,
1 hinge date, but 1 constraint that the lines meet exactly at the hinge date.  

However, that would be a more complex model, rather ill-motivated by anything other than a
desire to fit the data better when we already have an excellent fit.  So let's just live
with the caution that our estimates will be _underestimates_, and move on.  

<a href="{{ site.baseurl }}/images/2023-05-09-russian-casualty-data-update-update-regress-DayNum-on-Soldiers.png"><img src="{{ site.baseurl }}/images/2023-05-09-russian-casualty-data-update-update-regress-DayNum-on-Soldiers-thumb.jpg" width="400" height="400" alt="UKR MoD data on Russian casualties: DayNum on Soldiers" title="UKR MoD data on Russian casualties: DayNum on Soldiers" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now on to predictions!  

Last time, we used the regression model of Soldiers as a function of DayNum, and
back-solved to find the date when the number of casualties was about 200k.  That's&hellip;
awkward, especially since the 95% confidence intervals don't work linearly like that.  

So this time we'll regress DayNum on Soldiers, and use the number of losses at 200k to
directly predict the day number and its 95% confidence limit.  The fit is shown here.
(Don't spend too much time staring at it, since it's just the transpose of the fit above.)  

The vertical dashed gray line is 200k soldiers lost.  As you can see, things are not yet
that bad.

The fit is, of course, equally as excellent as the fit above:  

```
Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.701e+02  1.617e+00  -105.2   <2e-16 ***
Soldiers     1.396e-03  9.998e-06   139.7   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.258 on 104 degrees of freedom
Multiple R-squared:  0.9947,	Adjusted R-squared:  0.9946 
F-statistic: 1.951e+04 on 1 and 104 DF,  p-value: < 2.2e-16
```

When we use the linear model predictor to guess when casualties reach 200k, and what the
95% lower and upper confidence limits are, we get:  

```
         fit        lwr        upr
1 2023-05-11 2023-05-06 2023-05-15
```

Three things are worth noting here:  

1. The most likely date, using data up through today, is 2023-May-11.  For the reasons
   discussed above, the bend in slope at day 60 means this is probably a slight
   underestimate and the real event will be a little bit after that.  
2. The 95% confidence limit is from 2023-May-06 to 2023-May-15.  So any time from May 11
   to May 15 is probably a decent estimate to use.  
3. The lower confidence limit, 2023-May-06, is _in the past_.  We know with 100%
   confidence that the date will be in the future, so this is nonsense!  We're using an
   acausal (unaware of time and cause) linear model to predict a causal (time series,
   where things happen in a certain order) to predict.  This is, at some level, wrong.
   Probably if I were to take this seriously, I should go get out my old copy of Box,
   Jenkins, and Reinsel <sup id="fn4a">[[4]](#fn4)</sup> (or even something more modern
   like Hyndman and Athanasopoulos <sup id="fn5a">[[5]](#fn5)</sup>) and read about time
   series forecasting.  Both of them are sitting on my shelf, but
   [_Vīta brevis, ars longa, occāsiō praeceps, experīmentum perīculōsum, iūdicium difficile_](https://en.wikipedia.org/wiki/Ars_longa,_vita_brevis),
   as Hippocrates is supposed to have said (ok, in Greek, but I only know it in Latin).  


## The Weekend Conclusion  

Using slightly (though not completely) better methods, we estimate 200k Russian casualties
sometime in 2023-May-11 to 2023-May-15.  These dates are likely (slight) underestimates,
i.e., the true date will likely be a bit later.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Do the Ukrainian Reports of Russian Casualties Make Sense?"]({{ site.baseurl }}/russian-casualty-data/), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2023-Apr-15. [↩](#fn1a)  

<a id="fn2">2</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Update: Ukrainian Estimates of Russian Casualties"]({{ site.baseurl }}/russian-casualty-data-update/), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2023-May-01. [↩](#fn2a)  

<a id="fn3">3</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Updated R script to analyze Ukrainian reports of Russian casualties"]({{ site.baseurl }}/assets/2023-05-09-russian-casualty-update-update-ukr-rus-casualties.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2023-May-09.  

There is also [a textual transcript of running this]({{ site.baseurl }}/assets/2023-05-09-russian-casualty-update-update-ukr-rus-casualties-transcript.txt), so you can check that it says what I told you.  

We've also archived
[a .zip file of the original images uploaded by the Ukrainian MoD]({{ site.baseurl }}/assets/2023-05-09-russian-casualty-update-update-russian-casualty-data-images.zip),
and [a .tsv format spreadsheet we constructed from that for analysis]({{ site.baseurl }}/assets/2023-05-09-russian-casualty-update-update-russian-casualties-in-ukraine.tsv).  

__NB:__ There are also some subroutine files for graphics and analysis pipeline building
(`graphics-tools.r` and `pipeline-tools.r`) that are loaded from our private repository.
If you want those too for reproduction purposes, drop us an email and we'd be happy to send
them along to you.  

You might have to rename the script, create a data directory, and put the .tsv file in it with the appropriate name to make this work.  Ask if there's a problem.  Here at Ch&acirc;teau Weekend, we are peer-review-friendly. [↩](#fn3a)  

<a id="fn4">4</a>: G Box, _et al.,_ ["Time Series Analysis: Forecasting and Control (5th ed)"](https://www.amazon.com/Time-Analysis-Forecasting-Probability-Statistics/dp/1118675029/), Wiley, 2015.  Mine is the older 3rd edition of 1994. [↩](#fn4a)  

<a id="fn5">5</a>: R Hyndman &amp; G Athanasopoulos, ["Forecasting: Principles and Practice"](https://www.amazon.com/Forecasting-principles-practice-Rob-Hyndman/dp/0987507117/), [Open Access Textbooks](https://OTexts.com/fpp2/), 2018. [↩](#fn5a)  
