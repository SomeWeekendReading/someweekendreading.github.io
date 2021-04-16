---
layout: post
title: Another study of clotting and COVID vaccines
tags: COVID MathInTheNews PharmaAndBiotech 
comments: true
---

Another study has come out, comparing clotting risks of COVID-19 and various vaccines
versus each other.  What are the risks?  And can we interpret the study the obvious way,
or not?  


## Thrombosis and you  

Everybody's worried about thrombosis, now that 
[the US has paused the JnJ vaccine]({{ site.baseurl }}/jnj-thrombosis-pause/)
and 
[similar cautions have cropped up for the AZ/OX vaccine in Europe](https://www.someweekendreading.blog/azox-vaccine-thrombo/).
Both of those are [viral vector vaccines](https://en.wikipedia.org/wiki/Viral_vector_vaccine),
and one dark suspicion is that this is a "class effect", i.e., all viral vector vaccines
might have thrombosis problems.  As 
[the only other viral vector vaccines currently in existence are for Ebola](https://en.wikipedia.org/wiki/Ebola_vaccine),
_we do not yet have sufficient evidence to conclude this._  
 
Even more strangely, people worry about the risk of blood clots from the Pfizer and
Moderna vaccines, which are mRNA vaccines and thus a _totally different mechanism_.  It
would be pretty weird if blood clotting was a class effect of immunization against
COVID-19.  

So&hellip; is it?  


## A new study of blood clotting in COVID patients and vaccinees  

<img src="{{ site.baseurl }}/images/2021-04-16-covid-vaccines-and-clots-oxford-pr.jpg" width="400" height="454" alt="Univ Oxford PR: COVID-19 clot risk greater than vaccines" title="Univ Oxford PR: COVID-19 clot risk greater than vaccines" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-16-covid-vaccines-and-clots-oxford-preprint.jpg" width="400" height="287" alt="Taquet, et al.: Retrospective study of thrombosis in COVID patients and vaccinees" title="Taquet, et al.: Retrospective study of thrombosis in COVID patients and vaccinees" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
There's a pre-print out from the University of Oxford on this subject, announced in a 
press release <sup id="fn1a">[[1]](#fn1)</sup> and posted as a pre-print (not yet peer 
reviewed). <sup id="fn2a">[[2]](#fn2)</sup>  

At first glance, it's a beautiful thing: they synthesized medical records of vaccinees and
COVID patients (and influenza vaccinees as a control) from the European Medicines Agency
(EMA) monitoring in Europe, and from the TriNetX federated electronic health records from
59 healthcare agencies mostly in the US.  Getting data from huge medical institutions like
that is something of a minor triumph, navigating HIPAA and HL7, and lions &amp; tigers
&amp; bears, oh my.  Seriously: that's a boatload of work, and deserves respect.  

The populations were huge: 500k COVID patieents, 480k mRNA vaccinees, and a whopping 34
million AZ/OX vaccinees.  (They did not evaluate the JnJ vaccinees.) As a statistician
always concerned whether a study is has adequate statistical power, this gives me a happy.  

Just to be very thorough, they looked at CSVT as well as portal vein thrombosis (PVT, in
the liver).  I like the thorough approach.  Whichever way the conclusion comes out here,
I'm starting to like these guys.

<img src="{{ site.baseurl }}/images/2021-04-16-covid-vaccines-and-clots-oxford-preprint-fig1p13.jpg" width="400" height="188" alt="Taquet, et al., Figure 1, p. 13: Incidence of CVT in 2 weeks after health events" title="Taquet, et al., Figure 1, p. 13: Incidence of CVT in 2 weeks after health events" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-04-16-covid-vaccines-and-clots-oxford-preprint-figs2p22.jpg" width="400" height="131" alt="Taquet, et al., Figure S2, p. 22: Incidence of CVT in 2 weeks after health events" title="Taquet, et al.: Incidence of CVT in 2 weeks after health events" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
They curiously don't present their main result in a table, forcing me to dig it out of the
text.  (If I were a referee here, _that_ would be a rather pointed bit of advice: never
make your reader hunt for your conclusion; make it _painfully_ obvious!)  But, ok&hellp;
after a bit of excavation of word salad, we find they report on CVT event rates within 2 weeks after
diagnosis with COVID (or flu, as a control) or vaccination.  

The resulting CVT event rates and their 95% confidence limits were (pp 2-3):  

| Medical event          | CVT / million | 95% LCL | 95% UCL |
|:-----------------------|--------------:|--------:|--------:|
| COVID-19 diagnosis     | 39.0          | 25.2    | 60.2    |
| Influenza diagnosis    |  0.0          |  0.0    | 22.2    |
| COVID-19 mRNA vaccine  |  4.1          |  1.1    | 14.9    |
| AZ/OX vaccine          |  5.0          |  4.3    |  5.8    |

Figure 1 from p 13, shown here, presents this data graphically, along with the exact
population sizes studied.  Figure S2, p 22 in the supplement, shows the highly significant
result with [Fisher's Exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test)
between the COVID-19 cohort and the vaccinee cohort, i.e.,
_getting vaccinated however you make that happen lowers your risk compared to getting
COVID-19_.  (Notably, they _do not_ test statistical significance of CVT rates between
mRNA vaccines vs the AZ/OX vaccine, for reasons we explore below.)  

Their conclusion is one with which it's quite easy to agree, namely that getting
vaccinated is hella better than getting COVID-19:
> These data show that the incidence of CVT issignificantly increased after
> COVID-19,andgreater than that observed with BNT162b2 and mRNA-1273 COVID-19 vaccines.


## Some cautions and some pushback  

Now, the thing that's getting some side-eye here is that rows 3 &amp; 4 of the table above
show the _CVT clotting risk of the mRNA vaccines and the AZ/OX vaccines to be comparable!_
That's&hellip; peculiar!  

Surely, since the clotting events were noticed and so loudly reported for the AZ/OX and
JnJ vaccines, they would have been similarly reported for the Pfizer or Moderna vaccines
if they had been observed?  Already the dark corners of the internet are forming
conspiracy theories about the government lying about adverse events&hellip;  

First, let's note that the authors of the paper themselves want to disabuse you of
thinking this comparison is valid.  From their conclusions section, the tell us that the
various populations data-mined from EMR systems are not especially well matched.  That
makes a difference when some places are preferntially vaccinating the elderly, while
others are not:  

>First, the  magnitude  of  the  COVID-19  risk versus the population baseline, or versus
>influenza, is not based on cohorts which were matched for age or other demographic
>factors.  For the same reason, we cannot conclude that the mRNA vaccines studied here are
>associated with an increased riskof CVT; far larger samples are needed to address this
>question. 

Also, this depends on the right thing being coded into the EMR databases, and being
federated into a unified database utterly without error.  This is clearly a problem;
anybody who's wrestled with [ICD10](https://www.icd10data.com/) codings and 
[HL7](https://www.hl7.org/) systems probaby still has nightmares about it:  

> Second, we have no information about diagnostic accuracy or completeness, though this is
> likely to be less  of  an  issue  for  CVT  or  PVT  compared  to  many  diagnosessince
> radiological  confirmation  is typically needed.

Also, we don't have lab tests on whether these CVT events are even comparable.  We could
be comparing apples and oranges&hellip; or apples and sledgehammers:  

> Third, the absence of key haematological laboratory data from many patients limits our
> ability to comment on whether the mechanism of CVT after COVID-19 is likely to be
> similar or different from that observed after ChAdOx1 nCoV-19, especially regarding
> anti-platelet factor 4 (PF4) antibodies (Greinacher et al 2021; Schultz et al 2021). 

Also, the EMA monitoring system and the EHR network in the US are just _fundamentally
different_, so we're skating on ice so thin it might as well be surface tension:  

> Finally, we cannot directly compare the risks of CVT associated with ChAdOx1 nCoV-19
> with any of the other vaccines, or with COVID-19, since we are using data collected by
> the EMA monitoring system, not from the electronic health records network. (No  patients
> in  the  network had  received ChAdOx1  nCoV-19, reflecting  the  fact  that  the
> network  isalmost entirely US-based). 

On the one hand: gee, that's too bad.  On the other: this is an example of scrupulous
scientific honesty, and you should be applauding now.  (Though sadly, regretting the study
isn't what we all want it to be.)  

<img src="{{ site.baseurl }}/images/2021-04-16-covid-vaccines-and-clots-cbs.jpg" width="400" height="168" alt="CBS: COVID thrombosis risk and pushback on vaccine risk" title="CBS: COVID thrombosis risk and pushback on vaccine risk" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
There was of course pushback from other sectors, as well.  I'm not a fan of the general
media for this short of thing.  But since [STAT News](https://www.statnews.com/) doesn't
have an article up yet on this, I turned to a CBS news article <sup id="fn3a">[[3]](#fn3)</sup>.
Slightly to my (pleasant) surprise, it turned out to be pretty good.  

Pfizer commented on the confusing study design (presumably for the issues the authors
themselves raised above):

> Pfizer said that its own "comprehensive assessment of ongoing aggregate safety
> data... provided no evidence to conclude that arterial or venous thromboembolic events,
> with or without thrombocytopenia, are a risk associated with the use of our COVID-19
> vaccine."  
> &hellip;  
>Pfizer noted that a CDC review of data had detected slightly more cases of CVT in people
>given the Johnson & Johnson vaccine in the U.S., but "no similar findings have been
>observed with the authorized Pfizer-BioNTech vaccine."  

Tony Fauci, peripatetic head of NIAID, said it had "many many&hellip; procedural gaps"

> "Suggesting that the complication [CVT] following one vaccine is similar to that of the
> other... it is impossible, the way this study was designed and conducted, to make that
> determination"  
> &hellip;  
> "that confusion will be straightened out and it will be clear that you cannot make any
> statement, the way this is designed, about the adverse events following the vaccination
> with the mRNA comparing to anything else."  

But everybody agreed with the main conclusion: vaccination is better than getting COVID!

## The Weekend Conclusion  

While worth watching, the comparison of CVT risk between mRNA and AZ/OX vaccines is
probably not something to take seriously yet, unless it's confirmed in more homogeneous
datasets.  

But the story on CVT risk for COVID-19 patients vs vaccinees is clear: get yourself
vaccinated!  


---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Oxford University News &amp; Events, ["https://www.ox.ac.uk/news/2021-04-15-risk-rare-blood-clotting-higher-covid-19-vaccines"](https://www.ox.ac.uk/news/2021-04-15-risk-rare-blood-clotting-higher-covid-19-vaccines), Oxford Press Releases, 2021-Apr-15.[↩](#fn1a)  

<a id="fn2">2</a>: M Taquet, _et al._, ["Cerebral venous thrombosis: a retrospective cohort study of 513,284 confirmed COVID-19 cases and a comparison with 489,871 people receiving a COVID-19 mRNA vaccine"](https://osf.io/a9jdq/), Oxford preprit shared on OSF.io, retrieved 2021-Apr-16.[↩](#fn2a)  

<a id="fn3">3</a>: T Reals &amp; S Berriman, ["Study shows vaccines carry much lower risk of blood clots than COVID-19"](https://www.cbsnews.com/news/covid-vaccine-blood-clots-study-pfizer-astrazeneca-moderna-oxford/), _CBS News_, 2021-Apr-16. [↩](#fn3a)  
