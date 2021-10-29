---
layout: post
title: FDA VRBPAC Considers Pfizer COVID-19 Vaccine for Kids 5 &ndash; 11
tags: COVID MathInTheNews PharmaAndBiotech Statistics
comments: true
---

Today the FDA's Vaccine and Related Biological Products Advisory Committee (VRBPAC) meets
to discuss an Emergency Use Authorization (EUA) for Pfizer's COVID-19 vaccine Comirnaty
for children ages 5 &ndash; 11.  Lots of parents have been awaiting this for the last year and a
half, with varying degress of frayed nerves.  


## What's the sitch?  

Today we begin the 4-step process for getting an EUA for pediatric vaccines for children:  
1. The FDA's VRBPAC committee of outside experts has to decide if the risk/benefit is
   favorable and recommend EUA to the FDA.  
2. The FDA administration has to say, "Yeah, right: let's do that."  This is typically a
   couple days to a week after the VRBPAC meeting.  
3. The CDC's ACIP committee of outside experts has to recommend to the CDC that this
   should be recommended medical practice in the US.  That's scheduled for next Tuesday, 
   2021-Nov-02.  
4. The CDC management has to say, "Ok, fine: that's now the standard."  

Normally this takes months, maybe a year because people are really careful about stuff
on which people will literally bet their lives.  Lately, with the urgency of COVID-19 and this
being an _emergency_ use authorization and all, it's instead been taking _weeks._  So this has been
quite fast: somebody is frantically turning the crank _really_ hard on machinery that was
never meant to go this fast.  So when they get things done, we should applaud them.  

If everything goes smoothly, vaccinations of kids 5 &ndash; 11 could start Wednesday 2021-Nov-03.  

Today is step 1.  


