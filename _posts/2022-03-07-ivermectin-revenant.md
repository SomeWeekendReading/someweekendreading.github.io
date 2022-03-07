---
layout: post
title: Ivermectin Revenant
tags:  COVID JornalClub PharmaAndBiotech SomebodyAskedMe
comments: true
---

[Somebody asked]({{ site.baseurl }}/tags/#SomebodyAskedMe) about a recently published
abstract comparing ivermectin vs remdesivir in treating COVID-19.  (Sigh.)  


## Ivermectin just won't go away  

Despite [repeated debunkings]({{ site.baseurl }}/ivermectin-takedowns/), ivermectin is
a mania repeatedly _rebunked,_ and just won't go away.  I should know better than to play
scientific whack-a-mole.  But just a quick look can't hurt, right?  (Right?)  


## The latest paper  

<img src="{{ site.baseurl }}/images/2022-03-07-ivermectin-revenant-IJID.jpg" width="400" height="431" alt="Efimenko, et al. @ IJID: ivermectin vs remdesivid" title="Efimenko, et al. @ IJID: ivermectin vs remdesivid" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The paper in question <sup id="fn1a">[[1]](#fn1)</sup> is in fact an abstract a conference
on emerging diseases last year.  That means, among other things, that it is very, very
short: just a single page.  So we can read the whole thing in just a few minutes.  

The general idea is they took a look through a large EMR ("electronic medical records")
system, and:

1. Isolated adult (&ge; 18yr) patients with (a) a solidly believable COVID-19 diagnosis,
   and (b) who received either ivermectin or remdesivier, but not both.  Cutoff dates were
   2020-Jan-01 to 2021-Jul-11, so it _does not include Delta or Omicron_.  
2. Controlled for the usual confounding factors: age, gender, race/ethnicity,
   nicotine, diabetes, obesity, lower respiratory disease, heart disease,
   anti-inflammatory drug use of a couple kinds, and being on a ventilator.  
3. Then they looked for death as the primary outcome, demanding statistical significance
   at the usual $p \lt 0.05$ (statistical method unspecified in the abstract).  
   
I mean&hellip; it _looks_ like a reasonable thing to try.  And fighting your way through
the general chaos of US healthcare records _cannot_ have been fun or easy!  So we have to
start from a position of offering kudos to the authors for doing something that was
probably difficult, for the usual bizarre US healthcare reasons.  

Also, we should note that this is _just an abstract_ from a conference; from the id
reported it might even be an abstract of a poster.  That means 2 things:  
- The usual peer review is much lighter, since in short conference talks (and especially in
  posters), the idea is to include new ideas to think about rather than final, decisive
  studies.  
- It's very, very brief and thus we should expect it to be light on details, frustrating
  as that might be.  Any lack of detail here _is not the fault of the authors_, but of the
  process.  
  
I want to make that clear, because although I'm going to be critical, the authors did some
rather uphill work in a system that probably made data access difficult and forced them
into making a brief, sketchy report.  It's not a full paper, and we shouldn't hold it to
the standards for that.  

But let's not be rubes.  


## The result  

Still, they dutifully report a result that should make people at least take a look:  

- __Odds Ratio:__ The odds ratio for reduced mortality with ivermectin vs remdesivir of OR
  = 0.30 with a 95% confidence interval of 0.20 &ndash; 0.48.  Since the confidence
  interval on the odds ratio is bounded away from 1 (equal odds of death), this is
  statistically significant (though no reported $p$-value.)  
- __Risk Difference:__ The risk difference was -5.2%, with a confidence interval of -7.1%
  &ndash; -3.37%, and a significance of $p \lt 10^{-4}$.  The statistical significance
  here is considerable, though the effect size may perhaps not be: 5% decrease in death
  rates?  (As this is an abstract, there are not enough details for us to dig into their
  math.  So I'm frustrated, but probably the authors are frustrated at not being able to
  say it before a full publication, too.)  


## Some caveats  

Now, what should we think about that?  I have numerous reservations:  

- __Electronic Medical Records:__ EMR systems in the US are a patchwork quilt, unlike
  those in Europe or Israel.   
  - Yes, it's available data of generally ok-to-high quality.  But there's a severe
    selection bias toward people with medical insurance, often with a particular
    provider.  
  - That's only a moderate concern here, since TriNetX covers 68 million patients; though
    it's probably intermittent coverage as patients change jobs and insurers.  
- __Relevant SARS-CoV2 variants:__ The study dates, 2020-Jan-01 to 2021-Jul-11, do not
  include any time period where there was significant Delta or Omicron circulation in the
  US.  Those are the only relevant strains (until the next one!).  So the applicability
  is, while not irrelevant, at least not obviously extensible to Omicron.  
- __Patient gating factors:__ The TriNetX EMR system contains intermittent records on 68
  million patients, of whom 1,761,060 met the critiera for diagnosis with COVID-19, but of
  whom only 41,608 were eligible for this study.  Was the criterion of receiving either
  remdesivir or ivermectin but not both _that_ severe so as to restrict attention to only 
  $ 41,608 / 1,761,060 = 2.4\%$ of the COVID-19 patient population?  Shouldn't that make
  us worry about the general applicability of the results?  
  <img src="{{ site.baseurl }}/images/2022-03-07-ivermectin-revenant-epid.jpg" width="400" height="126" alt="Groenwald &amp; van Smeden @ Epidemiology: Efficient sampling in case-control studies" title="Groenwald &amp; van Smeden @ Epidemiology: Efficient sampling in case-control studies" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- __Unbalanced sample:__  The sample was quite  unbalanced, by an order of magnitude:
  1,072 ivermectin patients vs 40,536 remdesivir patients.  While this reflects current
  practice (ivermectin kind of "underground" vs remdesivire standard of care in the early
  pandemic), it worries me.  
  - _Case/Control Sampling:_ It would have been more usual to do some sort of case-control
    sampling. <sup id="fn2a">[[2]](#fn2)</sup>  In that case, one would take all 1,072
    ivermectin cases, and then sampled the remdesivir cases to get a similar
    sized cohort so the sampling is closer to 1:1.  (For bonus points that make grizzled
    old statisticians smile at you, assess the stability of the result under repeated
    bootstrap resampling of the remdesivire patients.)  
  - _Effect on statistical significance:_ This would have balanced the sampling, but
    reduced the sample size from 41k to 2k.  Elimination of the bias would have cost
    statistical significance, and I wonder if that's why they didn't use this well-known
    technique: maybe the effect goes away?  (In a real paper, not just an abstract,
    perhaps they will discuss this.)  
- __Weird choice of comparison:__  Why did they choose to go up against remdesivir?  
  - _Strengh of effect:_ Remdesivir is not a super-strong COVID-19 therapy.  I mean, it
    helps a little, but it didn't constitute a game-changing therapy.  It _was_ available
    from the beginning of the pandemic, so that extends the baseline of relevant patients.
    I suspect they chose remdesivir for that reason, to get more patients to get to
    statistical significance.  But with paxlovid and molnupiravir available, it's not so
    relevant going forward.  
  - _Mode of administration:_ Very few physicians will prescribe ivermectin for COVID-19.
    Consequently, we're comparing a self-administered drug usually taken at home, early in
    infection against a late-stage drug always given in hospitals by infusion, usually at
    later stages.  This is like comparing 2 populations for headache: one group takes
    ibuprofen and nobody dies; the other group goes to the hospital for surgery to remove
    a brain tumor and some of them die.  They're so unlike that it's almost a 
	Gilbert Ryle-style [_category error_](https://en.wikipedia.org/wiki/Category_mistake)
    to compare them.  
- __Age difference:__ The ivermectin cohort is a decade younger than the remdesivir
  cohort (52 vs 62, with of course some spread that the abstract does not explain).  While
  they did control for age, they can't take the space in an abstract to explain how.  So
  I'm a little antsy to make sure that they accounted for this risk factor by a sensible
  method. <sup id="fn3a">[[3]](#fn3)</sup>  
- __Sex difference:__ 10% fewer of the ivermectin cohort were male vs the remdesivir cohort
  (43% vs 54%).  Again, they claim to have controlled for this, but I want to see _how_,
  given that they've (commendably!) admitted up front this bias in the input data.
- __Credentials:__ Honestly, I want to soft-pedal this, because I hate the creeping
  credentialism that sometimes is used as an excuse not to listen to people.  But&hellip;
  of the 4 authors, only 1 is an infectious diseases person.  The other 3 are in plastic
  surgery and urology, which while fine disciplines in and of themselves, are of doubtful
  relevance here.  Still&hellip; I'm a bit undecided about whether the author specialties
  should be an issue.  It both bugs me, and also bugs me that it bugs me.  So let's be
  generous and spot them some benefit of the doubt on this one.  

Finally, just because I want to bend over backward to give these folks credit for doing
something difficult, they close by admitting a large randomized controlled trial is
required to _really_ decide the question.  

That's fair enough, but people only run large RCT's when there's at least some preliminary
evidence of an effect that's both large enough to be clinically meaningful, and
statistically significant enough that it's probably real.  So far, neither of those is the
case with ivermectin.  


## The Weekend Conclusion  

It appears to be a brave effort, though we need to see the details to be sure.  But it
appears to be an irrelevant comparison now, because:  

- The cohort of patients has some problems with age and gender biases, though this might
  have been corrected by their methods; we'll see when there's a full report.  On the
  other hand, the use of a US EMR system biases you toward employed people with health
  insurance, and I seen no way around that.  
- The sample is unbalanced, and probably should have done sampling to make it so.  That
  would have reduced statistical significance, so I'd like to hear from the authors about
  that, too.  
- The SARS-CoV2 variants circulating at the time of the study are no longer relevant.  
- The reported effect size (risk differnce of about 5%) is not large.  
- The comparison with remdesivir is odd, since remdesivir was at best only mildly
  effective, and administered only in the hospital at relatively late stages.  Ivermectin
  likely self-administered at home in early stages.  
- With the advent of paxlovid, molnupiravir, and bebtelovimab, the comparison with
  remdesivir is irrelevant.  The small effect size for ivermectin reported here has no
  hope of beating the new antivirals.  
- As this is an abstract of a conference short talk/poster, we have little idea of their
  methods for controlling for confounders or assessing association with mortality.  That's
  not their fault; there's just no room in an abstract.  Still, I'm not gonna just believe
  based on a few random assertions in an abstract!  I want to see the math.  

So, no.  This does not make me change my mind.  I'm _not_ on the ivermectin bandwagon for
anything other than treating parasite infestations.  

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

<a id="fn1">1</a>: I Efimenko, _et al.,_ ["Treatment with Ivermectin Is Associated with Decreased Mortality in COVID-19 Patients: Analysis of a National Federated Database"](https://www.sciencedirect.com/science/article/pii/S1201971221009887), _Intl Jnl Infect Dis_ 116: Suppl, S40, 2022-March.  Publication of abstract PS05.04 (947) from the _Eight International Meeting on Emerging Diseases And Surveillance_, IMED 2021-Nov 4-6 virtual meeting. [↩](#fn1a)  

<a id="fn2">2</a>: RHH Groenwald &amp; M van Smeden, ["Efficient Sampling in Unmatched Case–Control Studies When the Total Number of Cases and Controls Is Fixed"](https://journals.lww.com/epidem/Abstract/2017/11000/Efficient_Sampling_in_Unmatched_Case_Control.11.aspx), _Epidemiology_ 28:6, 834-837, 2017-Nov. [↩](#fn2a)  

<a id="fn3">3</a>: Yes, I'm a fussy old statistician.  But I came by that fussiness honestly. [↩](#fn3a)  
