---
layout: post
title: Nucleocapsid Abs &amp; Severe COVID-19
tags: COVID JournalClub PharmaAndBiotech SomebodyAskedMe Statistics
comments: true
commentsClosed: false
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) a couple months ago about the
significance of high nucleocapside antibodies in unvaccinated people compared to the
vaccinated.  Now there's another paper exploring the meaning of N ab levels.  Let's see
what it says!  


## The original question  

A couple months ago, on behalf of a friend, we looked into
[nucleocapsid antibody levels and COVID-19 resistance]({{ site.baseurl }}/covid-immunity-prevalence/).
A friend of a friend noted higher N abs in unvaccinated people, and opined that
unvaccinted people had more diverse antibody types, which might be protective over
vaccination.  

This was, of course, exactly backwards:  
- Vaccinated people don't bother making N abs because _they don't have to_: their spike
  antibodies take care of the infection before it gets that far.  
- Unvaccinated people make abs to _everything_ SARS-CoV2 related, including the
  nucleocapsid protein, more or less in desperation to find _something_ protective.  
- The nucleocapsid protein is _inside_ the viral envelope, so it's useless: your immune
  system can't see it until _after_ it's gotten inside a cell and opened up.  
- The stats on infection rates in vaccinated vs unvaccinated populations are unequivocal:
  vaccination _dramatically_ reduces the danger!  
  

## Association of Nucleocapsid Abs with Severe COVID-19  

<img src="{{ site.baseurl }}/images/2022-09-06-n-abs-severe-covid-19-aim-1.jpg" width="400" height="194" alt="ACTIV-3/TICO Study Group @ AIM: Association of plasma nucleocapsid antigen level and COVID-19 severity" title="ACTIV-3/TICO Study Group @ AIM: Association of plasma nucleocapsid antigen level and COVID-19 severity" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So it was of great interest here at Chez Weekend, when a paper dropped last week, after
passing peer review, on the subject of nucleocapsid antibodies and COVID-19 severity.
<sup id="fn1a">[[1]](#fn1)</sup>  

First, a distinction: they measured N _antigen_ levels, not antibody levels.  That is,
they looked at the viral protein levels themselves.  The immune system forms antibodies in
repsonse to antigens, so this is kind of a proxy for antibody levels.  (Or, maybe not:
maybe high N antigens just mean high viral load, which would mean severe infection.  Hard
to say, but I lean toward the proxy-for-antibody levels interpretation.)  

### Study Design  

Some background:  

- They measured $N = 2540$ subjects over a time window from 2020-Aug to 2021-Nov, in 114
  centers across 10 countries.  This is The Good Stuff, not a tiny, one-hospital study!  

- This is during the Delta wave, not the current Omicron.  

- Subjects were adults, hospitalized for COVID-19, with &le; 12 days of symptoms.  So the
  population is within a fairly narrow window of early/intermediate COVID-19.  

- They assessed via logistic regression &ndash; one of my favorite methods! &ndash; the
  association between binarized N antigen levels (&lt; 1000 ng/l _vs_ &gt; 1000 ng/l)
  and a variety of clinical meaurements, including:  
  -  worsening on an ordinal pulmonary scale at day 5 (lungs getting worse fast), and 
  - time to hospital discharge.  

  They also used [Fine-Gray](https://en.wikipedia.org/wiki/Relative_survival) regression models.  I
  worked with Bob Gray on a project once, and was very impressed.  Good guy.  
  
So: good sized study, international in nature, well defined subject population, and good
statistical method choices, and passed peer review!  

Thumbs up, so far.  

### Some Results  

The topline summary that they put in the abstract comes down to 3 things:  

- Pulmonary severity strongly associated with antigen levels, 3.1 fold (CL: 2.22 - 4.34).  
- Antigen stronger if no spike antibodies (unvaccinated), 6.42 fold (CL: 5.37 - 7.66).  
- High antigen means with longer time to hospital discharge, fold 0.54 (CL: 0.45 -  0.57).  

<a href="{{ site.baseurl }}/images/2022-09-06-n-abs-severe-covid-19-aim-2.jpg">
  <img src="{{ site.baseurl }}/images/2022-09-06-n-abs-severe-covid-19-aim-2-thumb.jpg" width="400" height="314" alt="ACTIV-3/TICO Study Group @ AIM: Rate of hospital discharge, low and high N antigen, by oxygenation status" title="ACTIV-3/TICO Study Group @ AIM: Rate of hospital discharge, low and high N antigen, by oxygenation status" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>
The main figure in the paper shows the hospitalization discharge rate graphically:  
- The horizontal axis is time, in days since hospital admission.  
- The vertical axis is the cumulative incidence fraction, i.e., what fraction of the
  patients have been discharged by a given day.  
- The red solid curve is the low N antigen cohort (&lt; 1000 ng/l), and the dotted blue
  curve is the high N antigen cohort (&gt; 1000 ng/l).  
- Each of the 4 panels shows the breakdown by oxygenation status: room air only, low O2
  supplement, higher O2 supplement, and an even higher O2 status (but not intubated).  

The figure highlights 2 conclusions, tested statistically elsewhere in the paper: low N
antigen patients get discharged earlier, and that fact is true independent of oxygen
treatment status.  

As the authors put it:  

> Elevated plasma antigen is highly associated with both severity of pulmonary illness and
> clinically important patient outcomes. Multiple clinical and viral factors are
> associated with plasma antigen level at presentation. These data support a potential
> role of ongoing viral replication in the pathogenesis of SARS-CoV-2 in hospitalized
> patients.  


## The Weekend Conclusion  

Basically, high nucleocapsid antigen levels are bad news.  They leave in their wake high
nucleocapsid antibodies, which is evidence of previous bad news.  

Basically, get vaccinated so you can avoid these bad things!  

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

<a id="fn1">1</a>: ACTIV-3/TICO Study Group, ["The Association of Baseline Plasma SARS-CoV-2 Nucleocapsid Antigen Level and Outcomes in Patients Hospitalized With COVID-19"](https://www.acpjournals.org/doi/10.7326/M22-0924), _Annals Int Med_, 2022-Aug-30.  DOI: [10.7326/M22-0924](https://doi.org/10.7326/M22-0924).[↩](#fn1a)  