## Our trusty safari guides  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-stat.jpg" width="400" height="199" alt="STAT News: FDA VRBPAC meets on Pfizer vax for kids" title="STAT News: FDA VRBPAC meets on Pfizer vax for kids" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
As has apparently become the pandemic custom of this crummy little blog that nobody reads,
we will rely upon the formidable Helen Branswell and Matthew Herper of _STAT News_ to be
our guides on this safari. <sup id="fn1a">[[1]](#fn1)</sup>  They're live-blogging the
whole thing, and we'll tag along with them to get a couple extra pairs of eyes to point out the
more interesting sights along the way.  

They've already done us one favor in their preamble, pointing out that there was an
organized campaign of anti-vaxxers trying to lobby the VRBPAC members with mass emails to
stop the vaccine in its tracks:  

> Members of the the Vaccines and Related Biological Products Advisory Committee (VRBPAC)
> were deluged by an organized email campaign urging them not to recommend the vaccine.  
>  
> "Over the weekend I was getting about one email every minute," said VRBPAC member Paul
> Offit, a vaccines expert at Children’s Hospital of Philadelphia, who said by the time
> the weekend was over he had received "hundreds and hundreds."  

Scott Siskind once said, "I have only done a little bit of social science research, but it
was enough to make me hate people." <sup id="fn2a">[[2]](#fn2)</sup> It's at moments like
this that I sympathize with this view, when people deliberately try to sabotage public
health.  

For today, Pfizer tested doses of 10&mu;g, 20&mu;g, and 30&mu;g (the original dose for
adults) in a dose-finding Phase 1 trial.  They picked 10&mu;g and are today applying for
EUA for the 10&mu;g dose ages 5 &ndash; 11 as tested in a Phase 2/3 trial, and sticking with the
30&mu;g dose for 12 and older.  Pfizer says that dose in ages 5 &ndash; 11 a vaccine efficacy
(i.e., reduction in probability of infection compared to unvaccinated) of 91%.  As
historical vaccines go, that's excellent.  The issues will likely be (a) medical need, and
(b) side effects in otherwise healthy children who aren't at huge COVID-19 risk anyway.
Let's hope the latter are just headache and mild fever.  

They compared 1518 kids in the treatment arm (3 got COVID-19) vs 750 in the placebo arm
(16 got COVID-19), so it should be adequately powered to see reasonably-sized effects (but
_not_ rare events, like rare adverse events such as anaphylaxis). 

Just a guess based on the numbers in each arm: I bet they did 2:1 randomization into the
treatment vs placebo arms.  In fact, just from those 4 integers, we can do our own little
prediction of what they'll report for vaccine efficacy:   

$$
\begin{align*}
  \mbox{VE} &= 100\% \times \left(1 - \frac{\Pr\left(\mbox{infect} | \mbox{treatment}\right)}{\Pr\left(\mbox{infect} | \mbox{placebo}\right)}\right) \\
            &= 100\% \times \left(1 - \frac{3/1518}{16/750}\right) \\
            &= 100\% \times \left(1 - \frac{0.00198}{0.0213}\right) \\
	        &= 100\% \times \left(1 - 0.0930\right) \\
	        &= 90.7\% \sim 91\%
\end{align*}
$$

We can also get a (very crude) estimate of the 95% confidence limits, using a scaled
binomial model like the one
[we used on the Israeli Simpson Paradox dataset](https://www.someweekendreading.blog/covid-simpson/#addendum-2021-sep-02-vaccine-efficacy-confidence-intervals):  

```R
> library("gsDesign")
Loading required package: xtable
Loading required package: ggplot2
> NtrtInf <- 3
> NcntInf <- 16
> Ntrt    <- 1518
> Ncnt    <- 750
> 100.0 * (1 - rev(ciBinomial(NtrtInf, NcntInf, Ntrt, Ncnt, scale = "RR")))
    upper    lower
1 70.3731 97.10647
```

__Prediction:__ We predict they will report 90.7% vaccine efficacy, with a 95% confidence
limit of 70.4% &ndash; 97.1%, at least at a very na&iuml;ve level (their confidence limit
algorithm will be more sophisticated than this clunky one, and will take into account
censorship effects as people drop out of the trial).  

Better still, the vax kids had mild symptoms but the unvaxed kids had more pronounced
fevers and other symptoms.  So, overall pretty good.  


## The data sources  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-1.jpg" width="400" height="208" alt="FDA: VRBPAC meeting 2021-Oct-26 materials on Pfizer COVID-19 vax for kids" title="FDA: VRBPAC meeting 2021-Oct-26 materials on Pfizer COVID-19 vax for kids" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<iframe width="400" height="224" src="https://www.youtube.com/embed/laaL0_xKmmA" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
Of course we won't rely _entirely_ on our safari guides, experienced as they are.  We'll
also examine, perhaps superficially, the primary data sources from the FDA.  The meeting
announcement page <sup id="fn3a">[[3]](#fn3)</sup> also has on it pointers to all the
[meeting presentations](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials)
that the VRBPAC will consider.  For completists and obsessives, all 7 or 8 hours of the
hearings are livestreamed, and can be watched on YouTube as seen here.  

The agenda for the meeting (revised, for some reason) <sup id="fn4a">[[4]](#fn4)</sup>
contains pretty much the things you'd expect:  
- welcomes and introduction to the topic &amp; background,  
- CDC presentations on epidemiology and safety signals like myocarditis,  
- a Pfizer presentation analyzing their data,  
- an FDA presentation independently analyzing the same data,  
- some FDA surveys of post-authorization safety data and benefit/risk analysis,  
- the usual open public hearing to let in the craziness,  
- Q&amp;A, discussion, and voting.  

The discussion question that is supposed to determine what the committee recommends to the
FDA is <sup id="fn5a">[[5]](#fn5)</sup>:  

> <u>October 26, 2021 VRBPAC Meeting Voting Question</u>  
>  
> Based on the totality of scientific evidence available, do the benefits of the
> PfizerBioNTech COVID-19 Vaccine when administered as a 2-dose series (10 µg each dose, 3
> weeks apart) outweigh its risks for use in children 5 &ndash; 11 years of age?  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-2.jpg" width="400" height="387" alt="Pfizer: VRBPAC dossier on Pfizer COVID-19 vax for kids" title="Pfizer: VRBPAC dossier on Pfizer COVID-19 vax for kids" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-3.jpg" width="400" height="92" alt="FDA: FDA reanalysis of Pfizer COVID-19 vax for kids" title="FDA: FDA reanalysis of Pfizer COVID-19 vax for kids" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-4.jpg" width="400" height="256" alt="FDA: Review of safety and efficacy in kids 5 &ndash; 11" title="FDA: Review of safety and efficacy in kids 5 &ndash; 11" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-5.jpg" width="400" height="214" alt="FDA: Formal statement of EUA" title="FDA: Formal statement of EUA" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-6.jpg" width="400" height="211" alt="FDA: Post-market surveillance in FDA BEST system" title="FDA: Post-market surveillance in FDA BEST system" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-7.jpg" width="400" height="225" alt="FDA: Pediatric benefit-risk analysis" title="FDA: Pediatric benefit-risk analysis" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-8.jpg" width="400" height="223" alt="CDC: Epidemiology of COVID-19 for ages 5 &ndash; 11" title="CDC: Epidemiology of COVID-19 for ages 5 &ndash; 11" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-9.jpg" width="400" height="223" alt="FDA: EUA amendment" title="FDA: EUA amendment" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-10.jpg" width="400" height="208" alt="Pfizer: Analysis of vax data in kids 9-11" title="Pfizer: Analysis of vax data in kids 9-11" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-11.jpg" width="400" height="200" alt="CDC: mRNA COVID-19 vaccine-associated myocarditis" title="CDC: mRNA COVID-19 vaccine-associated myocarditis" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
There are 10 documents to review here:  
1. Ramachandra Naik of the FDA goes through the status of available vaccines, and what an
   EUA amendment would mean, then outlines the day's agenda. <sup id="fn6a">[[6]](#fn6)</sup> 
2. There is, of course, the Pfizer dossier. <sup id="fn7a">[[7]](#fn7)</sup>  It weighs in at
   82 pages, which is what one of the documents the VRBPAC committee members have to
   digest beforehand.  As previously, we'll glance through it but prefer the slide package
   below for explanations and visual material.  
3. Then there's the FDA's dossier, which reanalyzes the same data to see if the FDA
   scientists get the same results. <sup id="fn8a">[[8]](#fn8)</sup>  Weighing in at 39
   pages (Hey!  See that?  The government folk were _briefer_ than the private sector
   folk.), we'll again defer to the slide packages below.  
4. Next is a slide package from Leslie Ball of the FDA, reviewing the general background,
   study design, immunogenicity, efficacy, and safety of the pediatric
   trial. <sup id="fn9a">[[9]](#fn9)</sup>  This is more or less the FDA's reanalysis, in
   slide form.  
5. Then Doran Fink of the FDA discusses the purpose of the meeting: background on
   COVID-19, background in kids 5 &ndash; 11, statutory criteria for an EUA, and what the benefit/risk
   considerations should be. <sup id="fn10a">[[10]](#fn10)</sup>  
6. Hui-Lee Wong of the FDA discusses post-market active surveillance in the FDA's BEST
   system, for tracking safety and effectiveness of 
   biologics. <sup id="fn11a">[[11]](#fn11)</sup>  
7. Hong Yang of the FDA considers the benefit-risk results for COVID-19 mRNA vaccination
   in children age 5 &ndash; 11. <sup id="fn12a">[[12]](#fn12)</sup>  
8. Fiona Havers of the CDC discusses the epidemiology of COVID-19 in kids, presumably
   somewhat different from adults due to different immune systems and different life 
   exposures. <sup id="fn13a">[[13]](#fn13)</sup>  
9. WC Gruber of Pfizer presents their case for an EUA 
   amendment. <sup id="fn14a">[[14]](#fn14)</sup>  
10. Finally, Michael Oster of the CDC talks about mRNA COVID-19 vaccine-associated
    myocarditis in kids. <sup id="fn15a">[[15]](#fn15)</sup>  This will be interesting
    because it's associated with (a) males and (b) youth; will it be a problem in younger
    boys?  


## The keynote set by the FDA CBER head  

Matt Herper reports that Peter Marks, the head of FDA CBER, wanted to establish two
facts for the VRBPAC:  
1. _Unmet medical need:_  There is, in fact, significant harm to kids, especially from the
   Delta variant.  In ages 5 &ndash; 11 there have been 1.9 million infections, 8300
   hospitalizations (1/3 ICU admissions), 2500 cases of MIS-C (multisystem inflammatory
   syndrome in children; summary: you don't want your kids to get it), and over 100
   deaths.  That makes COVID-19 one of the top 10 causes of death in ages 5 &ndash; 11 for this
   period.  And of course, it has impacts on school closure.  
2. _Mandates:_ Mandates are out of scope for this committee; other bodies will decide
   that.  Just medical need, safety, and efficacy are on the table today.  


## Epidemiology and unmet medical need: does it happen often, and does it matter?  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-havers-1.jpg" width="400" height="226" alt="CDC, Havers: 1.9 million cases of COVID-19 in kids, a LOW estimate" title="CDC, Havers: 1.9 million cases of COVID-19 in kids, a LOW estimate" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-havers-2.jpg" width="400" height="221" alt="CDC, Havers: kids 5 &ndash; 11 were 10.6% of cases 2021-Oct-10" title="CDC, Havers: kids 5 &ndash; 11 were 10.6% of cases 2021-Oct-10" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-havers-3.jpg" width="400" height="226" alt="CDC, Havers: COVID-19 is now 8th leading cause of death of kids 5 &ndash; 11" title="CDC, Havers: COVID-19 is now 8th leading cause of death of kids 5 &ndash; 11" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Fiona Havers of the CDC, in discussiong the epidemiology of COVID-19 in kids, confirms
much of this.  The stratification by age indeed shows 1.9 million COVID-19 cases i ages
5 &ndash; 11.  Empirically, seroprevalence in that age group hints that the actual rate is much
higher, so the cases are probably under-reported.  

Kids ages 5 &ndash; 11 constituted 10.6% of the cases in the week of 2021-Oct-10, so it's not a
clinically rare thing at all!  

Finally, she shows that COVID-19 is now the 8th leading cause of death of kids age 5 &ndash; 11.  

I think we can now regard the case for epidemiological frequency and unmet medical need as
having been established.  _Thoroughly._  


## Myocarditis safety signals  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-ostler-1.jpg" width="400" height="326" alt="CDC, Ostler: Pre-COVID myocarditis was mostly male, mostly younger" title="CDC, Ostler: Pre-COVID myocarditis was mostly male, mostly younger" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-ostler-2.jpg" width="400" height="224" alt="CDC, Ostler: Vaccine-associated myocarditis in males is mostly under 30" title="CDC, Ostler: Vaccine-associated myocarditis in males is mostly under 30" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Matthew Ostler of the CDC is our guide: they've tracked case of myocarditis for 3-6
months.  He's got a _lot_ of stuff here, but I took away 2 things:  
1. Pre-COVID-19, myocarditis still happened.  But it happened in males most of the time
   (e.g., 8x more often in 15-year-old boys than girls).  Also, it declined rapidly with
   age, men and women reaching parity at about age 50.  So the incidence in myocarditis in
   young males is not _just_ a vaccine thing, it's how the world was.  
2. The table shows the risk in men is a few parts per million or less (around tenths of a
   part per million), _except_ in young males under 30 after the 2nd dose of an mRNA
   vaccine.  (The corresponding table for women never shows a risk above a few parts per
   million.)  

So the myocarditis risk is in a clearly identifiable population, that can be tracked by
doctors and hospitals.  (Though the threshold of age 30 vs age 50 for male/female parity
before COVID is puzzling.)  That's good, because we can either (a) encourage them to get
J&amp;J, or (b) follow up with them for after vaccination.  Elsewhere, Ostler shows the
main risk is also quite time-bounded, around the first 5 days or so after the 2nd dose of
mRNA vaccine.  

It's not _ideal_ that this happens, but it's in a population that medical people can
identify and watch, and it's a short period of time, and the inflammation usually resolves
with treatment.  So, not ideal, but we kind of know what to do about it.    Plus, it's a
risk faced by young boys even before COVID-19 and before mRNA vaccines.  

Finally, apparently the theory is that all this has something to do with testosterone.  So
we should see _less_ of it in young (pre-puberty) boys than in teenagers and young men.
Not exactly a guarantee, but at least it's a hint that the risk is lower for kids.  


## Risk-benefit analysis  

Hong Yang is our guide here: she's got models including how much COVID-19 spreads,
vaccine-associated myocarditis risk, and overall vaccine efficacy.  She compares risks
associated with vaccination and then reduced risk of COVID-19 vs no vax risk from not
being vaccinated but much higher COVID-19 risk (which causes _worse_ myocarditis, anyway).  

There's a lot here, but the summary position is: vax risks are mild, COVID-19 risks are
huge, and you're _way_ better off with vaccination.  Especially if the risk of myocarditis
is testosterone linked, then we should expect to see less of it in boys 5 &ndash; 11 years old.  

Sounds like the truth to me!  


## The Pfizer presentation  

Then we got to the main presentaiton by Pfizer, from William Gruber.  They're proposing a
10&mu;g dose, intramuscular, as 2 doses 3 weeks apart just like the adult version.  The
main difference is the pediatric dose is 1/3 the adult dose.  

Gruber confirmed that they did 2:1 randomization into the treatment and placebo arms of
the Phase 2/3 part of the trial, so that explains the ~1500 : 750 numbers we speculated
about above.  They were followed for 6 months, with 3 blood draws to measure
immunogenicity (baseline, 1 month, and 6 months).  

The side effects were mostly fever, fatigue, and headache &ndash; about what we'd expect.
There were SAEs reported, and were mostly what you'd also expect.  Interestingly, they
also reported "upper arm fracture" and "ingestion of a foreign body" (apparently a
5-year-old swallowed a penny, which _has_ been known to happen&hellip;): stuff that
happens to kids, but unlikely to be vaccine  related.  Remember in the Moderna trial, the
guy who had to
[report being struck by lightning?](https://www.someweekendreading.blog/moderna-struck-by-lightning/#3-saes-in-the-treatment-arm-of-the-moderna-trial)
Yeah, like that.  

But there was no anaphylaxis, no myocarditis (phew!), no Bell's palsy, etc.  

They did "immunobridging" studies, to compare immunity between 5 &ndash; 11 year olds vs 16-25
year olds, and saw that the immunity was comparable.  

It worked on both the reference strain and the Delta strain.  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-pfizer-gruber-1.jpg" width="400" height="218" alt="Pfizer, Gruber: VE = 90.7% (95% CL: 67.7% &ndash; 98.3%)" title="Pfizer, Gruber: VE = 90.7% (95% CL: 67.7% &ndash; 98.3%)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-pfizer-gruber-2.jpg" width="400" height="223" alt="Pfizer, Gruber: Beautiful Kaplan-Meier curve" title="Pfizer, Gruber: Beautiful Kaplan-Meier curve" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The main punchline we got out of it here at Chez Weekend was the vaccine efficacy: 90.7%
(spot on with the quick hack we did above to guess the point estimate of the efficacy!),
and with a 95% confidence limit of 67.7% &ndash; 98.3% (only slightly wider than our
estimate above of 70.4% &ndash; 97.1%).  The confidence interval is much wider than the
original clinical trial because of the number of subjects enrolled: about 2250 here, vs about
30,000 in the first trial.  That's typical once you know a medication is working in one
population, to bridge to another population you don't need to re-establish a tight
confidence interval (just safety, and some notion of comparable efficacy).  

The corresponding Kaplan-Meier curves, shown here, are a thing of beauty just like the
original clinical trial.  (About which
[Randall Monroe cartooned in XKCD #2400](https://xkcd.com/2400/) &ndash; "Statistics Pro
Tip: Always try to get data that's good enough that you don't need to do statistics to
it.")  The red curve shows infections vs time in the placebo arm; the blue curve shows
infections vs time in the vaccine arm.  Clearly, the vaccine is working and you don't need
a fancy statistician to tell you that!  (Though, as it happens, one just did.)  

So, yeah&hellip; another tour de force for mRNA vaccines.  


## The FDA presentations  

Leslie Ball presented on the general background, study design, immunogenicity, efficacy,
and safety of the pediatric trial.  My quick look through these slides showed
near-complete agreement with Pfizer, right down to 3 decimal place agreement in the
vaccine efficacy calculation.  This is what you generally hope for: the FDA reanalyzes
your raw data according to the clinical trial protocol, and throws a fit if they disagree
with your analysis.  

No fits thrown here.  Good.  

Hui-Lee Wong presented on the pharmacovigilance programs, especially the FDA's BEST system
for tracking events in bilogicals, showing how well it worked in the adult dataset, how it
tracked adverse events in about 1/3 of the US population, and so on.  A red flag here
would have been a disaster.  

No red flags thrown down on the field here.  Good.  


## Public comment period  

It was the usual cesspool of paranoia and ignorance.  I couldn't bear more than a few
sentences of it.  


## The vote  

The committee wanted to argue with the FDA about the wording of the question.  It was
clear that a "no" vote would mean no kids could get the vaccine.  They were less clear
about whether a "yes" vote would lead to mandates, despite being told earlier that
mandates are off topic for this meeting, and will be decided elsewhere (possibly at the
CDC ACIP meeting next week?).  

They pushed on this a couple of times, but Peter Marks of FDA/CBER more or less insisted
on the question as worded.  I'm not sure who's side I would take here; I just want to see
the pediatric vaccine move forward!  

At 4:16pm, they voted: 17 Yes, 0 No, and 1 Abstain.  

So it's recommended to the FDA administrators for approval.  

But what was the abstention about?  

According to Helen Branswell, it was Michael Kurilla.  Recall
[we previously noted that he abstained during the original Moderna approval hearing](https://www.someweekendreading.blog/moderna-vaccine-passes-vrbpac-review/#whats-the-sitch).
In that case, he thought the EUA was a bit much, preferring an "extended access protocol"
which would have opened the clinical trial to people at high risk, but _not_ given broad
access to the vaccine.  Seems like a bad idea to me, but at least he's consistent.  (I
don't know if he was on the original Pfizer committee, because there was 1 abstention
there, too.)  

<img src="{{ site.baseurl }}/images/hmpf.png" width="400" height="160" alt="Hmpf." title="Hmpf." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Interestingly, [Kurilla also argued against the need for a mix-and-match EUA](https://www.someweekendreading.blog/fda-covid-boosters-jnj-mixmatch/#the-mix-and-match-clinical-trial),
saying it wasn't necessary.  

Hmpf.  


## The Weekend Conclusion  

So the Pfizer vaccine ("Comirnaty", I hate that name) is now successfully past the first
hurdle: the VRBPAC has recommended pediatric EUA status to the FDA administrators.  The remaining 3
steps are:  
1. The FDA administrators have to agree, which looks very likely to happen.  
2. The CDC's ACIP committee, which meets 7 days from now, has to recommend to the CDC that
   pediatric vaccination with Pfizer should be standard practice.  
3. The CDC administrators have to agree and make the recommendation.  

So far, the data looks excellent on both the safety and efficacy front, so if there's
going to be any problem I can't see it from here.  (Other than: I wish this whole process
were faster?!)  

Looks like you'll soon be able to vaccinate your kids!  

The things on the horizon I'd like to see moving faster:  
- Similar pediatric approvals for Moderna and J&amp; J.  
- The last remaining age cohort: infant pediatric studies, i.e., ages 6 months up to 5
  years, for all 3 vaccines.  I believe these are still in clinical trials, but haven't
  really checked.  
- Full approval for Moderna and J&amp;J, to put them on an even footing with Pfizer and
  tamp down a bit on the paranoia and superstition of the resisters.  
  
But for today&hellip; it looks like this was a good day.  


## Addendum 2021-Oct-29: FDA authorization  

<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-stat-fda-approval.jpg" width="400" height="177" alt="STAT News: FDA grants EUA for pediatric Pfizer COVID vaccine" title="STAT News: FDA grants EUA for pediatric Pfizer COVID vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-10-26-fda-pfizer-pediatric-fda-fda-approval.jpg" width="400" height="248" alt="FDA: EUA Authorization for pediatric Pfizer COVID vaccine" title="FDA: EUA Authorization for pediatric Pfizer COVID vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Today the FDA adminitrators took step (2) above, and granted formal EUA for
Pfizer's Comirnaty in 5 &ndash; 11 
year olds. <sup id="fn16a">[[16]](#fn16)</sup> <sup id="fn17a">[[17]](#fn17)</sup>  

Both _STAT News_ and the FDA press release quoted Woodcock:  

> "As a mother and a physician, I know that parents, caregivers, school staff, and
> children have been waiting for today's authorization. Vaccinating younger children
> against COVID-19 will bring us closer to returning to a sense of normalcy," said Acting
> FDA Commissioner Janet Woodcock, M.D. "Our comprehensive and rigorous evaluation of the
> data pertaining to the vaccine's safety and effectiveness should help assure parents and
> guardians that this vaccine meets our high standards."  

The FDA press release also notes a couple epidemiological facts:  
- Kids 5 &ndash; 11 make up 39% of COVID-19 cases in those under 18 in the US.  
- Those aren't all mild cases, either: 8300 COVID-19 _hospitalizations_ in kids 5 &ndash; 11 so
  far.  As of 2021-Oct-17:  
  - 691 of those 8300 cases under 18 are now dead, and  
  - 146 of those dying were kids 5 &ndash; 11.  

Those 2 facts mean: we're biting a _big chunk_ out of a _real risk_ to our kids this way.  

Interestingly, the FDA also authorized a manufacturing change for Pfizer.  They can now
incorporate Tris buffer, a commonly used buffer in many other approved medications, to
maintain stable pH.  This makes the vaccine's cold chain requirements a bit less
stringent, which should lessen the logistics headaches of getting it distributed
everywhere.  

Step (3) above, the meeting of the ACIP committee of the CDC, occurs next Tuesday
2021-Nov-02.  

While the risk of myocarditis appears to be small here, this pediatric trial was not
adequately powered (not enough subjects enrolled) to quantify rare events.  If the theory
that vaccine-associated myocarditis is linked to testosterone is correct, then it's not an
issue for pediatric use.  Also, the FDA models indicate there would be fewer myocarditis
hospitalizations with the vaccine than with the COVID-19 cases from no vaccine.  

But on the other hand, given this small trial _we really just don't know for sure._ If
there's one thing docs on regulatory boards hate, it's not knowing for sure that they're
not actually harming people.  That should be a subject of active debate next Tuesday at
the ACIP meeting.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: H Branswell &amp; M Herper, ["Tracking the FDA advisory panel meeting on Covid-19 vaccines for kids"](https://www.statnews.com/2021/10/26/pfizer-covid19-vaccine-kids-vrbpac-fda/), _STAT News_, 2021-Oct-26. [↩](#fn1a)  

<a id="fn2">2</a>: Scott Alexander Siskind, ["LIZARDMAN’S CONSTANT IS 4%"](https://slatestarcodex.com/2013/04/12/noisy-poll-results-and-reptilian-muslim-climatologists-from-mars/), _Slate Star Codex_, 2013-Apr-12. [↩](#fn2a)  

<a id="fn3">3</a>: FDA Staff, ["Vaccines and Related Biological Products Advisory Committee October 26, 2021 Meeting Announcement"](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement), FDA VRBPAC 2021-Oct-26 Materials, retrieved 2021-Oct-26.  The [meeting presentations](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials) are further down the page. [↩](#fn3a)  

<a id="fn4">4</a>: FDA Staff, ["170th Meeting of the Vaccines and Related Biological Products Advisory Committee October 26, 2021 DRAFT AGENDA (revised)"](https://www.fda.gov/media/153505/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26. [↩](#fn4a)  

<a id="fn5">5</a>: FDA Staff, ["10/26 Discussion Question"](https://www.fda.gov/media/153476/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26. [↩](#fn5a)  

<a id="fn6">6</a>: R Naik, ["Pfizer-BioNTech COVID-19 Vaccine Emergency Use Authorization Amendment Request for Use in Children 5 through 11 Years of Age"](https://www.fda.gov/media/153509/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn6a)  

<a id="fn7">7</a>: Pfizer staff, ["BNT162B2 [COMIRNATY (COVID-19 VACCINE, MRNA)] VACCINES AND RELATED BIOLOGICAL PRODUCTS ADVISORY COMMITTEE BRIEFING DOCUMENT"](https://www.fda.gov/media/153409/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26. [↩](#fn7a)  

<a id="fn8">8</a>: FDA staff, ["FDA Briefing Document: EUA amendment request for Pfizer-BioNTech COVID-19 Vaccine for use in children 5 through 11 years of age"](https://www.fda.gov/media/153447/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26. [↩](#fn8a)  

<a id="fn9">9</a>: L Ball, ["FDA Review of Effectiveness and Safety of Pfizer-BioNTech COVID-19 Vaccine in Children 5 through 11 Years of Age _Emergency Use Authorization Amendment_"](https://www.fda.gov/media/153510/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn9a)  

<a id="fn10">10</a>: DL Fink, ["Pfizer-BioNTech COVID-19 Vaccine: Request for Emergency Use Authorization (EUA) Amendment, Use of a 2-Dose Primary Series in Children 5 &ndash; 11 Years of Age"](https://www.fda.gov/media/153512/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn10a)  

<a id="fn11">11</a>: H-L Wong, ["Post-Market Active Surveillance of COVID-19 Vaccines in the Pediatric Population in the FDA BEST System"](https://www.fda.gov/media/153511/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn11a)  

<a id="fn12">12</a>: H Yang, ["Benefits-Risks of Pfizer-BioNTech COVID-19 Vaccine for Ages 5 to 11 Years"](https://www.fda.gov/media/153507/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn12a)  

<a id="fn13">13</a>: F Havers, ["Epidemiology of COVID-19 in Children Aged 5 – 11 years"](https://www.fda.gov/media/153508/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn13a)  

<a id="fn14">14</a>: WC Gruber, ["BNT162b2 (COVID-19 Vaccine, mRNA) Vaccine – Request for Emergency Use Authorization in Individuals 5 to <12 Years of Age"](https://www.fda.gov/media/153513/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn14a)  

<a id="fn15">15</a>: M Oster, ["mRNA COVID-19 Vaccine-Associated Myocarditis"](https://www.fda.gov/media/153514/download), [FDA VRBPAC 2021-Oct-26 Materials](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-october-26-2021-meeting-announcement#event-materials), retrieved 2021-Oct-26.  [↩](#fn15a)  

<a id="fn16">16</a>: M Herper, ["FDA authorizes Pfizer Covid-19 vaccine for children aged 5 to 11"](https://www.statnews.com/2021/10/29/fda-pfizer-vaccine-covid19-children/), _STAT News_, 2021-Oct-29. [↩](#fn16a)  

<a id="fn17">17</a>: [FDA Office of Media Affairs](mailto:fdaoma@fda.hhs.gov), ["FDA Authorizes Pfizer-BioNTech COVID-19 Vaccine for Emergency Use in Children 5 through 11 Years of Age"](https://www.fda.gov/news-events/press-announcements/fda-authorizes-pfizer-biontech-covid-19-vaccine-emergency-use-children-5-through-11-years-age), US FDA press announcements, 2021-Oct-29. [↩](#fn17a)  
