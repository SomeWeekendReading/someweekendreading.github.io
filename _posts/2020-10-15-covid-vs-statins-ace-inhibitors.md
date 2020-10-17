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

Initially I was a bit suspicious: there's some evidence that [ACE](https://en.wikipedia.org/wiki/Angiotensin-converting_enzyme) inhibitors actually
_increase_ the expression of [ACE2](https://en.wikipedia.org/wiki/Angiotensin-converting_enzyme_2), which SARS-COV-2 uses to enter cells, and that would
_increase_ risk.  Also, it's by a bunch of cardiologists, apparently trying to tell us
their discipline rules the world.  Finally, it was a press release (reference 1), and your
Weekend Editor has a rather dyspeptic view of press releases.  

Happily, I was wrong on all counts.  This looks like preliminary but legit evidence
(reference 2) of at least _some_ lowering of the risk of mild COVID becoming severe.
There was an accompanying paper on the mechanism, involving 25-hydroxy-cholesterol and
several effect-rescue assays that also look pretty good.  They've got clinical evidence of
effect, and lab bench evidence of a mechanism of action.  Now they need confirmation from
an independent lab, maybe a multi-center test, and they'll be ready to figure out how to
_use_ the information in combat situations.  

## Clinical effect of statins on COVID-19

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-daniels-1.png" width="400" height="154" alt="Daniels: Statins and COVID-19" title="Daniels: Statins and COVID-19" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First, let's take a look at Daniels, _et al._ (reference 2) and their report on statins
(to lower cholesterol), ACE inhibitors (to lower blood pressure), and ARB blockers (also
to lower blood pressure by a related mechanism):  
- They wondered if [statins](https://en.wikipedia.org/wiki/Statin), [ACE inhibitors](https://en.wikipedia.org/wiki/ACE_inhibitor), and [ARB blockers](https://en.wikipedia.org/wiki/Angiotensin_II_receptor_blocker) interacted with COVID-19,
  given they are all but ubiquitous in middle-aged and older people (in developed
  countries who have access to health insurance, both of which are sometimes doubtful in
  the US). Also, see reference 4 for other speculation about cholesterol, bp, and COVID.  
- They did a single-center study, at UCSD Health.  This is a bit of a weak point, which
  should be addressed in a multi-center study to rule out any oddities associated with
  UCSD.  But it's a start.  
- They looked at 170 patients hospitalized for COVID-19, and 5281 COVID-negative
  controls.  They measured time from hospital admission to onset of _severe_ disease
  (death or ICU), time to discharge with no longer severe disease, or time to death.  
- They did multivariate [logistic regressions](https://en.wikipedia.org/wiki/Logistic_regression) (in [R](https://www.r-project.org/), bless
  their little hearts) to account for the effect of statin/ACE/ARB drugs, and to account
  for confounding factors like age, sex, obesity, etc. <sup id="fn3a">[[3]](#fn3)</sup>  
- Statins were strongly associated with reduced risk of progressing to severe disease and
  with faster recovery times, by a couple of interesting statistical tests (_q.v._).  
- But... statin use in the COVID-negative controls was more weakly associated with
  progression: it won't _stop_ you getting COVID-19, but it helps (a little) once you
  already have it.  
- They say there is "potential evidence" associating ACE/ARB drugs to faster recovery, but
  their statistical significance tests say otherwise.  No idea why they said "potential
  evidence", when it's clear their statistician told them "No."  More medically important,
  though, is the implicit result: ACE/ARB drugs don't help against COVID, but they also
  _don't hurt_, so if you're taking them already for blood pressure you should continue to
  take them as your doctor prescribes.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-daniels-2.png" width="353" height="294" alt="Daniels: Odds ratio of predictors" title="Daniels: Odds ratio of predictors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Here's a summary of their results.  They're measuring the odds ratio of progression to
severe COVID-19 (and recall that, as they're using logistic regression, we're always
dealing in [log odds ratios](https://en.wikipedia.org/wiki/Logistic_regression#Logistic_function,_odds,_odds_ratio,_and_logit)).  The predictors are in the column on the left.  The thing in the
middle is sometimes called a ["forest plot"](https://en.wikipedia.org/wiki/Forest_plot): the favorable situation (odds ratio < 1.0) is on
the left, and unfavorable on the right.  You want to see the central blob _and_ it's 95%
confidence interval be on one side or the other of 1.0 in order to declare that variable
is a good predictor.  Note that: use of statins is a good predictor (and in the good
direction); diabetes is a good predictor (in the bad direction); nothing else makes the
grade (including ACE/ARB drugs).  

So that was time to progression to severe disease.  They also did a similar analysis for
time to death.  However, since nothing was statistically significant, it was exiled to the
supplement of the paper.  The supplements are always either (a) where the good stuff is,
in detail, or (b) where the nonsignificant data goes to die.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-daniels-3.png" width="400" height="150" alt="Daniels: Kaplan-Meier" title="Daniels: Kaplan-Meier" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
They did something called a [Cox proportional hazards model](https://en.wikipedia.org/wiki/Proportional_hazards_model) to (essentially) measure
probability per unit time to the onset of severe disease, or to recovery based on the
statin/non-statin cohorts.  From those, you make [Kaplan-Meier plots](https://en.wikipedia.org/wiki/Kaplan%E2%80%93Meier_estimator) (conventionally flipped
vertically compared to here), showing the cumulative progressions/recoveries vs time.  By comparing the
black line with the dotted line, you can see that the statin patients were slower (or
never) to progress to severe disease, and faster to recover.  More quantitatively, they
computed the usual hazard ratio and associated [logrank $p$-value](https://en.wikipedia.org/wiki/Logrank_test), to assess whether the curves are
statistically _significantly_ different, not just visually.  From table 2 in the paper:  
- For time to recovery, statin use was significant ($p \leq 0.004$), but ACE/ARB use was
  not.  
- For time to progression to severe disease, nobody made the cut.  (Though the authors, as
  always being hopeful, thought they could see a weak trend.  Crusty old statisticians
  like your Weekend Editor are seldom sympathetic to this.)  
- Age cohort (10 year groups) was also statistically wildly significant, in the bad
  direction ($p \leq 0.001$).  (There are, alas, as yet few treatments for age.)  

There's more, but that's kind of the bottom line:  
- If you're taking a cholesterol-lowering drug, particularly a statin, congratulations on
  your partial defense against severe COVID-19.  Keep doing that, because your doctor
  has your best interests at heart here. <sup id="fn4a">[[4](#fn4)]</sup>  
- If you're taking an ACE/ARB inhibitor for blood pressure, it doesn't help against
  COVID-19, but _it also doesn't hurt_, so congratulations on treating your high blood
  pressure.  Keep doing that, again following your doctor's advice. 

## Molecular mechanism of action of statins &amp; cholesterol on cell entry by SARS-COV-2

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-1.png" width="400" height="229" alt="Wang: 25HC and COVID" title="Wang: 25HC and COVID" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Daniels _et al._ then speculate about all kinds of mechanisms, but they're all over the map and show
no data.  Fortunately, the next paper (Wang, _et al._, reference 3) does exactly that.  

They explore a model which is at once pretty simple (A causes B causes C causes D...) and laughably complex, as things always seem to be in biology where the [Law of Unintended Consequences](https://en.wikipedia.org/wiki/Unintended_consequences#Everyday_usage) runs riot.  They are very careful to do a number of "rescue assays" to see if interrupting the chain at various points has the effect one would predict.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-2.png" width="400" height="278" alt="Wang: mechanism model" title="Wang: mechanism model" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The basics: viruses stimulate the [innate immune system](https://en.wikipedia.org/wiki/Innate_immune_system), 
which causes the release of [interferons of various kinds](https://en.wikipedia.org/wiki/Interferon),
which turns on a gene called [CH25H](https://www.ncbi.nlm.nih.gov/gene/9023), which makes
something called [25-hydroxycholesterol (25HC)](https://pubchem.ncbi.nlm.nih.gov/compound/25-Hydroxycholesterol),
which activates another gene called [ACAT](https://www.ncbi.nlm.nih.gov/gene/38) on the ER
membrane (and elsewhere), which then internalizes
cholesterol usually found in the cell membrane.  This low-cholesterol membrane then
prevents the virus from being endocytosed, or absorbed into the cell.  It stays outside,
where it can't do much damage and where it can be recognized by the adaptive immune system
(eventually).  So... A causes B causes C causes... for 6 steps!  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-3.png" width="283" height="138" alt="Wang: CH25H lowers virus entry" title="Wang: CH25H lowers virus entry" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
They present evidence that cells infected with SARS-COV-2 do indeed raise their expression
of CH25H, and that this is also observed in patient samples.  They then showed that when
they forced overexpression of CH25H in cell lines, SARS-COV-2 entry to cells was lowered,
and that was statistically significant by $t$-test.  (Showing Figure 1 C & D here: green
spots show cells infected by SARS-COV-2, while the bar chart shows the data after image
quantitation.  It is significant: $p \leq 0.0001$ by $t$-test.)  

Then, the objections start:  

__But is this just a cell line thing, of no relevance to actual patients?__  They also did
something similar in patient samples (Figure EV-1), to similar effect.  So
it's not just a cell line thing.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-4.png" width="354" height="115" alt="Wang: CH25H dose dependence" title="Wang: CH25H dose dependence" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
__But is this dependent on the dose of 25HC, as you would expect?__  Yes.  In Figure 2 A&B
shown here, we see that both quantitatively and visually with a GFP fluorescence image.
More 25HC leads to less SARS-COV-2 entry into cells.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-5.png" width="321" height="153" alt="Wang: cholesterol rescue" title="Wang: cholesterol rescue" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
__But can you "rescue" the effect (get the virus to work again) by adding lots of
cholesterol?__  Maybe you can overload things, so CH25H/25HC/ACAT and company can't deplete
the membrane cholesterol any more.  Figure 3 shows this, by doing all combinations of
adding 25HC or not and adding cholesterol or not.  All the expected differences are
significant, by $t$-test with $p$ in the range of 0.01 to 0.0001.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-6.png" width="473" height="166" alt="Wang: ACAT rescue" title="Wang: ACAT rescue" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
__But is ACAT really the gene involved in this mechanism?__  If you "knock down" the ACAT
gene with shRNA or an experimental ACAT inhibitor compound, you'd expect the virus to be
able to get in again.  Figure 4 shows this.  Yes: whether by shRNA to prevent ACAT from
being made, or with a molecule to inhibit ACAT activity, once ACAT is shut down the effect
goes away.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-7.png" width="504" height="213" alt="Wang: ACAT rescue" title="Wang: ACAT rescue" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
__But does SARS-COV-2 itself actually activate ACAT and 25HC?__  Figure EV4 shows that the
answer is yes.  So basically, these data taken together shows that SARS-COV-2 activates
CH25H, then 25HC is made, then ACAT is activated, then cholesterol is pulled in from the
cell membrane, then virus entry is blocked.  

<img src="{{ site.baseurl }}/images/2020-10-15-covid-vs-statins-ace-inhibitors-wang-8.png" width="400" height="313" alt="Wang: lung organoids" title="Wang: lung organoids" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
__But does that work in something like a human lung, not just in cell cultures?__  Figure
5 shows that the answer is yes.  They grew lung organoids (basically a cell culture in
something like soft agar where lung cells can build 3d structures that are at least
somewhat similar to actual lung tissue.    The dose response curves show that the
inhibition of virus by 25HC is still dose-dependent in cell lines, and that the potency
looks to be around 0.5$\mu$M.  Also, the bar charts below show a dramatic effect on virus
blocking in lung organoids.  So it's both dose-dependent, and works in something like an
organ.  

There's a lot more there, but it's pretty convincing at this point.  The only thing you
might wonder is why bother with statins as a back-door path to all this, when you could
administer 25HC itself and get the effect more directly? Reference 5 points out exactly
this point.  But... practically speaking, statins are an old and very safe drug taken by
millions with excellent effect on cardiac health, while 25HC use as a drug is a totally
new thing, requiring new trials.  Still, it's worth investigating, I suppose.  

## Summary

Ok, so that was a long trip.  I think the basics are:  
- We have good clinical evidence in actual patients that statins are a good thing.  This
  is definitely true for progression to severe disease and for recovery time, though not
  so much for death rates.  
- We have very good, detailed evidence of the pathway by which this happens in cells and
  in human-like organoids: virus &rarr; innate immune response &rarr; interferons &rarr;
  CH25H &rarr; 25-hydroxy-cholesterol &rarr; ACAT activation &rarr; membrane depletion of
  cholesterol &rarr; reduced virus entry.  
- We have long clinical history that taking statins also reduces cholesterol, at least
  partly in cell membranes.  (Usually it's measured in blood sera, not cell membranes.)
- There may be better ways to do this (direct administration of 25-hydroxycholesterol,
  perhaps directly to the lungs with a nebulizer?), but statins seem to _help_.  
- Statins, unlike remdesivir, are long-approved, well-understood, and cheap.  

So take your statins, if you doctor has prescribed them!  

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
doctor (PhD). The closest we'll come to medical advice is: (a) get a doctor, and (b) do
what your doctor says.  Right-wing political mischief with health
insurance in the US is a problem everybody here has, so do your best with that. [↩](#fn4a)  

## References  

1. H Buschman and J Vazquez, ["Statins reduce COVID-19 severity, likely by removing cholesterol that virus uses to infect."](https://ucsdnews.ucsd.edu/pressrelease/statins-reduce-covid-19-severity-likely-by-removing-cholesterol-that-virus-uses-to-infect), UC San Diego News Center, 2020-Sep-23.  Also reported in [_Science Daily_](https://www.sciencedaily.com/releases/2020/09/200923164603.htm).  

2. L Daniels, _et al._, ["Relation of Statin Use Prior to Admission to Severity and Recovery Among COVID-19 Inpatients"](https://www.ajconline.org/article/S0002-9149(20)30947-4/fulltext), _AmJCardiol_, 2020-Sep-15 DOI: [10.1016/j.amjcard.2020.09.012](http://dx.doi.org/10.1016/j.amjcard.2020.09.012).  

3. S Wang, _et al._, ["Cholesterol 25‐Hydroxylase inhibits SARS‐CoV‐2 and coronaviruses by depleting membrane cholesterol"](https://www.embopress.org/doi/full/10.15252/embj.2020106057), _EMBO Jnl_, e106057, 2020-Oct-05. DOI: [10.15252/embj.2020106057](https://doi.org/10.15252/embj.2020106057).  

4. L Fang, _et al._, ["Are patients with hypertension and diabetes mellitus at increased risk for COVID-19 infection?"](https://www.thelancet.com/journals/lanres/article/PIIS2213-2600(20)30116-8/fulltext), _Lancet Resp Med_, 8:4, 2020-Apr-01.  DOI: [10.1016/S2213-2600(20)30116-8](https://doi.org/10.1016/S2213-2600(20)30116-8).

5. S Zu, _et al._, ["25-Hydroxycholesterol is a potent SARS-CoV-2 inhibitor"](https://www.nature.com/articles/s41422-020-00398-1), _Nature Cell Res_, 2020-Aug-18.  
