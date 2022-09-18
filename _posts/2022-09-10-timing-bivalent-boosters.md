---
layout: post
title: On Timing the Next Bivalent Booster for Omicron COVID-19
tags: CatBlogging COVID JournalClub PharmaAndBiotech SomebodyAskedMe
comments: true
commentsClosed: false
---

[Somebody asked me]() when we'd be getting the new bivalent COVID-19 boosters.  (Not _if_
but _when._)  Since we've both recently had COVID-19, that requires a bit of a think.  


## CDC Recommendations  

<img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-cdc-1.jpg" width="400" height="184" alt="US CDC: Current COVID-19 vaccine guidelines" title="US CDC: Current COVID-19 vaccine guidelines" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

First, let's consult what the CDC recommends <sup id="fn1a">[[1]](#fn1)</sup> for older
people, double boosted, recently recovering from COVID-19.  How long should we wait to get
it?  

Seems pretty clear:  

> People with known current SARS-CoV-2 infection should defer any COVID-19 vaccination,
> including booster vaccination, at least until recovery from the acute illness (if
> symptoms were present) and criteria to discontinue isolation have been met.  
>  
> In addition, __people who recently had SARS-CoV-2 infection may consider delaying a
> primary series dose or booster dose by 3 months from symptom onset or positive test__ (if
> infection was asymptomatic). [Studies](https://jamanetwork.com/journals/jama/fullarticle/2785919)
> have shown that increased time between infection and vaccination may result in an
> improved immune response to vaccination. Also, a low risk of reinfection has been
> observed in the weeks to months following infection.  

So, first get better.  

Second, wait maybe 3 months past the onset of infection.  

For your humble Weekend Editor, the onset was July 25; for the Weekend Editrix it was a
week or two later (hard to tell, since symptoms started long before she tested positive).
So that means I should get the bivalent booster around the start of Octember, and she
should follow along a couple weeks later.  


## What Does the Scientific Literature Say?  

Well.  That's nice and all, but given the widespread distrust of the CDC (mostly
unwarranted), we might want to see what the evidence is.  It _probably_ makes sense, but
let's just check anyway.  

<img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-jama-1.jpg" width="400" height="330" alt="Zhong, et al. @ JAMA: Ab durability after mRNA vax with &amp; without infection" title="Zhong, et al. @ JAMA: Ab durability after mRNA vax with &amp; without infection" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-jama-2.png"><img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-jama-2-thumb.jpg" width="400" height="127" alt="Zhong, et al. @ JAMA: Ab decay rates, with/without infection, with/without delay after infection" title="Zhong, et al. @ JAMA: Ab decay rates, with/without infection, with/without delay after infection" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-jama-3.png"><img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-jama-3-thumb.jpg" width="400" height="189" alt="Zhang, et al. @ JAMA: Effect of &lt; 90d or &gt; 90d delay post-infection on vaccine ab levels" title="Zhang, et al. @ JAMA: Effect of &lt; 90d or &gt; 90d delay post-infection on vaccine ab levels" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The study linked by the CDC above is a _JAMA_ paper by Zhong, _et al._ <sup id="fn2a">[[2]](#fn2)</sup>
(an eminently brief 2-pager) about antibody lifetimes from mRNA vaccines, with and without
previous infection:  
- They studied $N =$ 3500 health care workers at Johns Hopkins, from 2020-Jun through
  2021-Sep.  
- Given the calendar dates of the study, this was all about the 2nd dose in the primary
  series, not about boosters.  
- They used electronic health records (only possible in the US at related sites, due to disjointed
  electronic record systems) to get vaccination and infection dates.    
- Then they measured antibody levels over time (ratio of spike ab to IgG ab as a
  background control), and estimated decay rates with a regression model.  
- For those with previous infection, they binarized the model at &gt; 90 days or &lt; 90
  days.  

The relevant bits are called out in the figure and the table, reproduced here:  
- Part A (left) of the figure shows what you'd think: antibody levels wane faster in
  people who had a previous vaccination but no infection, compared to people who had had a
  previous vaccination _and_ an infection.  Their immune systems were doubly cautious.
  (Interesting, but not our case.)  
- Part B (right) of the figure also shows what you'd think: ab levels wane both in people
  who got vaxed quickly and in those who waited 3 months.  It's not very fast in either
  group, and doesn't look statistically significant.  However, it's _slightly_ slower decay
  of abs in those who waited.  (Again interesting, but questionable statistical
  significance.)  
- There's a lot in the table, but concentrate on the part I've marked in a red square.  It
  compares vaccination-induced antibody levels (ratio with IgG controls, I think?) in
  people who got vaccinated soon/late, and at time points 1mo/3mo after vaccination.
  - First, the sample counts are very low: 32 vs 41 patients for each group.  We should
    not expect much in the way of statistical significance from this, and judging by the
    confidence intervals, that's almost true: they don't _quite_ overlap, but they're not
    that separate.  While I couldn't find a $p$-value, this is significant but marginal.  
  - Second, look at the effect: 10.52 vs 9.65 at 1 month, and 9.31 vs 8.22 at 3 months.
    Not a huge effect size, more of a 10% difference kind of thing.  
  
We need to be a little cautious, as the Zhong paper was about the efficacy of the 2nd dose
of the original vaccine and a much earlier strain of virus.  Here we're talking about the
5th dose, a new bivalent vaccine, and the nastily contagious Omicron.  So, not directly
comparable, but at least indicative that a delay between infection and vax is salutory,
even if we can't immediately embrace the quantitative results.  

Still, the result is: __waiting a little while is good, but the effect size is small beyond
3 months, and sample sizes were limited.__  

This, given that I'm anxious to get the bivalent booster, seems to point to an _upper limit_ on
delay for vaccination of 90 days post infection start.  

