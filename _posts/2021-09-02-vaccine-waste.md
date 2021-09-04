---
layout: post
title: Are we wasting too much COVID-19 vaccine?
tags: COVID MathInTheNews PharmaAndBiotech R
comments: true
---

Today comes news that we've wasted about 15.1 million doses of COVID-19 doses here in the
US.  Is that a lot, or a little?  How does it compare with history?  Is the difference, if
any, just random or is it real, i.e., statistically significant?  


## Scare headlines from the mathematically illiterate  

Today I saw a rather nice tweet pointing to a scary-sounding headline about vaccine
wastage, and then quite sagely pointing out that this seems to be _less_ than historical
vaccination campaigns:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    this is a good example of how big numbers can be misleading if they aren’t in
	context. here, the denominator is around 435 million doses, so 15 mil is 3.5% of the
	total. typical vaccine waste in a campaign ranges from 5% for a single dose vial to
	40% for a 20-dose vial. <a href="https://t.co/7Kb4AXBaq3">https://t.co/7Kb4AXBaq3</a>
  </p>&mdash; b-boy bouiebaisse (@jbouie) <a href="https://twitter.com/jbouie/status/1433244920173764616?ref_src=twsrc%5Etfw">September 2, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

<img src="{{ site.baseurl }}/images/Cioppino.jpg" width="200" height="150" alt="Cioppino, a delicoius San Francisco variant on bouillabaisse" title = "Cioppino, a delicoius San Francisco variant on bouillabaisse" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I dunno much about this guy, "b-boy bouiebaisse".  However, I _do_ love
[bouillabaisse](https://en.wikipedia.org/wiki/Bouillabaisse) and her American cousin
[cioppino](https://en.wikipedia.org/wiki/Cioppino).  So he's obviously a man of
considerable taste!  

More importantly, he's a man of considerable _common sense:_ when somebody gives you a
percentage, you ask "Percent of _what?"_; when somebody gives you a large number, you ask
"Compared to _what?"_  

Every. Single.  Time.  


## Ok, let's dig into the crazy  

<img src="{{ site.baseurl }}/images/2021-09-02-vaccine-waste-nbc.jpg" width="400" height="144" alt="NBC: 15 million Covid vaccine doses wasted in US since March" title = "NBC: 15 million Covid vaccine doses wasted in US since March" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First up is the source of the scare headline, from NBC News <sup id="fn1a">[[1]](#fn1)</sup>: 
15 million doses "thrown away", with the first-world guilt-inducing subtitle "As countries
across the world clamor for vaccine doses, U.S. pharmacy chains and state health
departments have thrown millions away."  

Sheesh.  Where do we even _start_ with how wrong this is?  
- The title is totally loaded language: "thrown away" makes it sound like somebody
  deliberately trashed doses.  Gee&hellip; maybe some of them expired?  Maybe sometimes
  they couldn't use the whole vial because there weren't people waiting?  
- The subtitle is a deliberate stilletto flash, slyly implying that the US is wasting
  valuable resources while the rest of the world starves.  While this is arguably a
  historical pattern, it's just gratuitous here.  Sort of emotional click-bait.  
- Then, under the obligatory-but-irrelevant picture, in tiny type: "The number of
  discarded doses is still a small fraction of the total doses administered in the U.S."
  So which is it: are we wasting huge quantities, or being efficient with only a small
  fraction of waste?  You can't have it both ways, but here it is _in consecutive sentences!_ 

Having read only the headline, subtitle, and irrelevant picture caption with exasperation,
I did not have much hope for the rest.  It sort of dances around, citing all sorts of
irrelevancies, without really telling you the 3 things that are actually relevant:  
1. What are doses that are "wasted", i.e., disposed of, as a _fraction of the total?_
   Without looking at this, you can't really judge whether the number is large or small.  
1. How does that fraction _compare_ with previous vaccine campaigns?  Without looking at
   this, you can't tell whether you're doing any better or worse than could be expected.  
1. Is the difference between those 2 fractions _statistically significant?_  Without
   looking at this, you can't tell if the difference is real, or arose solely by chance.  
   
Instead, they use loaded language that is less reportorial, and more accusatory:  
> Pharmacies and state governments in the United States have thrown away at least 15.1
> million doses of Covid-19 vaccines since March 1, according to government data obtained
> by NBC News — a far larger number than previously known and still probably an
> undercount.  

Then a few paragraphs later, they admit they're undermining their own case, in a fit of
intellectual incoherence:  

> The number of discarded doses is still a small fraction of the total doses administered
> in the U.S.  

Anecdote after anecdote, they tell numerous tedious stories to avoid doing anything
useful.  Irrelevant monthly breakdowns, appeals to guilt, appeals to emotion in general,
accusations of lack of planning&hellip; _feh._  


## No, never mind the crazy.  Let's run the numbers!  

Ok, enough of that trash.  Let's dig into the only 3 relevant facts in the article.  Even
though the don't give us the full picture, we can integrate other sources to do so:
- The US has distributed 438 million doses.  
- The US has _donated_ 111.7 million doses to other countries.  
- The US has disposed of (not "wasted") 15.1 million doses for various reasons.  

First, is 438 million doses a lot?  Not really: with about 330 million residents, we'd
need about 660 million doses even if there were no waste at all.  So that's only about 2/3
of the amount we'll eventually need.  If there are boosters needed &ndash; which here at
Chez Weekend we're forecasting at above 80% probability &ndash; then it's only a bit over
half as much as we'll need.  

Second, consider the 111.7 million doses _donated gratis_ to other countries.  It's not as
though we're hogging all the output, we're buying some of it _to give away._  In fact,
the US is giving away a _lot_ of the purchased doses, leaving less than what's needed to fully
vaccinate the US, let alone give boosters, which is the _opposite_ of what was implied by
the article above:  

$$
\Pr(\mathrm{donated.dose}) = 100\% \times \frac{111,700,000}{438,000,000} = 25.5\%
$$

Third, look at the 15.1 million doses that somehow were not put in arms.  Could be freezer
failiure, cracked vials, multi-dose vials where you don't have enough patients to use them
up in time, and so on.  Nobody's "wasting" anything.  The percent not put in arms is:  

$$
\Pr(\mathrm{disposed.dose}) = 100\% \times \frac{15,100,000}{438,000,000} = 3.4\%
$$

So&hellip; there was about 3.4% "waste".  That doesn't sound too bad, right?  


## Comparison with other vaccination campaigns  

How have other vaccination campaigns fared in the past?  That's the right comparison, not
an ideal of 0% wasted.  

<img src="{{ site.baseurl }}/images/2021-09-02-vaccine-waste-who.jpg" width="400" height="170" alt="WHO: Vaccine wastage rates in routine vs ordinary use, stratified by doses/vial" title = "WHO: Vaccine wastage rates in routine vs ordinary use, stratified by doses/vial" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Starting from a popular article <sup id="fn2a">[[2]](#fn2)</sup>, we dug in a little bit
for primary sources.  The _World Health Organization_ studied this problem before
COVID-19, and published a concept note <sup id="fn3a">[[3]](#fn3)</sup> with a bit of
amusing mathematics to make probabilistic estimates of the amount of vaccine wastage, due
to various causes.  While that document is more of a proposal to do better with
statistical models, their general estimates are shown in Table 1, reproduced here:  
- In mass vaccination campaigns, the range is from 5% &ndash; 20%.  
- The bigger the vial and the more stringent the cold chain requirements, the more the
  waste.  
  
The COVID-19 mRNA vaccines have the most onerous cold chain I've ever seen, and are in
multi-dose vials (as far as I can tell, currently 6/vial for Pfizer and 15/vial for
Moderna).  That means the appropriate scale of comparison is either row 2 or 3 of the
table, i.e., about 10% &ndash; 15% wastage during a vaccine campaign.  

What we actually observe here is 3.4% wastage of COVID-19 vaccines.  In other words,
_we are doing about 3-5x better than historical campaigns have done_, wasting
significantly less vaccine!  In fact, we're below the 5% historical waste level even for
single-dose vials.  

This is the _opposite_ of the conclusion the flashy article above would have invited.


## Is that just chance, or is it really better?  

Ok, fine.  But is that just due to chance, or are we _really_ doing better?  This is what
statistics is _for:_ given some evidence, what should we believe about it?  

It's the usual proabilistic model. Let $p$ be the probability a given dose gets "wasted"
(for whatever reason, legitimate or not).  Then:  

- For each vial, it's like a coin flip with a loaded coin that has probability $p$
  of coming up heads &ndash; a
  [Bernoulli distribution](https://en.wikipedia.org/wiki/Bernoulli_distribution).  
- Then count the number $k$ that are wasted out of $N$ total &ndash;
  a [binomial distribution](https://en.wikipedia.org/wiki/Binomial_distribution).  
- If you observe $k$ out of $N$ are wasted, you infer approximately $p = k/N$.  However,
  in a Bayesian framework, if you assume a uniform prior on $p$ (we make no committments
  of any sort about the potential values of $p$, beyond that it's in $[0, 1]$), then the
  posterior distribution is a [Beta distribution](https://en.wikipedia.org/wiki/Beta_distribution),
  because binomial and Beta are [conjugate priors](https://en.wikipedia.org/wiki/Conjugate_prior).  
  
$$
\Pr(p) \sim \mathrm{Beta}(k + 1, N - k + 1)
$$

<img src="{{ site.baseurl }}/assets/2021-09-02-vaccine-waste.png" width="400" height="400" alt="Bayesian posterior Beta distribution of probability a dose is wasted" title = "Bayesian posterior Beta distribution of probability a dose is wasted" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Now, for our case, $k = 1.51 \times 10^{7}$ and $N = 4.38 \times 10^{8}$.  How does the
corresponding Beta distribution look, as calculated by a little
[R](https://www.r-project.org) script? <sup id="fn4a">[[4]](#fn4)</sup>
- As you can see, it is _very_ strongly clustered around the approximate answer above of
  3.4%.  
- The 95% confidence interval on the probability a vaccine dose is wasted is
  3.446% &ndash; 3.449%.  
  
So we're _very_ sure that the probability of wasting a dose is around 3.4475%.  

But let's do the formal hypothesis test anyway: how far out in the tail are the values
shown as wastage rates in the past of 5%, 10%, and 15% that we should compare against?
Let's see:  

```R
> library("plyr")

> k <- 15100000; N <- 438000000
> ddply(data.frame(WasteRate = c(0.05, 0.10, 0.15)), "WasteRate", function(df) {
    data.frame("p.Test" = pbeta(df[1, "WasteRate"], k + 1, N - k + 1, lower.tail = FALSE))
  })
  WasteRate p.Test
1      0.05      0
2      0.10      0
3      0.15      0
```

Effectively, here we're looking at the graph above and asking what's the probability of
getting a waste rate as high as 5% &ndash; 15% as seen in the past?  In all cases, the
probability is basically 0!  The uncertainty around the probability of wasting a dose
($p$) is so strongly centered around 3.4475% that there's no chance in the world that we're
actually as wasting as the past studies, and saw this value by chance.  

In other words, the idea that the waste of COVID-19 is less than past studies is 
_wildly statistically significant:_ the result is real, not by chance; we've really done
better.  

## The Weekend Conclusion  

Oy, where to start?  

The article is pretty trashy: it makes insinuations that doses are being wasted
needlessly and flagrantly in the US when the rest of the world is in need.  The facts you
see above, however, are:  
- The US has donated about 25% of its own vaccine supply, and will have to buy more just
  to get its own population vaccinated, much less give boosters.  
- The "waste" rate is 3.4475% (95% confidence limits: 3.446% &ndash; 3.449%).  
- This compares favorably with the WHO-documented historical waste rates for demanding
  cold chains and multi-dose vials of 10% &ndash; 15%.  
- This result is robustly statistically significant: there is not a chance in the universe
  that we're really as profligate as historical campaigns, but happened to get 3.4% just
  by luck.  We _really are doing better._  
  
And that, boys and girls, is why you never trust the news media when they dance around something
to avoid quantitative reasoning.  They're frequently wrong, reflecting the anxieties of
the age rather than reality.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: J Eaton &amp; J Murphy, ["15 million Covid vaccine doses thrown away in the U.S. since March, new data shows"](https://www.nbcnews.com/news/us-news/america-has-wasted-least-15-million-covid-vaccine-doses-march-n1278211), _NBC News_, 2021-Sep-01. [↩](#fn1a)  

<a id="fn2">2</a>: S Schiffling &amp; Liz Breen, ["COVID vaccine: some waste is normal – but here’s how it is being kept to a minimum"](https://theconversation.com/covid-vaccine-some-waste-is-normal-but-heres-how-it-is-being-kept-to-a-minimum-152772), _The Conversation_, 2021-Jan-11. [↩](#fn2a)  

<a id="fn3">3</a>: World Health Organization Immunization Programmes Staff (Contact: [Souleymane Kone](mailto:kones@who.int), of WHO Supply Chain Group), ["Revising global indicative wastage rates: a WHO initiative for better planning and forecasting of vaccine supply needs"](https://www.who.int/immunization/programmes_systems/supply_chain/resources/Revising_Wastage_Concept_Note.pdf?ua=1), _World Health Organization_ (Concept Note), 2019-Apr-08. [↩](#fn3a)  

<a id="fn4">4</a>: Weekend Editor, [R script to plot posterior Beta distribution of probability of a wasted dose]({{ site.baseurl }}/assets/2021-09-02-vaccine-waste.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2021-Sep-02. [↩](#fn4a)  
