---
layout: post
title: Trump Department of Justice&colon; Now 0/26 on Voter Roll Cases
tags: CorporateLifeAndItsDiscontents MathInTheNews Politics R Statistics
comments: true
commentsClosed: true
---

The Trump Department of Justice has been trying for some time now to force states to give
up voter registration information, so Trumpers can purge them of likely-Democratic voters
whom they will charge with being non-citizens.  They've been losing, but let's check in on
their progress anyway.  


## The Current Score  

<img src="{{ site.baseurl }}/images/2026-10-01-DoJ-0-for-26-voter-rolls-demdock-1.jpg" width="400" height="184" alt="Knutson @ Democracy Docket: DoJ is now 0-26" title="Knutson @ Democracy Docket: DoJ is now 0-26" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The Trump Department of Justice wants to ignore the fact that the US constitution says
states are in charge of elections.  They want to impose _their_ restrictive ideas of who
should vote, no matter what the states think.  This ties into their scare stories about
illegal immigrants voting, a thing which pretty much never happens.  However, armed with
state voter registration data (and accompanying sensitive data like voting history, driver's
license info, and so on) they could wreak havoc by merely _accusing_ large swathes of
voters of being illegal just before an election.  

They've filed something like 30ish lawsuits seeking to force state attorneys general to
supply that information, usually in a way that would be illegal under the laws of those states.
Marc Elias's law firm has been fighting these suits, and his _Democracy Docket_ has been
reporting their progress.  

With the latest loss in Georgia <sup id="fn1a">[[1]](#fn1)</sup>, the Trump Department of
Justice now has a record of 0 wins in 26 trials.  Georgia even offered them the public
version of their voter rolls without the confidential information, but the DoJ insisted
they wanted the one with all the personal information:  

> Alongside that finding, Calvert noted that, in response to the DOJ’s demands, Georgia
> repeatedly offered the public version of its voter roll, which is available to anyone
> for a fee.  

After 0 wins in 26 trials, what should we believe about their probability of success going
forward?  I mean, they've already lost 26 times in a row, i.e., more than half the states
in the United States, so our estimate of their probability of success certainly can't be
very high!  

We've addressed this issue before, about 2 months ago when the DoJ was 0 for 20
successes. <sup id="fn2a">[[2]](#fn2)</sup>  We showed 
[the details of the math then]({{ site.baseurl }}/doj-smackdowns/#the-math-repeated-coin-flips),
i.e., that this is about like watching a bunch of coin tosses and then asking whether the
coin is loaded or not:  
- You start out assuming their chance of success $p$ is a random draw from a uniform
  distribution on 0 to 1.  This is what Bayesians call an _uninformative prior_, i.e.,
  our prior beliefs don't really assume much at all &mdash; $p$ could be _anything._  
- Then after observing $N$ trials with $k$ successes, the Bayesian posterior is a Beta
  distribution $B_{k+1, N-k+1}(p)$.  It's not terribly important what the details of that
  distribution are, other than that they are well known (by people who spend time finding
  out such things, anyway).  

<a href="{{ site.baseurl }}/assets/2026-10-01-DoJ-0-for-26-voter-rolls.png"><img src="{{ site.baseurl }}/assets/2026-10-01-DoJ-0-for-26-voter-rolls-thumb.jpg" width="400" height="200" alt="Posterior distribution for probability of success, given 26 trials and 0 successes" title="Posterior distribution for probability of success, given 26 trials and 0 successes" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
So here's what it looks like for the current situation $N = 26$ trials and $k = 0$
successes.  The probability $p$ for success going forward would be a random draw against
this distribution, $B_{1, 27}(p)$.  But it's grim news for the DoJ: as you can see from
the plot, the median is 2.53%, and we're 95% sure that the real value is in 0.094% &ndash;
12.77%.  

In other words, with a 2.5% chance of success, it's kind of crazy to keep trying.
Instead, you should either change your strategy or evaluate whether this is the right sort
of thing to be doing in the first place!  

What sort of person keeps doing the same thing anyway?  My guess, is either:  
- Ideologues so committed to Trumpian fascism that they'll keep on no matter what.  
- DoJ lawyers, particularly those near retirement, who can't endanger their families by
  getting fired and hence will obey orders.  Even stupid ones.  

The former are immune to reason and deserve our contempt.  The latter deserve some
sympathy, though we'd all prefer they refuse to obey bad orders from bad people for bad
purposes.  


## The Weekend Conclusion  

Even just looking at the court statistics, the Trump lawsuits are insane.  His lawsuits
about the 2020 election were equally absurd: he lost all of them, but just kept pounding
away in spite of being proven repeatedly wrong.  

Keep that in mind as the primaries approach: Trump is being proven repeatedly wrong.  

So vote, and vote Democratic, all up and down the ticket.  Removing substantially _all_
Republicans is the only way forward that's consistent with democracy.  

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

<a id="fn1">1</a>: J Knutson, [" DOJ now 0-26 after judge rejects demand for Georgia voter rolls"](https://www.democracydocket.com/news-alerts/doj-now-0-26-after-judge-rejects-demand-for-georgia-voter-rolls/), _Democracy Docket_, 2026-Sep-30. [↩](#fn1a)  

<a id="fn2">2</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Department of Justice Denied Access to State Voter Rolls&hellip; Again"]({{ site.baseurl }}/doj-smackdowns/), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2026-Aug-04. [↩](#fn2a)  
