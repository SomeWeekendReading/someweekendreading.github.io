---
layout: post
title: Another beautiful vaccine&colon; a look into the Moderna FDA EUA submission package
tags: COVID MathInTheNews PharmaAndBiotech Politics Statistics
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about the contents of the
Moderna EUA application for their COVID-19 vaccine.  Summary: It is also quite beautiful.  

I woke up this morning, blearily lying abed listening to NPR.  They said the Moderna EUA
application at the FDA had dropped today, in preparation for the advisory committee
(VRBPAC: Vaccines and Related Biological Products Advisory Committee) meeting on Thursday.
So I thought, slowly and sleepily, "Yeah, probably ought to look into that sooner or
later, maybe this afteroon."  After a bit of breakfast, I checked email and discovered
that [Gary Cornell](https://garycornell.com/) had not only already found the FDA briefing
docs, but had dug into them, had questions about the confidence intervals, and thought
maybe I should have an opinion already, as well!  

Adjusting for time zones, that was 6am for him when he emailed me, meaning he'd gotten up
at around 5am his time to read the briefing docs while I was snoring.  I'm a little bit
intense, but I'm not _5am intense!_  

But&hellip; better late than never.  Let's have a look, now that it's a civilized time of
day.  


## What's the sitch?  

<img src="{{ site.baseurl }}/images/2020-12-15-beautiful-vaccines-2-stat.jpg" width="400" height="426" alt="STAT News: Moderna briefing docs for EUA" title="STAT News: Moderna briefing docs for EUA" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Our first stop, as usual, is _STAT News_ for a summary of the 
situation. <sup id="fn1a">[[1]](#fn1)</sup>  As we've explained before, the US has the
quaint custom of throwing out the analysis &amp; conclusions of drug applications, and
instead doing an _ab initio_ analysis of their own on the data using the analysis methods
in the clinical trial protocol.  Only then, analysis in hand, will they compare their
results with those of the submitter and proceed further if there's agreement on what the
data say.  

That's where we are today:  
- The FDA agrees with Moderna that the trial is evidence that the vaccine is "highly
  effective" at preventing symptomatic COVID-19 14 days after the 2nd dose.  (Asymptomatic
  COVID-19 is another matter, still under intense study.)  
- The FDA also agrees that the side-effects will make you feel like crap for a day or so
  (though they didn't print those exact words, I'm quite certain they were spoken),
  and that the degree might be a bit worse than Pfizer, but not enough to impede EUA
  approval.  
- The FDA also finds evidence of partial immunity after 1 dose, but this is preliminary
  and in no way a guideline for people to skip the second dose.  
  

## The Moderna FDA EUA application briefing documents  

There are 3 documents this time, because Moderna filed a supplement:  
1. The Moderna submission (84 pages). <sup id="fn2a">[[2]](#fn2)</sup>  
2. A supplement to the Moderna submission, because apparently you can't amend the original
   document (7 pages). <sup id="fn3a">[[3]](#fn3)</sup>  
3. The FDA reanalysis of the clinical trial data using the analysis methods in the
   protocol (54 pages). <sup id="fn4a">[[4]](#fn4)</sup>  
   

## Fine, but what's _in_ those briefing documents?!  

<img src="{{ site.baseurl }}/images/2020-12-15-beautiful-vaccines-2-survival-plot.jpg" width="400" height="212" alt="FDA: Moderna survival plot for treatment vs control arms" title="FDA: Moderna survival plot for treatment vs control arms" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Remember in our look at the Pfizer/BioNTech EUA submission, there was 
[a very beautiful survival plot of infection rates in the treatment vs control arms](https://www.someweekendreading.blog/beautiful-vaccines/#a-beautiful-survival-plot)?
Unsurprisingly, Moderna has one that is equally beautiful on page 28 of the FDA analysis,
Figure 2.  The comments that come to mind are about the same as for Pfizer/BioNTech:  
- The horizontal axis is time.  The first injection occurred on day 1, and the second on
  day 29.  
- The vertical axis is the frequency of COVID-19 cases seen, as a fraction of the number
  of subjects in each treatment arm.  
- The red curve is the treatment arm (i.e., the vaccine), and the blue curve is the
  control arm.  __NB:__ These colors are reversed from Pfizer's color choices, as there is
  no standard on these matters.  
  
Note that the blue arm rises somewhat _faster_ than linearly in time.  That means there is
an increasing probability/unit time, or rate, of being infected.  This is the background case
rate we would like to escape.  (In Pfizer's plot, this curve was more or less linear.)  

The red arm, though: it shows more or less no protection up until about day 12, but then goes
almost absolutely flat.  It completely _squashes_ the case rate to almost nothing.  Yes,
there are a couple cases; but remember there are about 15,000 people in each arm, so the
probability/time, or rate, of getting infected is driven down to almost nothing
beyond a few rare events.  

This is very, very good!  Especially hopeful is that the Pfizer/BioNTech and Moderna
vaccines are quite similar technology, this represents an out-of-sample, independent
confirmation of both vaccine's efficacy.  Things are looking up, I think.  

<img src="{{ site.baseurl }}/images/2020-12-15-beautiful-vaccines-2-subgroups.jpg" width="400" height="413" alt="FDA: Moderna trial population subgroups" title="FDA: Moderna trial population subgroups" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Table 6 on p. 20 gives us the subgroup breakdown of the trial population.  
- Subjects: 13,934 in treatment group, and 13,883 in control group, so it's well powered.  
- It looks like the age range is 18 - 95 years of age, with about 25% of subjects
  over 65.  So that's good, they'll get a good look into the response of older people.  
- The racial makeup is 80% whites, about 10% Blacks, 5% Asian, and a miscellany of
  others.  I wish it could have been a little less white, but that _does_ include
  Hispanics, so maybe not so bad.  It breaks down to 20% Latinx and 80% not; there were
  63% non-Hispanic white.  

<img src="{{ site.baseurl }}/images/2020-12-15-beautiful-vaccines-2-VE-by-age.jpg" width="400" height="144" alt="FDA: Moderna vaccine efficacy by age groups" title="FDA: Moderna vaccine efficacy by age groups" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The real meat of the matter is in Section 5.2.5: Vaccine Efficacy, starting on page 22.
There are a number of interesting tables here, but we'll concentrate on Table 17 (page
29): final efficacy analysis of the whole cohort, after both doses, with age breakdowns.
The efficacies and their 95% upper &amp; lower confidence limits (very properly using a
confidence interval from a Cox proportional hazard method, in contrast to Pfizer where
they used the Clopper-Pearson method) are:  

| Cohort   | Efficacy | 95% LCL | 95% UCL |
|:--------:|:--------:|:-------:|:-------:|
|    All   |   94.1%  |  89.3%  |  96.8%  |
| 18-64 yr |   95.6%  |  90.6%  |  97.9%  |
|  65+ yr  |   86.4%  |  61.4%  |  95.5%  |

<img src="{{ site.baseurl }}/images/2020-12-15-beautiful-vaccines-2-VE-forest-plot.jpg" width="400" height="215" alt="Moderna: Moderna vaccine efficacy forest plots" title="Moderna: Moderna vaccine efficacy forest plots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
There's a [forest plot](https://en.wikipedia.org/wiki/Forest_plot) using the hazad ratios
and relating those to vaccine efficacy, on page 53 of the Moderna submission which
summarizes all of this graphically, with breakdowns by age group.  

So it's excellent overall, and still pretty good for those over age 65.  The only
worrisome spot is that we can't really exclude the possibility that the efficacy is as low
as 61.4% in elders.  Still&hellip; that's _pretty_ good  


## A note on confidence intervals  

<img src="{{ site.baseurl }}/images/2020-12-15-beautiful-vaccines-2-VE-CI.jpg" width="400" height="141" alt="Moderna: Moderna vaccine efficacy forest plots" title="Moderna: Moderna vaccine efficacy forest plots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Gary had a few pointed questions about some of the other tables, in which there were no
confidence intervals for various subsets with age over 65.  Tables 9 &amp; 10 on pages 23
and 24 of the FDA report (interim analyses) are good examples.  See in the 3rd row &amp;
4th column where it just reports 100% efficacy with no confidence interval, unlike the
rows above it.  

The clue to what's going on here is to note that in the corresponding analysis by Moderna,
the confidence interval is reported as (NE, 100%) where "NE" stands for something like
"not evaluable".  This happens in every instance where there were no infections in the
treatment arm (e.g., row 3, column 2 in the table shown here).  

I suspect their confidence interval calculation method, based on the 95% CI of a Cox
proportional hazard method, breaks down when the number of reported events is 0.  

This is very like the situation in the Pfizer report, where they chose to use the
Clopper-Pearson method (puzzlingly slightly inappropriate for a survival problem like
this).  There's a special case for Clopper-Pearson when the reported events are 0% or 100%
that gives an exact answer.  If you use the interior Clopper-Pearson method, you get
nonsense: either a _negative_ lower confidence limit or an upper confidence limit above
100%.  Hence the embarassing negative numbers in the Pfizer tables.  

Here, Moderna specified in the trial protocol that they were going to use the more
sophisticated Cox proportional hazards method (and properly so).  But the penalty is when
you observe 0 infections, you apparently can't calculate a confidence interval.  (Or so it
seems.  I haven't checked out the math to be _sure_ that this is the case.)  

So&hellip; nothing really wrong there.  And when you look at the full dataset as we did
above, there were no zeroes anyway, so the problem did not arise.  

The "problem", if you really want a problem, is that the lower confidence limit for
subjects age 65+ could be as low as 60%-ish.  That's still pretty good, though since your
humble Weekend Editor is in that age group, it would be nice if it were higher.  


## So&hellip; what's it all mean?  

It means we have 2 independent randomized clinical trials on variations along the same
mRNA theme.  This is the _gold standard_ as far as medical evidence goes, and it says both
of Pfizer and Moderna appear to have excellent vaccines.  
- Pfizer puts more onerous demands on the cold chain, and  
- Moderna _may_ have slightly more annoying side effects.  

Other than that, I see little difference to convince me to prefer one over the other.  I'd
happily take either one _today_.  There's every reason to expect a favorable result when
Moderna goes before the VRBPAC this Thurday.  At that point, the vaccination capability of
the US (and, for that matter, the world) will approximately double.  

Be happy about this.  It's a good thing, in a year where good things have been lacking.  

---

## Notes &amp; References  
<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: M Herper &amp; D Garde, ["FDA scientists endorse Moderna Covid-19 vaccine, as documents provide new hints on efficacy"](https://www.statnews.com/2020/12/15/fda-scientists-endorse-moderna-covid-19-vaccine-as-documents-provide-new-hints-on-efficacy/), _STAT News_, 2020-Dec-15. [↩](#fn1a)  

<a id="fn2">2</a>: Moderna Therapeutics, ["mRNA-1273 Sponsor Briefing Document"](https://www.fda.gov/media/144452/download), FDA.gov, downloaded 2020-Dec-15. [↩](#fn2a)  

<a id="fn3">3</a>: Moderna Therapeutics, ["mRNA-1273 Sponsor Briefing Document Addendum"](https://www.fda.gov/media/144453/download), FDA.gov, downloaded 2020-Dec-15. Discusses duration of follow-up of subjects, adverse reaction definitions for lymphadenopaty (swollen lymph glands, usually in the armpit), some interim data on using Kaplan-Meier estimators for recurrence under [intent-to-treat](https://en.wikipedia.org/wiki/Intention-to-treat_analysis) rules, and, most interestingly to me, some evidence supporting efficacy _vs_ asymptomatic infection![↩](#fn3a)  

<a id="fn4">4</a>: FDA staff, ["FDA Briefing Document: Moderna COVID-19 Vaccine"](https://www.fda.gov/media/144434/download), FDA.gov, downloaded 2020-Dec-15.[↩](#fn4a)  
