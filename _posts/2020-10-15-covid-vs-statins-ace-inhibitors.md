---
layout: post
title: Statins &amp; ACE inhibitors as COVID-19 therapeutics?
tags: SomebodyAskedMe COVID R
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) (honest!) about a news item
linking improved treatment outcomes for COVID-19 with patients using statin and ACE
inhibitor drugs. <sup id="fn1a">[[1](#fn1)]</sup> <sup id="fn2a">[[2](#fn2)]</sup> 
Very preliminary stuff, and the effect size is not giant, but it is peer-reviewed and
looks quite legit.  Not gonna change the world, but even small bits of good news are welcome.  

Initially I was a bit suspicious: there's some evidence that ACE inhibitors actually
_increase_ the expression of ACE2, which SARS-COV-2 uses to enter cells, and that would
_increase_ risk.  Also, it's by a bunch of cardilogists, apparently trying to tell us
their discipline rules the world.  Finally, it was a press release (reference 1), and your
Weekend Editor has a rather dyspeptic view of press releases.  

I was wrong on all counts.  This looks like preliminary but legit evidence (reference 2)
of at least _some_ lowering of the risk of mild COVID becoming severe.  There was an
accompanying paper on the mechanism, involving 25-hydroxy-cholesterol and several effect
rescue assays that also looks pretty good.  They've got clinical evidence of effect, and
lab bench evidence of a mechanism of action.  Now they need confirmation from an
independent lab, and they'll be ready to figure out how to _use_ the information in combat
situations.  

<img src="{{site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-daniels-1.png" width="400" height="154" alt="Daniels: Statins and COVID-19" title="Daniels: Statins and COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First, let's take a look at Daniels, _et al._ (reference 2) and their report on statins
(to lower cholesterol), ACE inhibitors (to lower blood pressure), and ARB inhibitors (also
to lower blood pressure by a related mechanism).  
- They wondered if statins, ACE inhibitors, and ARB inhibitors interacted with COVID-19,
  given they are all but ubiquitous in middle-aged and older people (in developed
  countries who have access to health insurance, both of which are sometimes doubtful in
  the US). Also, see reference 4 for other speculation about cholesterol, bp, and COVID.  
- They did a single-center study, at UCSD Health.  This is a bit of a weak point, which
  should be addressed in a multi-center study to rule out any oddities associated with
  UCSD.  But it's a start.  
- They looked at 170 patients hospitalized for COVID-19, and 5281 COVID-negative
  controls.  They measured time from hospital admission to onset of _severe_ disease
  (death or ICU), time to discharge with no longer severe disease, or time to death.  
- They did multivariate logistic regressions (in [R](https://www.r-project.org/), bless
  their little hearts) to account for the effect of statin/ACE/ARB drugs, and to account
  for confounding factors like age, sex, obesity, etc. <sup id="fn3a">[[3]](#fn3)</sup>  
- Statins were strongly associated with reduced risk of progressing to severe disease and
  with faster recovery times, by a couple of interesting statistical tests (_q.v._).  
- But... statin use in the COVID-negative controls was more weakly associated with
  progression: it won't stop you getting COVID-19, but it helps (a little) once you
  already have it.  
- They say there is "potential evidence" associating ACE/ARB drugs to faster recovery, but
  their statistical significance tests say no.  No idea why they said "potential
  evidence", when it's clear their statistician told them "no".  More medically important,
  though, is the implicit result: ACE/ARB drugs don't help against COVID, but they also
  _don't hurt_, so if you're taking them already for blood pressure you should continue.  

<img src="{{site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-daniels-2.png" width="353" height="294" alt="Daniels: Odds ratio of predictors" title="Daniels: Odds ratio of predictors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Here's a summary of their results.  They're measuring the odds ratio of progression to
severe COVID-19 (and recall that, as they're using logistic regression, we're always
dealing in odds ratios).  The predictors are in the column on the left.  The thing in the
middle is sometimes called a "forest plot": the favorable situation (odds ratio < 1.0) is on
the left, and unfavorable on the right.  You want to see the central blob _and_ it's 95%
confidence interval be on one side or the other of 1.0 in order to declare that variable
is a good predictor.  Note that: use of statins is a good predictor (and in the good
direction); diabetes is a good predictor (in the bad direction); nothing else makes the
grade (including ACE/ARB drugs).  

So that was time to progression to severe disease.  They also did a similar analysis for
time to death.  However, since nothing was statistically significant, it was exiled to the
supplement of the paper.  

<img src="{{site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-daniels-3.png" width="400" height="150" alt="Daniels: Kaplan-Meier" title="Daniels: Kaplan-Meier" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
They did something called a Cox proportional hazards model to (essentially) measure
probability per unit time to the onset of severe disease, or to recovery based on the
statin/non-statin cohorts.  From those, you make Kaplan-Meier plot (conventionally flipped
vertically), showing the cumulative progressions/recoveries vs time.  By comparing the
black line with the dotted line, you can see that the statin patients were slower (or
never) to progress to severe disease, and faster to recover.  More quantitatively, they
computed the usual hazard ratio and logrank $p$-value, to assess whether the curves are
statistically significantly different.  From table 2 in the paper:  
- For time to recovery, statin use was significant ($p \leq 0.004$), but ACE/ARB use was
  not.  
- For time to progression to severe disease, nobody made the cut.  (Though the authors, as
  always being hopeful, thought they could see a weak trend.  Crusty old statisticians
  like your Weekend Editor are seldom sympathetic to this.)  
- Age cohort (10 year groups) was also statistically wildly significant, in the bad
  direction ($p \leq 0.001$).  There are, alas, as yet few treatments for age.  

There's more, but that's kind of the bottom line:  
- If you're taking a cholesterol-lowering drug, particularly a statin, congratulations on
  your partial defense against severe COVID-19.  Keep doing that, because your doctor
  has your best interests at heart here. <sup id="fn4a">[[4](#fn4)]</sup>  
- If you're taking an ACE/ARB inhibitor for blood pressure, it doesn't help against
  COVID-19, but _it also doesn't hurt_, so congratulations on treating your high blood
  pressure.  Keep doing that, again following your doctor's advice. 

<img src="{{site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-1.png" width="400" height="229" alt="Wang: 25HC and COVID" title="Wang: 25HC and COVID" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
They then speculate about all kinds of mechanisms, but they're all over the map and show
no data.  Fortunately, the next paper (Wang, _et al._, reference 3) does exactly that.  

...TBD...  

---

## Notes  

<a id="fn1">1</a>: In the interests of disclosure, one should note that both your Weekend
Editor and Weekend Editrix take a statin and an ACE inhibitor.  So, if anything, we
_want_ something like this to be true, as it would grant us some extra protection.  And my
prior says that ACE2 (binding site of SARS-COV-2) and ACE (the blood pressure med target)
are homologous proteins, so maybe inhibiting ACE has some crosstalk to ACE2.  Be
appropriately skeptical of my prejudices.  (Comme d'habitude!)[↩](#fn1a)  

<a id="fn2">2</a>: Also, your humble Weekend Editor once worked for a company which did
some of the first gene sequencing around ACE2, and thus had an early ACE2 inhibitor 
around 2001.  It failed clinical trials in 2 separate disease areas, and was later 
out-licensed.  Nothing much came of it, though now its interest in blocking the COVID-19 
entry point has returned. Experiencing 2 clinical trial failures would make me even _more_ 
skeptical in this area. [↩](#fn2a)  

<a id="fn3">3</a>: For example, age is a risk factor for severe COVID.  But it's also a
risk factor for needing blood pressure and high cholesterol meds.  So if you didn't
account for age as a confounding covariate, you might conclude that older people take
cholesterol meds, and older people get severe COVID-19, so maybe the cholesterol med
caused it &mdash; when the _opposite_ is true, it _protects_.  Intuitively, you first
regress the log odds ratio of severe disease on all the confounders (age, sex, obesity,
...) and then do prediction using the cholesterol/bp meds on the residuals.  (In fact it
happens slightly differently, but that's often the way to explain it for the first time
and have people more or less get it.)[↩](#fn3a)  

<a id="fn4">4</a>: And most especially: _please don't ever take anything you read here as
medical advice!_  Your humble Weekend Editor is not an MD, but a totally different sort of
doctor (PhD). Please listen to your own doctor.  Right-wing political mischief with health
insurance in the US is a problem everybody here has, so do your best. [↩](#fn4a)  

## References  

1. H Buschman and J Vazquez, ["Statins reduce COVID-19 severity, likely by removing cholesterol that virus uses to infect."](https://ucsdnews.ucsd.edu/pressrelease/statins-reduce-covid-19-severity-likely-by-removing-cholesterol-that-virus-uses-to-infect), UC San Diego News Center, 2020-Sep-23.  Also reported in [_Science Daily_](https://www.sciencedaily.com/releases/2020/09/200923164603.htm).  

2. L Daniels, _et al._, ["Relation of Statin Use Prior to Admission to Severity and Recovery Among COVID-19 Inpatients"](https://www.ajconline.org/article/S0002-9149(20)30947-4/fulltext), _AmJCardiol_, 2020-Sep-15 DOI: [10.1016/j.amjcard.2020.09.012](http://dx.doi.org/10.1016/j.amjcard.2020.09.012).  

3. S Wang, _et al._, ["Cholesterol 25‐Hydroxylase inhibits SARS‐CoV‐2 and coronaviruses by
   depleting membrane cholesterol"](https://www.embopress.org/doi/full/10.15252/embj.2020106057), _EMBO Jnl_, e106057, 2020-Oct-05. DOI: [10.15252/embj.2020106057](https://doi.org/10.15252/embj.2020106057).  

4. L Fang, _et al._, ["Are patients with hypertension and diabetes mellitus at increased
   risk for COVID-19 infection?"](https://www.thelancet.com/journals/lanres/article/PIIS2213-2600(20)30116-8/fulltext), _Lancet Resp Med_, 8:4, 2020-Apr-01.  DOI: [10.1016/S2213-2600(20)30116-8](https://doi.org/10.1016/S2213-2600(20)30116-8).
