---
layout: post
title: Paxlovid in the Wild Redux
tags: COVID JournalClub Math PharmaAndBiotech
comments: true
commentsClosed: false
---

What do we know about the people for whom paxlovid works really well?  


## How Paxlovid Works  

We previously wrote a bit on this Crummy Little Blog That Nobody Reads (CLBTNR) about
[the paxlovid mechansim of action last January]({{ site.baseurl }}/how-to-discover-paxlovid/#science-and-serendipity),
discussing the med-chem optimization of paxlovid. <sup id="fn1a">[[1]](#fn1)</sup>  

SARS-CoV2 has a very funny gene called [ORF1ab](https://www.ncbi.nlm.nih.gov/gene/43740578).
- What's "funny" about it is that it violates the "central dogma" of genetics: one gene
  makes one protein.  
- ORF1ab is a _polyprotein_ gene: it makes a huge string of mRNA, which is transcribed
  into a huge mess of amino acids that make not much sense as a protien.  
- But then _another_ SARS-CoV2 protein called either 3CLpro ("3C-like-protease") or Mpro ("main
  protease") comes along and snips that polyprotein into pieces, some of which fold up into
  workable proteins.  
  
Yes, biology is a kluge.  Surely you are not surprised?  Evolution places no premium on
elegance by the standards of human understanding.  

Paxlovid contains one ingredient called [nirmatrelvir](https://en.wikipedia.org/wiki/Nirmatrelvir)
that inhibits 3CLpro/Mpro.  This has 2 salutary effects:  
1. The product of ORF1ab is not cloven, remains non-functional, and the virus cannot
   reproduce.  
2. There is no homolog of 3CLpro/Mpro in human, so nirmatrelvir can be dosed nice & high
   without worrying too much about doing something nasty to human biology.  In other
   words, you can hit the virus really, really hard.  
   
There's a whole long happy tale of why Pfizer "just happened" to have an Mpro inhibitor lying
around, involving work on the original SARS epidemic back in 2003.  A good research lab
never loses information!  Knowledge always turns out to be good for something, and keeping
the people around who can find it for you is a good idea.  

The other component of paxlovid is ritonavir.  This is a medication that's been used in
HIV and hepatitis C for years.  Yes, it's mildly a 3CLpro/Mpro inhibitor in its own right.
But the main reason for it is that your liver, via a gene called CYP3A, will break down
nirmatrelvir too fast!  We'd practically have to keep you in the hospital with a
continuous infusion to make nirmatrelvir work on its own.  

Ritonavir to the rescue: it inhibits CYP3A, which makes nirmatrelvir stay active in your
body longer, which means it can keep whacking on the virus longer.  And it means we can
send you home with a couple blister packs of pills instead of keeping you on an IV.  On
the (slight) downside, ritonavir is the reason why paxlovid interacts unfavorably with so
many other drugs: they're broken down by CYP3A also!  

All very nice.  A triumph of drug development, really, illustrating How It Is Done.  


## For Whom the Paxlovid Tolls&hellip; or Rather, "Works"  

<a href="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-2.png"><img src="{{ site.baseurl }}/images/2022-06-02-paxlovid-in-the-wild-israeli-2-thumb.jpg" width="400" height="648" alt="Arbel, et al.: Paxlovid vs no treatment, KM curves for hospitalization and death, by age" title="Arbel, et al.: Paxlovid vs no treatment, KM curves for hospitalization and death, by age" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Previously on this CLBTNR we wrote about [an Israeli study of where paxlovid has a huge
benefit and were it doesn't]({{ site.baseurl }}/paxlovid-in-the-wild#the-weekend-conclusion).
<sup id="fn2a">[[2]](#fn2)</sup>  The conclusion we drew was:  

> 1. For ages 65+: Paxlovid had a dramatic positive effect in reducing hospitalization and death rates.  
> 2. For ages 40-64: Paxlovid had not much effect at all on either hospitalization or death rates.  

<img src="{{ site.baseurl }}/images/2022-10-24-in-the-wild-peer-reviewed-nejm-1.jpg" width="400" height="213" alt="Arbel et al. @ NEJM: Paxlovid in the time of Omicron" title="Arbel et al. @ NEJM: Paxlovid in the time of Omicron" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

Now, that was based on a preprint, before peer review.  So we were _extremely_ pleased to
see that the paper held up under peer review and was published in the prestigious _New
England Journal of Medicine_ last month. <sup id="fn3a">[[3]](#fn3)</sup>  

So kudos to the group at Clalit Health Services and Ben-Gurion University for some good,
hard data on the merits of paxlovid.  Solid work.  Paxlovid is really, really good stuff.
Also a great tale of effective drug discovery based on tons of past research.  (Like the
mRNA vaccines, for that matter, which are also based on decades of previous work!)  


## Why Don't We See Much Effect for Ages 40-64?  

Basically, paxlovid makes the response in elders more in line with the response in the
middle-aged.  It's not that paxlovid _doesn't_ work for the middle aged, since it does
shorten the time to healing.  It's just that the middle-aged have immune systems that are
still pretty good and will _probably_ recover without paxlovid.  For the middle-aged,
paxlovid just makes sure.  

But for elders, with weaker immune systems, paxlovid fills a
real gap in the risk, by fighting alongside their immune system to punch the virus hard
enough that even an elderly immune system can cope.  


## The Weekend Conclusion  

I think the conclusion still stands:
- __Paxlovid is a _big deal_ for people over 65.__  If you're over 65 and get COVID-19,
  _insist_ that your doc either write for paxlovid or present _very specific_ medical
  reasons why not.  (Usually drug interactions with other prescriptions which you cannot
  interrupt, even for 5 days.)  
- __For people under 65, it's probably not a tragedy if you can't get it.__  _Probably._  If I
  were still in that demographic, I'd still insist pretty hard until I got it prescribed,
  since it demonstrably does no harm and backstops your immune system.  I mean, why take
  chances when theres's (a) no reward for doing so and (b) the countermeasures are cheap,
  safe, and effective?  
  
Paxlovid is good stuff.  It's woefully underprescribed, because of all the misinformation
and press concentrating only on the very minor bad events.  

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

<a id="fn1">1</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Med-Chem Optimization of Paxlovid"]({{ site.baseurl }}/how-to-discover-paxlovid/),  [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2022-Jan-19. [↩](#fn1a)  

<a id="fn2">2</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["Paxlovid in the Wild"]({{ site.baseurl }}/paxlovid-in-the-wild), [_Some Weekend Reading_]({{ site.baseurl }}/) blog, 2022-Jun-02. [↩](#fn2a)  

<a id="fn3">3</a>: R Arbel, _et al.,_ ["Nirmatrelvir Use and Severe Covid-19 Outcomes during the Omicron Surge"](https://www.nejm.org/doi/full/10.1056/NEJMoa2204919), _New Engl Jnl Med_, 387:790-798, 2022-Sep-01.  DOI: [10.1056/NEJMoa2204919](https://doi.org/10.1056/NEJMoa2204919). [↩](#fn3a)  