<img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-medrxiv-1.jpg" width="400" height="203" alt="Buckner, et al. @ medRxiv: Timing of previous vaccination/infection with booters" title="Buckner, et al. @ medRxiv: Timing of previous vaccination/infection with booters" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Another, more recent, reference I came across is a _medR&chi;iv_ preprint (not yet peer reviewed) of a
study by Buckner, _et al._ <sup id="fn3a">[[3]](#fn3)</sup> on the behavior of memory B
cells after boosters.  This is nice, because it studies boosters instead of the primary
series, and because it looks at memory B cells (long-term immunity) instead of perpetually
waning antibody levels.  Let's see what they have to say.  

This is a much smaller study: $N =$ 66 subjects, with various infection histories, all
getting their 3rd dose of mRNA vaccine.  They measured antibody and B-cell responses
together.  

It appears that spike-specific B-cell responses in people with recent infection were less
strong than those without recent infection, measured at 60 days post-boost.  More or less:
recent infection mutes the B-cell response to a booster.  

Judging by the sheer number of figures, they conducted a _very_ thorough study of antibody
types and abundances, and B cell responses and various B cell subtypes.  My poor little
post-COVID-19 brain doesn't want to trudge through all of it &ndash; sorry! &ndash; so
we'll just take their own words as the conclusion:  

> In summary, we have shown that antibody and B-cell responses to SARS-CoV-2 booster
> vaccination are impacted by infection status, where prior SARS-CoV-2 infection is
> associated with a muted response, the extent of which is dictated by the interval
> between infection and vaccination. __When the interval is too short, the response induced
> by the recent infection appears to prevent B cells from responding to the subsequent
> booster vaccine.__ As a growing number of people are infected and re-infected with
> SARS-CoV-2, these findings may help provide guidance for future recommendations on how
> to establish booster vaccine schedules that account for infection histories.  

After trudging through their many, many assays with various parameters, it looks like:
__"too short" meant 2 to 3 months post-infection.__  

<img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-yle-1.jpg" width="400" height="127" alt="K Jetelina @ YLE: Timing the bivalent booster" title="K Jetelina @ YLE: Timing the bivalent booster" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
For a third viewpoint, let's consult Katelyn Jetelina, writing at
_Your Local Epidemiologist_.  <sup id="fn4a">[[4]](#fn4)</sup>  

She, being a scientist of very good taste, also read the Buckner preprint we read above. :-)
Unlike us, with our foggy little post-COVID brain, she took the time to understand the
details.  Her conclusion:

> This week a really great [preprint](https://www.medrxiv.org/content/10.1101/2022.08.30.22279344v1)
> found a booster doesn’t add much benefit within 2 months (60 days) of infection. While
> it increases neutralizing antibodies (our body’s first line of defense that prevents
> infection and transmission), it will not broaden the memory of B cells (our second line
> of defense and long term-memory). __So wait at least 2 months.__  
> 
> Unfortunately, beyond that, we don’t know the optimal timing.

__Summary:__
- The CDC says 3 months post onset of infection.  
- The Zhong paper says at 3 months, there's only a small difference.  So no longer than 3
  months.  
- The Buckner paper, while very complex, says 2-3 months in both my analysis and
  Jetelina's.  With my brain fog, her opinion is the one that rules here, so 2-3 months.  


## The Weekend Conclusion  


<a href="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-weekend-publisher-bed-of-nails.jpg"><img src="{{ site.baseurl }}/images/2022-09-10-timing-bivalent-boosters-weekend-publisher-bed-of-nails-thumb.jpg" width="400" height="300" alt="Weekend Publisher on a bed of nails, waiting for you to get bivalent-boosted" title="Weekend Publisher on a bed of nails, waiting for you to get bivalent-boosted" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
We started showing infection on 2022-Jul-25, so call it the beginning of August.  Waiting
2-3 months for booster means the beginning of Octember or maybe Novober.  

If you, unlike us, have the good fortune not to have been infected or vaccinated within
the last 3 months or so, you should get your bivalent booster right away.  

I'd maybe wait until Oct/Nov on the flu vaccine, to give it time to peak over the flu
season.  

For now, that's what we'll be doing, here at Chez Weekend.  


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

<a id="fn1">1</a>: CDC Staff, ["Interim Clinical Considerations for Use of COVID-19 Vaccines Currently Approved or Authorized in the United States"](https://www.cdc.gov/vaccines/covid-19/clinical-considerations/interim-considerations-us.html#infection), US Centers for Disease Control and Prevention, downloaded 2022-Sep-10, updated 2022-Sep-02. [↩](#fn1a)  

<a id="fn2">2</a>: D Zong, _et al.,_ ["Durability of Antibody Levels After Vaccination With mRNA SARS-CoV-2 Vaccine in Individuals With or Without Prior Infection"](https://jamanetwork.com/journals/jama/fullarticle/2785919), _JAMA_ 326:24, 2524 - 2526, 2021-Nov-01.  DOI: [10.1001/jama.2021.19996](https://doi.org/10.1001/jama.2021.19996). [↩](#fn2a)  

<a id="fn3">3</a>: CM Buckner, _et al.,_ ["Recent SARS-CoV-2 infection abrogates antibody and B-cell responses to booster vaccination "](https://www.medrxiv.org/content/10.1101/2022.08.30.22279344v1.full), _medR&chi;iv_, 2022-Aug-31. DOI: [10.1101/2022.08.30.22279344](https://doi.org/10.1101/2022.08.30.22279344). [↩](#fn3a)  

<a id="fn4">4</a>: K Jetelina, ["Considerations for your fall booster"](https://yourlocalepidemiologist.substack.com/p/considerations-for-your-fall-booster), _Your Local Epidemiologist_, 2022-Sep-02. [↩](#fn4a)  
