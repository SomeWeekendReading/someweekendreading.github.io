---
layout: post
title: Getting Vaccinated Because&hellip; Knuckleheads!
tags: CatBlogging COVID MathInTheNews PharmaAndBiotech Politics Sadness
comments: true
commentsClosed: true
---

Today I got a COVID-19 vaccine booster, because that's recommended twice yearly for
seniors.  I also got an MMR (measles/mumps/rubella) booster because&hellip; _knuckleheads_.  


## [Once More, With Feeling](https://en.wikipedia.org/wiki/Once_More,_with_Feeling_(Buffy_the_Vampire_Slayer))  

<img src="{{ site.baseurl }}/images/2025-03-17-vax-vs-knucklehead-vax.jpg" width="400" height="533" alt="Your humble Weekend Editor's portside dorsal manipulator getting Moderna'd" title="Your humble Weekend Editor's portside dorsal manipulator getting Moderna'd" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Today I got my biannual COVID-19 booster, as is recommended by the CDC <sup id="fn1a">[[1]](#fn1)</sup>:  

> People ages 65 years and older, vaccinated under the routine schedule, are recommended
> to receive 2 doses of any 2024–2025 COVID-19 vaccine (i.e., Moderna, Novavax, or
> Pfizer-BioNTech) separated by 6 months (minimum interval 2 months) regardless of
> vaccination history&hellip;  

Alas, the CDC's reputation is in tatters, with science censorship and superstition being the
order of the day.  But, this is still good medical advice from the Before Times.  

By my count, and according to my state's vaccination registry, this is my 10th COVID-19
vaccination shot.  

This is me, being responsible both to self and community.  

You can do that too, you know.  


## Ok, Sure... But Why Measles?!  

<a href="{{ site.baseurl }}/images/2025-03-17-vax-vs-knuckleheads-nyt-1.png"><img src="{{ site.baseurl }}/images/2025-03-17-vax-vs-knuckleheads-nyt-1-thumb.jpg" width="400" height="324" alt="Rosenbluth @ NYT: Yearly measles cases in the US, 1985 - 2024" title="Rosenbluth @ NYT: Yearly measles cases in the US, 1985 - 2024" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<img src="{{ site.baseurl }}/images/2025-03-17-vax-vs-knuckleheads-cdc-1.jpg" width="400" height="109" alt="CDC: History of measles in the US" title="CDC: History of measles in the US" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Everybody asks: isn't measles gone in the US, so we don't have to worry about that any more?  

No, apparently not.  From a _New York Times_ article, here's an annual frequency plot of measles
cases from 1985 - 2025.  <sup id="fn2a">[[2]](#fn2)</sup>  Note that the measles vaccine
was invented in 1963. <sup id="fn3a">[[3]](#fn3)</sup>  It took _forty years_ of public health
effort to get vaccination levels up high enough to eliminate it in 2000.  

But then&hellip; look at the bars after 2020: measles is _really trying_ to make a
comeback in the US.  More accurately, people are really trying to dive into conspiracy
theories and disinformation to avoid vaccinating their kids against measles.  It's
particularly bad right now in Texas, where we now have dead kids.  

Also, measles can have a nasty side-effect: _immune amnesia_, where you lose all the
resistance to other diseases you've built up over the years, and have to start again.  I
would not, for example, want to lose my resistance to COVID-19!  

Now I was born before the measles vaccines were common, and actually had childhood
measles.  But&hellip; that was _a long time ago._  That immunity might have faded.  Yes,
there's an antibody titer test to tell if that's the case, but the MMR vaccine is so safe
it's easier just to get vaccinated again.  

I want to (a) protect myself against an infection that could be fatal at my age, and (b)
be responsible to those around me by not being a spreader.  In particular, as the Weekend
Editrix goes to visit her elderly mother in Japan, we do not want to give her a virus that
would likely kill her, at her age.  

### First, Do the Math  

Why was measles so hard to eradicate, and why is it coming back so easily just because
some knuckleheads are too stupid or too gullible to vaccinate?

This is the central truth: measles is the most contagious disease known to humanity.  We
measure that by a quantity named the basic reproduction number, $R_0$: in an
immune-na&iuml;ve population, how many people get infected from one infected person?  If
that's large ($R_0 \gg 1)$, the disease is being rapidly transmitted.  If it's small
enough ($R_0 \lt 1$), the disease will die out.

For measles, $R_0 \sim 12-18$, i.e., 1 person would infect on average about 12-18 others if we
had no vaccines or other immunity.  _This is _enormous._  COVID-19, for comparison had
early in the pandemic $R_0 \sim 2-3$ <sup id="fn4a">[[4]](#fn4)</sup>, and that was no
walk in the park; indeed COVID-19 _is still not under control._   

Now, consider what happens if not everybody is susceptible, and what fraction of
non-susceptible people we need in order to have herd immunity.  Let $s$ be the fraction of
people susceptible, then the _effective_ reproduction number will be:  

$$
R_{\mbox{eff}} = s R_0
$$

"Herd immunity" is when $R_{\mbox{eff}} \lt 1$, so the infection dies out.  Each cohort of
infected people is a factor of $R_{\mbox{eff}}$ smaller than the previous. So if that's
less than 1, the disease dies out.  

In order to get $R_{\mbox{eff}} \lt 1$, we must have:  

$$
s \lt \frac{1}{R_0}
$$

That is, the number of vaccinated (or immune by recovery from previous sickness) must be
at least:  

$$
1 - s \ge 1 - \frac{1}{R_0}
$$

Plug in the measles $R_0 = 18$, and you get herd immunity at 94.4% vaccinated.  You really
need to vaccinate _almost everybody_ to suppress a disease as contagious as measles!  

The good miracle is that we pretty much did that, from 1963 - 2000 as the graph above shows.  

The evil miracle is that we are allowing ignorance, superstition, and disinformation
to cause people to walk away from that.  

If more than 5% of the population fail to vaccinate, then _measles becomes a problem for everyone._
Here at Ch&acirc;teau Weekend, we are determined both not to get sick _and_ not to be
spreaders, so we won't be a burden on ourselves or others.  

### Next, Look at What People Do  

Rosenbluth in the _NYT_ article cited above examines the problem of a few knuckleheads
bringing the whole public health enterprise crashing down:  

> Why has the rate of vaccination fallen so much? Part of the answer lies in the Covid
> pandemic. Conspiracy theories about Covid-19 vaccines made many question the safety of
> other routine shots. The vaccine-skepticism movement is growing quickly, driven by
> declining trust in
> [science](https://www.pewresearch.org/science/2023/11/14/americans-trust-in-scientists-positive-views-of-science-continue-to-decline/)
> and [rampant misinformation](https://www.kff.org/other/poll-finding/measles-vaccines-and-misinformation-in-the-courts-a-snapshot-from-the-kff-health-misinformation-tracking-poll/)
> on social media.  

She basically points out that people who don't trust science simply don't trust reality
(emphasis added):  

> They fear that distrust in science is so deeply rooted and that misinformation is so
> ubiquitous that many will choose to stay unvaccinated. And they worry that if
> vaccination rates don’t rise, __other preventable diseases like polio will follow.__  
>  
> Vaccine skeptics now walk the corridors of power in Washington. President Trump has
> [questioned the safety](https://www.nytimes.com/2024/07/16/us/politics/rfk-trump-call.html)
> of vaccines. So has
> [Robert F. Kennedy Jr.](https://www.nytimes.com/2025/03/10/health/measles-texas-kennedy-fox.html),
> the nation’s top health official, who wrote a book about measles in 2021 saying that
> outbreaks had been fabricated so the government could “inflict unnecessary and risky
> vaccines on millions.”  There is no cure for the virus, but Kennedy has also
> [promoted unproven treatments](https://www.nytimes.com/2025/03/04/health/texas-measles-outbreak-kennedy.html):
> He said this month that doctors had told him about patients who had
> an “almost miraculous and instantaneous recovery” after they took cod liver oil,
> steroids and antibiotics. Health officials in Texas tell me such promises may have
> caused measles patients to [delay medical care](https://www.nytimes.com/2025/03/15/health/measles-texas-kennedy.html).  
>  
> The outbreak in Texas supports the pessimistic thesis. There, even communities plagued
> by serious illness and death have still largely rejected the M.M.R. vaccine.  

So&hellip; _knuckleheads._  

<a href="https://www.google.com/search?q=locust+avenue%2C+mill+valley+california" target="_blank">
![Historical photo of 1918 flue pandemic masks in Mill Valley, CA, USA]({{ site.baseurl }}/images/2021-10-30-partisan-covid-deaths-mill-valley.jpg "Historical photo of 1918 flue pandemic masks in Mill Valley, CA, USA")  
</a>
There are only a few ways to avoid getting sick and avoid spreading sickness to others:  
- Get vaccinated, so your probability of being sick or being a spreader is dramatically
  lower.  
- Get forcibly quarantined, so sick people are isolated.  By "forcibly", I mean the sort
  of quarantines used in the 1918 flu pandemic where armed law enforcement officers force
  you into your home and arrest you if you come out.  That's more or less what's depicted
  in this photo, taken 1918-Nov-03 by Raymond Coyne in Mill Valley, California on Locust
  Avenue, including "Wear a Mask or Go to Jail".  
- Get sick, and&hellip;
  - you _might_ recover with measles immunity.  Though, given the _immune amnesia_ effect,
    you might _also_ then have to get all your previous diseases all over again!
    Or&hellip;  
  - your death will _definitely_ remove you from the pool of spreaders.  

Those are the choices.  Vaccination is cheap, safe, and effective; the other choices are
none of those things.  

The responsible thing to do is self-defense for myself and my family, and to be the
responsible sort who does _not_ spread anything I catch.  Practically, that amounts to
getting an MMR booster.  


## The Weekend Conclusion  

Look, just get COVID-19 and MMR boosters, ok?

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  


## Addendum 2025-Mar-18: Sequelae the Next Day  

No fever.  Just achy and tired.  In other words, just like every other Old Man Day, only a
little more so.  

Easy!  Do it.  

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

<a id="fn1">1</a>: CDC Staff, ["Interim Clinical Considerations for Use of COVID-19 Vaccines in the United States"](https://www.cdc.gov/vaccines/covid-19/clinical-considerations/covid-19-vaccines-us.html), US _Centers for Disease Control_ web site, 2024-Oct-31. Downloaded on 2025-Mar-17. [↩](#fn1a)  

<a id="fn2">2</a>: T Rosenbluth, ["An outbreak"](https://messaging-custom-newsletters.nytimes.com/dynamic/render?isViewInBrowser=true&nl=the-morning&uri=nyt://newsletter/d74e33bc-d618-5e24-904b-afa054db07df), "The Morning" newsletter, _The New York Times_, 2025-Mar-17. [↩](#fn2a)  

<a id="fn3">3</a>: CDC Staff, ["History of Measles"](https://www.cdc.gov/measles/about/history.html), US _Centers for Disease Control_ web site, 2024-May-09.  Downloaded 2025-Mar-17. [↩](#fn3a)  

<a id="fn4">4</a>: NC Achaiah, _et al._, ["R0 and Re of COVID-19: Can We Predict When the Pandemic Outbreak will be Contained?"](https://pmc.ncbi.nlm.nih.gov/articles/PMC7751056/), _Indian Jnl Crit Care Med_, 2020-Nov. DOI: [10.5005/jp-journals-10071-23649](https://doi.org/10.5005/jp-journals-10071-23649). [↩](#fn4a)  
