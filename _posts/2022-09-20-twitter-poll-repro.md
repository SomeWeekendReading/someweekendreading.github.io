---
layout: post
title: On the Reproducibility of Twitter Polls
tags: COVID MathInTheNews R Statistics
comments: true
commentsClosed: false
---

Everybody knows Twitter polls are&hellip; _questionable._  But are they _reproducible?_  


## Twitter Polls  

There are all sorts of problems with Twitter polls:  
- Huge sample bias, since the respondents self-select from among those who saw the poll.
  Twitter respondents tell us little about the public in general.  
- Differences in phrasing that look minor to those unbaptised in sampling survey design
  can hugely affect the results.  
- Twitter is global, so effects across nations, ethnicities, and cultures are all mixed
  together in a way that is not measured.  
  
  
&hellip; and about 17 other things.  (Don't tempt me to go full Cyrano de Bergerac on
this.)  


## A Natural Experiment  

<img src="{{ site.baseurl }}/images/2022-09-20-twitter-poll-repro-zvi-1.jpg" width="400" height="198" alt="Zvi: Are Twitter polls evidence?" title="Zvi: Are Twitter polls evidence?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Over at [_Don't Worry About the Vase_](https://thezvi.wordpress.com/), Zvi mused about the
reliability and reproducibility of Twitter polls, and conducts what almost amounts to a
natural experiment. <sup id="fn1a">[[1]](#fn1)</sup> In a
[_natural experiment_](https://en.wikipedia.org/wiki/Natural_experiment), we expose
subjects to the variables under our control, but also to the farrago of all the other
factors _not_ under our control.  Like, say, a Twitter poll.  

The original subject was a couple Twitter polls about people's psychological health in the
pandemic.  The results differed slightly, but the questions also differed, as did
presumably the set of followers of the two instigators.  Many other details were
different, on top of the huge sample bias and other problems.  Fair enough.  

This led to some discussion about whether this is "weak evidence" (causes a small Bayesian
update, but in the _correct_ direction), or "bad evidence" (causes an update of any size, but
in the _wrong_ direction).  That's actually a startlingly good summary of the situation:
bad evidence has biases that cover up the truth in a non-recoverable way and then does
damage to your cognitive model of the world.  

Amusingly:  
- When a philosopher showed up in the conversation, Zvi summarized the situation as:  

  > Getting into a Socratic dialog with a Socratic philosopher, and letting them play the
  >role of Socrates. Classic blunder.  

  &hellip; which is just about perfect.  (It happens I have a friend who is a professor of
  the classics, specializing in ancient Greek, who thinks it's perfect too.)  

- They also went full meta, with a Twitter poll on the merits of Twitter polls.  I'm sure
  [Doug Hofstadter](https://en.wikipedia.org/wiki/Douglas_Hofstadter) would approve.
  Heaven knows I thought it was hilarious, but then I'm a bit weird.  
  
The almost-natural experiment was to repeat someone else's poll, word for word, and
collect proportions to compare:  
- __Q:__ What's your experience of people in general since the onset of the pandemic?  
- __A:__ More stable, about the same as before, or less stable.  

For a variety of reasons, Zvi snapshotted his poll at 2 time points, for comparison with
Patrick Collison's survey a week ago.  

<a href="{{ site.baseurl }}/images/2022-09-20-twitter-poll-repro-zvi-2.jpg"><img src="{{ site.baseurl }}/images/2022-09-20-twitter-poll-repro-zvi-2-thumb.jpg" width="400" height="72" alt="Zvi & Patrick: Survey response data" title="Zvi & Patrick: Survey response data" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The data are shown here, both as the percentages reported and the counts inferred from
that.  The 3 polls certainly _look_ very close, based on percentage breakdowns.  But can
we make that quantitative?  

Yes, we can.  

These are 3 results drawn from a [multinomial distribution](https://en.wikipedia.org/wiki/Multinomial_distribution) (like binomial, but in this case
with 3 outcomes). We want to know if they're all from the same distribution or not.  (More
precisely, we'll do pairwise comparison of each of Zvi's snapshots with Patrick's, but
won't bother comparing Zvi's 2 snapshots.)  We're not asking if any of these are
_accurate_ in any way, just whether or not they're the _same._  

<img src="{{ site.baseurl }}/images/2022-09-20-twitter-poll-repro-gsa-1.jpg" width="400" height="95" alt="OES/GSA: Guidance on multinomial tests" title="OES/GSA: Guidance on multinomial tests" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Just so you'll know it's not me spitballing the test here, we'll follow the guidance
offered  by the Office of Evaluation Services of the General Services Administration of
the US government.  <sup id="fn2a">[[2]](#fn2)</sup> Not perfect, but a source many (must)
take seriously.  

The recommendation is a $\chi^2$ test, which looks at the sums of squares of
differences of the counts and asks how probable it is to see differences as large as we
do.  This is a two-way test, as we're asking if 2 samples are random draws from the same
underlying (unknown) distribution.  

```R
> counts <- matrix(c(10, 133, 240, 29, 295, 594, 859, 3985, 9970), byrow = TRUE, nrow = 3, dimnames = list(c("Zvi1hr", "Zvi16hr", "Patrick"), c("More stable", "Same", "Less Stable"))); counts
        More stable Same Less Stable
Zvi1hr           10  133         240
Zvi16hr          29  295         594
Patrick         859 3985        9970

> chisq.test(counts[c("Zvi1hr", "Patrick"), ])
	Pearson's Chi-squared test

data:  counts[c("Zvi1hr", "Patrick"), ]
X-squared = 16.267, df = 2, p-value = 0.0002935

> chisq.test(counts[c("Zvi16hr", "Patrick"), ])
	Pearson's Chi-squared test

data:  counts[c("Zvi16hr", "Patrick"), ]
X-squared = 20.244, df = 2, p-value = 4.018e-05
```

Now that's interesting!  _Both_ $p$-values are very statistically significant, in spite of
the very small differences in observed proportions.  We can check this by doing a
[Fisher exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test), and we get similar results.  

How can that be?  Well, Patrick's survey has 38x and 16x more samples than Zvi's
snapshots, respectively. When you have a giant pile of data, it's easy to make small
differences look significant.  Also, when the sample sizes are unbalanced like this, you
bias in favor of the larger class (Patrick's).  

The usual response here is something like case-control sampling, where you down-sample the
large group multiple times to get more representative cohorts.  We can't do that here,
since we don't have individual response data.  But we can _assume_ the subsample of
Patrick's respondents would have the same proportions, and just scale down his counts to
match Zvi's to see what happens.  The row sums of the downsampled tables show that we've
synthesized a dataset in which Zvi and Patrick had the same number of respondents:  

```R
> downsample1 <- t(transform(t(counts[c("Zvi1hr", "Patrick"), ]), Patrick = round(Patrick / 38.68))); downsample1
        More stable Same Less Stable
Zvi1hr           10  133         240
Patrick          22  103         258

> chisq.test(downsample1)
	Pearson's Chi-squared test

data:  downsample1
X-squared = 8.9642, df = 2, p-value = 0.01131


> downsample2 <- t(transform(t(counts[c("Zvi16hr", "Patrick"), ]), Patrick = round(Patrick / 16.14))); downsample2
        More stable Same Less Stable
Zvi16hr          29  295         594
Patrick          53  247         618

> chisq.test(downsample2)
	Pearson's Chi-squared test

data:  downsample2
X-squared = 11.751, df = 2, p-value = 0.002808
```

_Still_ statistically significant, though not at such eye-watering levels as at first.  

What's happening?  Basically, there's a real difference: Patrick found more results at the
"more stable" and "less stable" ends, with fewer in the "about the same" bucket (27% vs
32% - 35%).  You can see this from the proportion data above, but I was a bit surprised to
see it statistically significant.  

But: __does it matter?__  That is to say, we've found a "real" effect here that is
statistically significant (unlikely to be simple sample fluctuations); is it big enough
that we should care?  That is, is the effect size large enough to move us to make a
different decision based on the two datasets?  

Probably not!  Zvi's and Patrick's followers are _different_, but oh-so-very slightly
different that nobody should update much on that fact.  


## A Bayesian Alternative  

For those of you about to poo-poo this analysis because it is frequentist &ndash; and you
know who you are :-) &ndash; there is a Bayesian version.  

In the case of [binomially distributed](https://en.wikipedia.org/wiki/Binomial_distribution)
data, the Bayesian conjugate distribution that gives your posterior over the $p$ parameter is a 
[Beta distribution](https://en.wikipedia.org/wiki/Beta_distribution).  

For multinomially distributed data like this, the Bayesian conjugate distribution that
gives your posterior over the _vector_ of $p_i$ parameters is the
[Dirichlet distribution](https://en.wikipedia.org/wiki/Dirichlet_distribution).  

Almost nobody does this.  (Ok, [Ed Jaynes](https://en.wikipedia.org/wiki/Edwin_Thompson_Jaynes),
because he was Just That Way. But I can't think of anybody else.)  I've only done it once
in my career.  I was happy with the mathematical purity.  But I was sad for pragmatic
reasons: I don't think I ever adequately explained it well enough to the client so they would do what
their experiment told them to do.  They just glazed over at "all the math stuff".
Sometimes there are limits to what you can do relate to social engineering more than
anything else.  

There are even more alternatives in the non-parametric space, with varying degrees of
fancy pants: [Kolmogorov-Smirnov test](https://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test),
[Kulback-Leibler divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence),
and so on.  We'll content ourselves with the multinomial test above.  


## The Weekend Conclusion  

Zvi and Patrick's survey results were _different,_ in that Patrick found statistically significantly
fewer respondents saying "about the same".  However, the effect size was small and should
probably be ignored.  

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

<a id="fn1">1</a>: Zvi Mowshowitz, ["Twitter Polls: Evidence is Evidence"](https://thezvi.wordpress.com/2022/09/20/twitter-polls-evidence-is-evidence/), _Don't Worry About the Vase_ blog, 2022-Sep-20. [↩](#fn1a)  

<a id="fn2">2</a>: US government OES &amp; GSA, ["Guidance on Using Multinomial Tests for Differences in Distribution"](https://oes.gsa.gov/assets/files/Guidance-on-Using-Multinomial-Tests-for-Differences-in-Distribution.pdf), OES publications, retrieved 2022-Sep-20. [↩](#fn2a)  
