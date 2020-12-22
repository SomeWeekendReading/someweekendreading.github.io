---
layout: post
title: Is the racial makeup of the Boston Police Department unrepresentative?
tags: MathInTheNews Politics R SomebodyAskedMe Statistics
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about [this article in the _Boston Globe_ by Vernal Coleman](https://www.bostonglobe.com/2020/06/30/metro/boston-police-once-resembled-community-force-has-grown-whiter-city-becomes-more-diverse/)
on the racial makeup of the Boston Police Department: does it resemble the
community it polices?  

These days, police are understandably under intense scrutiny.  So... _scrutinemus_!


### Story

<img src="{{ site.baseurl }}/images/2020-07-03-bpd-racial-makeup-globe-article.png" height="190" width="190" alt="Coleman article in Globe" title="Coleman article in Globe" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Reporters love _story_, i.e., they will move heaven and earth to uncover a narrative with
people telling you how things felt.  Rarely do they have any such feelings about data, let
alone math, which is entered begrudgingly as lesser evidence.  But we nerds see it the
other way around, so... does the evidence back up the story, or not?  

Let's get the "story" out of the way:  

It turns out that in 1973 Black officers were only 2% of the department vs 20% of the city
-- you don't need a fancy statistician to tell you that ain't right!  (Though a fancy
statistician _did_ in fact just tell you that.)  One thing led to another; federal case,
lawyers, judges, consent decree, blah, blah blah: and the deparment was legally forced to
hire one minority officer for every white officer it hired, until they became balanced.
(This is the sort of thing that puzzles me. I want to ask them: "This is so _obviously_
sensible, why did you need _literally_ a federal case to force you to do it?!")  

And what do you know?  It worked!  In 2004, "for the first time in modern history" the BPD
looked like the community.  So the judge lifted the order.  

Can you guess the rest?  What does the _story_ require, dramatically, for the reporter to
notice?  

The accusation is, of course, that the BPD went back to its bad old ways and became
whiter.  And to service the needs of the narrative, there are quotes in the article from
veteran minority officers who say this is indeed their personal experience.  Good for
them; we should listen to them.  

Ok, enough _story_.  

### Data

<a href="{{ site.baseurl }}/images/2020-07-03-bpd-racial-makeup-pie-chart.png" target="_blank"><img src="{{ site.baseurl }}/images/2020-07-03-bpd-racial-makeup-pie-chart.png" height="200" width="200" alt="BPD racial makeup pie chart"  title="BPD racial makeup pie chart" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Do the _data_ give us any guidance as to what to think about that story?  So here's what we _know_:  

* The venerable _Globe_'s chart tells us the current BPD officers are 65.4% white.  
* [Wikipedia on the BPD](https://en.wikipedia.org/wiki/Boston_Police_Department#Departmental_organization:~:text=The%20Boston%20Police%20Department%20has,and%20a%20population%20of%20617%2C594.) tells us they have 2015 officers.  
* The [census data on Boston](https://www.census.gov/quickfacts/bostoncitymassachusetts) tells us city has 692,600 residents, of whom 52.6% are white.  

So our research question is: is 65.4% of BPD being white significantly different from
52.6% of Bostonians being white?  

The first thing we do is build a contingency table (we're using
[R](https://www.r-project.org/) here, of course), showing the number of white/nonwhite
people in the BPD and in Boston generally:   
```R
> mx <- matrix(c(2015 * 0.654, 2015 * (1 - 0.654), 692600 * 0.526, 692600 * (1 - 0.526)), nrow = 2, byrow = TRUE, dimnames = list(c("BPD", "BOS"), c("White", "Nonwhite"))); mx
```
```
        White  Nonwhite
BPD   1317.81    697.19
BOS 364307.60 328292.40
```

### Analysis

[Fisher's exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test) (devised,
according to legend, for the problem of [The Lady Tasting Tea](https://en.wikipedia.org/wiki/Lady_tasting_tea)) is sort of the canonical way
to ask if the row &amp; column proportions in a contingency table are really different.  A small
_p_-value means there's very little chance the differences are random, and that the effect
is real.  Here the _p_ ~ 2.2e-16, so it's very significant:  
```R
> fisher.test(mx)
```
```
	Fisher's Exact Test for Count Data

data:  mx
p-value < 2.2e-16
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 1.553230 1.870766
sample estimates:
odds ratio 
   1.70401 
```

Another way to test this is using a [test of proportion](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/prop.test). It
tests just what we want to know: whether getting 65.4% of the BPD is really different
from getting 52.6% of Boston (i.e., the null hypothesis is that the proportions are the
same and any variation is just sampling noise).  Here again, a tiny _p_-value (in fact the
smallest R will report, which is why it's the same as for the Fisher exact test) tells us the effect is real:  
```R
> prop.test(mx)
```
```
	2-sample test for equality of proportions with continuity correction

data:  mx
X-squared = 131.53, df = 1, p-value < 2.2e-16
alternative hypothesis: two.sided
95 percent confidence interval:
 0.1069478 0.1490522
sample estimates:
prop 1 prop 2 
 0.654  0.526 
```

Finally, we can think like a Bayesian, at least for a minute.  What we've measured
experimentally here are really just some conditional probabilities: p1 = Pr(White | BOS)
and p2 = Pr(White | BPD).  But both p1 and p2 have some distribution: if we start with a
uniform prior, then [the posterior here is a Beta distribution](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading14a.pdf).
We can plot those distributions, and see if our uncertainty about the 2 probabilities (the "proportions")
has them well-separated or not:  
```R
> source("~/Documents/laboratory/tools/graphics-tools.r")
> ps <- seq(from = 0, to = 1, length.out = 1000)
> bpd <- dbeta(ps, shape1 = 1318, shape2 = 698)
> bos <- dbeta(ps, shape1 = 364308, shape2 = 328293)
> withPNG("../images/2020-07-03-bpd-racial-makeup-posterior-beta.png", 600, 300, FALSE, function() { withPars(function() { matplot(ps, matrix(c(bpd, bos), byrow = FALSE, ncol = 2), type = "l", lty = "solid", col = c("blue", "black"), xlab = "p", ylab = "Density", main = "Bayesian Posterior Beta Distributions"); legend("topright", inset = 0.01, bg = "antiquewhite", legend = c("BPD", "BOS"), col = c("blue", "black"), lty = "solid", lwd = 2) }, pty = "m", bg = "transparent", ps = 16, mar = c(3, 3, 2, 1), mgp = c(1.7, 0.5, 0)) }) 
```

<a href="{{ site.baseurl }}/images/2020-07-03-bpd-racial-makeup-posterior-beta.png" target="_blank"><img src="{{ site.baseurl }}/images/2020-07-03-bpd-racial-makeup-posterior-beta.png" height="150" width="300" alt="Bayesian posteriors" title="Bayesian posteriors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
As you might expect, with 692,600 people, we are _very_ certain about the distribution for
Boston in general.  With the BPD 300x smaller than the population of Boston, we have
considerably more uncertainty.  But the Boston spike is the tall black one, while the BPD
is the smaller, more spread-out blue one.  Yes, there's some uncertainty... but we're not
in the least uncertain that these 2 distributions are _different_.  The BPD is indeed
whiter than Boston.  

### Conclusions

Case closed?  Not really.  We've just demonstrated to our satisfaction that there really
is a difference here.  We've demonstrated _statistical significance_, i.e., that the story
is telling us something real.  So at least a conversation about racial makeup of the
police force is firmly grounded in reality.  

We have not demonstrated _strength of effect_, i.e., that the real difference in racial
makeup has big consequences in terms of policing policy.  (It probably does, but that's
just my _story_, not a _fact_.)  

We need to have investigative reporting and honest political discussions about what we
value in police practices, what outcomes we are seeking, and whether those outcomes are
best addressed via police at all (as opposed to public health, employment, housing, and
education for example).  That will take time and good will, both in regrettably short
supply.  Perhaps then we can devise a police force that is finally clearly under civilian
control, and operating for the common good.  
