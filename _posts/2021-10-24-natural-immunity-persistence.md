---
layout: post
title: On 'Natural' Immunity Persistence vs COVID-19
tags: COVID Politics Statistics
comments: true
---

What are the consequences of relying on 'natural' immunity after recovery from COVID-19?  


## What happens if you perpetually refuse vaccination?  

First of all, if you are unvaccinated, _you will get COVID-19_, most likely the Delta
variant.  This is unavoidable, and sometimes unsurvivable or only survivable with long-term
debilitating consequences.  

But then what would happen after that?  Would you then be immune?  

We'd love to believe that immunity is more or less life-long, as with measles.  But
coronaviruses are unrelated to measles viruses, so there's really no reason to expect
that.  

Immunity may fade with time, which means either: (a) we need periodic boosters, probably
annually, or (b) we have to be really aggressive about vaccinating _every single human
being_ until we eradicate COVID-19 like we've eradicated smallpox.  Unfortunately, unlike
smallpox which is human-specific, SARS-CoV2 is present in many animal reservoirs 
now. <sup id="fn1a">[[1]](#fn1)</sup> Unless we're going to vaccinate all the wild,
farmed, and domestic animals in the world, that reservoir is going to keep on causing
zoonotic re-infections in humanity more or less forever.  

So&hellip; alternative (a), periodic boosters, is the likely future.  

That's why I was struck by this (__NB:__ "MI" = myocardial infarction, basically a heart attack;
"PE" = pulmonary embolism, clotting in the lung that's often instanty fatal):  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
	Not good news for antivaxxers. <br><br>Those who plan on never getting the vaccine
	should expect to get COVID every 1.5 years for the rest of their lives. Which,
	incidentally, may not be very long on average, considering the increased risk of MI, PE
	and stroke with every infection. <a href="https://t.co/keXUzsMlZg">pic.twitter.com/keXUzsMlZg</a>
  </p>&mdash; Justin Pearson (@Jeffersoniandoc) <a href="https://twitter.com/Jeffersoniandoc/status/1450936440548827136?ref_src=twsrc%5Etfw">October 20, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

The disturbing thing, of course, is in the delusional replies that crawled out of the woodwork:  
- vaccinees have taken the [Mark of the Beast](https://en.wikipedia.org/wiki/Number_of_the_beast),
  which ends in the [lake of fire](https://en.wikipedia.org/wiki/Lake_of_fire#Book_of_Revelation),
  or  
- vaccinees should shut up and leave the unvaccinated alone, or  
- vaccinees are simply too afraid of COVID, and should instead "build up" their immunity
  (except that's what vaccination _does_), or  
- &hellip; I just can't bear to read any more replies.  

<img src="{{ site.baseurl }}/images/2021-10-24-natural-immunity-persistence-yale.jpg" width="400" height="257" alt="Yale Daily News: COVID-19 reinfections every 1.5 years without vaccination" title="Yale Daily News: COVID-19 reinfections every 1.5 years without vaccination" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-24-natural-immunity-persistence-lancet.jpg" width="400" height="164" alt="Lancet: durability of immunity against reinfection by SARS-CoV-2" title="Lancet: durability of immunity against reinfection by SARS-CoV-2" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The Tweet's author is referring to this article by Kinsella in the _Yale Daily News_. <sup id="fn2a">[[2]](#fn2)</sup> Townsend, _et al._ at the Yale School of Public Health <sup id="fn3a">[[3]](#fn3)</sup> used _actual_ close relatvies of SARS-CoV-2 (classic SARS, MERS, and a couple other human coronaviruses for a total of around 6 viruses) to estimate the duration of 'natural' immunity for unvaccinated people:  
- At 3 months, there's about 5% chance of reinfection.  
- At 17 months, there's a _50% chance of reinfection_, i.e., you should, on average, to be
  reinfected by this point about 1.5 years after your first infection.  

__Conclusion:__ If you refuse vaccination, you should expect on average to get COVID-19
_again_, about every 1.5 years or a bit less, for the rest of your life.  

Hmm&hellip; let's suppose that you do this dumb thing, avoiding vaccination.  Let us further
suppose that as you keep getting COVID-19 over and over, the mortality rate creeps
up a bit because it's wearing you down.  It's varying over time and in different places
<sup id="fn4a">[[4]](#fn4)</sup>, ranging from a few tenths of a percent to double digit
percents.  So let's _guess_ 3% mortality for you, averaged over many cycles of re-infection.  

How bad can it get?  Pretty bad:  

```R
> 0.97^9
[1] 0.7602311
```

That means: after 9 cycles of infection &ndash; just 13.5 years &ndash; _25% of you are dead!_  

Is that a lot?  

Why, yes.  Yes, it is:  
- About 1/4 of the US population seem to be vaccine refuseniks for now, although as mandates
  take hold that will go down to the really hard core.  Let's say 15% &ndash; 16% of US
  residents are hardcore vaccine refusers.  
- If one quarter of those vaccine refusers die within 13.5 years from repeated COVID-19
  infection, that's about 16% / 4 = about 4% of the entire US dead.  
- There are 330 million people in the US, so 4% of that is _13.2 million dead in 13.5 years!_  

That is a&hellip; _poor survival strategy._  


## The Weekend Conclusion  

We already know that although 'natural' immunity conveys some protection,
[vaccination induces stronger antibody levels](https://www.someweekendreading.blog/vax-better/).
Now we see the consequences: 25% of vaccine refusers dead within 13.5 years, based on
comparison with the most closely related human-infecting coronaviruses.  13.2 million dead
in the US in the next 13.5 years.  

Please don't do that.  Get vaccinated.  You should live, and not die.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: T Prince, _et al._, ["SARS-CoV-2 Infections in Animals: Reservoirs for Reverse Zoonosis and Models for Study"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8002747/), _Viruses_ 13:3, p 494, 2021-Mar-07. PMID: [33802857](https://pubmed.ncbi.nlm.nih.gov/33802857/), DOI: [10.3390/v13030494](https://dx.doi.org/10.3390/v13030494) [↩](#fn1a)  

<a id="fn2">2</a>: A Kinsella, ["COVID-19 reinfection is likely among unvaccinated individuals, Yale study finds"](https://yaledailynews.com/blog/2021/10/07/covid-19-reinfection-is-likely-among-unvaccinated-individuals-yale-study-finds/), _Yale Daily News_, 2021-Oct-07. [↩](#fn2a)  

<a id="fn3">3</a>: JT Townsend _et al.,_ ["The durability of immunity against reinfection by SARS-CoV-2: a comparative evolutionary study"](https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(21)00219-6/fulltext), _The Lancet Microbe_, 2021-Oct-01.  DOI: [10.1016/S2666-5247(21)00219-6](https://doi.org/10.1016/S2666-5247(21)00219-6). [↩](#fn3a)  

<a id="fn4">4</a>: MN Hasan, _et al._, ["The Global Case-Fatality Rate of COVID-19 Has Been Declining Since May 2020"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8176487/), _Am J Tropical Med &amp; Hygiene_ 104:6, pp 2176-2184, 2021.  PMID: [33882025](https://pubmed.ncbi.nlm.nih.gov/33882025/), DOI: [10.4269/ajtmh.20-1496](https://dx.doi.org/10.4269/ajtmh.20-1496) [↩](#fn4a)  
