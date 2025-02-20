---
layout: post
title: Tesla Cybertruck vs Ford Pinto&colon; Which is the Bigger Fire-Trap?
tags: CorporateLifeAndItsDiscontents MathInTheNews Politics R Sadness Statistics
comments: true
commentsClosed: true
---

A couple recent news reports said the Tesla Cybertruck caught fire and killed people more
often than the infamous Ford Pinto of the 1970s.  Let's look statistically at the data and
see if this is believable.  Surely we've learned from past experiences with corporate
misfeasance, not to mention fire safety?  


## Car Safety Issues: Historical &amp; Modern  

<img src="{{ site.baseurl }}/images/2025-02-11-cybertruck-vs-pinto-mt-1.jpg" width="400" height="167" alt="Gold @ Motor Trend: History &amp; tragedy of the Ford Pinto" title="Gold @ Motor Trend: History &amp; tragedy of the Ford Pinto" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The Ford Pinto is a storied automobile <sup id="fn1a">[[1]](#fn1)</sup>, to say the
least.  It was a first reaction from Ford to smaller imported cars, and it set the tone
for some pretty despicable behavior by American automakers: general incompetence, stubborn
refusal to understand customer needs for fuel efficiency, and in this case criminal
neglect of safety resulting in multiple deaths.  

It had the regrettable tendency, upon even mild impact from behind, to burst the fuel tank
and spray fuel over hot parts and into the back seat.  Worse, this problem was understood
at Ford, and largely ignored:  

> Ford was aware of the Pinto’s propensity to catch fire. Early crash tests, performed in
> anticipation of a proposed safety standard regarding rear-end collisions and fuel
> leakage, showed the Pinto was prone to fuel leakage and fire in low-speed, rear-end
> impacts. Ford considered several fixes, including a shield behind the axle and a
> rubberized bladder for the fuel tank, but rejected these as they would have added cost
> and put the program behind schedule.  
>  
> According to The Unknown Iacocca, 117 lawsuits were brought against Ford for
> Pinto-related injuries or deaths. There is no record of how much Ford paid out, though
> in the case of Richard Grimshaw, Lilly Gray’s 13-year-old passenger, in 1978 the jury
> awarded him \\$2.8 million in compensatory damages (\\$13.3 million in 2024 dollars) and
> \\$125 million (\\$595 million in 2024) in punitive damages, the latter reduced to \\$3.5
> million (\\$16.7 million) by the judge. After that verdict, Ford settled most of the rest
> of the Pinto cases out of court.  
>  
> In 1979, the state of Indiana indicted Ford on three counts of reckless homicide after a
> fiery Pinto wreck killed three teenagers. This was the first time a corporation faced
> criminal charges for a defective product. Ford was acquitted.  

Read that carefully: _criminal charges._  This is not just an engineering bungle.  There
was an infamous "Pinto Memo" obtained by litigants that showed Ford was aware of multiple
safety problems, and weighed the cost of fixing them versus the cost of paying off
lawsuits, including wrongful death lawsuits.  Ford had to be compelled legally, kicking
and screaming all the way, into making the Pinto at least somewhat safer.  

If you think the cost of a wrongful death lawsuit is an accounting problem, you have
committed a serious [_category error_](https://en.wikipedia.org/wiki/Category_mistake).
This is not about accounting, or even about money. It is a _moral_ calculation, which you
have failed due to a sociopathic devotion to money.  

If you've ever wondered why people hate CEOs and billionaires, this is why.  

<img src="{{ site.baseurl }}/images/2025-02-11-cybertruck-vs-pinto-the-byte-1.jpg" width="400" height="179" alt="Wilkins @ Futurism/The Byte: Cybertruck safety issues" title="Wilkins @ Futurism/The Byte: Cybertruck safety issues" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Tesla's Cybertruck, of course, has its own safety concerns <sup id="fn2a">[[2]](#fn2)</sup>:  

> The tacky EVs have been a source of controversy for just about everyone, owing to their
> apparent [lack of crumple zones](https://www.reuters.com/business/autos-transportation/tesla-cybertrucks-stiff-structure-sharp-design-raise-safety-concerns-experts-2023-12-08/), 
> [hazardous self-driving software](https://www.carscoops.com/2025/02/crashed-cybertruck-owner-claims-they-nearly-got-killed-as-a-result-of-fsd-failure/), 
> [batteries that catch fire](https://www.kron4.com/news/bay-area/officials-warn-about-fire-dangers-for-electric-vehicle-batteries-after-fatal-cybertruck-crash/), 
> and a small problem where the things [brick in the middle of the highway](https://futurism.com/the-byte/thousands-cybertrucks-recalled-power) &ndash; and
> that's just a tiny sampling of the [many issues](https://futurism.com/the-byte/cybertruck-ford-pinto-comparison#:~:text=The%20tacky%20EVs,from%20European%20streets.) reported with Musk's cyberpunk fantasy
> car.  
> 
> Case in point, they've [been impounded](https://www.thedrive.com/news/uk-police-arent-having-it-with-the-tesla-cybertruck) whenever they've shown up in the UK, and EU safety
> organizations are hoping to [ban the things](https://gizmodo.com/european-road-safety-orgs-are-terrified-of-the-cybertruck-2000512122) from European streets.  


## Fires, Specifically  

<img src="{{ site.baseurl }}/images/2025-02-11-cybertruck-vs-pinto-fuel-arc-1.jpg" width="400" height="193" alt="Leadfoot @ Fuel Arc: Death rates by fire in Ford Pintos and Tesla Cybertrucks" title="Leadfoot @ Fuel Arc: Death rates by fire in Ford Pintos and Tesla Cybertrucks" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
An article at _Fuel Arc_ reports the rates of fatalities in fires in Ford Pintos and Tesla
Cybertrucks. <sup id="fn3a">[[3]](#fn3)</sup>  

The fatality data is relatively straightforward to acquire since death tends to leave a
paper trail.  They've gone with the lowest, most solidly verifiable numbers of deaths here
in both cases.  However, the number of units manufactured is more difficult to know, in a way that
wasn't obvious to me:  
- Ford's Pinto was a long(ish) time ago, so everything is kind of buried.  However, they
  offer their thanks in an amusing way:  
  > Thank you, unpaid Wikipedia editors, for your oddly intense attention to detail!  
- Tesla, on the other hand, treats their production numbers as super-secret.  I'm a bit
  surprised that a public company can conceal such relevant data from their stockholders!
  However, there are Tesla enthusiasts who carefully keep track via a number of techniques
  almost like industrial espionage, and have
  [famously accurate](https://x.com/TroyTeslike/status/1841625794118091202) numbers.  So
  that's what's used here.  
  
Let's get the numbers in to an [R](https://www.r-project.org/) dataframe for analysis:  

```
> tbl <- data.frame(TotalUnits = c(34438, 3173491), ReportedFireFatalities = c(5, 27), row.names = c("TeslaCybertruck", "FordPinto")); tbl
                TotalUnits ReportedFireFatalities
TeslaCybertruck      34438                      5
FordPinto          3173491                     27
```

I'm not so sure about the 7-figure accuracy in the Pinto numbers, but we just need things
to be in the generally correct neighborhood, anyway.  

We need to normalize the death counts somehow; ideally we'd use something like
passenger-hours.  That being unavailable, we'll use the number of units produced and
assume people use their cars about the same number of hours.  (That could be quite a
stretch between 1970 and 2020!)  

Our first rough estimate of the probability of a fire death is:  

$$
\begin{align*}
  \Pr(\mbox{fire death} | \mbox{Pinto})      &= \frac{27}{3173491} &= 8.51 \times 10^{-6} \\
  \Pr(\mbox{fire death} | \mbox{Cybertruck}) &= \frac{5}{34438}    &= 1.45 \times 10^{-4}
\end{align*}
$$

That certainly _looks_ bad, being 17 times larger than the most famous deathtrap fire in
US automotive history!  But is it statistically significant, and is the effect size large,
on an objective basis?  

To answer this, we'll first apply the
[Fisher Exact Test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test),
to tell us if the rows in the table look very different after being scaled to about the
same size:  

```R
> fisher.test(tbl)

	Fisher's Exact Test for Count Data

data:  tbl
p-value = 2.255e-05
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
  5.131407 44.968030
sample estimates:
odds ratio 
  17.06523 
```

This gets us a $p$-value of $p \sim 2.26 \times 10^{-5}$, which is very statistically
significant.  The effect is _real_, i.e., we we should believe the difference in
probabilities will reproduce going forward if the cars are left unchanged.

<a href="{{ site.baseurl }}/images/2025-02-11-cybertruck-vs-pinto-effect-size.jpg"><img src="{{ site.baseurl }}/images/2025-02-11-cybertruck-vs-pinto-effect-size-thumb.jpg" width="400" height="194" alt="Maher, et al.: Guidance on interpreting some common effect size statistics" title="Maher, et al.: Guidance on interpreting some common effect size statistics" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The odds ratio of 17.07 is a measure of the strength of effect: an odds ratio of 1 means
they're comparable, and an odds ratio greater than one points to more fire deaths in
Cybertrucks.  It has confidence limits from 5.13 to 44.97.  That is to say, it is very
probably bounded away from 1.  

Common guidelines <sup id="fn4a">[[4, especially Table 2, shown here]](#fn4)</sup> say
this is well beyond a "very large effect size", in fact what we may term a "honkin' big
effect size".  

As a cross-check, we'll also perform a test of proportion, using methods of Wilson &amp;
Newcombe.  This has the satisfying interpretation of working directly on the probabilities
we calculated above, and asking if they're different:  

```R
> ptst <- prop.test(x = tbl$"ReportedFireFatalities", n = tbl$"TotalUnits"); ptst

	2-sample test for equality of proportions with continuity correction

data:  tbl$ReportedFireFatalities out of tbl$TotalUnits
X-squared = 50.837, df = 1, p-value = 1.004e-12
alternative hypothesis: two.sided
95 percent confidence interval:
 -5.28810e-06  2.78649e-04
sample estimates:
      prop 1       prop 2 
1.451885e-04 8.507981e-06 
```

Indeed, the result is deeply significant at $p \sim 1.00 \times 10^{-12}$.  

Note that the more subtly computed, continuity-corrected probabilities computed here
("prop 1" and "prop 2") agree almost exactly with the cruder computations above.  Also, we can
recover the odds ratio (odds recall, are $p/(1-p)$, so we're taking the ratio of that
between the 2 cases):  

```R
> ptst$"estimate"[["prop 1"]]/(1 - ptst$"estimate"[["prop 1"]]) * (1 - ptst$"estimate"[["prop 2"]])/ptst$"estimate"[["prop 2"]]
[1] 17.06731
```

So we have another vote for extreme statistical significance and agree with the Fisher
exact test about the very large effect size.  


## The Weekend Conclusion  

Look, it's inescapable: the Cybertruck is a _greater danger of fire death_ than the infamous
Ford Pinto:
- There is no doubt the effect is _real._  
- There is no doubt the effect is _large._  

The last time this happened (the Pinto) there were regulations, there were _criminal_
cases, and the cars were forcibly changed against the will of the manufacturer.  Will we
do the same against today's New Gilded Age billionaires?  

If not, I suppose tumbrels are always a possibility.  

For her trouble, Kay Leadfoot received death threats in response to her article:  

> We got our first bonafide death threat over this coverage. Ha, I called it. Here it is
> in full, since it is now part of the story… less the IP address:  
>   
>> "You guys are a lying piece of [__redacted__] rag that purposely spreading false information
>> about cybertruck .. which by will be the best selling truck in the world &mdash;- go eat
>> [__6 swear words in a row, all redacted__] You purposely skewed data to make it sound bad just
>> for your purpose of hurting Tesla. Get ready we plan on suing your [__redacted__]. You don’t
>> know who we are, but we’re coming after you. go suck a tailpipe get your quickest way out."  
>  
>For the record, we do not skew any data for any purpose. We cover the news here. It’s
>honest work and we’ll keep getting it done.  

Yeah, that tracks: the violence at the root of fascism, defending a deadly product by
issuing death threats those who tell the truth.  

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

<a id="fn1">1</a>: A Gold, ["The History (and Tragedy) of the Ford Pinto: Everything You Need to Know"](https://www.motortrend.com/features/ford-pinto/), _Motor Trend_,2024-Apr-04. [↩](#fn1a)  

<a id="fn2">2</a>: J Wilkins, ["The Cybertruck Appears to Be More Deadly Than the Infamous Ford Pinto, According to a New Analysis"](https://futurism.com/the-byte/cybertruck-ford-pinto-comparison), _The Byte_, 2025-Feb-08. [↩](#fn2a)  

<a id="fn3">3</a>: K Leadfoot, ["It’s Official: the Cybertruck is More Explosive than the Ford Pinto"](https://fuelarc.com/evs/its-official-the-cybertruck-is-more-explosive-than-the-ford-pinto/), _Fuel Arc_, 2025-Feb-06.  

We assume, with great hope, that "Leadfoot" is a pseudonym.  Given the death threats she has received from Musk fans, this is as understandable as it is regrettable. [↩](#fn3a)  

<a id="fn4">4</a>: JM Maher, _et al.,_ ["The Other Half of the Story: Effect Size Analysis in Quantitative Research"](https://pmc.ncbi.nlm.nih.gov/articles/PMC3763001/), _CBE Life Sci Educ_ 12:3, 2013-Fall, pp. 345-351. DOI: [10.1187/cbe.13-04-0082](https://doi.org/10.1187/cbe.13-04-0082). PMID: [24006382](https://pubmed.ncbi.nlm.nih.gov/24006382/). PMC: [PMC3763001](https://pmc.ncbi.nlm.nih.gov/articles/PMC3763001/). 

See, in particular, Table 2.  [↩](#fn4a)  
