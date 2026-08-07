---
layout: post
title: Department of Justice Denied Access to State Voter Rolls&hellip; Again
tags: CorporateLifeAndItsDiscontents MathInTheNews Politics R Statistics
comments: true
commentsClosed: true
---

The Trump Department of Justice has now lost 20 out of 20 lawsuits to obtain state voter
registration information.  What should a Bayesian believe about their probability of
success in the future?  


## States Control Elections&hellip; But Trump Wants To Control Them Instead

Over the last decade or so, Trump has _repeatedly_ claimed that voting is infested by
illegal immigrants who somehow always vote for Democrats.  There is, of course, _no evidence_
that any such problem exists, let alone that it biases anything in favor of Democrats.
Actual rates of noncitizen voting are vanishingly small, and almost always because
somebody misinformed a foreign resident.  

<img src="{{ site.baseurl }}/images/2026-08-04-doj-smackdown-dd-1.jpg" width="400" height="503" alt="Roth @ Democracy Docket: DoJ just lost 20th case in a row, demanding voter registration control from states" title="Roth @ Democracy Docket: DoJ just lost 20th case in a row, demanding voter registration control from states" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Still, the Trump r&eacute;gime wants to 'fix' the problem, and thus demands Democratic
states give up to him their Constitutionally-mandated control of voter registration, so he
can &ndash; allegedly &ndash; purge them of non-citizen voters.  This is, _prima facie,_
just a declaration on Trump's part to engage in voter suppression.  Since they can't
reliably win fair elections, they'll just make it _harder to vote_ in blue states, until
only the red states matter.  

Fortunately, American democracy still has defenders.  One remarkable such defender is
_Democracy Docket_, apparently run by attorney Marc Elias and his firm.  They've opposed
the Trump administration in court every time it's attempted to usurp control of
elections.  They've just reported _their 20th win in a row_ <sup id="fn1a">[[1]](#fn1)</sup>,
which really makes you wonder about the Department of Justice folk who keep crashing into
the same wall, over and over and over again!  

__NB:__ As the article points out, this suit from the Trump administration was dismissed
by the US District Judge Philip Brimmer _with prejudice._ Regrettably, Americans live in a
time when we all have to learn a bit of legal jargon, so: "with prejudice" means "don't
ever come back, we never want to see this in any court ever again".  In other words, this
is _really_ screwed up and should never have happened in the first place.  

Judge Brimmer was appointed by GW Bush and is himself a Republican.  Of the 20 DoJ
failures, 12 came from Republican-appointed judges, and 8 appointed by Trump himself.  One
simply _cannot_ say this is a left-wing judiciary here!  

Alas, here we are, in a world where Trump makes even _stupid_ things dangerous.  


## What Should We Believe About DoJ's Probability of Success Going Forward?  

Congratulations to Elias and his crew, of course.  I follow them on YouTube and BlueSky,
and find them frighteningly informative.  

But they've now presented us with what scientists call a
[_natural experiment:_](https://en.wikipedia.org/wiki/Natural_experiment) a dataset
in which something gets repeated, more or less, in a quantifiably comparable way, even
though it was not designed as an experiment.  _Twenty times_ the DoJ has attempted to
control state voter registrations, and in the 20 cases where it's been fought, they've
lost all of them.  

What should we believe about the probability of success if they try it again?  Because
stupid &amp; stubborn fascists never give up until you remove them by force or by prison
sentences, so this is worth knowing.  

Let $p$ denote the unknown probability of success of the DoJ in lawsuits to get control of
state voter registration.  Then, being charitably unbiased, we can say we know nothing of
the value of $p$ before seeing some examples.  We would say, as Bayesians, that it has an
uninformative prior like a uniform distribution on [0, 1]:  

$$
p \sim \mbox{Uniform}(0, 1)
$$

Now, we've observed $N = 20$ trials of which the DoJ has won $k = 0$.  We can assume the
number of successes should be independently identically binomially distributed, with
success probability $p$:  

$$
\Pr(N_{Successes}) = \binom{N}{k} p^k (1-p)^{(N-k)}
$$

But once we have evidence about $N$ and $k$, how should we update our beliefs about how
$p$ is distributed?  Obviously one temptation is the point estimate of $p \approx k/N =
0$, but that's an overcommittment.  We know the value of $p$ is _small,_ but it still
might be nonzero.  It's well known, at least among people who know such things, that the
result is a [Beta distribution of the first kind](https://en.wikipedia.org/wiki/Beta_distribution)
$p$:  

$$
\Pr(p | \alpha, \beta) = \frac{p^{\alpha - 1} (1 - p)^{\beta - 1}}{B(\alpha, \beta)}
$$

where the normalization is
$B(\alpha, \beta)$ is the [complete Beta function](https://en.wikipedia.org/wiki/Beta_function).  

This is something we've done many times on this Crummy Little Blog That Nobody Reads
(CLBTNR).  It's a trick that should be _much_ more widely known!  

<a href="{{ site.baseurl }}/assets/2026-08-04-doj-smackdowns.png"><img src="{{ site.baseurl }}/assets/2026-08-04-doj-smackdowns-thumb.jpg" width="400" height="200" alt="Posterior distribution for probability of success, given 20 trials and 0 successes" title="Posterior distribution for probability of success, given 20 trials and 0 successes" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
So let's see what it says about our case:  
- The blue curve shows the posterior distribution, reflecting our updated beliefs about
  $p$ after observing 20/20 losses.  
- The vertical lines show the median (best single estimate), and the 95% confidence limits
  of our remaining uncertainty about $p$.  
  
__Conclusion:__ We're pretty sure the probability of any future success by the DoJ is
about 3.2%.  We're 95% sure the limits are about 0.1% &ndash; 16.1%.  

The [R](https://www.r-project.org/) script to do this is, as usual, available for your
inspection and peer review. <sup id="fn2a">[[2]](#fn2)</sup>  


## The Weekend Conclusion  

Basically, at this point, we'd guess the DoJ has about a 3% chance of success at this
business.  The smart lawyers, with a good sense of survival, have either already left or
will at least stop doing _this._  

[(_Ceterum censeo, Trump incarceranda est!_)]({{ site.baseurl }}/ceterum-censeo/)  

(_Et ceterum censeo, index Epsteiniani divulganda est!_)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** DOI: [***](***). [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000; margin: 0 auto; display: block;">
</a>

<iframe width="400" height="224" src="***?rel=0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: Z Roth, ["Trump DOJ now 0 for 20 after judge dismisses Colorado voter roll lawsuit ‘with prejudice’ "](https://www.democracydocket.com/news-alerts/trump-doj-now-0-for-20-after-judge-dismisses-colorado-voter-roll-lawsuit-with-prejudice/), _Democracy Docket_, 2026-Aug-04.  [↩](#fn1a)  

<a id="fn2">2</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script to estimate DoJ success probability at getting voter roles"]({{ site.baseurl }}/assets/2026-08-04-doj-smackdowns.r), _Some Weekend Reading_ blog, 2026-Aug-04. [↩](#fn2a)  
