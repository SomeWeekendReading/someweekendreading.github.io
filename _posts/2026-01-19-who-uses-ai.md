---
layout: post
title: Who Uses AI?  
tags: ArtificialIntelligence CorporateLifeAndItsDiscontents JournalClub Sadness Statistics
comments: true
commentsClosed: true
---

Who actually _uses_ the LLM AIs, and what sorts of people are they?  


## A Study of AI Users and Their Personality Types  

<img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-pivot-1.jpg" width="400" height="547" alt="Gerard @ Pivot to AI: AI is not popular, and the users are dark triad people" title="Gerard @ Pivot to AI: AI is not popular, and the users are dark triad people" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-cyberpsych-1.jpg" width="400" height="274" alt="Mckinley, et al. @ Cyberpsych: Who uses AI and what sort of personalities do they have?" title="Mckinley, et al. @ Cyberpsych: Who uses AI and what sort of personalities do they have?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-psypost-1.jpg" width="400" height="292" alt="Dolan @ PsyPost: Summary and interview with authors" title="Dolan @ PsyPost: Summary and interview with authors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Somewhere I came across a blog by David Gerard called _Pivot to AI_, largely consisting of rather
well-reasoned critiques of AI and a hefty side of snark.  (Motto: "It can't be that
stupid, you must be prompting it wrong.")  One recent article <sup id="fn1a">[[1]](#fn1)</sup>
is about how much people _actually, measurably_ use AI, and what kinds of personality
types are associated with that.  

You can probably take a guess where this is going, given the illustration shown here:
virtual reality goggles clamped firmly in place by crab-like arms around the back of the
head, a tube to interfere with breathing, and a tentacle about the neck.  This is clearly
a riff on the
[face-hugger monsters such as those in the old 70s horror flick _Alien._](https://en.wikipedia.org/wiki/Xenomorph#Facehugger)  

He's reporting on a recently published &ndash; and thus peer-reviewed &ndash; paper by
McKinley, _et al._ <sup id="fn2a">[[2]](#fn2)</sup>, in which they studied 2 pretty
good-sized populations, measuring amount of AI usage and administering 2 different
personality type tests to see what sort of people used AI more than others.  (__NB:__
McKinley, the lead author, is a PhD candidate.  If this very good paper is any
indication, she will have a _heck_ of a thesis and a good start to her career!)  

There's another summary of the same paper and some brief interview material with
McKinley, by Dolan at _PsyPost_ <sup id="fn3a">[[3]](#fn3)</sup>.  

The results are about what I'd hoped (LLMs are _really_ not very popular) and feared (LLMs
tend to get used by people who are more Machiavellian, narcissistic, or psychopathic).  In
other words, the good news is most people ignore LLMs, but the bad news is that bad people
use it.  This makes a degree of sense: LLMs are basically BS engines, so BS artists probably
regard them as valuable time-savers.  

### Prolegomena  

They studied 2 separate populations:  
- Students from 2 universities, $N$ = 499  
- General public (selection criteria somewhat unclear to me), $N$ = 455.  

They did _not_ rely on self-reports of use of AI, though they did record that too.  (See
below on how inaccurate the self-reports were.)  Instead, they filtered for subjects who
used the Chrome browser, and were competent to install their plugin to measure web site
usage.  This has 2 effects: by giving up on measuring phone/app usage, they're biasing it
to older subjects ("the desktop is for geezers", as one commenter put it), and even so
they are only accepting those with enough technical competence to install their plugin.
Both of those issues will have to be revisited in any followup studies attempting
replication, though the authors are up-front about it.  

The study period was for 3 months.  

They annotated the web sites visited by subjects in a couple dozen categories, which we
can summarize here as "AI" or "not AI".  The initial AI sites were from a repository
curated by AI researchers.  For the rest, they (alas!) used ChatGPT to classify the web
sites according to a widely used taxonomy from the Interactive Advertising Bureau.  While
I despise the idea of trusting ChatGPT to tell the truth about _anything,_ they did at
least have 2 people hand-check a random sample of 200 web sites, finding only
1 error, a web site which could not be accessed for assessment.  _Maybe_ good enough for a
start, but it's a weak point that makes me itch!  

They also administered some well-thought-of psychological tests to the participants:  
- The TIPI, or ten-item personality inventory, is a version of the well-regarded
  [Big Five personality traits](https://en.wikipedia.org/wiki/Big_Five_personality_traits).
  It rates subjects on scales for Extraversion, Agreeableness, Conscientiousness,
  Emotional Stability, and Openness to New Experience.  It has high reproducibility.  
  
  You can [take the Big Five test for yourself](https://openpsychometrics.org/tests/IPIP-BFFM/)
  to see if it seems to capture what you know about yourself.  
- The SD3, or short dark triad personality test, measures for the 
  [Dark Triad personality traits](https://en.wikipedia.org/wiki/Dark_triad) of
  Machiavellianism, Narcissism, and Psychopathy.  These well-defined terms are personality
  traits with well-documented clinical correlates, e.g., diagnosing Narcissistic
  Personality Disorder, Antisocial Personality Disorder, and so on.  
  
  You can [take the Short Dark Triad test yourself](https://openpsychometrics.org/tests/SD3/)
  to see if you recognize anything about the darker side of yourself.  
- Other tests measured attitudes toward AI, its ease of use, perception of its usefulness,
  general technology acceptance, political ideology, etc.  

(They also computed [Cronbach's $\alpha$](https://en.wikipedia.org/wiki/Cronbach%27s_alpha), 
a measure of internal consistency/reliability of the tests; we won't go into detail about
that.)  

There were a lot of measurements, but the two that stand out to me are:  
- What personality traits predict more use of AI?  
- If we separate the _prolific_ AI users from the rest, how are they different in
  personality traits?  

Since the distributions of AI usage were decidedly non-normal (more like a power law?)
they decided to use of
[Spearman rank correlation $\rho$](https://en.wikipedia.org/wiki/Spearman%27s_rank_correlation_coefficient).
(I _hope_ this means they rank-ordered the data first, but the word salad was
a bit unclear to me.)  

### Results: Frequency of Use of LLMs &amp; Personality Type Correlates  

<a href="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-cyberpsych-2.jpg"><img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-cyberpsych-2-thumb.jpg" width="400" height="203" alt="McKinley, et al. @ Cyberpsych: Distribution of frequencies of AI use for students" title="McKinley, et al. @ Cyberpsych: Distribution of frequencies of AI use for students" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-cyberpsych-3.jpg"><img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-cyberpsych-3-thumb.jpg" width="400" height="217" alt="McKinley, et al. @ Cyberpsych: Distribution of frequencies of AI use for general public" title="McKinley, et al. @ Cyberpsych: Distribution of frequencies of AI use for general public" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-siam-1.jpg" width="400" height="265" alt="Clauset, et al. @ SIAM Rev: Power laws in empirical data" title="Clauset, et al. @ SIAM Rev: Power laws in empirical data" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Here's the observed distribution of number of "AI" sites visited, for the student
population (top) and general public (bottom).  Note the difference in horizontal scales:
the general public used AI sites much less.  This is over the whole study period, which
remained pretty constant; there were no observable trends over time.  

The authors note this is decidedly non-normal, and thus punted to rank-order statistics
like Spearman's $\rho$.  That's&hellip; sort of okay, I guess?  I'd have tried some
distribution tests to see what's at least _close_ to the observations.  They speculate
it's a power law, but do no analysis to test this.  My favorite method for power laws in
empirical data is from Cosima Shalizi's group <sup id="fn4a">[[4]](#fn4)</sup>, which not
only gives stable methods for estimating the parameters but recommendations for other
distributions to test and compare with likelihood ratios.  

That's not a fatal flaw in the paper, and the rank statistic tactic is probably
acceptable.  But in the future, or even in a reanalysis of these data, the Shalizi tests
could be informative in that they enable more specific statistical methods once the
distribution is identified.  

<a href="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-pivot-tbl-1.jpg"><img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-pivot-tbl-1-thumb.jpg" width="400" height="58" alt="McKiinley, et al. @ Cyberpsych: Frequencies of AI use in 2 study populations" title="McKiinley, et al. @ Cyberpsych: Frequencies of AI use in 2 study populations" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Here's the top-line result: over 90 days, about 1% of the sites visited by students were
AI sites, and about 0.44% of the sites visited by the general public.  That's&hellip;
_very low._  

Also, when comparing self-reported AI use with _measured_ AI use, they got a Spearman 
$\rho \sim$ 0.329, with an associated significance of $p \sim$ 0.001.  (It seems this was done
only in the general public test population, and not for students?)  That's statistically
significantly different from 0, but still pretty low.  It was a good idea to measure AI
use directly, because the self-reports were not accurate.  (They do not say if the
self-reports were higher or lower than the measurements.)  

__Conclusion:__ AI use in both populations is much lower than expected.  


<img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-pivot-tbl-3.jpg" width="400" height="197" alt="McKiinley, et al. @ Cyberpsych: Association of AI use with dark triad in students" title="McKiinley, et al. @ Cyberpsych: Association of AI use with dark triad in students" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Looking at the student population, they computed Spearman correlation of number of AI
sites visited with the Big 5 personality types and the Dark Triad personality disorders.
The statistically significant ($p \le$ 5%) Spearman rank correlations were as shown here:
mild to moderate association, but statistically significant (_i.e.,_ reproducible).  

They also report that, in the student population, Extraversion on the Big 5
personality test is correlated with both Narcissism and Psychopathy.  This leads one to
think Narcissism and Psychopathy are the root elements, and bring Extraversion along with
them.  

In the general population, there was much less AI use and thus it was harder for Spearman
rank correlations of AI use with personality measurements to reach statistical
significance.  Nothing really made the usual $p \lt$ 0.05 cut; the closest was
Machiavellianism at $\rho \sim 0.080$, $p \sim$ 0.087.  

__Conclusion:__ In younger people, AI use correlates with Extraversion, Narcissism, and
Psychopathy scores.  In the general public, AI use was low enough that it was hard to
tell, though there was a hint at a relationship to Machiavellianism.  

### Results: Personality Types for Prolific LLM Users  

They did another study, focusing on the differences in personality between _prolific_ AI
users (more than 4% of URLs during the study period) vs everybody else.  Since the AI
usage in the general population was pretty low, the prolific population was too small for
analysis.  So this is just for the student population.

They looked at the test scores between the student prolific and non-prolific AI users, and
tested for a difference in mean with a
[Welch (unequal $\sigma^2$) $t$-test](https://en.wikipedia.org/wiki/Welch%27s_t-test).
Commendably, they _also_ tested for effect size with
[Cohen's $d$](https://en.wikipedia.org/wiki/Effect_size#Cohen's_d).  

Obviously, the limiting factor for statistical significance is the small number of prolific
users:  
- _Prolific:_ N=20  
- _Non-Prolific:_ N=479  

There were no significant differences in the Big 5 personality factors ($p \gt$ 0.15),
i.e., the prolific AI users were about the same in Extraversion, etc.  


<a href="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-pivot-tbl-2.jpg"><img src="{{ site.baseurl }}/images/2026-01-19-who-uses-ai-pivot-tbl-2-thumb.jpg" width="400" height="130" alt="McKinley, et al. @ Cyberpsych: Spearman correlation, statistical significance, and effect size of Dark Triad with extreme AI use" title="McKinley, et al. @ Cyberpsych: Spearman correlation, statistical significance, and effect size of Dark Triad with extreme AI use" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
However, it's quite _disturbing_ that all 3 of the Dark Triad personality disorders
were statistically significantly associated with prolific AI use (by Welch's $t$ test).
The effect size, according to
[the usual tables for interpreting Cohen's $d$](https://en.wikipedia.org/wiki/Effect_size#:~:text=The%20table%20below%20contains%20descriptors%20for%20various%20magnitudes%20of%20d%2C%20r%2C%20f%20and%20omega),
ranged from medium (0.5) to large (0.8).  

In the spirit of "correlation is not causation", we must mention that we do not know if
Dark Triad people tend to use AI more ("game recognizes game", so BS artists like BS
engines), or _whether prolific AI use made them that way._  

This is a serious question: as we've written before <sup id="fn5a">[[5]](#fn5)</sup> on
this Crummy Little Blog That Nobody Reads (CLBTNR), there is now significant anecdotal
evidence of extreme AI use _causing_ mental illness.  

Either way, this result is _alarming._  

__Conclusion:__ _Prolific_ AI users in the student population scored higher on tests for
all 3 of the Dark Triad personality disorders.  This was both statistically significant
and a medium to large effect size.  


## The Weekend Conclusion  

We'll leave the final word to Gerard's _Pivot to AI_ post, since I kind of cringe at using
the sort of vocabulary required for sufficient emphasis:  

> So AI is not actually popular, and AI users are unpleasant assholes.  

Cruder than I'd put it, but you won't forget it.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/ceterum-censeo/)  

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

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: D Gerard, ["AI is not popular, and AI users are unpleasant asshats"](https://pivot-to-ai.com/2025/10/15/ai-is-not-popular-and-ai-users-are-unpleasant-asshats/), _Pivot to AI_ blog, 2025-Oct-10. [↩](#fn1a)  

<a id="fn2">2</a>: E McKinley, _et al.,_ ["Evaluating Artificial Intelligence Use and Its Psychological Correlates via Months of Web-Browsing Data"](https://journals.sagepub.com/doi/10.1177/21522715251379987), _Cyberpsych Behavior &amp; Soc Net_ 28:10, 2025-Oct-14. DOI: [10.1177/21522715251379987](https://doi.org/10.1177/21522715251379987). [↩](#fn2a)  

<a id="fn3">3</a>: EW Dolan, ["Most people rarely use AI, and dark personality traits predict who uses it more"](https://www.psypost.org/most-people-rarely-use-ai-and-dark-personality-traits-predict-who-uses-it-more/), _PsyPost_, 2025-Oct-12. [↩](#fn3a)  

<a id="fn4">4</a>: A Clauset, CR Shalizi, &amp; MEJ Newman, ["Power-Law Distributions in Empirical Data"](https://epubs.siam.org/doi/10.1137/070710111), _SIAM Review_ 51:4, 2009. DOI: [10.1137/070710111](https://doi.org/10.1137/070710111).  

__NB:__ [The preprint on _ar&chi;iv_](https://arxiv.org/abs/0706.1062) is not paywalled. [↩](#fn4a)  

<a id="fn5">5</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["AI LLMs: A Way to Make Yourself Crazy&hellip; Literally!"]({{ site.baseurl }}/llms-make-you-crazy/), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2025-Aug-16. [↩](#fn5a)  
