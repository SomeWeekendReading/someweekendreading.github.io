---
layout: post
title: COVID-19 mRNA in Boston Wastewater
tags: COVID JournalClub MathInTheNews Politics
comments: true
commentsClosed: true
---

Some good news: Boston COVID-19 wastewater levels were at (and now slightly above) the
2-year low.  


## Wastewater Tracking  

Measuring levels of SARS-CoV2 mRNA levels in sewage have a number of attractive
properties.  It's almost impossible to cheat: everybody uses a toiler sooner or later,
whereas nowadays almost nobody reports a positive test taken at home.  It's better even
than hospital admissions: even though the hospital testing for COVID-19 is objective, the
patients admitted now are only the most very severe, as compared to the beginning of the
pandemic.  

So it's got the desirable property of measuring _reality_, rather than reality plus
people's preferences about reporting.  

That's why we've written about it a number of times, here on this Crummy Little Blog That
Nobody Reads (CLBTNR).  <sup id="fn1a">[[1]](#fn1)</sup> <sup id="fn2a">[[2]](#fn2)</sup>
<sup id="fn3a">[[3]](#fn3)</sup> <sup id="fn4a">[[4]](#fn4)</sup>  

We had _hoped_ to find a time-lagged relationship between wastewater mRNA levels and various
sorts of medical loads, like hospital admissions, death rates, and so on.  Reality, of
course had other ideas: each wave was more or less _sui generis:_   
<img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-cdc-1.jpg" width="400" height="157" alt="Staff @ US CDC: COVID-19 treatments &amp; medications" title="Staff @ US CDC: COVID-19 treatments &amp; medications" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- The medical standard of care changed as we learned about SARS-CoV2 and how it manifests
  as COVID-19 (breakthrough infections in the vaccinated, prone ventilation,
  dexamethasone, remdesivir, paxlovid, convalescent plasma
  &hellip;).  The CDC has a nice report on the drugs currently available, which were
  either developed over time or discovered to be something we could re-purpose for
  COVID-19. <sup id="fn5a">[[5]](#fn5)</sup>  
<img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-bmc-id-1.jpg" width="400" height="292" alt="Tieskens et al. @ BMC Infect Dis: Changes in COVID-19 risk population over time" title="Tieskens et al. @ BMC Infect Dis: Changes in COVID-19 risk population over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- The population at risk changed (becoming more vaccinated or more immune through previous
  infection, also many elderly/medically frail people having been killed).  A paper
  published a couple years ago in _BMC Infectious Diseases_ documented this exact
  population shift in Massachusetts <sup id="fn6a">[[6]](#fn6)</sup>, the same population
  we're considering today.  

<a href="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-bmc-id-2.jpg"><img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-bmc-id-2-thumb.jpg" width="400" height="388" alt="Tieskens et al. @ BMCI Infect Dis: Significant (p ~ 1%) correlations of 22 predictor variables" title="Tieskens et al. @ BMCI Infect Dis: Significant (p ~ 1%) correlations of 22 predictor variables" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The Tieskens paper is quite interesting.  They examined many risk factors and found
about 22 that were related to COVID-19, and measured their correlations to find block structures.
This is shown in their Figure 2:  
- There is a block of correlated variables in the upper left which appears to be
  population density, measured various ways.  _This does not mean urban living is more dangerous!_
  Quite the contrary, since it usually indicates proximity to big hospitals.  Rather,
  there are just more people there, and hence more cases.  So we conclude that any
  predictor model had better correct for population density (which they did, _q.v._).
  (Also, their Figure 1 showed the same population effect by looking at Massachusetts
  county by county, seeing COVID-19 cases over time.)  
- Another block in the lower right appears to be more or less crowded housing,
  being poor, Black, Hispanic, or lacking health insurance.  All of those are scary during the
  best of times, but more deadly during the pandemic.  
- There's another block in the middle which seems to have to do with being elderly or
  being in a long-term care facility.  

<a href="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-bmc-id-3.jpg"><img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-bmc-id-3-thumb.jpg" width="400" height="362" alt="Tieskens et al. @ BMC Infect Dis: Changes in 8 risk factor log odds ratios over time, by pandemic wave" title="Tieskens et al. @ BMC Infect Dis: Changes in 8 risk factor log odds ratios over time, by pandemic wave" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
They put these into a
[backward predictor selection process](https://cran.r-project.org/web/packages/olsrr/vignettes/variable_selection.html)
finding 8 fixed-effect predictor variables that all had some goodness of fit during the 5
phases of the pandemic then observable.  Their predictor was a 
mixed-effect, adjusted [Poisson regression](https://en.wikipedia.org/wiki/Poisson_regression).
(Recall: Poisson models predict discrete counts in the limit of large case numbers, as
appropriate here.)  

These variables gave coverage of each of the
correlated predictor blocks seen in the correlation matrix above.  They measured the
influence of each of the 8 variables by looking at the log odds (and 95% CL) of mixed
effects models predicting COVID-19, population-weighted for each town (Figure 3; large
positive values mean it's a risk factor; negative values mean it's a protective factor):  
- Some of them look pretty constant, like availability of essential services and being an
  undergraduate.  Regrettably, the risks for Hispanics remained high.  
- Others show trends, like being Black or in a long-term care facility (both, gratefully,
  decreasing as we tried to enforce some kind of equity among minorities and the
  elderly).  
- Others showed peaks, like age over 80, not having health insurance, and population
  density.  Something about the middle of the pandemic made those even riskier than they
  usually were.  

__Conclusion:__ Not all pandemic waves are the same!  Not medically, and not
demographically.  


## What's the State of Boston's COVID-19 mRNA Levels Now?  

While we can't predict medical loads very well from fits against data in previous
waves, we can nonetheless measure how much COVID-19 is running around in the population,
regardless of the level of test reports.  

So were are we now?  

<img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-globe-1.jpg" width="400" height="186" alt="Dominguez @ Globe: Boston wastewater COVID-19 mRNA levels low" title="Dominguez @ Globe: Boston wastewater COVID-19 mRNA levels low" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
An article today in the venerable _Globe_ <sup id="fn7a">[[7]](#fn7)</sup> points out that
the SARS-CoV2 mRNA levels detected in Boston wastewater are now quite low, as in the
lowest in 2 years.  

<a href="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-mwra-1.jpg"><img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-mwra-1-thumb.jpg" width="400" height="311" alt="MWRA Biobot data: SARS-CoV2 mRNA levels in Boston wastewater through 2023-Jun-29" title="MWRA Biobot data: SARS-CoV2 mRNA levels in Boston wastewater through 2023-Jun-29" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Reliable as the _Globe_ occasionally is, we decided to check the primary source for the
data.  That would be the Massachusetts Water Resource Authority (MWRA), and the tracking
data they collect from the Deer Island treatment plant. <sup id="fn8a">[[8]](#fn8)</sup>  

As you can see, the current levels are indeed low, compared to previous waves.  However,
the extreme peak of the Omicron wave at the beginning of 2022 dwarfs everything else.
While I wish they would show it on a vertical log scale, I'm not going to replot their
data.  

<a href="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-globe-2.jpg"><img src="{{ site.baseurl }}/images/2023-07-06-boston-wastewater-low-globe-2-thumb.jpg" width="400" height="254" alt="R Huddle/Globe Staff: MWRA North/South district SARS-CoV2 mRNA levels, past 60 days" title="R Huddle/Globe Staff: MWRA North/South district SARS-CoV2 mRNA levels, past 60 days" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
You can see a zoomed-in picture on recent data either on the MWRA site (separated by North
and South water districts), or you can consider the _Globe_'s zoomed in version,
shown here:  
- The absolute minimum was a couple weeks ago, around 2023-June-23, at a bit below 100 copies/mL.  
- While it's risen a bit since then, the change is clearly not terribly meaningful: about
  50 copies/mL increase, when previous waves had 1000 copies/mL to around 10,000 copies/mL.
  This is very likely noise, though we haven't done formal statistical testing to
  establish that.  
  
We have a highly vaccinated population in Boston, and it shows here.  But, in the fall
when students return from all over the world, we should probably see an uptick.  (When
teaching at MIT, many years ago as a grad student, I'd always get a bad cold in September
or October, as I was exposed to students upon their return.  A cold, I'm happy to tolerate
in exchange for the opportunity to teach them.  I'm less sanguine about COVID-19!)  


## The Weekend Conclusion  

COVID-19 is not over, no matter what your friends tell you.  Here at Ch&acirc;teau Weekend
we note with sadness that some less cautious friends of ours have recently caught COVID-19
_for the fourth time_, despite being fully vaccinated.  Risk exposure is not without its
consequences.  

The political "end" of the public health emergency means we've been blinded to the data.
But it appears about 1000 people are dying each week in the US.  We act like 50,000 dead
every year is no big deal.  50,000 people&hellip; somehow "no big deal".  

It is _incredibly_ stupid &amp; cruel to normalize this sort of death rate!  

If you're eligible for a second dose of the bivalent booster (over 65, other medical
need), then you should definitely get it now.  

The US FDA's VRBPAC (Vaccine and Related Biological Product Advisory Committee) voted on
2023-Jun-15 to authorize a fall booster this year tuned to the latest variant, 
XBB.1.5. <sup id="fn9a">[[9]](#fn9)</sup>  

Yes, _of course_ you should get this fall booster.  Don't ask silly questions, or at least
ask them _after_ getting the fall booster.  Just get the fall booster.  

Live, and not die.  

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

<a id="fn1">1</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Wastewater coronavirus RNA vs medical loads"]({{ site.baseurl }}/wastewater-corona-virus-rna-vs-medical-loads/), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2020-Nov-04. [↩](#fn1a)  

<a id="fn2">2</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Wastewater Revisited: Metagenomic Viral RNA and Medical Loads"]({{ site.baseurl }}/wastewater-redux/), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2021-May-21. [↩](#fn2a)  

<a id="fn3">3</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Boston Wastewater Re-Re-Visited: Sewage Viral RNA vs COVID-19 Cases and Deaths"]({{ site.baseurl }}/wastewater-reredux/), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2022-Feb-04. [↩](#fn3a)  

<a id="fn4">4</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["SARS-CoV2 Cryptic Sequences in NYC Wastewater: Why Not to Sleep Well at Night"]({{ site.baseurl }}/sars-cov2-cryptic/), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2022-Feb-07. [↩](#fn4a)  

<a id="fn5">5</a>: CDC Staff, ["COVID-19 Treatments and Medications"](https://www.cdc.gov/coronavirus/2019-ncov/your-health/treatments-for-severe-illness.html), US _Centers for Disease Control and Prevention_, updated 2023-May-26, retrieved 2023-Jul-06. [↩](#fn5a)  

<a id="fn6">6</a>: KF Tieskens, _et al.,_ ["Time-varying associations between COVID-19 case incidence and community-level sociodemographic, occupational, environmental, and mobility risk factors in Massachusetts"](https://bmcinfectdis.biomedcentral.com/articles/10.1186/s12879-021-06389-w), _BMC Infect Dis_, 21:686, 2021-Jul-16. [↩](#fn6a)  

<a id="fn7">7</a>: [Emma Obreg&oacute;n Dominguez](https://www.bostonglobe.com/about/staff-list/correspondent/emma-obregon-dominguez/?p1=Article_Byline), ["COVID-19 waste water numbers reach lowest levels in two years"](https://www.bostonglobe.com/2023/07/06/metro/covid-19-waste-water-numbers-have-reached-their-lowest-levels-two-years/), _Boston Globe_, 2023-Jul-06. [↩](#fn7a)  

<a id="fn8">8</a>: MWRA Staff, [Biobot wastewater RNA data](http://www.mwra.com/biobot/biobotdata.htm), [_Massachusetts Water Resource Authority_](https://www.mwra.com/index.html), data through 2023-Jun-29 retrieved 2023-Jul-06. [↩](#fn8a)  

<a id="fn9">9</a>: US FDA Staff, ["Updated COVID-19 Vaccines for Use in the United States Beginning in Fall 2023"](https://www.fda.gov/vaccines-blood-biologics/updated-covid-19-vaccines-use-united-states-beginning-fall-2023), US _Food & Drug Administration_ press releases, 2023-Jun-15. [↩](#fn9a)  
