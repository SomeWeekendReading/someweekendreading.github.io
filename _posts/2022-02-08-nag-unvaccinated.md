---
layout: post
title: On the Importance of Nagging the Unvaccinated
tags: COVID PharmaAndBiotech Politics
comments: true
---

It's _important_ that we keep nagging people to get vaccinated, at escalating levels of
unpleasantness.  Let me show you why.  


## The consequences of choosing to remain unvaccinated  

<img src="{{ site.baseurl }}/images/old-man-yells-at-cloud.jpg" width="400" height="318" alt="Simpsons: old man yells at cloud" title="Simpsons: old man yells at cloud" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Now, if you've seen almost _anything_ on this crummy little blog that nobody reads, you
know what I'm going to tell you: being unvaccinated without _excellent_ reason is a bad
way to live personally, a bad way to treat the people around you, and a bad way to
overload the medical system in your area.  But&hellip; I might just be an old man yelling
at a cloud, for all you know.  

It would be much better if we could find a source of reliable data and trustworthy
analysis.  Or better yet: the ability to analyze that data for ourselves and draw some
statistical conclusions.  

<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-cdc-mmwr.jpg" width="400" height="268" alt="CDC MMWR: COVID-19 risks of unvaccinated vs vaccinated and boosted" title="CDC MMWR: COVID-19 risks of unvaccinated vs vaccinated and boosted" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Fortunately, last Friday's edition of the US CDC's _Morbidity and Mortality Weekly Report_
has an article by Danza, _et al._ <sup id="fn1a">[[1]](#fn1)</sup> that's just the ticket.
They report a large study conducted by the Los Angeles County Department of Public Health
on COVID-19 patients late last year, properly age-adjusted to avoid any whiff of 
[Simpson's Paradox]({{ site.baseurl }}/covid-simpson/).  (Note that the report doesn't
specify _in detail_ how they did the age adjustment, so we can't quite check.  But they're
competent statisticians who said the magic words, so I'm inclined to trust them.  If they
screwed up, they'll get caught and we'll figure it out if that happens.  For now: benefit
of doubt given.)  

<a href="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-cdc-mmwr-variants.jpg"><img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-cdc-mmwr-variants-thumb.jpg" width="400" height="225" alt="Danza @ MMWR: SARS-CoV2 variants and the fall of Delta, rise of Omicron" title="Danza @ MMWR: SARS-CoV2 variants and the fall of Delta, rise of Omicron" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
First, in Supplementary Figure 1 shown here (click to embiggen), we see the period covered
started out with 100% Delta patients and ended with 100% Omicron patients.  During
the crossover period, they estimate they sequenced about 20% of all COVID-19 patients in
their area.  This is a dramatic graphical portrayal of just _how much more infectious_
Omicron is over Delta.  

__Conclusion:__ Delta was bad; Omicron is worse.  If you're not vaccinated and boosted,
_you will get Omicron_ and _it will be bad_.  (If you're vaccinated and boosted,
you still _might_ get Omicron, but it probably will be annoying, not awful.)  

<a href="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-cdc-mmwr-rates.jpg"><img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-cdc-mmwr-rates-thumb.jpg" width="400" height="538" alt="Danza @ MMWR: Age-adjusted 14-day COVID/hosp rates in LA by vaccination status" title="Danza @ MMWR: Age-adjusted 14-day COVID/hosp rates in LA by vaccination status" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Next, have a look at their Figures 1 A&amp;B, reproduced here (click to embiggen).  
- The top figure shows the time course of cases per 100,000 population.  It's properly
  age-adjusted, and broken down by vaccination status.  The solid line is for the
  unvaccinated, and the dashed line is for the vaccinated and boosted.  Note that while
  all lines are rising, the unvaccinated are rising _dramatically_ fast while the
  vaccinated and boosted are getting just a few infections.  
- The bottom figure is the same sort of thing, but for hospitlizations per 100,000.  Note
  the even stronger effect: the unvaccinated are headed for disaster and clogged
  hospitals, while the vaccinated and boosted barely notice.  
  
__Conclusion:__ Being unvaccinated is a _terrible strategic error_: it subjects you to
infection at higher rates, and make you impose a burden on hospitals at a fantastically
higher rate.  That then blocks other people who need those hospital resourcese for more
mundane purposes like broken legs, heart attacks, and cancer.  Don't be the dog in the
manger here: get vaccinated so you don't block up an important resource.  

Even more interestingly, if you're a statistics nerd, is that they could calculate risk
ratios between unvaccinated vs vaccinated + boosted populations.  That amounts to
calculating ratios of conditional probabilities for infection and hospitalization like:  

$$
\left\{
  \begin{align*}
	RR_{\mbox{infect}} &= \frac{\Pr(\mbox{infect} | \mbox{unvax})}(\Pr(\mbox{infect} | \mbox{vax+boost})) \\
	RR_{\mbox{hosp}}   &= \frac{\Pr(\mbox{hosp}   | \mbox{unvax})}(\Pr(\mbox{hosp}   | \mbox{vax+boost}))
  \end{align*}
\right.
$$

Let's see what they found for risk ratios in the Delta and Omicron wave:  

|                 |   | _Delta_ |   | _Omicron_ |
|:---------------:|:-:|-------:|:-:|---------:|
| Infection       |   | 12.3   |   |  3.8     |
| Hospitalization |   | 83.0   |   | 12.9     |

(Now, I didn't dig deep enough to see if they provided enough information to check the
risk ratio calculation, let alone enough to get a 95% confidence interval on them.  I'm a
little ripped that they didn't report the confidence interval, but let's go ahead and take
them at their word here.)  

__Conclusion:__ If you are unvaccinated, you are at massively higher risk &ndash; as in 
_orders of magnitude higher_ &ndash; compared to vaccinated and boosted people.  Why in
the world would you have tolerated more than 80 times the risk of hospitalization during
Delta?  Why would you continue to tolerate more than 10 times the risk now during Omicron?
(Answer: you should _not_ tolerate it, and should get vaccinated and then boosted.)  

<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-wapo-1.jpg" width="400" height="491" alt="Blake @ WaPo: Still a pandemic of the unvaccinated" title="Blake @ WaPo: Still a pandemic of the unvaccinated" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Look: the pandemic would be over now if people would stop refusing the vaccine for
stupidly superstitious reasons.  (And, admittedly, if the developed nations would cease
their sociopathic self-regard long enough to recognize even their self-interest in
vaccinating the rest of humanity, particularly in the developing nations.)  

This really is, still, a "pandemic of the unvaccinated", as Aaron Blake writes in the
_Washington Post_ <sup id="fn2a">[[2]](#fn2)</sup>, inspired by the _MMWR_ report above.
I just don't understand Republican wooden-headedness on this subject (and, to be fair, on
_many_ other subjects).  He notes other studies in other jurisdictions (it's not just an
LA thing!) finding similar results, with double-digit risk ratios for the unvaccinated
&ndash; that's just _stupid_ large!  

<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-nyt-1.jpg" width="400" height="588" alt="Leonhardt @ NYT: Americans have a booster problem" title="Leonhardt @ NYT: Americans have a booster problem" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-nyt-1-booster-rate.jpg" width="400" height="283" alt="Leonhardt @ NYT: US booster uptake dramatically lags developed world" title="Leonhardt @ NYT: US booster uptake dramatically lags developed world" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-nyt-1-death-rate.jpg" width="400" height="287" alt="Leonhardt @ NYT: US death rate dramatically exceeds developed world" title="Leonhardt @ NYT: US death rate dramatically exceeds developed world" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-nyt-1-booster-resistance.jpg" width="400" height="178" alt="Leonhardt @ NYT: Only 39% of Americans want boosters" title="Leonhardt @ NYT: Only 39% of Americans want boosters" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Even if we write off those who resist vaccination as hopeless cases deteremined to die of
COVID-19, why won't the rest of us get boosters in larger numbers?  This is a question
asked by David Leonhardt in the _New York Times_ yesterday. <sup id="fn3a">[[3]](#fn3)</sup>  

He points out 2 very painful facts, shown here graphically from his article:  
1. The rate of booster uptake per capita in the US is lower than in other developed
   nations (black line), and
2. The cumulative deaths per capita in the US are, correspondingly, dramatically higher
   (black line).  

Somehow, Americans are resisting boosters strongly enough that they are _willing to die_
for that belief.  What could it possibly be?  

Leonhardt proposes 2 features of the sadistic American healthcare system are at fault
here:  
1. _Extreme fragmentation:_ We just can't get our act together with centralized medical reporting, or even the ability to remind people to get a booster.  That's up to literally thousands and thousands of HMOs, hospitals, and individual practicese. Startlingly, most Americans _do not have a regular point of contact about healthcare._ In this situation, that's lethal  
2. _Government communication:_ It's been _terrible._  Leonhardt notes that they speak in
  the "language of academia", with abundant cautions and notes for exceptions.  Now here
  at _Chez Weekend_ we speak the "language of academia" like natives, so that's ok by us.
  But most people do not: they hear something complicated and decide to ignore it; they
  hear caveats and decide it's dangerous; they hear exceptions and decide it doesn't work.
  For example, many are still somehow confused on the subject of whether masks work!  Some
  are even confused as to whether vaccines work, when they are probably one of the most
  stupendously successful vaccines in human history (and we somehow manage not to say
  that).  Now to be fair, this is just a combination of stupidity and the massive failure of the
  American educational system; but it's also the reality with which we must engage.  

We were slow to grant full approval to the vaccines:
[Pfizer not until 2021-Aug-23]({{ site.baseurl }}/pfizer-vaccine-approved/) and
[Moderna not until 2022-Jan-31]({{ site.baseurl }}/spikevax-approved/).  We were slow to
approve rapid tests at home, and then made people work through insurance paperwork to pay
for them.  We were slow to work out that the J&amp;J vaccine recpients probably also
needed a booster.  

We were slow with all that&hellip; and now we're slow getting boosters.  We're not slow
to die, though.  


## Why we're making this harder than it has to be  

It still bugs me, though, as an American: why are we so _insistently_ making this much
much harder than it has to be?  

<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-wapo-2.jpg" width="400" height="400" alt="Taylor @ WaPo: COVID-19 preparedness via government trust" title="Taylor @ WaPo: COVID-19 preparedness via government trust" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-lancet.jpg" width="400" height="160" alt="COVID Natl Prep Collab @ Lancet: Govt trust as factor in preparedness" title="COVID Natl Prep Collab @ Lancet: Govt trust as factor in preparedness" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-lancet-trust.jpg"><img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-lancet-trust-thumb.jpg" width="400" height="229" alt="Lancet: Pandemic preparedness vs government trust, interpersonal trust, and government corruption" title="Lancet: Pandemic preparedness vs government trust, interpersonal trust, and government corruption" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
That's the subject of an article by Adam Taylor in the
_Washington Post_ <sup id="fn4a">[[4]](#fn4)</sup>, summarizing a research article 
in _The Lancet_ by the COVID-19 National Preparedness Collaborators. <sup id="fn5a">[[5]](#fn5)</sup>  

Taylor starts with the example of Vietnam: a smallish country that looked pretty
vulnerable to pandemics.  But&hellip; they've performed fantastically: good public health
measures to keep infection rates low, good vaccine uptake, and as a result low fatalities
compared to much richer countries.  One might, very reasonably, ask why that was the case
and what the rest of us could learn from it.  That study, of 177 countries, was the
subject of the _Lancet_ article.  

Now, the article wrestles with a _lot_ of potential predictors.  But in a way that is both
surprising to me and simultaneously sickeningly unsurprising, one big element was trust in
government and perception that the government is not corrupt.  Have a look at their
Figure 4, shown here (click to embiggen):  
- The top row of 3 plots is about population mobility, so ignore that.  
- The bottom row of 3 plots shows vaccine coverage (a measure of sensible pandemic
  response) plotted against measures of trust in government, interpersonal trust, and
  government corruption.  
  
The inescapable conclusion is related to trust:  
1. A people who trust their government to tell them the truth,  
2. Trust each other, and  
3. Perceive their government as not corrupt  
&hellip; will respond sensibly and get vaccinated.  

In the words of Thomas Bollyky, one of the study authors, to the _WaPo_:  

> We found no links between covid outcomes and democracy, populism, government
> effectiveness, universal health care, pandemic preparedness metrics, economic inequality
> or trust in science.  

He estimated that if all countries trusted their governments as much as Denmark (and if
their governments had been as _trustworthy_ as Denmark's), then 13% of world COVID-19
deaths could have been avoided.  Increased level of trust in others could have lowered
infections by as much as 40%.  

Now, in the US we had the 2nd worst standardized infection rate among infected
countries. After 2 generations of degrading trust in government since Reagan in the 1980s,
we show social wounds in all 3 of those areas.  Republicans in particular hammer their points
that the government is not to be trusted; each person is only responsible for themselves
as individuals, with no collective obligations; and provided us with Trump as an example
of the most corrupt administration in US history.  So each of the factors above has been
systematically degraded by 2 generations of right-wing political and economic poison.  


## How did we lose trust, and keep it from growing back?  

Basically, we've allowed economic inequality to approach and exceed the levels of the
Gilded Age, now approaching the Middle Ages with aristocrats and peasants.  That means the
rich and powerful are _very_ rich, and _very_ powerful.  They're perfectly capable of
reshaping the world to suit their own ends.  

<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-umair-1.jpg" width="400" height="118" alt="Umair Haque @ Eudaimonia: Why we pay people like Joe Rogan to stir up fascist hate" title="Umair Haque @ Eudaimonia: Why we pay people like Joe Rogan to stir up fascist hate" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-umair-2.jpg" width="400" height="155" alt="Umair Haque @ Eudaimonia: Why the Internet is making our societies self-destruct" title="Umair Haque @ Eudaimonia: Why the Internet is making our societies self-destruct" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
That is essentially the tack taken by Umair Haque, a blogger for whom I have great
respect.  

He's analyzed the recent teapot-tempest of the execrably racist, misogynist, and
proto-fascist rantings of Joe Rogan on Spotify <sup id="fn6a">[[6]](#fn6)</sup> and the
general use of the Internet to make swarm attacks. <sup id="fn7a">[[7]](#fn7)</sup>  

There are some interesting facts to contemplate:  
- While it's true Rogan has about 11 million regular listeners, it's the _same_ 11 million
  for each podcast.  It's not like he's growing much.  
- Spotify paid him about \$100 million to host his podcasts, so they're paying about \$10
  for each pair of ears listening.  That's a _massive_ payout for Rogan, and an _enormous_
  amount to pay to get listeners.  
- Other artists have _dramatically_ larger audiences, for which they are paid a pittance:
  - Euro football championship: 5 billion viewers  
  - The Olympics: 4 billion viewers  
  - Adele's "30" album: 30 million streams in one month  
  - Dua Lipa's "Levitating": more than 500 million streams  
  - Olivia Rodrigo's top 2 songs: more than 1 billion.  
  
So it seems, on the surface, like a particularly stupid business decision for Spotify to
host Rogan at ruinous expense both in terms of money and public disapproval.  They're
_subsidizing_ someone to spew hatred, racism, misogyny, ignorance, and COVID-19
disinformation (like ivermectin).  

We understand (though do not respect) why Rogan wants to do it: he's being paid well.  As
for his corporate masters?  They're spreading right-wing memes to undermine any sort of
effective government that might move toward things people want, like universal healthcare,
affordable housing, peaceful foreign policies, green and sustainable energy, and so on.
It pays better for the billionaire clade to keep the rest of us under their boot heel.  

<img src="{{ site.baseurl }}/images/2022-02-08-nag-unvaccinated-nyt-2.jpg" width="400" height="223" alt="Krugman @ NYT: What to Do With Our Pandemic Anger" title="Krugman @ NYT: What to Do With Our Pandemic Anger" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Paul Krugman, the econ Nobelist who moonlights writing at the _New York Times_, says much
the same, though in more polite terms. <sup id="fn8a">[[8]](#fn8)</sup>  

He points out that our wounds are largely self-inflicted: too many of us refuse to break
our sociopathic self-regard to act responsibly.  "Act responsibly" here is pretty easy to
understand: get vaccinated &amp; boosted, wear a mask, do social distancing, use tests.  

The rest of us are _angry_ about this.  If you're a vaccine resister, I'm _angry at you._
You are _hurting_ me, my family, my country, and my world.  After 900,000 dead in the US,
you should be in no way surprised to hear this.  

Like Krugman, I'm tired of the way we bend over backward to accomodate the vaccine
refuseniks and the conspiracy whackos.  Time to make them bend over backward, instead.  


## The Weekend Conclusion  

We'll leave the last word to Cheryl Rofer, another retired physics type.  She specialized
in nuclear stuff and national security, so she knows a thing or two about response to
threats.  And, alas, the public's myopic and attention-span-impaired attitude:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    For all those removing mask mandates, I repeat a graphic I&#39;ve been using since March 2020.
    We keep doing this over and over and over.
    <a href="https://t.co/LjYpukLi0G">pic.twitter.com/LjYpukLi0G</a>
  </p>&mdash; Cheryl Rofer (@CherylRofer) <a href="https://twitter.com/CherylRofer/status/1490894042040877056?ref_src=twsrc%5Etfw">February 8, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

&hellip; back to dying needlessly.  

We should learn, so we can live and not die.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: P Danza, _et al.,_ ["SARS-CoV-2 Infection and Hospitalization Among Adults Aged ≥18 Years, by Vaccination Status, Before and During SARS-CoV-2 B.1.1.529 (Omicron) Variant Predominance — Los Angeles County, California, November 7, 2021–January 8, 2022"](https://www.cdc.gov/mmwr/volumes/71/wr/mm7105e1.htm?s_cid=mm7105e1_w), US Centers for Disease Control &amp; Prevention _Morbidity and Mortality Weekly Report_, 71:5, 177-181, 2022-Feb-04.  

The _MMWR_ is sort of the CDC's in-house almost-journal for publishing public health data
vignettes and analyses.  "Morbidity &amp; Mortality" is quite a catchy journal name, no?  [↩](#fn1a)  

<a id="fn2">2</a>: A Blake, ["Yes, it’s still a pandemic of the unvaccinated — arguably even more so now"](https://www.washingtonpost.com/politics/2022/02/03/yes-its-still-pandemic-unvaccinated-arguably-even-more-so-now/), _Washington Post_, 2022-Feb-03. [↩](#fn2a)  

<a id="fn3">3</a>: D Leonhardt, ["The Booster Problem: Why are Americans slow to get booster shots?"](https://www.nytimes.com/2022/02/07/briefing/boosters-us-covid-omicron.html), _New York Times_, 2022-Feb-07. [↩](#fn3a)  

<a id="fn4">4</a>: A Taylor, ["Researchers are asking why some countries were better prepared for covid. One surprising answer: Trust."](https://www.washingtonpost.com/world/2022/02/01/trust-lancet-covid-study/), _Washington Post_, 2022-Feb-01. [↩](#fn4a)  

<a id="fn5">5</a>: COVID-19 National Preparedness Collaborators, ["Pandemic preparedness and COVID-19: an exploratory analysis of infection and fatality rates, and contextual factors associated with preparedness in 177 countries, from Jan 1, 2020, to Sept 30, 2021"](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(22)00172-6/fulltext), _The Lancet_, 2022-Feb-01.  DOI: [10.1016/S0140-6736(22)00172-6](https://doi.org/10.1016/S0140-6736(22)00172-6). [↩](#fn5a)  

<a id="fn6">6</a>: U Haque, ["How the Internet Became a Maelstrom of Hate"](https://eand.co/how-the-internet-became-a-maelstrom-of-hate-2cd1331ff65f), _Eudaimonia &amp; Co_ blog, 2022-Feb-05. [↩](#fn6a)  

<a id="fn7">7</a>: U Haque, ["Why the Internet is Making Our Societies Self-Destruct"](https://eand.co/the-internet-has-become-poisonous-7f8de38a45fc), _Eudaimonia &amp; Co_ blog, 2022-Feb-07. [↩](#fn7a)  

<a id="fn8">8</a>: P Krugman, ["What to Do With Our Pandemic Anger"](https://www.nytimes.com/2022/02/07/opinion/covid-unvaccinated-anger.html), _New York Times_, 2022-Feb-07. [↩](#fn8a)  
