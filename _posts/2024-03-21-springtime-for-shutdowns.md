---
layout: post
title: Springtime for Shutdowns
tags: MathInTheNews Politics R Sadness Statistics
comments: true
commentsClosed: true
---

It's springtime!  That means Republicans in the US want to shut down the federal
government.  Or does it?  Let's look at some data, and find out.  


## US Government Shutdowns  

One of the peculiarities of US government is that it must periodically have its budget
passed by Congress and signed by the President.  Without this, parts of the government
begin to shut down, right up to and including defense, diplomacy, and&hellip;
_everything._ <sup id="fn1a">[[1]](#fn1)</sup> All such appropriations bills must, by
constitutional fiat, start in the House.  <sup id="fn2a">[[2]](#fn2)</sup>  

Given a cabal of Republican extremists in the House, such a must-pass bill is an irresistible
opportunity for blackmail.  They'll give Ukraine to Russia, default on debt, shut down
schools, fail to feed children, cut off pensions for the elderly, block military
promotions, or any other way to throw sand in the gears to attempt to force the
Republican agenda.  

Since they can't get a majority, blackmail is a perfectly acceptable alternative tool to
them.  That's why we've had 3 government crises around almost-shutdowns in just the first
3 months of 2024.

Is Republican partisanship fundamentally associated with shutdowns, or not?  


## Some Data on Shutdown Partisanship  

[Steven Rattner](https://en.wikipedia.org/wiki/Steven_Rattner) is apparently an investor,
former journalist, former Obama Treasury advisor, and media commentator.  He reminded us (on
the Bad Social Media Site) of the partisanship associated with the last 30 years of
shutdowns.  They started to be a regular thing in the 90s, with Republican hysteria over
Clinton, and have never left.  

The usual rules of engagement for social media apply:
- You probably don't want to touch X/Twitter.  
- Under _no circumstances_ should you read the replies.  I looked (briefly), so you don't
  have to.  They're mostly along the lines of "fake news", "lying media", "shutdowns are
  good", and outright denial of the data, as is now traditional among Republicans.  (I was
  alive during this time interval, and can personally confirm the data from direct experience.
  As if anyone could really doubt it in the first place.)  

<a href="https://twitter.com/SteveRattner/status/1770110205637882291"><img src="{{ site.baseurl }}/images/2024-03-21-springtime-for-shutdowns-rattner-1.jpg" width="550" height="901" alt="Rattner @ Twitter: Partisanship of House, Senate, and Presidency during shutdowns" title="Rattner @ Twitter: Partisanship of House, Senate, and Presidency during shutdowns" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<img src="{{ site.baseurl }}/images/2024-03-21-springtime-for-shutdowns-data.jpg" width="400" height="244" alt="Rattner's data on government branch partisanship for 30 years of shutdowns" title="Rattner's data on government branch partisanship for 30 years of shutdowns" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Applied statistician voice: Hey, that's some _data_, right there!  

We've got 30 years of data on the partisanship of each branch of the US government during
a shutdown, summarized in a nice neat table, shown here.  

Can we make anything of that?  

Why, yes.  Yes, we can.  

And will.  


## Some Slightly Objective Thinking About the Data  

The obvious conclusion being invited here is that shutdowns are associated with Republican
dominance, particularly in the House.  The House part is understandable, given the
constitutional specification.  But should we believe the bias here that accuses
Republicans of having shutdowns as part of the Republican brand?  

There are, as always, 2 questions:  
1. _Statistical Significance:_ Is the effect real, i.e., will it reproduce in the future?  
2. _Strength of Effect:_  Is the effect big enough to matter?  (If you have great steaming
   piles of data, you can find statistically significant effects that nonetheless do not
   matter.)  
   
So, of course we wrote an [R](https://www.r-project.org/) script to decide the
matter. <sup id="fn3a">[[3]](#fn3)</sup>  
   
### Statistical Significance  

Na&iuml;vely, the data above gives the proportion of the time a given branch is
Republican, during each of the 6 shutdowns over the last 30 years:  

$$
\left\{
  \begin{align*}
    \Pr\left(\mbox{Republican House}      |\mbox{Shutdown}\right) &= 6 / 6 = 100\% \\
    \Pr\left(\mbox{Republican Senate}     |\mbox{Shutdown}\right) &= 4 / 6 = \:\: 67\% \\
    \Pr\left(\mbox{Republican Presidency} |\mbox{Shutdown}\right) &= 2 / 6 = \:\: 33\%
  \end{align*}
\right.
$$

Let's start with a Null Hypothesis that the probability of a branch being Republican
during a shutdown should be 50% absent anything else happening, i.e., it's about equal
blame for Republicans and Democrats to cause shutdowns.  The question of significance is
whether the observed probability above is different _enough_ from 50% that we should take
notice.  Could this have happened by chance in only 6 events, or is it really a thing?

The relevant test here is the
[test of proportion](https://en.wikipedia.org/wiki/Population_proportion).
We did exactly that, using the [R](https://www.r-project.org/)
function [`prop.test()`](https://search.r-project.org/CRAN/refmans/rstatix/html/prop_test.html)
to test the hypothesis that the observed probability of Republicans presiding over a
shutdown was &gt; 50% (a 1-sided test).  Since there were only 6 data points, we also
turned off the Yates continuity correction (though I'm happy to take guidance on that
subject, as well as anything else).  

<img src="{{ site.baseurl }}/images/2024-03-21-springtime-for-shutdowns-results-signif.jpg" width="400" height="124" alt="Results of test of proportion: Republicans strongly implicated in House, but not in Senate or Presidency" title="Results of test of proportion: Republicans strongly implicated in House, but not in Senate or Presidency" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The results are as shown here.  
- First consider the column $p$.  

  That's the raw $p$-value coming out of the test of proportion.  It says how likely it is
  that the proportion of times Republican control a branch could have been &gt; 50% purely
  by chance.  Now, with only 6 shutdowns with which to work, the data has to be pretty
  extreme to pass the usual significance threshold of $p \lt 0.05$.  
  
  But, as you can see, the House Republicans are up to the job: $p \sim 0.007$ is
  significant: there is only a 0.7% chance of seeing results like this by chance. 
  
  The results for the Senate and the Presidency, on the other hand, can be comfortably
  assigned to chance.  Republicans in the House matter, not so much elsewhere.  
  
- Second, consider the column FDR.  

  That's present because we tested 3 hypothesis (Republican dominance in the House,
  Senate, and Presidency) rather than just 1, using only 1 dataset.  _Cognoscenti_ will
  recognize that we are in (mild) need of a
  [Multiple Hypothesis Test Correction](https://en.wikipedia.org/wiki/Multiple_comparisons_problem),
  which accounts for the fact that we're making just one dataset do triple duty here.  
  
  We've chosen a very standard
  [Benjamini-H&ouml;chberg correction](https://en.wikipedia.org/wiki/False_discovery_rate#Benjamini%E2%80%93Hochberg_procedure),
  which corrects a $p$-value into a
  [False Discovery Rate](https://en.wikipedia.org/wiki/False_discovery_rate).
  Basically, if you sort the list
  of results by increasing FDR (as shown in the table) and then cut it off somewhere, the
  FDR tells you the fraction of results above the line that are likely to be false
  discoveries.  
  
  As you can see here, if we cut off between House and Senate, there's an FDR $\sim 0.021$.
  That's less than 0.05, so we still pass significance, as there's only a 2.1% chance
  we're accusing House Republicans at random.  
  
_Summary:_ 

1. The association between shutdowns and Republican control of the House is
   statistically significant by test of proportion, with $p \sim 0.7\%$ and FDR $\sim 2.1\%$.
   That is, we're pretty darn sure there's a relationship between Republicans controlling the
   House and a government shutdown.  
2. There is no similar association with Republican control of the Senate or Presidency.
   Given the constitutional requirement that funding bills start in the House, this is
   understandable.  


### Strength of Effect  

Is the effect big enough to matter?

If we had _centuries_ of data, one might argue that by sheer statistical power we'd found
something real, but totally small enough to ignore.  With only 6 data points, that's not
really a worry: anything significant here has to be _whopping_ big!  

However, one thing I learned over years of statistical practice is that people will got to
all sorts of lengths to disbelieve a conclusion they don't like.  That includes saying
"the effect is real, but small, so I'm going to ignore it." (In almost exactly those
words.)  

You really have to hammer down every loose end.  So&hellip; hammer time.  

Here we're going to use [Cohen's $h$](https://en.wikipedia.org/wiki/Cohen%27s_h) statistic
here, which measures a heuristic effect size for proportions.  We're measuring the effect
size for the proportion of times the House is Republican during a shutdown (100%) versus
the null hypothesis (50%).  Cohen's $h$ is computed by: 

$$
h = 2 \left(\arcsin\sqrt{p} - \arcsin\sqrt{p_{\mbox{null}}}\right)
$$

We used the [R](https://www.r-project.org/) function
[`ES.h()`](https://search.r-project.org/CRAN/refmans/pwr/html/ES.h.html) in the
[`pwr` package](https://cran.r-project.org/web/packages/pwr/pwr.pdf) for this
computation.  (We also took the absolute value of the result, as we are only interested in
the size of the effect at this point, not the direction.)

<img src="{{ site.baseurl }}/images/2024-03-21-springtime-for-shutdowns-results-effsize.jpg" width="400" height="125" alt="Cohen's h effect size for each of the branches" title="Cohen's h effect size for each of the branches" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The results are as shown here.  
- On interpreting Cohen's $h$:  
  - Cohen's $h$ has a range (in absolute value) from 0 to $\pi$.  
  - $h \sim 0.2$ is a small effect, $h \sim 0.5$ is a medium effect, and $h \ge 0.8$ is a
    large effect.  
- As you can see here, the Senate and Presidency have smallish effect sizes, which makes
  sense as they were statistically insignificant, i.e., probably not real anyway.  
- But the effect size for Republican control of the House is $h \sim 1.57$, which
  qualifies the effect size as "honkin' big".  
  
_Summary:_ The effect size for Republican control of the House being associated with
government shutdowns is enormous.  

### Bayesian Posterior Beta Approach  

Now let's pretend to be Bayesians for a moment:
- Every time there's a shutdown, somebody flips a weighted coin which determines if
  we'll see Republicans in charge of the House or not.  That's a
  [Bernoulli Distribution](https://en.wikipedia.org/wiki/Bernoulli_distribution).  Just
  think of it as a heads-or-tails thing, where the probability of heads/Republicans is $p$
  (same variable as above, sorry):  
  
  $$
  \left\{
	\begin{align*}
	  \Pr\left(\mbox{Republican House} | \mbox{Shutdown}\right) &= p \\
	  \Pr\left(\mbox{Democratic House} | \mbox{Shutdown}\right) &= 1 - p
	\end{align*}
  \right.
  $$
- If we then observe $N$ shutdowns and ask how many times $k$ had Republicans in the
  House, that's a [Binomial Distribution](https://en.wikipedia.org/wiki/Binomial_distribution):  

  $$
  \Pr(k | N, p) = \binom{N}{k} p^k (1-p)^{(N-k)}
  $$
  
<!-- *** ref Heckerman?  https://arxiv.org/abs/2002.00269 -->
- Now suppose you observe $N$ flips of this coin, of which $k$ turn out heads/Republican.
  What should you believe about $p$, the probability a flip comes up heads/Republican?
  The simple answer is $p \sim k/N$, though there are elaborations.  One elaboration is to
  consider a Bayesian approach: before seeing any data, we model $p$ as a random draw from
  a uniform prior distribution; after seeing $k$ and $N$ we should then model $p$ as a
  draw from a
  [Beta distribution of the first kind](https://en.wikipedia.org/wiki/Beta_distribution)
  $\mathrm{Beta}\left(k + 1, N - k + 1\right)$:  
  
  $$
  \Pr(p | N, k) = \frac{p^{k} (1 - p)^{N - k}}{B(k + 1, N - k + 1)}
  $$
  
  where the normalization is
  $B(\alpha, \beta)$ is the [complete Beta function](https://en.wikipedia.org/wiki/Beta_function).  

  (It should be pretty clear that the uniform distribution is $\mathrm{Beta}(1, 1)$, i.e.,
  when $N = k = 0$, which is the case of no observational data.  Hence our choice of a
  uniform prior, since it too is a Beta function.)  

If we really need a point estimate of $p$, we can take the median of the posterior Beta
distribution.  (For technical reasons, there's a popular method of taking the _mode_,
called
[Maximum _A posteriori_ Probability, or MAP estimation](https://en.wikipedia.org/wiki/Maximum_a_posteriori_estimation).
We'll be content with the median here.)  

<a href="{{ site.baseurl }}/assets/2024-03-21-springtime-for-shutdown.png"><img src="{{ site.baseurl }}/assets/2024-03-21-springtime-for-shutdown-thumb.jpg" width="400" height="400" alt="Posterior Beta distributions for probability a branch is Republican when we observe a shutdown" title="Posterior Beta distributions for probability a branch is Republican when we observe a shutdown" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<img src="{{ site.baseurl }}/images/2024-03-21-springtime-for-shutdowns-results-median-posteriors.jpg" width="400" height="128" alt="Median posteriors: probability a branch is Republican when we see a shutdown" title="Median posteriors: probability a branch is Republican when we see a shutdown" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The resulting distributions for $p$, the probability a branch will be Republican when we
see a shutdown, are shown here.  
- As you can see, the curves for the Senate (green, peaks around 2/3, as in 1st equation above) and
  Presidency (blue, peaks around 1/3, as in 1st equation above) are sort of 
  around the middle value of 50%.  That was our null hypothesis, that either party could
  be at fault.  This is just another way of saying that the partisanship of the Senate and
  the Presidency aren't especially predictable by shutdowns.  
- But the red curve for House partisanship, is clustered up around 100%.  This is, of
  course, because all 6 of the 6 shutdowns in the last 30 years had Republicans in control
  of the House.  It's a bit less drastic than the point estimate of 100%, but it still is
  quite damning: when a shutdown happens, it's a good bet Republicans ruled the House.  
  
The table shows similar information, giving the median values of the distributions for the
3 branches.  If you need, for some reason, a single value to quote as the probability a
given branch is Republican when you observe a shutdown, this is it.  Note that it says
observing a shutdown means you should, with more than 90% probability, suspect Republican
control of the House.  

_Summary:_  The probability of finding Republicans in control of the House when we observe
a shutdown is enormous, more than 90%.  The Senate and Presidency are, of course, less
tainted by Republican mischief.  

### Another Bayesian Approach to a Slightly Different Question  

That was interesting, but it was all centered around estimating
$\Pr(\mbox{Republican House} | \mbox{Shutdown})$.  This tells us, when we inevitably
experience a government shutdown, what to expect to observe in the House.  

We might well be interested in the Bayesian conjugate, i.e., 
$\Pr(\mbox{Shutdown} | \mbox{Republican House})$.  That is, if we stupidly elect
Republicans to the House _again_, what's the chance they'll cause another shutdown?  

This is addressable with a direct application of Bayes Theorem:  

$$
\Pr(\mbox{Shutdown} | \mbox{House Republican}) = \frac{\Pr(\mbox{House Republican} | \mbox{Shutdown}) \times \Pr(\mbox{Shutdown})}{\Pr(\mbox{House Republican})}
$$

Ok, let's estimate that, over the last 30 years when shutdowns have become a more regular
thing.  This goes back to the Gingrich speakership.  One might argue it should go back to
the Reagan presidency, when Republican madness became more pathological.  But as we've
seen, the House is the pressure point for shutdowns, and Gingrich was when the infection
spread to the House.  

For the last 30 years (1994-2024), there have been 15 congressional terms:
[11 Republican and 4 Democratic](https://en.wikipedia.org/wiki/Party_divisions_of_United_States_Congresses).
So $\Pr(\mbox{House Republican}) = 11/15$.  

Over those 15 congressional terms, there have been 6 shutdowns (assuming one is about to
happen now).  So $\Pr(\mbox{Shutdown}) = 6/15 = 2/5$.  

Thus:  

$$
\begin{align*}
\Pr(\mbox{Shutdown} | \mbox{House Republican}) &= \frac{1.0 \times 2/5}{11/15} = \frac{2}{11/3} = \frac{6}{11} \\
											   &= 54.5\%
\end{align*}
$$

_Summary:_ Should you be rash enough to vote for a Republican House candidate, you are
abetting a 54.5% probability of a government shutdown during that Congressional term.  

Don't do that.  


## The Weekend Conclusion  

<iframe width="400" height="224" src="https://www.youtube.com/embed/ovCf9VRLnDY?si=Q2Q1pqyPeB2WcLdT" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
Springtime.  Not, apparently, just for the return of plants and wildlife any more.  Now
it's apparently for the return of fascism.  

Mel Brooks, in his comic genius illustrated here from _The Producers_
([1967](https://en.wikipedia.org/wiki/The_Producers_(1967_film)),
[2005](https://en.wikipedia.org/wiki/The_Producers_(2005_film))), did not foresee
that we would be _this_ stupid to let fascists blackmail us about whether the US
government is even allowed to operate.  

Look: our US problem with shutdowns and debt defaults is a real problem.  The evidence
unequivocally points at Republicans, particularly in the House, as the root of the
problem.  Do not vote Republican, not _ever,_ not for any imaginable office, not under any
conceivable circumstance.  And at least for the next election, also do not vote 3rd party
or abstain from voting: that's half a vote for fascism &amp; Trump.  

You really _must_ vote for Biden and for Democrats in both houses of Congress.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  


## Addendum 2024-Mar-23: Averted, For Now?  

<img src="{{ site.baseurl }}/images/2024-03-21-springtime-for-shutdowns-nyt-1.jpg" width="400" height="172" alt="Edmondson @ NYT: Congress passes budget, 6mo into fiscal year" title="Edmondson @ NYT: Congress passes budget, 6mo into fiscal year" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
According to the _NYT_ <sup id="fn4a">[[4]](#fn4)</sup>, the House managed to pass a
budget 286 (101R + 185D) to 134, and then immediately adjourn for 2 weeks.  Note that only
a minority of Republicans voted for this, relying on Democrats to do the work for them.  

This left the Senate with the obligation to meet at night on an emergency basis, and
either pass the House budget with no changes (since the House was now gone for 2 weeks),
or sink the government.  It passed the Senate 74 to 24, i.e., 24 Senate Republicans would
rather sink the government.  It took almost 12 hours in the Senate to get even that much
agreement, since the nihilist faction was so determined to load it up with poison pills.  

This is also, as far as I know, the only time a budget has been passed this late: 6 months
into the fiscal year.  

Technically, there _was_ a shutdown: at midnight, the OMB began a shutdown, but stopped a
few hours _after midnight_ when the Senate passed the budget at 2am.  So technically the US
government was dead for a few hours, but was resuscitated in the middle of the night.  

In reaction, Rep Marjorie Taylor Greene (R-GA) began filing the motions to oust her own
party's speaker.  Basically:  
1. They wanted a border control bill.  
2. Then they refused to pass the most conservative border control bill in a generation.  
3. Then, because there was no border bill, they wanted to defund _all_ of government.  
4. Then, because the funding bill squeaked by, they want to oust their _own_ Speaker.
   Apparently they can show how much they hate government by destroying their own
   governmental appointees.  

No, it doesn't make sense.  Don't even try to make sense of it; you might hurt yourself.  

These are the _dangerously stupid_ people we have to remove systematically from every
elected office.  


## Addendum 2024-Apr-02: A Baysian Coda  

We've [added a post]({{ site.baseurl }}/springtime-for-shutdowns-2/) showing the posterior
Beta distribution for the probability of shutdown when each party controls the House.  

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

<a id="fn1">1</a>: Wikipedia Editors, ["Government shutdowns in the United States"](https://en.wikipedia.org/wiki/Government_shutdowns_in_the_United_States), _Wikipedia.org_, retrieved 2024-Mar-21. [↩](#fn1a)  

<a id="fn2">2</a>: Wikipedia Editors, ["Appropriations bill (United States)"](https://en.wikipedia.org/wiki/Appropriations_bill_(United_States)), _Wikipedia.org_, retrieved 2024-Mar-21. [↩](#fn2a)  

<a id="fn3">3</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script to assess significance and strength of Republican association with US government shutdowns"]({{ site.baseurl }}/assets/2024-03-21-springtime-for-shutdowns.r), _Some Weekend Reading_ blog, 2024-Mar-21.  There is also [a transcript of running this]({{ site.baseurl }}/assets/2024-03-21-springtime-for-shutdown.txt), for you to check that it says what we say it says.[↩](#fn3a)  

<a id="fn4">4</a>: C Edmondson, ["Congress Passes Spending Bill in Wee Hours to Fend Off Shutdown"](https://www.nytimes.com/2024/03/22/us/politics/congress-spending-bill-government-shutdown.html), _New York Times_, 2024-Mar-22. [↩](#fn4a)  
