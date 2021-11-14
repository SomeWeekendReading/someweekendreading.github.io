---
layout: post
title: On New COVID-19 Therapeutics
tags: COVID MathInTheNews PharmaAndBiotech R Statistics
comments: true
---

Vaccines are great, but now there are some exciting new treatments for COVID-19, in case
you get a breakthrough infection (or made the wrong choice about accepting vaccination).
Let's look at how well they work, and what they might cost in comparison to other things.  


## A quick review of efficacy percentage and its confidence limits  

We talk about _efficacy_ of a vaccine or other treatment, as a number telling how much the
risk of infection, hospitalization, or death is reduced, compared to the untreated
popultion.  In other words:  

$$
\begin{align*}
 \mbox{VE} &= 100\% \times \frac{\Pr(\mbox{sick} | \mbox{untreated}) - \Pr(\mbox{sick} | \mbox{treated})}{\Pr(\mbox{sick} | \mbox{untreated})} \\
           &= 100\% \times \left(1 - \frac{\Pr(\mbox{sick} | \mbox{treated})}{\Pr(\mbox{sick} | \mbox{untreated})}\right)
\end{align*}
$$

- Efficacy of 100% means nobody in the treatment arm of a trial got sick.  
- Efficacy of a positive percent means the treatment helped, i.e., the treatment arm got sick
  somewhat less often than the untreated arm.  
- Efficacy of 0% means the treated &amp; untreated people got sick at about the same rate,
  i.e., treatment didn't help and didn't hurt.  
- A _negative_ efficacy means the treated subjects got sick _more often_ than the
  untreated, i.e., the treatment is actively harmful.  

So that's just a ratio of 2 probabilities and a little arithmetic.  You can calculate it
yourself on paper if you can learn just 4 integers: the number of subjects in the
treatment &amp; control arms ($N_{\mbox{trt}}$, $N_{\mbox{cnt}}$) and
the number in each arm who got sick ($K_{\mbox{trt}}$, $K_{\mbox{cnt}}$).  

But that's not quite the end of the story.  Of course we're _estimating_ the probabilities
here, by examining a finite number of patients.  That means the efficacy is itself a
random variable, which has some distribution due to measurement uncertainty and sample
size.  So we'd like also to know the 95% confidence limits (CL): what's the lowest and highest
it can be, such that we're 95% confident the true value is inbetween?  The lower
confidence limit (LCL) is the 2.5% quantile, and the upper confidence limit (UCL) is the
97.5% quantile.  

There are lots of ways of computing this, depending on how much modeling you want to
do. My favorite, which I haven't finished working on yet, involves
[the ratio of Beta-distributed variables as captured by a Gauss hypergeometric function ${}\_2F\_1()$]({{ site.baseurl }}/beta-ratios/).  

