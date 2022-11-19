---
layout: post
title: Republicans vs Herd Immunity
tags: COVID MathInTheNews Politics SomebodyAskedMe
comments: true
commentsClosed: true
---

If a large enough clade of US persons refuse COVID-19 vaccination, herd immunity may never
be reached.  Right now in the US, that clade seems to be White Republicans.  (World-wide,
it's of course more complicated.)  

## Vaccine hesitancy in the US by subgroups 

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) what I thought about vaccine
hesitancy in various groups, and how that would affect our attempt to reach herd
immunity.  

Everybody talks about Blacks, who actually have pretty good, rational reasons to
think the medical system doesn't have their best interests at heart.  But, as we wrote
[in a previous post]({{ site.baseurl }}/i-guess-i-like-dolly-parton/#whats-that-got-to-do-with-covid-19-vaccines), 
that's a bit of a red herring according to _Axios_ <sup id="fn1a">[[1]](#fn1)</sup>:  

!["Axios: White Republican vaccine hesitancy"]({{ site.baseurl }}/images/2021-03-08-i-guess-i-like-dolly-parton-axios.jpg "Axios: White Republican vaccine hesitancy")

We see that the most problematic clade is White Republicans, not Blacks or Latinos.  In
fact, the Black and Latino vaccine resistance has been trending downward over time, with a
nice step down on the day vaccinations started.  White Republicans, on the other hand, had
a _step up_ in vaccine resistance when vaccines came out, and no noticeable downward trend
(red curve).  So if you really want to combat resistance and get to general immunity,
White Republicans are where you have to start.  

That's why I was so impressed with
[Dolly Parton's vaccination video]({{ site.baseurl }}/i-guess-i-like-dolly-parton/#whats-that-got-to-do-with-covid-19-vaccines)
(aside from the intimidating new sobriquet "chicken squat"): her fan demographic skews rural,
White, and Republican, so her message was _exactly_ on target.  


## Is that your only evidence?  

As St Thomas Aquinas (or possibly St Augustine?) is alleged to have said, 
["hominem unius libri timeo"](https://en.wikipedia.org/wiki/Homo_unius_libri) 
(I fear the man of one book, i.e., someone with narrow views likely to be fanatical).  So
do we have multiple sources beyond _Axios_ above?  

<img src="{{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-wapo.jpg" width="400" height="135" alt="WaPo: 1/3 of Republicans definitely won't get vaccinated" title="WaPo: 1/3 of Republicans definitely won't get vaccinated" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-wapo-fishnet-mask.jpg" width="400" height="309" alt="WaPo: malicious compliance fishnet mask at CPAC" title="WaPo: malicious compliance fishnet mask at CPAC" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Unfortunately, yes.  

From a _Washington Post_ article by Dan Diamond comes the
disappointing news that almost 1/3 of Republicans say the "definitely won't" get
vaccinated. <sup id="fn2a">[[2]](#fn2)</sup>  The article reports on a number of
interviews with some _very_ peculiar people subscribing to various dingbat ideas about
vaccines.  

My first reaction was "How can anybody be that _stupid?_ "  But then, I looked at the photo
at the top of the article.  It shows a knucklehead at CPAC showing off his "fishnet mask",
i.e., allowing him to claim to be masked but making the mask utterly useless.  This is
what's called _malicious compliance_, i.e., technically obeying the mask-wearing rule
while contemptibly endangering everyone.  

So&hellip; the Well of Stupid is deep indeed.  

Also, the Kaiser Family Foundation reports polling from last 
December <sup id="fn3a">[[3]](#fn3)</sup>
(the whole report is worth a deep read, for related things like factually wrong beliefs
about masks) which confirms that the most resistant clade tends to be Republican and less educated:  

!["Kaiser Family Foundation: resistance skews low education and Republican"]({{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-kff.jpg "Kaiser Family Foundation: resistance skews low education and Republican")


## The critical question  

Ok, so some people are self-destructively stupid.  But does that really endanger others?
Are there enough of them to mess up herd immunity so this _never_ goes away?  

First, let's get a handle on the size of the problem.  We've seen _Axios_ claim 56% of
White Republicans, and now the _WaPo_ claim 33% of all Republicans.  Let's go with the
lower figure, just to make sure I'm not stacking the deck here.  Let's say about half the
US is Republican (alas), so that means we have a hard-core vaccine resistance population
of about 0.33 * 0.50 * 100% = 16.5%.  That squares roughly with the 15% from the Kaiser
Foundation report, above.  

Second, let's look at 
[the mathematical basis for herd immunity](https://en.wikipedia.org/wiki/Herd_immunity#Theoretical_basis).
Everything depends on the parameter $R_0$, the basic reproduction number of the disease:
the number of new infections caused by each infected person in conditions of perfect
mixing.  Let $S$ be the fraction of the population who are susceptible.  At the critical
point where herd immunity sets in, each case generates less than enough new cases to
replace it:  

$$
R_0 \cdot S \leq 1
$$

Now let $p$ be the probability a person accepts the vaccine.  Then $S = 1 - p$.  Plug
that into the previous equation and solve for $p$ to get:  

$$
p \geq 1 - \frac{1}{R_0}
$$

Now, for COVID-19, the best estimates for $R_0$ range around 
2.5 &ndash; 4. <sup id="fn4a">[[4]](#fn4)</sup> <sup id="fn5a">[[5]](#fn5)</sup>
The B.1.1.7 and B.1.351 variants might be quite a bit higher, so the upper end of that
range is the thing we have to shoot for.  That means we need 100% * (1 - 1/4) = 75% of the
population vaccinated to get to herd immunity.  (_At least._  New variants may be more
virulent, i.e., have a higher value of $R_0$, thus needing a higher vaccination fraction.)  

So&hellip; we have 25% or less slack in the population who can resist the vaccine and not
mess it up for the rest of us.  Having 17% of the population being vaccine resisting
Republicans isn't immediately fatal&hellip; _only if we get near-perfect vaccine
acceptance everywhere else, and the new variants aren't even more virulent._  They're
burning up the margin of safety in the name of&hellip; knuckleheadery?!  


## Consequences  

There is precedent for what to do here: [Jacobson v Massachusetts](https://en.wikipedia.org/wiki/Jacobson_v._Massachusetts) (197 U.S. 11 (1905))
is a Supreme Court precedent saying that yes, it _is_ possible for the state to use police
powers to compel vaccination (smallpox, in this case).  It's not some dusty old legal
peculiarity, either.  It gets frequently used as a precedent because it both strengthens
_and limits_ police power: you can be arrested &amp; fined for not being vaccinated, but
the cops can't just hold you down and jab you against your will.  

And we haven't even begun to think about the developing world!  Unless COVID is eradicated
_everywhere_, it will continue to evolve mutant forms that are more virulent or more
deadly.  Worst of all would be an "escape mutation" that evades the existing vaccines;
then we'd have to start all over again.  So we really have to vaccinate pretty much
_everybody_: [nobody is safe until everybody is safe](https://www.gavi.org/vaccineswork/why-no-one-safe-until-everyone-safe-during-pandemic).  

Sometimes, that's what it takes to eradicate a pandemic.  Just think of what the modern
debased US political reactions would be&hellip; It's already _almost_ that bad, where
people refusing to mask up are assumed to be Republicans, and that widely viewed as an
occasion for shame:  

<a href="https://twitter.com/Phormio2013/status/1369256097899552772">
  <img src="{{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-twitter-1.jpg" width="550" height="928" alt="DoctorTitanium @ Twitter: Battle of cultural norms" title="DoctorTitanium @ Twitter: Battle of cultural norms">
</a>


##  Eagerly awaiting vaccination  

Here at Chez Weekend, your humble Weekend Editor has gotten the first shot, and is eagerly
awaiting the second.  The Weekend Editrix, being a young slip of a girl, is eagerly
awaiting our state guidelines lowering the age limit to her age.  

So everybody wants (or should want) the vaccine.  

Now, I'm not really a fan of Randy Rainbow&hellip; but once in a loooong while, his brand of
silliness helps us appreciate the surreal nature of the situation.  I do actually remember
the song
["Mr. Sandman" by the Chordettes from 1958](https://www.youtube.com/watch?v=CX45pYvxDiA).
(Mostly because my elder siblings were listening to popular music
at the time when I were nought but a wee sprout.)  So&hellip; "Mr. Biden, bring my vaccine":  

<a href="https://twitter.com/RandyRainbow/status/1369294406126305283">
  <img src="{{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-twitter-2.jpg" width="550" height="553" alt="Randy Rainbow @ Twitter: Mr Biden, Bring My Vaccine" title="Randy Rainbow @ Twitter: Mr Biden, Bring My Vaccine">
</a>


## Addendum 2021-Mar-14 (Pi Day!)

<img src="{{ site.baseurl }}/images/2021-03-10-republicans-vs-herd-immunity-fauci.jpg" width="400" height="420" alt="Boston Globe: Fauci doesn't get Republican vaccine resistance either" title="Boston Globe: Fauci doesn't get Republican vaccine resistance either" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
An article in the venerable _Globe_ by Krasny &amp; Condon <sup id="fn6a">[[6]](#fn6)</sup> 
interviews Tony Fauci, the now-famous head of the 
[National Institute of Allergy and Infectious Diseases](https://www.niaid.nih.gov/) and
general wizard on the subject of COVID-19 in particular.  A disturbing fact:  
- 41% of Republicans would refuse any COVID-19 vaccine, and  
- 49% of Republican men would refuse, but  
- just 6% of Democratic men would refuse.  

That's&hellip; _maddening!_  When asked about this, Fauci's response was in line with what
we found above:  

> "I just don’t get it," Anthony Fauci, director of the National Institute of Allergies
> and Infectious Diseases, said on NBC's "Meet the Press" when asked about polling showing
> many Republicans, especially men, don't want a vaccine.  
>  
> &hellip;  
>  
>"We've got to dissociate political persuasion from common sense, no-brainer public health
>things," Fauci said.  
>  
> &hellip;  
>  
> Fauci also said he wished former President Donald Trump would come out and publicly urge
> his supporters to get the vaccine. "I wish he would," Fauci said on "Fox News Sunday."
> "It would really be a game changer if he did."  
>  
> &hellip;  
>  
> __But a decision by a large swathe of the population to not receive a vaccine may slow or
> imperil the march toward herd immunity in the U.S.__  

Yep.  Right there with you, Tony.  We don't get it either.  Endangering herd immunity
isn't just self-destructive, it's dangerous for all of us.
[Jacobson v Massachusetts](https://en.wikipedia.org/wiki/Jacobson_v._Massachusetts) is
starting to look better and better.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: C Owens, ["Republicans are least likely to want the coronavirus vaccine"](https://www.axios.com/republicans-coronavirus-vaccine-hesitancy-023bf32f-3d68-4206-b906-4f701b87c39f.html), _Axios_, 2021-Feb-25. [↩](#fn1a)  

<a id="fn2">2</a>: D Diamond, ["Meet the GOP voters who could decide whether the U.S. reaches herd immunity"](https://www.washingtonpost.com/health/2021/03/07/republicans-covid-vaccine/), _Washington Post_, 2021-Mar-08. [↩](#fn2a)  

<a id="fn3">3</a>: L Hamel, _et al._, ["KFF COVID-19 Vaccine Monitor: December 2020"](https://www.kff.org/coronavirus-covid-19/report/kff-covid-19-vaccine-monitor-december-2020/), _Kaiser Family Foundation_, 2020-Dec-15.[↩](#fn3a)  

<a id="fn4">4</a>: A Fontanet &amp; S Cauchemez, ["COVID-19 herd immunity: where are we?"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7480627), _Nature Reviews Immunology_ 20:10 (2020-Oct), 583–584. doi:[10.1038/s41577-020-00451-5](https://doi.org/10.1038%2Fs41577-020-00451-5). PMC [7480627](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7480627). PMID [32908300](https://pubmed.ncbi.nlm.nih.gov/32908300/).  [↩](#fn4a)  

<a id="fn5">5</a>: HE Randolph &amp; LB Barreiro, ["Herd Immunity: Understanding COVID-19"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7236739), _Immunity_ 52:5 (2020-May), 737–741. doi:[10.1016/j.immuni.2020.04.012](https://doi.org/10.1016%2Fj.immuni.2020.04.012). PMC [7236739](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7236739). PMID [32433946](https://pubmed.ncbi.nlm.nih.gov/32433946/). [↩](#fn5a)  

<a id="fn6">6</a>: R Krasny &amp; C Condon, ["Fauci says vaccine hesitancy among Republicans poses a risk: ‘I just don’t get it’"](https://www.bostonglobe.com/2021/03/14/nation/fauci-says-vaccine-hesitancy-among-republicans-poses-risk-i-just-dont-get-it/), _Boston Globe_, 2021-Mar-14. [↩](#fn6a)  
