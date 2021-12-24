---
layout: post
title: FDA Authorizes Paxlovid
tags: COVID PharmaAndBiotech 
comments: true
---

&hellip; aaaaand, today [the suspense is over](https://www.someweekendreading.blog/veni-veni-paxlovid/#addendum-2021-dec-21-rumor-has-fda-approval-this-week): the FDA has authorized paxlovid.  


## Paxlovid is legal  

<img src="{{ site.baseurl }}/images/2021-12-22-paxlovid-approved-stat.jpg" width="400" height="188" alt="Herper @ STAT: FDA Authorizes Paxlovid" title="Herper @ STAT: FDA Authorizes Paxlovid" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-12-22-paxlovid-approved-fda.jpg" width="400" height="176" alt="FDA: Paxlovid authorized" title="FDA: Paxlovid authorized" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Matthew Herper at _STAT News_ is, as usual, on the case.  <sup id="fn1a">[[1]](#fn1)</sup>
There was the official FDA news relase this morning.  <sup id="fn2a">[[2]](#fn2)</sup>  

This is not full approval, but an Emergency Use Authorization.  Because&hellip;
_emergency._  Another sign of their efforts at speed is that they didn't convene the AMDAC
committee of external advisors to pass judgement, like they did with molnupiravir.  This
indicates (a) they're in a hurry to get this out, and (b) the data are really, very, very,
good.  

The authorization is for age 12 and up.  

Mysteriously, it is _not_ authorized for prevention in case of exposure.  Maybe the drug
interactions of the ritonavir component have people feeling a bit cautious.  They did
explicitly mention this.  

The FDA accepted that the efficacy vs hospitalization was 88%.  


## The Weekend Conclusion  

Here at Chez Weekend, we also approve _fully._  (Not that anyone should care about that.
Instead, care about people getting effective treatment: A Good Thing.)  


## Addendum 2021-Dec-23: A trawl through the data  

One of the drawbacks to sidestepping the advisory committes (AMDAC or VRBPAC) is that we
don't get public availability of the filing documents, the slide decks, and so on.  Those
are _really_ informative.  

But here, [as with evusheld](https://www.someweekendreading.blog/fda-evusheld/), we have
to rely on skimpier sources, starting with the FDA press release.  So here's what we've
got, working forward from the press release and following links:  

- The clinical trial itself, called EPIC-HR and given the id NCT04960202 at
  ClinicalTrials.gov. <sup id="fn3a">[[3]](#fn3)</sup>  Sadly, no raw data here to feed
  into the Weekend R Pipeline.  This is one of the reasons I wish they'd had a (fast)
  AMDAC meeting, because then all the documents would be available.  
- The Pfizer fact sheet for patients, parents, and caregivers, i.e., explaining to
  non-medical people what's happening to them. <sup id="fn4a">[[4]](#fn4)</sup>  Seems
  pretty basic: 
  - Tell your doc about allergies, liver/kidney disease, pregnancy, breastfeeding, etc.  
  - Also, I'm glad to see they emphasize telling your doc about _all_ your meds.  One of
    the components of paxlovid is ritonavir, which inhibits liver breakdown via CYP3A of many drugs
    (deliberately: it makes the other component, nirmatrelvir, last longer in your body).
    So it interacts _by design_ with other drugs, and you have to watch for that.  
  - There's a list on page 3 of drugs that, when taken, mean you can't have paxlovid.
    Some are pretty typical, like a couple statins in very wide use; some are odd, like
    St. John's Wort (an herbal supplement).  
  - A worrisome side effect: If you have untreated HIV, paxlovid may lead to some HIV meds
    not working as well in the future.  
  - Also, there's a Pfizer site for consumer side-effect/adverse event reports.  
- The Pfizer fact sheet for healthcare providers, with a lot more technical information
  and pragmatic use guidelines. <sup id="fn5a">[[5]](#fn5)</sup>  This is 29 pages of
  detail in the usual medical jargon about how to prescribe it, to whom, what to watch out
  for, interactions with other drugs (a __lot__ of them!), cautions around pre-existing
  liver and kidney disease, and so on.  It goes on for a good long while, and while I at
  least glanced at each page, I didn't give it a deep read.  
  - There really are a lot of cautions about drug interactions, so it's good to see that
    taken seriously.  
  - The business about HIV drugs not working as well if you already have HIV is explained:
    apparently HIV can evolve escape mutations around ritonavir, which is a component of
    the usual HIV cocktail.  (The HIV cocktail is a complicated combination designed to
    make it hard for the HIV virus to evade all of them.  But just 1, it can evade.)  
<img src="{{ site.baseurl }}/images/2021-12-22-paxlovid-approved-nirmatrelvir.jpg" width="200" height="183" alt="Struture of nirmatrelvir" title="Struture of nirmatrelvir" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-12-22-paxlovid-approved-ritonavir.jpg" width="451" height="183" alt="Structure of ritonavir" title="Structure of ritonavir" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
  - The former pharma nerd in me can't resist the structural diagrams for nirmatrelvir and
    ritonavir.  I always admired med chemists: not only can they make these
    battleship-sized molecules, but they can design a scalable pipeline that does it
    reliably, over and over, making the exact same thing each time.  
  - There's also the final, official, all i's dotted, all t's crossed report on efficacy.
    In the paxlovid arm, $N_p = 1039$ subjects, of whom $K_p = 8$ were hospitalized.  In
    the placebo arm, $N_0 = 1046$ subjects, of whom $K_0 = 66$ were hospitalized.  My
    [wheezy little R script]({{ site.baseurl }}/assets/2021-11-12-covid-treatments-simple-efficacy-confidence-limits.r)
    says that's an efficacy against hospitalization of 87.8% (95% CL: 75.1% &ndash; 94.0%):  
	```R
    > signif(efficacyAndCL(1039, 8, 1046, 66), digits = 3)
      LCL   Eff   UCL 
    0.751 0.878 0.940 
    ```
  - The same for death rates: 0 in the paxlovid arm, 12 in the placebo arm.  That gives an
    efficacy vs death of 100% (95% CL: 67.9% &ndash; 100%):  
    ```R
    > signif(efficacyAndCL(1039, 0, 1046, 12), digits = 3)
	  LCL   Eff   UCL 
	0.679 1.000 1.000 
	```
<a href="{{ site.baseurl }}/images/2021-12-22-paxlovid-approved-stratification.jpg"><img src="{{ site.baseurl }}/images/2021-12-22-paxlovid-approved-stratification-thumb.jpg" width="400" height="280" alt="Paxlovid efficacy stratified by various patient groups" title="Paxlovid efficacy stratified by various patient groups" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
  - There's also (p. 27, click to embiggen) a nice stratification by age, gender, symptom
    onset delay, BMI, diabetes, and so on of factors thought to be influential.  It's nice
    to see the % change in hospitalization is statistially significant with nearly all
    subgroups.  
- The FDA's FAQ on the paxlovid EUA. <sup id="fn6a">[[6]](#fn6)</sup>  Basically
  explanations of what an EUA means, who can prescribe, and so on.  
- The official letter from the FDA's acting chief scientist, granting the 
  EUA.  <sup id="fn7a">[[7]](#fn7)</sup>  This one goes on for 11 pages; I'm always
  surprised at how long they are.  
  - Some of it is detail about which sections of the FDA Act apply.  If you care about
    that, you're probably a lawyer and don't need me to tell you about it.  If you care
    about it and are _not_ a lawyer, then I slightly fear you.  
  - It specifies the prescribing guidelines, the appearance of the pills, the required
    package inserts, reporting adverse events, monthly reporting on viral variants
    relevant to resistance (presumably 3CLpro mutants?)&hellip; all kinds of stuff.  
  - The crucial bit:  
    > Having concluded that the criteria for issuance of this authorization under Section
    > 564(c) of the Act are met, I am authorizing the emergency use of PAXLOVID for the
    > treatment of mild-tomoderate COVID-19 in certain adults and pediatric patients, as
    > described in the Scope of Authorization section of this letter (Section II) and
    > subject to the terms of this authorization.  

So, no big surprises.  Other than that it got done so suddenly, without an advisory committee
meeting.  


## Addendum 2021-Dec-23: And in related news&hellip; molnupiravir is _also_ legal  

Honestly, I though Merck's molnupiravir was dead in the water:
[equivocal recommendation from the AMDAC](https://www.someweekendreading.blog/fda-molnupiravir/),
worries about mutagenicity particlarly in pregnancy, worries about breeding new
variants, weeks of inaction by FDA administrators after the AMDAC meeting, hints that an
EUA could be withdrawn if "something better" showed up (like paxlovid)&hellip; the list
goes on.  

But I'm happy to report being wrong: today the FDA gave an EUA for molnupiravir, 
too. <sup id="fn8a">[[8]](#fn8)</sup>  Now, true, they loaded it up with a bunch of
restrictions, but those seem appropriate.  Such as, "only when other authorized therapies
are not accessible or not clinically appropriate", i.e., last-resort situations.  

The pregnancy issue is an interesting one.  Women are recommended to get a negative
pregnancy test before treatment, then to use contraception during treatment and for 4 days
after.  Men, on the other hand, are urged to use contraception during treatement and _for
the following 3 months!_

Availability: Merck has hundreds of thousands of courses available _now_, with 1 million
courses over the next few weeks in the US and 10 million to be shipped worldwide.  It will
be in greater supply than paxlovid for the first few months of 2022.  

Now if only somebody would do a combination trial involving paxlovid, molnupiravir, and
fluvoxamine.  Heck, maybe even monoclonal abs, too.  Gotta be a good
[Loewe synergy](https://en.wikipedia.org/wiki/Loewe_additivity) score in
there somewhere, with all those different mechanisms of action.  

Of course you should _still_ get vaccinated.

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: M Herper, ["FDA authorizes Pfizer pill to treat Covid-19 in patients as young as 12"](https://www.statnews.com/2021/12/22/fda-authorizes-pfizer-pill-to-treat-covid-19-in-patients-as-young-as-12/), _STAT News_, 2021-Dec-22. [↩](#fn1a)  

<a id="fn2">2</a>: [C Tantibanchachai](mailto:chanapa.tantibanchachai@fda.hhs.gov), ["Coronavirus (COVID-19) Update: FDA Authorizes First Oral Antiviral for Treatment of COVID-19"](https://www.fda.gov/news-events/press-announcements/coronavirus-covid-19-update-fda-authorizes-first-oral-antiviral-treatment-covid-19), _FDA News Releases_, 2021-Dec-22. [↩](#fn2a)  

<a id="fn3">3</a>: Pfizer Staff, ["EPIC-HR: Study of Oral PF-07321332/Ritonavir Compared With Placebo in Nonhospitalized High Risk Adults With COVID-19"](https://clinicaltrials.gov/ct2/show/NCT04960202), ClinicalTrials.gov, downloaded 2021-Dec-23. [↩](#fn3a)  

<a id="fn4">4</a>: Pfizer Staff, ["FACT SHEET FOR PATIENTS, PARENTS, AND CAREGIVERS: EMERGENCY USE AUTHORIZATION (EUA) OF PAXLOVID FOR CORONAVIRUS DISEASE 19 (COVID-19)"](https://www.fda.gov/media/155051/download), FDA.gov, downloaded 2021-Dec-23. [↩](#fn4a)  

<a id="fn5">5</a>: Pfizer Staff, ["FACT SHEET FOR HEALTHCARE PROVIDERS: EMERGENCY USE AUTHORIZATION FOR PAXLOVID(TM)"](https://www.fda.gov/media/155050/download), FDA.gov, downloaded 2021-Dec-23. [↩](#fn5a)  

<a id="fn6">6</a>: FDA Staff, ["Frequently Asked Questions on the Emergency Use Authorization for Paxlovid for Treatment of COVID-19"](https://www.fda.gov/media/155052/download), FDA.gov, downloaded 2021-Dec-23. [↩](#fn6a)  

<a id="fn7">7</a>: JA O'Shaughnessy (Acting Chief Scientist, FDA), ["Official Letter of Emergency Use Authorization"](https://www.fda.gov/media/155049/download), FDA.gov, downloaded 2021-Dec-23. [↩](#fn7a)  

<a id="fn8">8</a>: M Herper, ["FDA authorizes Merck’s Covid-19 pill, but stresses its use should be limited"](https://www.statnews.com/2021/12/23/fda-authorizes-mercks-covid-19-pill-but-stresses-its-use-should-be-limited/), _STAT News_, 2021-Dec-23. [↩](#fn8a)  