But until that's working, I'll use some other methods in the
[R](https://www.r-project.org/) package
[gsDesign](https://cran.r-project.org/web/packages/gsDesign/index.html).
The function
[`ciBinomial()`](https://www.rdocumentation.org/packages/gsDesign/versions/3.2.1/topics/ciBinomial)
is all about confidence intervals involving binomially-distributed variables.  You can see
how the probabilities in the efficacy equation above can be viewed as scaled binomial
variables (using the arm size as the scale).  By telling `ciBinomial()` we want a risk
ratio, we'll get confidence limits on the efficacy.  

We've packaged that up in a nice little script <sup id="fn1a">[[1]](#fn1)</sup>, which
basically does:  

```R
rev(1 - ciBinomial(Ktrt, Kcnt, Ntrt, Ncnt, scale = "RR"))
```

to get the confidence limits.  


## New COVID-19 therapeutics  

Vaccines are great.  Really, _really_ great.  Preventing disease is always better than
treating it.  

But&hellip; disease _happens._  There are (rare) breakthrough COVID-19 infections in the
vacccinatd, and (regrettably not rare) people who won't get vaccinated.  We'd like to be
able to take good care of them, too.  

<img src="{{ site.baseurl }}/images/2021-10-04-covid-misc-stat.jpg" width="400" height="226" alt="Herper at STAT: Molnupiravir reduces COVID-19 hospitalizations" title = "Herper at STAT: Molnupiravir reduces COVID-19 hospitalizations" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-11-12-covid-treatments-stat-paxlovid.jpg" width="400" height="195" alt="Herper at STAT: Paxlovid reduces COVID-19 hospitalizations" title="Herper at STAT: Paxlovid reduces COVID-19 hospitalizations" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Today we'll look at treatment efficacy for 2 new COVID-19 therapeutics:  
1. At the beginning of October, Merck's study on molnupiravir debuted with much
   fanfare. <sup id="fn2a">[[2]](#fn2)</sup>  It's a pseudo nucleotide, which the virus
   will incorprate in its RNA when it's replicating. That causes hypermutation and
   catastrophic failure.  Clever, really.  We
   [previously analyzed their result](https://www.someweekendreading.blog/covid-misc/#molnupiravir-works)
   on this crummy little blog that nobody reads, and it was pretty good!  
2. Just last week, Pfizer announced that the trial on Paxlovid was stopped, because the
   trial results were so good! <sup id="fn3a">[[3]](#fn3)</sup>  It's a protease
   inhibitor, part of a large family of drugs that interrupt the functioning of some viral
   proteins in proteolysis.  This is the family of drugs that have revolutionized the
   treatment of HIV and hepatitis-C.  They're not super expensive to make, they have a
   pretty well understood safety profile, and they can be taken chronically.  So that's
   pretty good news.  

Let's look at their efficacy numbers.

For molnupiravir, the total number of subjects and the number of hospitalizations in each
arm of the trial were, [as we determined approximately in a previous post](https://www.someweekendreading.blog/covid-misc/#molnupiravir-works):  

```R
> mnpData <- matrix(c(53, 28, round(53/0.141), round(28/0.073)), nrow = 2, ncol = 2, byrow = FALSE,
                    dimnames = list(c("Placebo", "Treatment"), c("Ncases", "Ntotal"))); mnpData
          Ncases Ntotal
Placebo       53    376
Treatment     28    384
```

So we calculate the efficacy vs hospitalization at 48.3% (CL: 20.5% &ndash; 66.5%):  

```R
> signif(efficacyAndCL(384, 28, 376, 53), digits = 3)
  LCL   Eff   UCL
0.205 0.483 0.665
```

For paxlovid, the numbers are a trial of very similar size, as reported in the 
_WaPo_ <sup id="fn4a">[[4]](#fn4)</sup>:  

```R
> paxData <- matrix(c(27, 3, 385, 389), nrow = 2, ncol = 2, byrow = FALSE,
                    dimnames = list(c("Placebo", "Treatment"), c("Ncases", "Ntotal"))); paxData
          Ncases Ntotal
Placebo       27    385
Treatment      3    389

```

So we calculate the efficacy vs hospitalization at 89.0% (CL: 66.3% &ndash; 96.4%),
which is _even better_ than molnupiravir:  

```R
> signif(efficacyAndCL(389, 3, 385, 27), digits = 3)
  LCL   Eff   UCL
0.663 0.890 0.964
```

   
## Why that matters  

- __Cost:__ Merck seems to have priced a course of molnupiravir at \$700, which seems
  pretty reasonable.  Pfizer hasn't priced paxlovid yet, but other protease inhibitors
  aren't super expensive.  I dug a little bit to get pricing on other COVID-19 treatments,
  and by comparison they're much more expensive:  
  - Regeneron's mab cocktail (casirivimab and imdevimab): \$1250 per infusion, plus cost
    of skilled nursing care to do it and a facility in which to do it.  
  - GSK & Vir’s mab cocktail (sotrovimab): about \$2100 per infusion, plus skilled nursing
    and facility charges.  
  - Remdesivir: about \$3120 for a course of treatment.  
- __Administration:__ These are oral: just a pill you take.  The antibody infusions you
  have to go to a clinic and get an IV line put in, and sit there for maybe an hour.  It's
  just _easier_ on patients, and they take the pill at home where they won't load up the
  medical system.  
- __Synergy:__ I used to do a lot of synergy research in oncology, where therapies get
  combined to deliver a stronger effect than either drug alone.  Since molnupiravir and
  paxlovid work by completely different mechanisms of action, it would be interesting to
  see if there were synergy in using both simultaneously.  Or better yet, a 3-way
  combination of molnupiravir, paxlovid, and fluvoxamine?  Or in combination with the
  antibody therapies, because why not _check?_  
- __Safety:__ Paxlovid, at least, is in a class of drugs that have been well-used for 25
  or so years, so we know a lot about their safety.  People with HIV take them
  chronically, daily for years and years.  
- __Prophylaxis:__ If you test positive for COVID-19, what can we do for your contacts
  other than test them?  Both molnupiravir and paxlovid have to be given early.  Can we
  give them as a preventive, _before_ people start showing symptoms?  It would be great if
  we could offer them as a therapy to people found in contact tracing, and might even be
  able to stop outbreaks in their tracks.  

That's an awful lot of powerfully [positive protective mana](https://en.wikipedia.org/wiki/Mana)
barreling down the road at us.  


## The Weekend Conclusion  

We can prevent COVID-19 with vaccines (though we do need to learn how to persuade people
to get vaccinated).  Now we can _treat_ COVID-19 if caught early enough, with at least 2
new drugs, in addition to the antibody infusions, dexamethasone, and so on.  

Things are slowly getting better.  


## Addendum 2021-Nov-14: Death rates in the paxlovid trial  

After some discussion
[in the comments over at TheZvi's blog](https://thezvi.wordpress.com/2021/11/11/covid-11-11-winter-and-effective-treatments-are-coming/#comment-15407),
we should also examine the death rates in the paxlovid trial.  

The confusing thing here is that there were 0 deaths in the paxlovid arm vs 7 deaths in
the control arm.  That seems to lead to an efficacy vs death of 100%&hellip; which,
understandably, people have trouble swallowing.  

```R
> paxDataD <- matrix(c(7, 0, 385, 389), nrow = 2, ncol = 2, byrow = FALSE,
                     dimnames = list(c("Placebo", "Treatment"), c("Ndead", "Ntotal"))); paxDataD
          Ndead Ntotal
Placebo       7    385
Treatment     0    389

> signif(efficacyAndCL(389, 0, 385, 7), digits = 3)
  LCL  Eff  UCL
 0.46 1.00 1.00
```

Here's how I would have reported it: yes, the efficacy vs death was measured at 100% (CL:
46% &ndash; 100%).  

But with a 95% confidence limit of 46% &ndash; 100%?!  From a Bayesian point of view, that
very broad confidence interval means the posterior distribution of the efficacy is very,
very wide.  It is your warning that the trial isn't really powered to report on the
blessedly rare event of death.  A very cautious person might conclude that death rates
were reduced by _at least_ 46%, probably more, maybe as much as 100%&hellip; but we can't
say with confidence _exactly how much_ more.  

Still, a _worst case_ 46% reduction in death is a good result!  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script for efficacy confidence limits by scaled binomial ratio"]({{ site.baseurl }}/assets/2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2021-Nov-12. [↩](#fn1a)  

<a id="fn2">2</a>: M Herper, ["Merck’s antiviral pill reduces hospitalization of Covid patients, a possible game-changer for treatment"](https://www.statnews.com/2021/10/01/mercks-antiviral-pill-reduces-hospitalization-of-covid-patients-a-possible-game-changer-for-treatment/), _STAT News_, 2021-Oct-01. [↩](#fn2a)  

<a id="fn3">3</a>: M Herper, ["Experimental Pfizer pill prevents Covid hospitalizations and deaths"](https://www.statnews.com/2021/11/05/experimental-pfizer-pill-prevents-covid-hospitalizations-and-deaths/), _STAT News_, 2021-Nov-05. [↩](#fn3a)  

<a id="fn4">4</a>: CY Johnson, ["Antiviral pills from Pfizer, Merck, show promise against worst covid-19 outcomes"](https://www.washingtonpost.com/health/2021/11/05/pfizer-covid-pill/), _Washington Post_, 2021-Nov-05. [↩](#fn4a)  
