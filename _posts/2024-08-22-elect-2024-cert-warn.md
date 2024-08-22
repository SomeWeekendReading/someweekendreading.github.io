---
layout: post
title: US Election 2024 Certification Warnings
tags: MathInTheNews Obscurantism Politics R Sadness Statistics
comments: true
commentsClosed: true
---

Republicans are planning _now_ to refuse certification of the 2024 election results.  


## _Again?!_  

<img src="{{ site.baseurl }}/images/2024-08-22-elect-2024-cert-warn-nbc-1.jpg" width="400" height="257" alt="Hillyard &amp; Shabad @ NBC: Trump not focused on getting out vote" title="Hillyard &amp; Shabad @ NBC: Trump not focused on getting out vote" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
As we saw in 2020, Republicans no longer seem to care much about winning elections, but
rather more like _taking_ elections.  

Trump has even said this, quite explicitly.  For example, at a campaign event in
Asheboro, North Carolina, he said he thinks he has the votes all locked up and only needs
to accuse Democrats of (imaginary) cheating <sup id="fn1a">[[1]](#fn1)</sup>:  

> Our primary focus is not to get out the vote, it is to make sure they don’t
> cheat&hellip;  Because we have all the votes we need.  

Basically, he cannot _conceive_ of a world in which he does not win, so he need not
actually compete.  He merely need ascribe his problems to cheating by others, as seems to
be his custom in all things.  

He's setting us up for accusations of cheating in the fall, followed by the riots and
insurrections of his followers about which he was so enthused last time.  


## The Reality: Republican Attempts at Cheating, _Again_  

The truth, of course, is that the cheating is essentially all on the Republican side.
Whether it was fake slates of electors intended to deceive Congress, pointless but endless
lawsuits, or the actual riots, insurrections, assaults, and deaths on January 6 2021, the
intent is the same: ignore the votes, force the process to his will so he can _take_
power.  

The US election system is a complex Rube Goldberg machine with many interacting parts.
It's essentially a way for people to act out, almost in pantomime, the ritual steps in an
18th century workflow as specified by our laws. Today much of it would be replaced by a
spreadsheet (one that was very, very carefully and transparently audited).  

It's also breathtakingly decentralized: there is almost no Federal counting, as that is
done not even by states, but by _counties._ In theory, this is security against mischief
in one place; in reality, it provides opportunities for mischief in _many_ places.  (A
joke from one of my former employers: "Our systems don't have a single point of failure.
We have _multiple_ points of failure!")  

Each of those has different laws and customs.  Each of them might have either appointed or
elected officials. While they are supposed to be non-partisan, Republicans since Reagan
have been anything but that.  

As [we previously noted in 2020](https://www.someweekendreading.blog/unsatisfactory-election/)
here on this Crummy Little Blog That Nobody Reads, there are multiple stages at which a
coordinated Republican effort to overthrow the election could very well work.
Unfortunately, other people have also noticed this.  

<img src="{{ site.baseurl }}/images/2024-08-22-elect-2024-cert-warn-dd-1.jpg" width="400" height="223" alt="Cohen @ Democracy Docket: What happens if election officials refuse to certify?" title="Cohen @ Democracy Docket: What happens if election officials refuse to certify?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<iframe width="400" height="224" src="https://www.youtube.com/embed/_CR08Tp7_Fg?si=u2_LXiLNqj1cyBpO" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
The inspiration for today's post is this article <sup id="fn2a">[[2]](#fn2)</sup> and the 
accompanying 9min 22sec video <sup id="fn3a">[[3]](#fn3)</sup> from _Democracy Docket_. (Which, by the
way, I highly recommend.)  

Their main focus is the _certification_ process: after we determine who is eligible to
vote, and the voting itself happens, and the counting happens, comes certification.  

- This is traditionally seen as a ceremonial activity, in which a local official polls the
  vote-counters, tallies up the results, writes them on a fancy document, which is then
  signed and possibly has a pretty seal affixed.  Basically, they assert the tabulations
  are complete and correct, under legal penalties for lying that are something like
  perjury in a court.  
- That document is sent up the chain of command to the state, which does something
  similar as a second level of certification.  
  - Based on that, electors to the Electoral College are chosen, and sworn.  Eventually,
    they officially do their thing and cast Electoral College ballots.  
- Finally, the Electoral College ballots are counted in Congress, with the Vice President
  certifying each state's Electoral College ballots and the total.

[Marc Elias](https://en.wikipedia.org/wiki/Marc_Elias) of _Democracy Docket_ describes the
election certifiers at all levels as like the "scoreboard operators" of an athletic game,
not members of the competing teams.  Of course, if you can corrupt the scoreboard
operators &ndash; including Congress! &ndash; you can subvert the process.  If the process
is tree-structured and depends on upward dataflow, a few subversions at the bottom can
bork the whole thing, like falling dominoes.  

There are legal remedies, of course.  Writs of mandamus, suing counties, and so on.
_Democracy Docket_ is on the case in that regard.  But once elections happen, clocks start
ticking, and there are a _lot_ of US counties which comprise a huge attack surface for
those seeking to subvert the election.  The Georgia state election board has already
passed rules making it _easier_ for county-level officials to obstruct the entire national
election.  

How bad is it?  Suppose the number of counties attempting to obstruct the election were
binomially distributed.  Then we need to know $N$, the number of relevant counties, and
$p$, the probability that a given county will attempt to obstruct.  
- According to Wikipedia <sup id="fn4a">[[4]](#fn4)</sup>, there are 3,143 US counties plus
  100 county-like subdivisions in territories, for a total of 3,243.  
  - Let's suppose about half of those have local election boards that are Republican.  (I
    suspect the true number is a bit higher, but let's cut ourselves a break and assume
    it's even.)  
  - Then $N = 1621$.  
- Now, most Republicans still actively functioning in office have to be Trump fans, or
  they'd have been removed.  Most of those are extreme MAGAs. 
  - However, let's be charitable and assume that only about 10% of them would actually
    attempt to block a Democratic win.  
  - Then $p = 0.10$.  

The number of counties $n$ attempting overthrow would be a binomially distributed random
variable:  

$$
\Pr(n | N, p) = \binom{N}{n} p^n (1-p)^{N-n}
$$

A bit of fiddling about in [R](https://www.r-project.org/) tells us the median and the 95%
confidence limits on the likely number of these law-defying counties:  

```R
> qbinom(c(0.025, 0.500, 0.975), 1621, 0.1)
[1] 139 162 186
```

So we'd expect about 162 counties to attempt this in the median, with 95% confidence
between 139 and 186.  That's&hellip; a _lot_ of leaks in the bottom of the boat to have to
patch under time pressure and in the face of resistance in court!  

But why would anyone want to _do_ that?  
- If the Electoral College is tied, or just crippled to the point of not functioning, then
  the election is "thrown into the House" to decide.  
- Each _delegation,_ i.e., each state, gets 1 vote.  

So all those low-population, rural, red states get 1 vote.  California, with its huge
population, gets 1 vote.  The big, low-population red states would install Trump and
simply ignore the votes of most of the US citizens.  

_That's_ what they want.  

__NB:__ This looks perhaps more pessimistic than need be.  
- The reality of political polarization is that most states are already locked in.  The
  election will be decided by a about 10 battleground states.  
- In fact, only $O$(10,000) "undecided" voters in those states will determine the outcome.  
- However, that makes the pressure on county election officials there even _more_ intense.
  As the _Democracy Docket_ article notes, about 70 election officials in battleground
  states have already declared their belief in conspiracy theories about 2020 and their
  intent to obstruct any result they do not like.  
  
The sorta good news, I suppose, is that 70 leaks in the boat is a smaller number of leaks
to plug in real time this November.  Ok, maybe just "less bad" news, but I'll take it.  We
can start watching them _now_, which is what Elias's law firm is presumably doing.  


## The Weekend Conclusion  

The Democratic National Convention this week has raised my hopes that the Democrats
are becoming the party they always should have been. Nonetheless, the fascists currently in
charge of the Republican party seem to have very ugly plans for election overthrow.  

Republicans are probably going to lose the election, but they will almost _certainly_ try
to overthrow democracy.  

_Again._  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** DOI: [***](***). [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: V Hillyard &amp; R Shabad, ["Trump says his focus is ensuring Democrats 'don't cheat,' not voter turnout — echoing efforts to undermine election"](https://www.nbcnews.com/politics/2024-election/trump-says-focus-ensuring-democrats-dont-cheat-not-voter-turnout-rcna167630), _NBC News_, 2024-Aug-21. [↩](#fn1a)  

<a id="fn2">2</a>: M Cohen, ["What Happens When Election Officials Refuse to Certify Results?"](https://www.democracydocket.com/analysis/what-happens-when-election-officials-refuse-to-certify-results/), _Democracy Docket_, 2024-Aug-01. [↩](#fn2a)  

<a id="fn3">3</a>: _Democracy Docket_ Staff, ["What Happens If Election Officials Refuse to Certify Results?"](https://www.youtube.com/watch?v=_CR08Tp7_Fg), _YouTube_, 2024-Aug-22.[↩](#fn3a)  

<a id="fn4">4</a>: _Wikipedia_ Editors, ["List of United States counties and county
equivalents"](https://en.wikipedia.org/wiki/List_of_United_States_counties_and_county_equivalents#:~:text=In%20total%2C%20the%2050%20states,United%20States%20as%20county%20equivalents.), _Wikipedia_, retrieved 2024-Aug-22. [↩](#fn4a)  
