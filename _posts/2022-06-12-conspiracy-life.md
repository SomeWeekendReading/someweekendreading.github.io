---
layout: post
title: On the Lifetime of Conspiracies
tags: COVID JournalClub Math MathInTheNews PharmaAndBiotech Politics Sadness Statistics
comments: true
---

The world is full of conspiracy theories, more than I recall ever being the case in the
past.  How reasonable is it to expect that a conspiracy can (a) depend on secrecy, (b)
involve a large number of people, and (c) survive for more than a couple years?  Not very,
according to a probabilistic model!  


## Anatomy of basic conspiracy failures  

Intelligent people disdain "conspiracy theories".  But of course we all know there _are_
conspiracies, since they're exposed more or less constantly.  Also, some conspiracies do
not depend entirely on secrecy for their continued existence: we all know organized crime
exists, but that does not stop it.  

On the other hand, some conspiracy theories posit situations that depend on secrecy.  For
example, pharma companies can't hold back a secret cure for cancer unless the secret is
kept.  Or the QAnon craziness about the government being run by a ring of pedophile
cannibals depends on secrecy, because dead children have a way of marvelously focusing the
attention of police.  

<img src="{{ site.baseurl }}/images/2022-06-12-conspiracy-life-plosone-1.jpg" width="400" height="191" alt="Grimes @ PLoS ONE: Conspiracy lifetime model" title="Grimes @ PLoS ONE: Conspiracy lifetime model" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So how long should we expect such a conspiracy to last?  That's the subject of a paper by
DR Grimes of Oxford, published in _PLoS ONE_ a couple years ago. <sup id="fn1a">[[1]](#fn1)</sup>
He assumes a conspiracy stays intact until someone reveals it.  In this model, it's always
an insider snitch, never an outside investigator.  

Let's reconstruct his arguments.  

First assume a few reasonable things about the attempts to reveal the conspiracy:  
1. Each decision to reveal the conspiracy is an independent event.  
2. The mean rate at which conspirators decide to reveal is constant.  
3. No 2 acts of revealing occur at the same time.  

We can model the arrival of reveal events as a
[Poisson distribution](https://en.wikipedia.org/wiki/Poisson_distribution), if the revelations
obey [those conditions](https://en.wikipedia.org/wiki/Poisson_distribution#Assumptions_and_validity).
The Poisson distribution tells us if we wait for time $t$, the probability distribution of
the number of attempts $k$ to reveal the conspiracy will be:  

$$
\Pr(k | \lambda) = \frac{\lambda^k e^{-\lambda}}{k!}
$$

where $\lambda$ is the mean number of times the conspiracy is revealed after an
unspecified time.  However, we're more interested in the _rate_ of revelations, not the
mean number observed.  So let $\lambda = \phi t$, where $\phi$ is the rate, i.e.,
mean revelation attempts per unit time.  Then the probability mass function for the number of
revelation attempts $k$ is:  

$$
\Pr(k | \phi, t) = \frac{(\phi t)^k e^{-\phi t}}{k!}
$$

Now, we're really interested in the first revelation only, since that one breaks the
conspiracy.  So the distribution of time until that event is essentially how long we can
keep observing $k = 0$:  

$$
\Pr(k = 0 | \phi, t) = e^{-\phi t}
$$

That's the distribution of times over which we observe $k = 0$, no revelation of the
conspiracy.  We're interested in the time until $k \gt 0$, i.e., when the conspiracy is
revealed:  

$$
\Pr(\mbox{conspiracy lasts until $t$} | \phi) = 1 - e^{-\phi t}
$$

That's equation (1) of Grimes's paper: the probability the conspiracy is revealed starts
out at 0, and rises in an exponential fashion to 1 over time.  

Next, how should we think about $\phi$?  Clearly it should increase with the number $N$ of
people involved, and with each conspirator's probability of revelation per unit time $p$.
We should also acknowledge that the number of conspirators can also be a strong function of time,
i.e., $N = N(t)$.   People die off, are killed off by co-conspirators, or their knowledge may become
irrelevant over time.  

Grimes proposes this in equation (2) of the paper:  

$$
\phi = 1 - (1-p)^{N(t)}
$$

The 2nd term is the probability that all $N(t)$ people _don't_ reveal, so 1 minus that is
the probability that at least 1 person reveals.  That's what we want.  

Because $1-p$ is going to appear a lot, for convenience we denote $\psi = 1 - p$.  So the
relevant probability is now:  

$$
\Pr(\mbox{conspiracy lasts until $t$} | p, N(t)) = 1 - e^{-t(1 - \psi^{N(t)})}
$$

This is equation (3) of the paper.  


## Correction for time-varying rates of exposure  

<img src="{{ site.baseurl }}/images/2022-06-12-conspiracy-life-plosone-2.jpg" width="400" height="150" alt="Grimes @ PLoS ONE: Correction for time-varying exposure rates" title="Grimes @ PLoS ONE: Correction for time-varying exposure rates" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
There's a correction posted on _PLoS ONE_ a few months after the initial 
publication.  <sup id="fn2a">[[2]](#fn2)</sup>  Though in this case, it looks to me a bit
more like an extension than a correction: we've allowed $N(t)$ to be a function of time,
but should also allow $p = p(t)$ and in general $\phi = \phi(t)$.  This would be
appropriate for a population that is inhomogeneous over time, e.g., subject to changing
social attitudes about the conspiracy.  So the products in the exponents should in general
be integrals:  

$$
\begin{align*}
\Pr(\mbox{conspiracy lasts until $t$} | p, N(t)) &= 1 - e^{-\int_0^t{dt' \phi(t')}} \\
                                                 &= 1 - e^{-\int_0^t{dt' (1 - \psi(t')^{N(t')})}}
\end{align*}
$$

A few more things have to be done numerically, rather than analytically.  This also
affects the cases below, where we vary $N(t)$ over time in various plausible ways.  In
those cases, it's important to look at the figures in the correction, not the original
paper.  


## Various ways to count who's in on the conspiracy secret  

Nobody says the number of people in on the secret is fixed.  How might it reasonably vary?  

1. __Fixed $N$:__ Ok, maybe it doesn't vary.  There are some number of people in on it at
   the beginning, and they stay that way for the rest of eternity, all of them providing
   active coverup for the secret, for all time:  

   $$
   N(t) = N_0
   $$

2. __Conspirators die off naturally:__ In this case, the secret is kept more or less on
   its own, without requiring all conspirators to maintain it actively.  As they die off,
   fewer of them are available to reveal the secret.  In that case, the number of
   conspirators will usually obey the [Gompertz distribution](https://en.wikipedia.org/wiki/Gompertz_distribution),
   widely used to estimate survival in things like life insurance:  

   $$
   N(t) = N_0 e^{\frac{\alpha}{\beta}(1 - e^{\beta(t + t_e)})}
   $$

   where $t_e$ is the average age of conspirators at the start of the conspiracy and
   $\alpha$ and $\beta$ are Gompertz parameters to be estimated, typically about 
   $\alpha = 10^{-4}$ and $\beta = 0.085$ for general human populations.  

3. __Conspirators are killed off or otherwise eliminated _faster_ than naturally:__  As
   Benjamin Franklin is alleged to have printed in _Poor Richard's Almanac_ in 1735:  

   > Three may keep a secret if two are dead.  

   If our conspirators take this to heart and begin murdering each other (or outside
   investigators pick them off, albeit without learning the secret), we may perhaps model
   $N(t)$ as an exponential decay:  

   $$
   N(t) = N_0 e^{-\lambda t}
   $$

   This assumes the remaining conspirators do not revise their probability $p$ of
   revealing the conspiracy as they watch their fellows eliminated.  This is unlikely to
   be true, e.g., as organized crime syndicate members watch their fellows go silently to
   jail; plea bargains exist for a reason!  

<a href="{{ site.baseurl }}/images/2022-06-12-conspiracy-life-plosone-2-fig1.jpg"><img src="{{ site.baseurl }}/images/2022-06-12-conspiracy-life-plosone-2-fig1-thumb.jpg" width="400" height="362" alt="Grimes @ PLoS ONE: Probability of reveal vs time, 3 models of conspirator population" title="Grimes @ PLoS ONE: Probability of reveal vs time, 3 models of conspirator population" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The original paper shows a few intriguing graphs which have the probability of exposure
peaking in a certain year in some of these models.  However, once we apply the correction
and use the integrals in the exponent, this feature goes away: the probability of exposure
always increases with time, even if $N(t)$ decreases with time under the models above.
Figure 1 in the correction shows us the situation, reproduced here.
- This shows the probability of exposure on the vertical axis and time in years since the
  start of the conspiracy on the horizontal axis.  
- We assume an initial $N = 5000$ conspirators, each of whom has probability $p = 5 \times 10^{-6}$
  of revealing the conspiracy each year.  
- There are 3 different models of how $N(t)$ behaves over time:  
  - In blue, the number of conspirators $N_0$ remains constant.  This is clearly the worst
    case, as it maximizes the number of people who might reveal the secret!  
  - The red dotted line in the middle is Gompertzian decay, i.e., conspirators dying off
    naturally.  It assumes they're mostly middle-aged ($t_e = 40$ years at the start).  
  - The orange line shows a more murderous conspiracy, bent on keeping the secret by
    killing off their fellows so the number of conspirators is cut in half every 10
    years.  

__Conclusion:__ For a reasonably complex conspiracy ($N = 5000$), the probability of being
revealed is a near certainty in a few decades if all must keep the secret, better than
50-50 if they die off naturally, and still about 1/3 of the time if they keep the secret
by systematically murdering each other.  _Keeping a secret in a large group is hard!_  


## Calibration versus real-world events  

Grimes went to some effort to calibrate his model against 3 well-known real-world
conspiracies that were actually revealed, to see if the parameter fits made any sense:  
1. _The US National Security Agency's PRISM scandal:_ It's actually illegal for them to spy
   on US citizens inside the US. But they did it anyway, on the theory that their usually
   excellent operational security could keep it secret, and keeping illegality
   undiscovered was as good as being legal.  It was exposed by Edward Snowden.  (_Hint:_ if
   the NSA's opsec was not up to task here, why is your conspiracy likely to do any better?)  
2. _The Tuskeegee syphilis experiment:_ From 1932 to about 1970, the US Public Health Service
   found a number of black men with syphilis, kept it secret from them, and withheld
   treatment "in order to study the disease".  This is one of the reasons, quite
   understandably, that American Blacks have a deep distrust of both government and the
   health care system.  It was exposed by Peter Buxtun in 1972.  
3. _The US Federal Bureau of Investigation's use of a number of pseudoscientific forensic tests:_
   They used these dubious 'tests' to determine criminality in many cases without any
   basis in reality.  Many were detained for decades, and some even executed on the basis
   of these fraudulent tests. It was eventually exposed in 1998 by Frederic Whitehurst.  
   
Without going into the detail available in the paper, all the conspiracies fit the model
with some reasonable parameter settings.  There are lots of ambiguities, such as deciding
when the conspiracy started: in 1932 the Tuskeegee experiment may have been regarded as
acceptable back then, whereas it is abominable today; what's the "true" start date?  

Other conspiracies examined: that the moon landing was a hoax, that climate change is a
hoax, that vaccines cause autism or don't work (recall this is 2016, _before_ COVID-19),
and that pharma companies are somehow holding back a cancer cure.  They can all be fit as
well, with various parameter settings that are at least not beyond the bounds of reason.
This holds _even though Grimes chose parameter settings maximally favorable to conspirators!_  


## Grimes's grim conclusion 

First, conspiracies are _fragile:_  

> The analysis here predicts that even with parameter estimates favourable to
> conspiratorial leanings that __the conspiracies analysed tend rapidly towards collapse.__ Even
> if there was a concerted effort, the sheer number of people required for the sheer scale
> of hypothetical scientific deceptions would inextricably undermine these nascent
> conspiracies. For a conspiracy of even only a few thousand actors, intrinsic failure would
> arise within decades. For hundreds of thousands, such failure would be assured within less
> than half a decade.  

This includes only internal failures; the efforts of outside investigation just make
things worse for would-be conspirators.  

He is also well aware of the [backfire effect](https://en.wikipedia.org/wiki/Belief_perseverance),
and how conspiracy-minded people when presented with evidence like this may just dig in
deeper:  

> The grim reality is that there appears to be __a cohort so ideologically invested in a
> belief that for whom no reasoning will shift, their convictions impervious to the
> intrusions of reality.__ In these cases, it is highly unlikely that a simple mathematical
> demonstration of the untenability of their belief will change their view-point. However,
> for the less invested such an intervention might indeed prove useful.  

So, yeah: we can change a few minds, but some minds are irreparably damaged and therefore
unreachable.  I have no good ideas about that.  


## Why we care  

At some level, we care because we care about our society and the people who are its
members: nobody should be deluded into taking stances detrimental to their own well-being
and the well-being of all of us.  

<img src="{{ site.baseurl }}/images/2022-06-12-conspiracy-life-plosbio-1.jpg" width="400" height="148" alt="Hotez @ PLoS Biol: Anti-science aggression in the US" title="Hotez @ PLoS Biol: Anti-science aggression in the US" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
But we also care for a darker, and more dangerous reason: there is increasing violence
directed against scientists.  An article in _PLoS Biology_ by Peter Hotez details some of
this <sup id="fn3a">[[3]](#fn3)</sup>, as a warning to our community.  

> There is a __troubling new expansion of antiscience aggression in the United States.__ It’s
> arising from far-right extremism, including some elected members of the US Congress and
> conservative news outlets that target prominent biological scientists fighting the
> COVID-19 pandemic.  

When politicians call hysterically to cut off the salary of Tony Fauci, their base of
"patriots" issues death threats.  They feed into vaccine resistance, _which kills people._  

With _absolutely no exaggeration whatsoever,_ this is beginning to resemble the repression
of science under mid-20th century Fascism:  

> Historically, such regimes viewed scientists as enemies of the state. In his 1941 essay,
> Science in the Totalitarian State [10], Waldemar Kaempffert outlines details using the
> examples of Nazism under Hitler, Fascism under Mussolini, and Marxism and Leninism
> [10]. For example, under Stalin, the study of genetics and relativity physics were
> treated as dangerous western theories, and potentially in conflict with official social
> philosophies of state [11]. Today, there remain examples of authoritarian regimes that
> hold similar views. In 2019, the Hungarian Government under Prime Minister Viktor Orbán
> took over the control of the Hungarian Academy of Scientists. Brazil’s President Jair
> Bolsonaro cut funding for Brazilian scientific institutions and universities while
> downplaying the severity of the COVID-19 pandemic or undermining evidence of
> deforestation in the Amazon due to climate change.  

This intimidation is deep and broad.  For example, last February, Katelyn Jetelina (who
blogs as _Your Local Epidemiologist_)
[had to "take a break" for security reasons](https://yourlocalepidemiologist.substack.com/p/taking-a-short-break?s=r).  

It's become a grim, and increasingly dangerous time to be a scientist in the United
States:  

> As Nobel Laureate and Holocaust survivor Elie Wiesel once pointed out, __neutrality or
> silence favors the oppressor.__ We must take steps to protect our scientists and take
> swift and positive action to counter the growing wave of far-right antiscience
> aggression. __Not taking action is a tacit endorsement, and a guarantee that the integrity
> and productivity of science in the United States will be eroded or lose ground.__  


## The Weekend Conclusion  

Conspiracy thinking is a danger to one's self.  It is a danger to society.  As a
scientist, it is now also a danger to me.  

Conspiracies are _fragile_ with respect to being disclosed, but can do unimaginable damage
until then.  

Fight them.  Tooth and nail.  

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

<a id="fn1">1</a>: DR Grimes, ["On the Viability of Conspiratorial Beliefs"](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0147905), _PLoS ONE_ 11:1, e0147905, 2016-Jan-26.  DOI: [10.1371/journal.pone.0147905](https://doi.org/10.1371/journal.pone.0147905). [↩](#fn1a)  

<a id="fn2">2</a>: DR Grimes, ["Correction: On the Viability of Conspiratorial Beliefs"](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0151003), _PLoS ONE_ 11:3, e0151003, 2016-Mar-01.  DOI: [10.1371/journal.pone.0151003](https://doi.org/10.1371/journal.pone.0151003). [↩](#fn2a)  

<a id="fn3">3</a>: PJ Hotez, ["Mounting antiscience aggression in the United States"](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.3001369), _PLoS Biology_ 19:7, e3001369.  DOI: [10.1371/journal.pbio.3001369](https://doi.org/10.1371/journal.pbio.3001369). [↩](#fn3a)  
