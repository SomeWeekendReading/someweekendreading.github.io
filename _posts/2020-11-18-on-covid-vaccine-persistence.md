---
layout: post
title: On COVID vaccine protection persistence
tags: COVID MathInTheNews
comments: true
---

Everybody's worried about how long the protection from a COVID vaccine will last, whether
there can be reinfections, and so on.  How much do we actually know about that as of
now?  

Unsurprisingly, very little.  Really the only way to know is to vaccinate a bunch of
people and watch them for a couple of years.  The animal data looked pretty good before
the clinical trials, but it _always_ looks good or the human trials wouldn't have been
allowed to start.  

Over at [_In the Pipeline_](https://blogs.sciencemag.org/pipeline), Derek Lowe wrote about
this <sup id="fn1a">[[reference 1](#fn1)]</sup> (among other things like side-effects,
efficacy across different populations, logistics of the rollout, and other really
interesting stuff).  

That leads to the paper by Dan, _et al._ <sup id="fn2a">[[reference 2](#fn2)]</sup> which
hit the preprint server ("not yet peer reviewed") in the last couple days.  Lowe notes that
this seems to be the largest and most detailed study of post-viral-infection immunity in the entire
medical literature!  It basically says that at 6 months post-infection:
- spike antibodies were still abundant,
- the spike-specific B cells that form immune memory were still abundant,
- the CD4+ and CD8+ T cells that do the actual work were slowly decaying with a half life
  of about 3-5 months, as one would expect of an immune system slowly standing down after
  an infection.  

That's the good news.  

<img src="{{ site.baseurl }}/images/2020-11-18-on-vaccine-persistence-dan-abs.jpg" width="269" height="144" alt="Dan, et al. on SARS-COV-2 spike antibodies over time" title="Dan, et al. on SARS-COV-2 spike antibodies over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The other, more frustrating news that I get from that paper is the _intense variability_
across patients and across time, as shown in their Figure 1, excerpted here.  There are
going to be a _lot_ of different kinds of response seen in the population, possibly
including re-infection.  People will probably get really confused &amp; angry about it.
(Though, to be fair, "confused &amp; angry" does seems to be the _zeitgeist_.)  

## Bottom line  

Overall, this is looking like good, solid vaccine response with persistence of the things
we think matter for a long time.  Lowe reminds us of the following hopeful historical
fact:  

> For what it’s worth, there are patients who survived the 1918 influenza pandemic who had B cells that [still responded](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2848880/) <sup id="fn3a">[[reference 3](#fn3)]</sup> with fresh neutralizing antibodies after over 90 years, so they can be rather hardy.  

So&hellip; yeah, 90 years.  I'll take that.  Let's hope we can _all_ get that.  

## Added 2020-Dec-07:  

<img src="{{ site.baseurl }}/images/2020-11-18-on-vaccine-persistence-nejm-1.jpg" width="400" height="135" alt="NEJM letter on mRNA-1237 persistence" title="NEJM letter on mRNA-1237 persistence" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2020-11-18-on-vaccine-persistence-nejm-2.jpg" width="400" height="498" alt="mRNA-1273 persistence results" title="mRNA-1273 persistence results" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
On 2020-Dec-03 the _New England Journal of Medicine_ published a letter from the mRNA-1273
Study Group (basically the cohort of academic &amp; Moderna scientists studying the
Moderna vacccine).  <sup id="fn4a">[[reference 4](#fn4)]</sup>  

The figure at right reproduces their results, saying that reactions to the virus remain
quite stable are 119 days (about 4 months) from the first injection.  Ok, that's not a
long time, but it's the time that has elapsed so we can look empirically.  

__Emphatically:__ this is _not_ a prediction, it is a _measurement_ of what actually
happened. Here we're looking at 34 trial participants from the Phase I trial, who have
been on the study the longest: 15 subjects age 18-55, 9 subjects
age 56-70, and 10 subjects age 71 and older.  Notably, the curves shown here _do not
stratify_ by age, indicating that vaccine response is probably as strong in the elderly as
in everybody else. The 3 columns show the 3 age cohorts, youngest to oldest.  The arrows
on the horizontal axes show the first and second injection dates.
- Row A shows the binding to the receptor binding domain of the coronavirus spike protein;
  higher means the antibodies are recognizing and binding to the Big Bad.  Note that
  levels are generally high and stable.  
- Row B shows the inhibitory dilution that neutralizes 50% in a pseudovirus assay (ID50).
  This declines a bit, but apparently so does the same assay in convalescent patients, so
  we're at least looking like convalescent patients?  
- Row C shows something similar but with a different assay.  
- Row D shows a plaque-reduction neutralization assay, which is again somethingn along the
  same lines, but testing in a different system in a different way.  

The authors point out that all these responses were above the median of 41 control
subjects, who were convalescing from having actually had COVID-19.  So the vaccine
response is _stronger_ than having had the disease, which is good to see.  

While the antibodies do seem to be slowly declining, they're declining at about the rate
of convalescent patients.  As the authors point out, it is not yet known if memory B-cell
response has been achieved, i.e., if the immune system will have a long-term memory of
SARS-COV-2.  It did, however, provoke primary CD4 type 1 T helper cell responses 43 days
after the first vaccination (which is hopeful), and B-cell studies are ongoing.  

So it looks like the dose used in the Phase 3 trials, the same as the one studied here, is
the right one, or at least a good one.  

---

## Notes &amp; References  

<a id="fn1">1</a>: D Lowe, ["Vaccine Possibilities"](https://blogs.sciencemag.org/pipeline/archives/2020/11/18/vaccine-possibilities), [_In the Pipeline_](https://blogs.sciencemag.org/pipeline), 2020-Nov-18. [↩](#fn1a)  

<a id="fn2">2</a>: J Dan, _et al._, ["Immunological memory to SARS-CoV-2 assessed for greater than six months after infection"](https://www.biorxiv.org/content/10.1101/2020.11.15.383323v1), biorxiv DOI 10.1101/2020.11.15.383323.  __NB:__ This is a _preprint_, not yet peer-reviewed for scientific publication.[↩](#fn2a)  

<a id="fn3">3</a>: X Yu, ["Neutralizing antibodies derived from the B cells of 1918 influenza pandemic survivors"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2848880/), _Nature_ 2008-Sep-25, 455(7212): 532-536.[↩](#fn3a)  

<a id="fn4">4</a>: mRNA-1273 Study Group, ["Durability of Responses after SARS-CoV-2 2020mRNA-1273 Vaccination"](https://www.nejm.org/doi/full/10.1056/NEJMc2032195), _NEJM_ DOI: 10.1056/NEJMc2032195, 2020-Dec-03. [↩](#fn4a)  
