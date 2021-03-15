---
layout: post
title: US Senate&colon; does one party filibuster more?
tags: MathInTheNews Politics
comments: true
---

Sen McConnell claims the _Democrats_ abuse the filibuster!  Because of course he does.
But what does the data say?  


## The claim  

<img src="{{ site.baseurl }}/images/2021-03-15-filibusters-pbs.jpg" width="400" height="323" alt="PBS News Hour: Judy Woodruff interviews Sen McConnell" title="PBS News Hour: Judy Woodruff interviews Sen McConnell" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Senator McConnell was interviewed on the PBS news hour a few nights ago, by 
[Judy Woodruff](https://en.wikipedia.org/wiki/Judy_Woodruff). <sup id="fn1a">[[1]](#fn1)</sup>
He made the extraordinary claim that the Republicans were innocent, but that _Democrats_
had abused the filibuster:  

>Our Democratic friends in the minority last year used it frequently to stop things that
>we might have wanted to do. Now they're threatening to blow the place up and turn the
>Senate into the House, so that they can get their way, with presumably 50 Democrats
>voting yes and the vice president being in the chair.  

Now, that is quite startling!  The Republicans have been so clearly radical, I
find it hard to accept.  What do the data say?  


## The data  

It's hard to come by explicit data on the use of the filibuster in the US senate.  That's
because a filibuster isn't a particular legislative move or a formal filing; it's a
_behavior_.  If you insist on talking _ad nauseam_, that's a filibuster whether you say so
or not.  And it's even worse nowadays: you don't actually have to stand up there and talk.
You just need to signal privately your _intent_ to filibuster to the party leaders , and
everything grinds to a halt!  

However, since the early 20th century there has been a formal filing to close off
a filibuster, called a _cloture motion_.  We can track cloture motions filed versus time.
On the theory that filibusters irritate people enough to try to get the votes for cloture,
this might track filibusters.  On the other hand, if there is not a 60% supermajority to
_invoke_ cloture, maybe nobody tries and this under-represents filibusters?  I dunno, but
it's all we can get easily.  

<img src="{{ site.baseurl }}/images/2021-03-15-filibusters-cloture-data.jpg" width="400" height="260" alt="US Senate: Cloture motions over time, by session" title="US Senate: Cloture motions over time, by session" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So we took the US Senate's web page for cloture motion filings and captured them
into a tab-separated value file. <sup id="fn2a">[[2]](#fn2)</sup>  
We dropped the current (117th) senate term, since it's only been in session for 3 months.
We're doing this by senate term, each of which is 2 years long, rather than by individual
years.  That's the time granularity over which party majorities can change.  So we're starting with the 91st session (1969-1970) and ending with the 116th session (2019-2020).  That's 50 years of data, starting in 1970 when pundits seem to claim the use of filibusters took off.  

You'd think it would be dead easy to get a table of party counts in each senate session,
but apparently not.  The US Senate's records are presented as a big bowl of 
word salad <sup id="fn3a">[[3]](#fn3)</sup>, not a nice table of analyzeable data.
So&hellip; a bit of hand screen-scraping was in order.  

<img src="{{ site.baseurl }}/images/2021-03-15-filibusters-party-data.jpg" width="400" height="264" alt="US Senate: party dominance by session" title="US Senate: party dominance by session" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
We then massaged this data in a couple of ways:  
- The independents who caucus with one of the major parties were added to the count for
  the major party.  E.g. Sen Sanders caucases with the Democrats, so for our purposes he
  counts toward the Democrat's seat count.  
- We eliminated the 107th session (2001-2002) since power actually shifted back and forth
  between Democrats and Republicans 4 times in this 2-year session!  I dunno what to do
  with that, but I do know it looks like a huge outlier, so I dropped it.  
- Sometimes the presidency party (actually the Vice President) is needed, in case a
  tie-breaking vote is required.  That's in the data file, but it's only necessary in the
  117th (current) and 107th session, both of which were dropped from the analysis.  So
  practically speaking, the senate majority is always determined by senator seat counts in
  this particular dataset.  

<img src="{{ site.baseurl }}/images/2021-03-15-filibusters-omnibus-data.jpg" width="400" height="289" alt="US Senate: Omnibus majority party and cloture filing count data" title="US Senate: Omnibus majority party and cloture filing count data" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
To analyze these data, we wrote an [R](https://www.r-project.org) 
script <sup id="fn4a">[[4]](#fn4)</sup> to load the cloture &amp; party data, then
assemble them with an inner join on the senate session number to produce an omnibus
dataset here delivered as a combined tab-separated value file. <sup id="fn5a">[[5]](#fn5)</sup>
In the process, there was considerable
constraint checking for quality assurance purposes: the numeric fields were always
positive integers, the number of senators was always 100, the majority party in the senate
followed the decision rules from the seat counts and the presidency party, and so on.  (The
details are available for peer review in the script itself.)  


## Analysis  

### Exploratory analysis  

<img src="{{ site.baseurl }}/images/2021-03-15-filibusters.png" width="400" height="600" alt="Senate filibusters since 1970: trend over time and frequency by party" title="Senate filibusters since 1970: trend over time and frequency by party" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First, let's just have a look at the data:
- There is no doubt that the number of cloture attempts is increasing over the last 50
  years.  To the extent that cloture attempts track perceived filibusters (mildly
  questionable), this confirms what we think about _somebody_ weaponizing the filibuster
  to require a 60% supermajority for more or less all legislation.  (Though nominations
  are on a different track, and apparently now harder to filibuster.)  
- This strong trend in time means the data from the early part of the curve is unlikely to
  be relevant to the later part of the curve.  This will come back to bite us below when
  we do hypothesis testing.  
- There's no obvious excess of high numbers associated with either red dots or blue dots.
  Frankly, it looks like a tit-for-tat situation where one party so offends the other with
  their use of filibusters, that they get hit back harder when power shifts.  
- The boxplot of the probability distribution of number of cloture attempts vs party is
  also somewhat informative: the black horizontal bar is the median, the colored box is
  the upper &amp; lower quartile, and the whisker is the total range.  It appears the
  median is higher for Republicans, but the variation makes that unlikely to be
  statistically significant.  It appears the upper whisker goes higher for Republicans as
  well.  So we hypothesize: there's more filibuster/cloture action under Republican
  majorities, though the variation is high and the outliers dominate.  

When we break down by majorit party the mean clotures, the standard deviation of clotures,
and the number of years in power, we see about the same thing:  
```R
  Majority Motions.Filed.Mean Motions.Filed.Sd Years
1        D               74.4             66.3    28
2        R              102.0             89.0    22
```

### Hypothesis testing  

McConnell's hypothesis is that the Democrats are somehow bad, so that should show up as
some kind of difference between the two parties as far as cloture/filibuster counts.  Our
null hypothesis against which that will be tested is basically that there is no such
difference.  (Null hypotheses are almost always about "nothing going on", "no difference",
and hence the name "null".)  

This is a simple $t$-test for whether the mean number of cloture invocations per session
is different by party majority.  The boxplot above leads us to predict that this will be
statistically non-significant:  

```R
	Welch Two Sample t-test

data:  Motions.Filed by Majority
t = -0.8573, df = 17.987, p-value = 0.4026
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -95.14208  39.99923
sample estimates:
mean in group D mean in group R 
       74.42857       102.00000 
```

And with a $p$-value of 40%, it is indeed non-significant.  We therefore _reject_
McConnell's hypothesis and accept the null hypothesis that things aren't that different
betweeen the two parties, as far as use of filibusters and as far as cloture motions track
filibusters.  


## Interpretation  

The results lack statistical significance, so we can't rule out that this difference
occurs just by chance.  However:  
- The cloture counts show a strong trend over time, so we're comparing the low counts of
  the 1970's with the high counts of the hyper-partisan 2000's.  (I used to think Reagan
  was hyper-partisan, and he was, but not as bad as today, apparently.)  
- If we were to de-trend the data or just use the last decade, we'd have too few data
  points to get significance either.  
- It still could be (for example) that Republicans systematically abuse filibuster, and
  Democrats when in power would have to invoke cloture to combat it.  Since we're not
  measuring filibusters, but rather clotures, this whole issue is kind of murky.  
  
But even without statistical significance:  
- The table above shows there have been, in teh mean, about 1.37x more instances of
  filibuster related action (cloture attempts) under Republicans than under Democrats.
  The time trend and the standard deviation keep this from being statistically
  significant.  
- The boxplot of cloture attempts by party shows an upper tail higher for Republicans,
  i.e., more instances of high-count activity.  
  
So&hellip; it's a bit murky, but we can say for sure that McConnell's accusation is
_rejected by the data_.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: J Woodruff, ["Sen. Mitch McConnell on COVID relief, election reform and the filibuster rule"](https://www.pbs.org/newshour/show/sen-mitch-mcconnell-on-covid-relief-election-reform-and-the-filibuster-rule), _PBS News Hour_, 2021-Mar-11. [↩](#fn1a)  

<a id="fn2">2</a>: United States Senate, ["Cloture Motions"](https://www.senate.gov/legislative/cloture/clotureCounts.htm), _senate.gov_, 2021-Mar-14. Captured as [2021-03-15-filibusters-cloture.tsv]({{ site.baseurl }}/assets/2021-03-15-filibusters-cloture.tsv). [↩](#fn2a)  

<a id="fn3">3</a>: United States Senate, ["Party Division"](https://www.senate.gov/history/partydiv.htm), _senate.gov_, 2021-Mar-14. __NB:__ Data is not presented here as a table, but as text.  A certain amount of hand extraction into a tab-separated data file was necessary. 
Results captured as [2021-03-15-filibusters-parties.tsv]({{ site.baseurl }}/assets/2021-03-15-filibusters-parties.tsv)[↩](#fn3a)  

<a id="fn4">4</a>: Weekend Editor, ["R script for analyzing senate filibusters"]({{ site.baseurl }}/assets/2021-03-15-filibusters.r), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Mar-15.  There is also [a transcript of the execution of this script]({{ site.baseurl }}/assets/2021-03-15-filibusters.txt), to peer-review the results reported here.[↩](#fn4a)  

<a id="fn5">5</a>: Weekend Editor, ["Omnibus dataset for senate filibusters"]({{ site.baseurl }}/assets/2021-03-15-filibusters.tsv), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Mar-15. [↩](#fn5a)  
