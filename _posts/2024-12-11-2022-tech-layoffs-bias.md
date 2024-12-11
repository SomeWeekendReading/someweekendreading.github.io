---
layout: post
title: 2022 Tech Layoffs&colon; Gender Bias?
tags: CorporateLifeAndItsDiscontents MathInTheNews Politics SomebodyAskedMe Statistics
comments: true
commentsClosed: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) &ndash; ok, really I saw it
on Mastodon, but close enough &ndash; about gender bias in the tech layoff cycle of 2022.
Is it really true that women were targeted?  


## Who got laid off in 2022?  

<a href="https://toot.cat/@sphakos/113632110117495253"><img src="{{ site.baseurl }}/images/2024-12-11-2022-tech-layoffs-mastodon-1.jpg" width="400" height="972" alt="Sharp @ Mastodon: Nearly 70% of 2022 tech layoffs were women" title="Sharp @ Mastodon: Nearly 70% of 2022 tech layoffs were women" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Our story today begins with this social media post on Mastodon from Sean Sharp.  He's
pointing to a _Wired_ article <sup id="fn1a">[[1]](#fn1)</sup> on women laid off from tech
in 2022, and a related report in Prism <sup id="fn2a">[[2]](#fn2)</sup> on various
minority communities in laid-off workers.  Sharp makes the rather pointed observation that
when examining the laid-off tech worker population in 2022, 70% of them were women.  But
women, he asserts, held only 21% of tech jobs.  The _Prism_ source confirms the 2022
layoff as having been largely women:  

> Women are 1.6 times more likely to face layoffs than men, often due to less
> seniority. Additionally, 57% of women in Technology, Media, and Telecom (TMT) plan to
> leave their jobs within two years, citing poor work/life balance. __The 2022 tech layoffs
> disproportionately affected women, with 69.2% of those laid off being female, based on a
> WomenTech Network study of 4912 profiles from 54 companies.__  

Now there may be a number of reasons for this:  
- Layoffs of mostly junior people will preferentially impact the recently hired, who are
  enriched for women and minorities.  
- During the pandemic, tech companies hired a _lot_ of people who worked remotely.  But
  now, return-to-office mandates seem to be pinpoint targeting women and single parents.
  It also severely impacts those needing a disability accommodation, as required by law but
  sometimes loathed by employers.  
- Women represent a greater fraction of college students, so it could be that with the end
  of the pandemic some larger number of women than men agreed to accept a layoff to return
  to college.  (I mean, one can _hope_&hellip; though this is not especially likely.)  
- Also, there's been an unfortunate political sea change, swinging us back to the
  practices of a darker, more discriminatory past and the privilege of the wealthy &amp; powerful.  
  
But none of those are excuses!  

Sharp goes on to say, "I can't see how this is anything other than discrimination."  This
does indeed seem rather out of balance, but we'd like to look through some data to
quantify it in the right way, and then decide.  

So let's try some Bayesian analysis to see if the layoff probability for women is indeed
larger than that for men.  


## A Bayesian analysis  

The figure of 70% of those laid off being women is, in Bayesian language, saying:  

$$
\Pr(\mbox{female} | \mbox{laid off}) = 0.70
$$

That's&hellip; not pretty, but it's not quite what we want.  We want to know the Bayesian
dual, namely $\Pr(\mbox{laid off} | \mbox{female})$.  That is, if you're a woman working
in tech, what's the probability you're going to be laid off?  

The way to translate between these 2 conditional probabilities is of course the venerable
[Bayes Rule](https://en.wikipedia.org/wiki/Bayes%27_theorem):  

$$
\Pr(\mbox{laid off} | \mbox{female}) = \frac{\Pr(\mbox{female} | \mbox{laid off}) \cdot \Pr(\mbox{laid off})}{\Pr(\mbox{female})}
$$

An article in _WomenTech_ <sup id="fn3a">[[3]](#fn3)</sup> asserts that women are 35% of
tech workers, but that's apparently for 2024.  We'll go with the 21% figure provided by
Sharp, for 2022:  

$$
\Pr(\mbox{female}) = 0.21
$$

What's the value for $\Pr(\mbox{laid off})$ in 2022?  
- We found various figures for the number of tech layoffs in 2022 (93,000/164,969/120,000,
  etc.).  
<img src="{{ site.baseurl }}/images/2024-12-11-2022-tech-layoffs-layoffs.fyi-1.jpg" width="400" height="91" alt="Layoffs.fyi: 165,269 tech layoffs in 2022" title="Layoffs.fyi: 165,269 tech layoffs in 2022" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- However, we're going to go with the figure from Layoffs.fyi <sup id="fn4a">[[4]](#fn4)</sup>
  which says, as shown here, there were 165,269 employees laid off from tech jobs
  in 2022.  
- Now, to get a probability, we need to know the total number of tech employees in 2022.
  (Yes, not all positions are the same; this is an average.)  CompTIA's
  _State of the Tech Workforce_ in an October 2023 report <sup id="fn5a">[[5]](#fn5)</sup>
  pins this number down for us at a bit over 9 million:  
  
  > Net tech employment in the United States reached an estimated 9,156,390 workers in
  > 2022, an increase of 3.2% year-over-year or approximately 286,400 additional workers
  > employed in technology.  

So the probability of a random tech worker, of either gender, being laid off is:  

$$
\begin{align*}
  \Pr(\mbox{laid off}) &= \frac{165{,}269}{9{,}156{,}390} \\ 
					   &= 0.018
\end{align*}
$$

Now, a 1.8% probability of layoff doesn't sound so bad, does it?  Well, it _does_ when you
realize this is 1.8% _per year_, which adds up quickly.  That's a 10% turnover every 5
years through deliberate layoffs, not just attrition!  If you add in a _very_ optimistic
5% turnover per year (most companies are 10% - 15%), then this means you're losing more
than 1/3 of your employees every year.  

So we're beginning to get an inkling that tech has a problem with management addicted to
layoffs.  

Here's how it looks when we break it down by gender, asking if you're a tech worker of a
given gender what the probability of layoff is:  

$$
\begin{align*}
  \Pr(\mbox{laid off} | \mbox{female}) &= \frac{\Pr(\mbox{female} | \mbox{laid off}) \cdot \Pr(\mbox{laid off})}{\Pr(\mbox{female})} \\
						               &= 0.70 \cdot 0.018 / 0.21 \\
						               &= 0.06 \\
\\
  \Pr(\mbox{laid off} | \mbox{male}) &= \frac{\Pr(\mbox{male} | \mbox{laid off}) \cdot \Pr(\mbox{laid off})}{\Pr(\mbox{male})} \\
					                 &= 0.30 \cdot 0.018 / 0.79 \\
					                 &= 0.0068
\end{align*}
$$

So there's a general risk of layoff of 1.8% per year for years like 2022, but for women it
was 6%.  For men, it was drastically lower at 0.68%.  We can express this as a likelihood
ratio, i.e., how many times more likely a woman was to be laid off than a man:  

$$
\begin{align*}
  \frac{\Pr(\mbox{laid off} | \mbox{female})}{\Pr(\mbox{laid off} | \mbox{male})} &= \frac{0.06}{0.0068} \\
                                                                                  &= 8.8
\end{align*}
$$

That is, a woman was 8.8 times more likely than a man to be laid off from a tech job
in 2022.  


## The Weekend Conclusion  

Sage Sharp started us off with an hypothesis, expressed in the plaintive cry: "I can't see
how this is anything other than discrimination."  

It appears this is, sadly, correct.  

You can argue with the figures: choose different layoff numbers, different numbers of tech
workers, or even the gender of those laid off.  But most sources seem to be in this
general ballpark, supporting the conclusion that women were laid off disproportionately
more often than men.  

By a factor of 8.8x.  

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

<a id="fn1">1</a>: CM Carrigan, ["Taking on the Tyranny of the Tech Bros"](https://www.wired.com/story/tyranny-tech-bros-silicon-valley-activism/),  _Wired_, 2024-Dec-09. [↩](#fn1a)  

<a id="fn2">2</a>: S Udavant, ["Tech layoffs disproportionately affect marginalized communities"](https://prismreports.org/2023/04/03/tech-layoffs-marginalized-communities/), _Prism_, 2023-Apr-03. [↩](#fn2a)  

<a id="fn3">3</a>: _WomenTech_ Staff, ["Women in the Workforce: The Economic Gender Gap"](https://www.womentech.net/en-us/women-in-tech-stats#:~:text=The%202022%20tech%20layoffs%20disproportionately%20affected%20women%2C%20with%2069.2%25%20of%20those%20laid%20off%20being%20female%2C%20based%20on%20a%20WomenTech%20Network%20study%20of%204912%20profiles%20from%2054%20companies.), _WomenTech.Net_, downloaded 2024-Dec-11. [↩](#fn3a)  

<a id="fn4">4</a>: _Layoffs.fyi_ Staff, ["Tech Layoffs in 2022"](https://layoffs.fyi), _Layoffs.fyi_, downloaded 2024-12-11. [↩](#fn4a)  

<a id="fn5">5</a>: _CompTIA_ Staff, ["State of the Tech Workforce 2023 CompTIA Research \| October 2023"](https://www.comptia.org/content/research/state-of-the-tech-workforce-2023#:~:text=Net%20tech%20employment%20in%20the,additional%20workers%20employed%20in%20technology.), _CompTIA_ web site, downloaded 2024-Dec-11. [↩](#fn5a)  
