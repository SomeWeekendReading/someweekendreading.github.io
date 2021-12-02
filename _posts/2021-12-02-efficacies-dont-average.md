---
layout: post
title: Mea Culpa&colon; Efficacies Don't Average!
tags: COVID Math MathInTheNews MeaCulpa PharmaAndBiotech Statistics
comments: true
---

A couple days ago, commenting at
[TheZvi](https://thezvi.wordpress.com/2021/12/01/fda-votes-on-molunpiravir/#comment-15907),
I blithely averaged efficacies from the early and late cohorts of the molnupiravir trial.  Fellow
commenter Thomas pointed out that this is not correct.  This post is a _mea culpa_ and a
lesson to myself on How to Do It Right.  

## What's the sitch?  

During [the FDA hearing on molnupiravir]({{ site.baseurl }}/fda-molnupiravir/),
it became apparent that:
- The interim analysis of the early cohort of patients showed fantastic efficacy vs 
  hospitalization: 48.3% (CL: 20.5% &ndash; 66.5%).  
- The final analysis of the full trial showed "meh" efficacy: 30.4% (CL: 1.0% &ndash;
  51.1%).  
  
I was opining that in order to come down from ~50% to ~30%, the second half of the trial
must have been pretty miserable!  Just winging it, I thought:  
- Suppose the early and late cohort are about the same size.  
- Then the efficacy of the whole trial should be about the average of the early and late
  cohort.  
- So the efficacy of the late cohort must have been about 10%: (50% + 10%) / 2 = 30%.  

The point I was trying to make was that the second cohort of the trial had to be really
miserable in order to drag down the overall result like that.

[Fellow commenter Thomas pointed out](https://thezvi.wordpress.com/2021/12/01/fda-votes-on-molunpiravir/#comment-15921)
that this averaging business is oh-so-wrong: efficacies do not average like that!  So,
Thomas: warm thanks to you, for pointing that out. I _do_ know how to do this calculation,
but I needed the reminder not to make cavalier guesses.  I owe you a favor for this.  

So the point of this post is (a) to own my mistake and learn from it, and (b) to get
archived here for myself (and anybody else who cares) How to Do It Right.

## Let's do it right  

<a href="{{ site.baseurl }}/images/2021-11-30-fda-molnupiravir-merck-interim-cohort-efficacy.jpg"><img src="{{ site.baseurl }}/images/2021-11-30-fda-molnupiravir-merck-interim-cohort-efficacy-thumb.jpg" width="400" height="215" alt="Merck: Molnupiravir efficacy across interim cohort" title="Merck: Molnupiravir efficacy across interim cohort" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2021-11-30-fda-molnupiravir-merck-full-cohort-efficacy.jpg"><img src="{{ site.baseurl }}/images/2021-11-30-fda-molnupiravir-merck-full-cohort-efficacy-thumb.jpg" width="400" height="213" alt="Merck: Molnupiravir efficacy across full cohort" title="Merck: Molnupiravir efficacy across full cohort" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
When we
[blogged the FDA molnupiravir hearings]({{ site.baseurl }}/fda-molnupiravir/),
we picked up slides CC-20 and CC-23 from the Merck deck <sup id="fn1a">[[1]](#fn1)</sup>,
shown here.  They contain what we need: patient and hospitalization counts, for the
control and treatment arms, for the interim and full analysis.  Subtracting the interim
counts from the full counts will give us the counts for the "completion" set, i.e., the
rest of the patients. <sup id="fn2a">[[2]](#fn2)</sup>  So the 3rd row in this table is
obtained by subtracting the second row from the first row:  


|    __Cohort__  | | $N_{\mbox{trt}}$ | | $K_{\mbox{trthosp}}$ | | $N_{\mbox{ctl}}$ | | $K_{\mbox{ctlhosp}}$ |
|:-----------------|-|-------------------:|-|----------------------:|-|-------------------:|-|----------------------:|
| _Full_           | | 709  | |    48    | | 699  | | 68 |
| _Interim_        | | 385  | |    28    | | 377  | | 53 |
| _Completion_     | | 324  | |    20    | | 322  | | 15 |

For any arm, we can get a point estimate of the efficacy by:  

$$
\begin{align*}
  \mbox{Efficacy} &= 1 - \frac{\Pr(\mbox{infect} | \mbox{treated})}{\Pr(\mbox{infect} | \mbox{control})} \\
                  &= 1 - \frac{K_{\mbox{trthosp}} / N_{\mbox{trt}}}{K_{\mbox{ctlhosp}} / N_{\mbox{ctl}}}
\end{align*}
$$

We can do a little more by getting 95% confidence limits, which as a retired statistician
I am required by international law to do.  I wrote a little [R script](https://www.r-project.org)
to do this <sup id="fn4a">[[4]](#fn4)</sup>, which really just uses scaled binomial
confidence intervals:  

```R
library("gsDesign")                                    # For ciBinomial()
efficacyAndCL <- function(Ntrt, Ktrt, Ncnt, Kcnt) {    # Treatment efficacy & 95% conf limit
  ## Ntrt = number of subjects in treatment arm
  ## Ktrt = number of sick in treatment arm
  ## Ncnt = number of subjects in control arm
  ## Kcnt = number of sick in control arm
  eff   <- 1 - (Ktrt / Ntrt) / (Kcnt / Ncnt)           # Point estimate, then confidence limits
  effCL <- rev(1 - ciBinomial(Ktrt, Kcnt, Ntrt, Ncnt, scale = "RR"))
  c(LCL = effCL[[1]], Eff = eff, UCL = effCL[[2]])     # Return 3-vector of LCL, estimate, and UCL
}                                                      #
```

(I'd prefer to use 
[my new Bayesian method of the distribution of Beta-distributed variables]({{ site.baseurl/beta-ratios}}),
but I haven't finished the tricky numerics of ${\{3}F\_{2}()}$ for large parameter
values.)  

So let's see what we get:  

- Full:  
```R
> round(efficacyAndCL(709, 48, 699, 68), digits = 3)
  LCL   Eff   UCL 
0.010 0.304 0.511 
```
- Interim:  
```R
> round(efficacyAndCL(385, 28, 377, 53), digits = 3)
  LCL   Eff   UCL 
0.204 0.483 0.665 
```
- Completion:  
```R
> round(efficacyAndCL(324, 20, 322, 15), digits = 3)
   LCL    Eff    UCL 
-1.516 -0.325  0.301 
```

So, in table form and expressed as percentages, we get:  

|    __Cohort__  | | 95% LCL   | | Efficacy | | 95% UCL | 
|:-----------------|-|----------:|-|---------:|-|--------:|
| _Full_         | |    1.0%  | |  30.4%  | | 51.1%  |
| _Interim_      | |   20.4%  | |  48.3%  | | 66.5%  |
| _Completion_    | | __-151.6%__  | | __-32.5%__ | | __30.1%__  |

Yeah&hellip; that second half of the trial looks like it was pretty miserable!  It should
be clear now why the FDA AMDAC members describe the efficacy as "wobbly".  


## The Weekend Conclusion  

1. I was wrong to average efficacies in order to conclude that the completion cohort was
   low performance.  Many thanks to Thomas for correcting me, thereby giving me this
   opportunity to clear up my knowledge here.  
2. The completion cohort _really was_ miserable, more so even than I thought.  

Every mistake is an opportunity to learn better.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: S Curtis, D Hazuda, K Blanchard, N Karsonis, ["Molnupiravir: U.S. Food & Drug Administration Antimicrobial Drugs Advisory Committee November 30, 2021"](https://www.fda.gov/media/154472/download), FDA AMDAC 2021-Nov-30 Materials, retrieved 2021-Nov-30. [↩](#fn1a)  

<a id="fn2">2</a>: Approximately!  To do this completely correctly, we'd have to have the
censoring data, i.e., when patients dropped out of the trial, and use some method related
to Cox regression to handle that.  

However, consulting the Merck submission document <sup id="fn3a">[[3, p. 46]](#fn3), we
see that the treatment arm shrank by 385 - 357 = 28 dropouts, and the control arm shrank
by 377 - 324 = 53 dropouts.  So that's a total dropout rate of:

$$
100\% \times \frac{28 + 53}{385 + 377} = 10.6\%
$$

So while it's wrong to ignore this, it might not be _excessively_ misleading because of
the low-to-moderate dropout rate.  But you would be right to be suspicous of anybody who
did what I'm about to do _if they had access to the censorship data!_</sup>[↩](#fn2a)  

<a id="fn3">3</a>: Merck Staff, ["Center for Drug Evaluation and Research, Antimicrobial Drugs Advisory Committee Meeting Briefing Document: Molnupiravir, Oral Treatment of COVID-19, APPLICATION NUMBER: EUA #000108"](https://www.fda.gov/media/154421/download), FDA AMDAC 2021-Nov-30 Materials, retrieved 2021-Nov-30. There is also [a 7-page addendum](https://www.fda.gov/media/154422/download). [↩](#fn3a)  

<a id="fn4">4</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script for efficacy confidence limits by scaled binomial ratio"]({{ site.baseurl }}/assets/2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}/), 2021-Nov-12. [↩](#fn4a)  
