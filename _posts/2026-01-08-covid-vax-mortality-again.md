---
layout: post
title: Revisiting All-Cause Mortality and COVID-19 Vaccines
tags: COVID JournalClub MathInTheNews PharmaAndBiotech Politics
comments: true
commentsClosed: true
---

People are _still_ worried about mortality from all causes after COVID-19 vaccination.  So
let's go through the scientific literature and see&hellip; well, that these worries are,
at _best_, misplaced.  


## The Backgrounder  

Let's start with the very, _very_ bad results that vaccine disinformation is having, all
the way down to the doctor-patient relationship.  This stuff is just plain, pure, _evil._  

<img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-stat-1.jpg" width="400" height="233" alt="Kuppalli @ STAT: Anti-science disinformation interfering with doctor-patient relationship" title="Kuppalli @ STAT: Anti-science disinformation interfering with doctor-patient relationship" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Since you probably don't want to take my word for it, consider Dr. Krutika Kuppalli,
writing recently in _STAT News_.  <sup id="fn1a">[[1]](#fn1)</sup>  She is an infectious
diseases physician, whose work focuses on emerging infectious diseases, outbreak response,
vaccine policy, and clinical care of complex infections. She knows a thing or two about
both diseases &amp; vaccines, and also about how to make the right thing happen in patient
care.  

She compares caring for patients now to something like a war zone:  

> I have spent my career caring for people facing some of the world’s most dangerous
> infectious diseases — Ebola, mpox, Covid-19. I have worked in outbreak zones, in
> understaffed hospitals, in field units built out of necessity. I’ve seen firsthand how
> vaccines transform the trajectory of a disease, a community, and a country.  
>  
> But nothing has prepared me for the exam room conversations I’m having now.  
> 
> Over the past few years, the rise of anti-science and anti-vaccine rhetoric has
> fundamentally changed the relationship between clinicians and patients. It has made
> routine preventive care feel like walking into an ideological minefield. Increasingly,
> it is making it harder and sometimes nearly impossible to protect patients’ health.  

Whenever the concept of life-saving vaccinations come up, she can see some of her patients
tense up, or shut down listening.  She says it's as though they're thinking, "I don't
believe anything you're about to say".  Needless to say, this least to poor decision
making on the patient's part.  Often enough, _fatally_ poor.  

This puts a burden on the caregivers:  

> The emotional toll is profound — [moral injury](https://en.wikipedia.org/wiki/Moral_injury)
> from trying to protect patients but being unable to break through the disinformation
> shaping their choices, burnout from debating the facts repeatedly, and sadness from
> watching preventable illnesses occur.  

Kuppalli uses the term "moral injury", a concept as profound as it is regrettably useful now to
explain why we all feel terrible all the time: we are forced into being complicit with
terrible things, under our anti-science authoritarian rulers.  We all want to follow what
might as well be the Zeroth Commandment: Don't Do Terrible Things.  But we are caught up
in the tidal waves of evil driving us upon the rocks of Terrible Things.  

<img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-propub-1.jpg" width="400" height="595" alt="Eldeib @ Pro Publica: COVID-19 risks in pregnancy, lowered by vaccination" title="Eldeib @ Pro Publica: COVID-19 risks in pregnancy, lowered by vaccination" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
It gets even more tragic when you consider RFKJr's manipulation of the CDC into
_withdrawing_ advice for pregnant people to get the COVID-19
vaccine.  <sup id="fn2a">[[2]](#fn2)</sup>  

Early on in the pandemic, under Biden, the CDC determined that having COVID-19 while
pregnant would not only _increase_ risks of autism and other birth defects, but also the
potential mothers faced a 70% increase in mortality.  The decision was easy, and may even
have been taken too slowly &amp; cautiously: get vaccinated, get a bigger chance to live,
and get a _lower_ chance of birth defects like autism.  

But then: Kennedy fired all 17 members of the ACIP (Advisory Committee on Immunization
Practice), installed some _deeply_ unqualified replacements, and removed the
recommendation for vaccinating pregnant people.  

_This goes against all scientific evidence and medical practice,_ according to
professional organizations like the Society for Maternal-Fetal Medicine and the American
College of Obstetricians and Gynecologists.  

A Harvard Med School study of births between 2020-March and 2021-May (before vaccine
availability) showed neurodevelopmental diagnoses in 16.3% of babies exposed to COVID-19
_in utero_ vs 9.7% of babies not so exposed, a statistically significant hazard ratio.  It
was even worse if the COVID-19 exposure happened in the 3rd trimester, especially for
boys.  

And yet&hellip; right-wing disinformation grinds on, telling people to endanger themselves
and their babies.  


## Mortality (Non-)Risk and the COVID-19 Vaccine  

With those stern reminders of the deadly serious impact of vaccine disinformation
campaigns, let's look at 4 papers on the actual, measurable risks.  

### A Mathematical Digression: Poisson Regression &amp; Adjusted Incidence Rate Ratios  

First, a little mathematical digression.  

It occurred to me that for most people it's not obvious why Poisson regression is a useful
tool for calculating adjusted Incidence Rate Ratios (IRRs).  So let's fix that!  (The
[Wikipedia page on Poisson regression](https://en.wikipedia.org/wiki/Poisson_regression)
is a good starting point.)  

Poisson regression tries to predict a count of events $Y$ (e.g., number of medical adverse
events) from a vector of features $\mathbf{x}$ (e.g., age, vaccination status, risk
status).  Predicting the log mean of $Y$ conditional on $\mathbf{x}$ with regression
coefficients $\alpha$ and $\beta$:  

$$
\log(\mathbb{E}[Y \vert \mathbf{x}]) = \alpha + \beta' \mathbf{x}
$$

This would fit your observed values of $Y$, but adjust them a bit so they make sense 
_as groups_ with the covariates $\mathbf{x}$.

Now if you want to compare 2 groups, with observed counts $Y_1$ and $Y_2$ with group
covariates $\mathbf{x}_1$ and $\mathbf{x}_2$ (say, vaccinated and unvaccinated people
within the same age cohort), then you'd use the regression model like this:  

$$
\left\{
  \begin{align*}
     \log(\mathbb{E}[Y_1 \vert \mathbf{x}_1]) &= \alpha + \beta' \mathbf{x}_1 \\
     \log(\mathbb{E}[Y_2 \vert \mathbf{x}_2]) &= \alpha + \beta' \mathbf{x}_2
  \end{align*}
\right.
$$

Take the difference, and you get a log estimator (almost) for the ratio:  

$$
\log\left(\frac{\mathbb{E}[Y_1 \vert \mathbf{x}_1]}{\mathbb{E}[Y_2 \vert \mathbf{x}_2]}\right) = \beta' (\mathbf{x}_1 - \mathbf{x}_2)
$$

So this plus the uncertainty estimates on $\beta$ from the regression get you an estimator
on the ratio and 95% confidence limits.  

A couple caveats:  
- Yes, this depends on the coding levels for $\mathbf{x}$.  But if you have 2 groups, say
  vaccinated and unvaccinated, coded as 0 and 1, then $\mathbf{x}_1 - \mathbf{x}_2 = 1$,
  conveniently enough.  
- Yes, the ratio of the expectation values is not the expectation of the ratio.  Ratio
  statistics is a whole 'nother thing.  See, for example, our method on a
  [method of Gauss hypergeometric functions for ratios of Beta-distributed variables](https://www.someweekendreading.blog/beta-ratios/)
  to get some idea how hairy that gets.  The Poisson method used here is apparently good
  enough, often enough, that it's widely used.  
- The variables being predicted are not actually counts, but _rates_.  That is, there's
  some kind of normalization done for each covariate group, e.g., divide by the number of
  fully vaccinated 18-44 year olds to get an incidence rate, say, per 100k person-years.
  That
  [mildly complicates things](https://en.wikipedia.org/wiki/Poisson_regression#%22Exposure%22_and_offset),
  but is intellectually straightforward.  

In the end you get (almost) an estimator for the incidence rate ratio, adjusted for the
covariates, and a 95% confidence interval on it.  

(I'd have done it differently using
[my method of ratio statistics on Beta-distributed event probabilities]({{ site.baseurl}}/beta-ratios/),
but I admit that's a niche taste.)  


### Study 1: Revisiting Dahl, _et al._ on All-Cause Mortality in Norway  

This Crummy Little Blog That Nobody Reads (CLBTNR) does't have wide readership.  But I
know there are a _few_ of you who are incorrigible long-term readers, and thus might remember
when we [blogged about this paper back in September](https://www.someweekendreading.blog/3-takes-covid-vax-safety/#take-2-all-of-norway-3-years-after-vaccination).
We're going to repeat that material here, both to have all the analyses in one place and
just in case an innocent new reader might stumble by.  (Hey, it could happen?)  

As we wrote back in September:  

We _definitely_ see increased all-cause mortality rates at the onset of the pandemic.
Were these due to the vaccines, or due to COVID-19 itself (and its disruption of health
care in general)?  

<img src="{{ site.baseurl }}/images/2025-09-11-3-takes-covid-vax-safety-medrxiv-1.jpg" width="400" height="254" alt="Dahl, et al. @ medR&chi;iv: mRNA vaccination all-cause mortality in Norway" title="Dahl, et al. @ medR&chi;iv: mRNA vaccination all-cause mortality in Norway" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
For that, we turn to a 3-year study by Dahl, _et al._ <sup id="fn3a">[[3]](#fn3)</sup>,
who looked at all-cause mortality in a broad population in Norway (universal
health care!), over 2021-2023 (3 years).  

Note that this is a preprint, which is not as yet peer-reviewed.  So&hellip; grain of
salt.  

<a href="{{ site.baseurl }}/images/2025-09-11-3-takes-covid-vax-safety-medrxiv-1-tbl1.jpg"><img src="{{ site.baseurl }}/images/2025-09-11-3-takes-covid-vax-safety-medrxiv-1-tbl1-thumb.jpg" width="400" height="371" alt="Dahl, et al. @ medR&chi;iv: Characteristics of study cohort" title="Dahl, et al. @ medR&chi;iv: Characteristics of study cohort" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
First, let's look at their study cohort, the summary table of which is shown here (click
to embiggen).  
- It was a retrospective cohort study, including just about everybody over age 18 living
  in Norway in the years 2021-2023.  
  - They were able to mine real-time national health registry data to obtain a study
    cohort of 4,645,910 people.
  - The 2024 population of Norway is around 5.5 million, so this was nearly the entire
    country in 2021-2023.  
  - Subjects were categorized as unvaccinated, partially vaccinated (1 or 2 doses), and fully
    vaccinated (3+ doses).  
    - People changed vaccination groups upon receiving a new dose.  This was reported in
      real time by the national electronic medical records system.  
	- These are obviously not the JN.1/LP.8.1 vaccines of this year, but rather the mRNA
      vaccines first available in 2021 and their modified versions through 2023.  
	- If you want to study long-term effects, you have to look long term, which means
      including older treatments like the very first mRNA vaccines.  Yes, mRNA vaccines
      have been in use for long enough that we can look at the first versions as having
      been "in the old days" of 2021!  
- Death outcomes were from the National Population Register.  

Now let's consider their calculations.  They stratified by analyzing each age group
separately.  Within each age group, they performed Poisson regressions to adjust for
covariates like gender, place of residence, and by whether they were in a high-risk
group.  

These Poisson regressions yielded an adjusted incidence rate ratio of all-cause mortality,
for each vaccination group compared to the unvaccinated. This looks almost exactly like
the method of the previous paper, except that instead of measuring 29 adverse events for a
few months, they measured only all-causes mortality _for 3 years._  

<a href="{{ site.baseurl }}/images/2025-09-11-3-takes-covid-vax-safety-medrxiv-1-fig1.jpg"><img src="{{ site.baseurl }}/images/2025-09-11-3-takes-covid-vax-safety-medrxiv-1-fig1-thumb.jpg" width="400" height="271" alt="Dahl, et al. @ medR&chi;iv: Adjusted incidence rate ratios show LOWER all-cause mortality in all cases" title="Dahl, et al. @ medR&chi;iv: Adjusted incidence rate ratios show LOWER all-cause mortality in all cases" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The results are shown here, in a forest plot (click to embiggen).  
- There are 4 groups, each in a horizontal strip. The most important one is the top strip,
  which represents all 3 years combined.   
- Within each such group, they first stratify by vaccination status (unvaccinated,
  partial, and full) and then by age group (18-44, 45-64, and 65+).  
- __NB:__ Since the unvaccinated group is the baseline for comparison, the ratio for them
  is always exactly 1.  We're interested in whether the vaccinated groups show a ratio
  less than 1 (fewer deaths) or greater than 1 (more deaths).  

Note that the adjusted IRR is _always_ less than 1, and is in fact bounded below 1 by its
95% confidence interval!  Also note that in the 3-year combined dataset, the 95%
confidence intervals are _very_ tight: a consequence of having 4.6 million test subjects!
Universal health care is good for health care, but it's also _great_ for research.  

(You might be curious about the one weird apparent exception for fully vaccinated, age
18-44, in 2021 only: the 95% confidence interval crosses 1.  If you look at the number of
deaths in that vax group and age group for that year, there were only 13!  Basically this
group was _so well protected from dying that there were too few deaths_ to estimate
accurately the 95% confidence interval!  That was a _very_ safe time to be a fully
vaccinated young Norwegian.)  

__Conclusion:__ The vaccinated population had a _lower_ death rate from all causes.  

### Study 2: Semenzato, _et al._ on All-Cause Mortality in France  

Thomas Aquinas is alleged to have said, "Homo unius libri timeo" (I fear the man of one
book).  It's slightly unclear &ndash; at least to me &ndash; whether he meant he feared
arguing with someone who was deeply specialized in one area, or whether he was just tired
of arguing with semi-educated people who hadn't the depth of having read many books.  

If we let the classical allusion go either way, in science we should always fear the person
of just one study: an effect really has to _replicate_ before we take it completely seriously.  

<img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-1.jpg" width="400" height="496" alt="Semenzato, et al. @ JAMA: COVID-19 mRNA vaccination and mortality in France" title="Semenzato, et al. @ JAMA: COVID-19 mRNA vaccination and mortality in France" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
And so it is here: now comes a study from Semenzato, _et al._ <sup id="fn4a">[[4]](#fn4)</sup>, 
telling us if Dahl, _et al._ above in Norway can be replicated in France.  

Like Dahl, this study is only possible because of universal healthcare and uniform
electronic medical records. It used a great fraction of the population of France.
Needless to say, the study is more than adequately powered.   

<a href="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-1a.jpg"><img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-1a-thumb.jpg" width="400" height="268" alt="Semenzato, et al. @ JAMA: CONSORT flowchart of patient selection" title="Semenzato, et al. @ JAMA: CONSORT flowchart of patient selection" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
They studied all causes of mortality for 4 years post-vaccination, in people ages 18-59.
As shown by their CONSORT flowchart of patient selection shown here (their figure e2, in
the supplement; click to embiggen), they started with a staggering 33,869,603 people from the French
electronic medical records who were (a) aged 18-59 and (b) alive on 2021-Nov-01.  After
dividing them into vaccinated and unvaccinated groups and filtering for this-n-that as
shown, they were left with 22,767,546 vaccinated and 5,932,433 unvaccinated subjects.  Note
here the influence of French medicine, having encouraged the vast majority of people to
get vaccinated!  This was not a crossover design, i.e., they filtered out unvaccinated
people who chose to get vaccinated at various points.  

These individuals were followed for 4 years: again, like Dahl, a _giant_ study with _long_
follow-ups to detect any long-term mortality effects.  You simply _cannot_ argue they
didn't look hard enough!  

Again like Dahl, they did some statistical adjustments within each group, adjusting the
morbidity count.  For example, the vaccinated group tended to be older, more female, and
less poor, so the results have to be adjusted for that.  They adjusted for:  
- Various sociodemographic factors like age stratified into 4 groups, economic class,
  place of residence, and level of medical insurance supplements to the state health
  insurance.  
- 41 different comorbidities of various sorts: cardiometabolic, respiratory, cancer,
  inflammatory and other problems, as well as obesity, smoking, and alcohol disorders.  
  
Slightly unlike Dahl, instead of Poisson regressions they did
[Cox regressions](https://en.wikipedia.org/wiki/Proportional_hazards_model), which
properly account for "censorship" when you lose track of a subject.  This is, if anything,
an _improvement_ over Dahl.  

<a href="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-1b.png"><img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-1b-thumb.jpg" width="400" height="410" alt="Semenzato, et al. @ JAMA: Forest plot showing hazard ratios for mortality overall and several subgroups; vaccinated people were safer." title="Semenzato, et al. @ JAMA: Forest plot showing hazard ratios for mortality overall and several subgroups; vaccinated people were safer." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
At that point they computed a hazard ratio: there's a lot of nuance to what that means,
but basically it amounts to a sophisticated measure of mortality risk in vaccinated people
divided by unvaccinated people.  Less than 1 means less risk for vaccinated folk.  A
variety of sophisticated methods get you not just the hazard ratio, but a 95% confidence
interval.  

Here are their results, showing a "forest plot", i.e., the hazard ratios and their
confidence intervals overall and for numerous subgroups (click to embiggen).  

Note that in all cases, the hazard ratio was less than 1, i.e., vaccinated people were
safer overall and in every subgroup.  Not only was the median hazard ratio below 1, but
the entire 95% confidence limit was as well, conveying a good deal of statistical
significance strength to the conclusion that vaccinations were safer than not.  (The lone
_almost_ exception is Corse, i.e., residents of Corsica.  Even there, the mean was less
than 1, just the tip of the upper limit of the 95% confidence interval says a very, very
weak "maybe".  There's probably something about localized poverty or access to medical
care in Corsica going on there, would be my guess.)  

Allow me to brute-force the summary for those of you who don't like diving into hazard
ratios.  After following millions of patients for 4 years:  
- The vaccinated group was 25% _less likely to die from any cause_ than the unvaccinated
  group.  
- If you focus on COVID-19 in particular, the vaccinated group was 75%
  _less likely to die in a hospital from COVID-19_ than the unvaccinated group.  
- The vaccinated group is _still less likely to die_ even when you remove the COVID-19
  deaths (thereby giving an unfair advantage to the unvaccinated group, but not enough to
  overcome the difference; being vaccinated is _still_ safer).  

As you can see from the forest plot above, this was _very consistent across subgroups_,
or, as the authors put it:  

> Results were consistent when stratified by age, sex, region, CSS coverage, social
> deprivation index, history of COVID-19, and history of chronic disease as well as when
> excluding individuals in the unvaccinated group who were vaccinated during follow-up.  

__Conclusion:__ Like the Dahl study, the Semenzato study tells us the vaccinated
population had a _lower_ death rate from all causes and that this was robust across all
subgroups.  

### Study 3: Andersson, _et al._ of JN.1-Updated mRNA Vaccine Safety  

<img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-2.jpg" width="400" height="380" alt="Andersson, et al. @ JAMA: Safety of JN.1-updated COVID-19 vaccines" title="Andersson, et al. @ JAMA: Safety of JN.1-updated COVID-19 vaccines" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
One thing I've learned over the past 5 years is that people infected by vaccine
disinformation are nothing if not persistent, sometimes fatally so.  They might, for
example, conclude: "Yeah, those old vaccines might have been ok, but the new ones updated
for this year have _got_ to be deadly."  

Right.  With something of a heavy sigh, let's address that.  

Andersson, _et al._ <sup id="fn5a">[[5]](#fn5)</sup> have done a study on the safety of
the latest version of the mRNA vaccines, updated for the JN.1 strain of SARS-CoV2.  

This is, again, one of those lovely European studies made possible only with universal
healthcare and uniform electronic medical records: their study population was more or less
the entire population of Denmark.  (However, with a new version of the vaccine only
recently available, this has to be a short-term study: from 2024-May-01 to 2025-Mar-31.)
So over a period of roughly 1 year, they did 28-day post-vaccination follow-ups on a cohort of:  
- 1,585,883 subjects total,  
- 1,012,400 of whom got updated mRNA COVID-19 shots optimized for the JN.1 lineage, and  
- the rest who did not get such an update.  

So again, they're statistically powered enough to go hunt bears.  _Angry_ bears.  

They looked at 29 kinds of medical adverse events such as anaphylaxis, ischemic cardiac
events, cerebrovascular events, arterial thromboembolism, and many more.  All of those
were carefully limited to the criteria described in
[the ICD-10 disease codes](https://www.icd10data.com/), for objectivity.  

As in the previous 2 papers, of course they calculated a hazard ratio and its 95%
confidence interval.  A particular medical adverse event was considered statistically
significant only if the hazard ratio and its 95% whiskers were all above 1 (more risk) or
below 1 (less risk).  The observation was for a period of 28 days after vaccination for
the vaccinated population; I don't know exactly what they did for the unvaccinated.  

<a href="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-2a.png"><img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-jama-2a-thumb.jpg" width="400" height="218" alt="Andersson, et al. @ JAMA: Forest plot showing NO INCREASED RISKS for people getting the JN.1 update." title="Andersson, et al. @ JAMA: Forest plot showing NO INCREASED RISKS for people getting the JN.1 update." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- As you can see from the by-now familiar forest plot shown here (click to embiggen), most
  adverse events (rows in the table) have a hazard ratio that is statistically
  indistinguishable from 1: _i.e.,_ there is no increase in risk.  
- There are, however, many cases where the box and its whiskers are _below_ 1, i.e., a
  statistically significant _decrease_ in risk.  Among them are ischemic cardiac event,
  cerebrovascular event, cerebrovascular infarction, deep venous thrombosis, pulmonary
  embolism, pericarditis, coagulative disorders, heart failure, acute kidney failure, and
  acute pancreatitis.   

__Conclusion:__  
- In the 28 days after receiving the JN.1 updated mRNA COVID-19 vaccine,
  there was _no statistically significant increase in risk_ in any of 29 medical adverse events
  studied.  
- However, in 10 of those events, the risk appears to have been _statistically significantly lowered._  

### Study 4: Grippin, _et al._ on Cancer _Reduction_ via mRNA Vaccines  

Finally, let's look at another bit of good news about vaccines.  

In the waning days of my career before retirement, I worked a lot with people doing
immunotherapy research in oncology.  Basically, those are various sorts of attempts to get
your immune system to attack the cancer, without attacking normal tissues.  That's always
the game: kill the tumor, not the patient.  The immune system has about a billion years of
experience in making fine distinctions about which cells to kill, so when this works it
works really well.  

COVID-19 vaccines mess with the immune system.  That's for the better, in terms of
_not getting COVID-19,_ but does it affect the response to cancer immunotherapies?  

<img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-nature-1.jpg" width="400" height="463" alt="Grippin, et al. @ Nature: mRNA vaccines sensitize tumors to immunotherapy" title="Grippin, et al. @ Nature: mRNA vaccines sensitize tumors to immunotherapy" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Yes, it does make response to at least one cancer immunotherapy _better,_ according to a paper 
by Grippin, _et al._ <sup id="fn6a">[[6]](#fn6)</sup>  

There's a type of cancer immunotherapy called an immune checkpoint inhibitor (ICI).  Now,
there are _volumes_ of things to know about those, but the crude summary is: immune
checkpoint molecules _stop_ the immune system from overreacting, so ICI therapy blocks
those checkpoints, allowing the immune system to proceed.  It's sort of like taking your
foot off the brakes of the immune system, and letting it race ahead.  That's not a great
idea in normal circumstances, but if it's fighting a cancer then the trade-offs are in
favor of an immune system that attacks your cancer.  

Unfortunately, if your immune system is not especially active, then blocking the
checkpoints won't do much.  

One response to this has been "cancer vaccines", where we make a vaccine special for you,
attuned to your particular cancer's mutations and weird proteins it expresses on the
surface of its cells.  Needless to say, that's expensive, complex, and difficult.  

Grippin, _et al._'s striking result is that mRNA COVID-19 vaccines have a similar result:
they stimulate your immune system enough that it responds _better_ to ICI therapy against
your cancer.  

There's a lot of interesting stuff to know about _how_ that happens, with things like CD8+
T cells, PD-L1 expression, various interferons, and so on.  And it turns out the response
has nothing much to do with SARS-CoV2, but a lot to do with the way mRNA vaccines and
their lipid nanoparticle (LNP) vehicles strongly stimulate the immune system.  (Non-mRNA
vaccines do not have this effect; it has to be mRNA + LNPs.)  However, the biological
details of the mechanism of action are something we'll leave to the biologists for now.
Instead, we'll just skip to the summary effect, of whether it improves cancer survival.  

<a href="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-nature-1a.jpg"><img src="{{ site.baseurl }}/images/2026-01-08-covid-vax-mortality-again-nature-1a-thumb.jpg" width="400" height="324" alt="Grippin, et al. @ Nature: Improved survival in various cancers with ICI + mRNA vax vs just ICI" title="Grippin, et al. @ Nature: Improved survival in various cancers with ICI + mRNA vax vs just ICI" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Here you see a collection of what are called Kaplan-Meier curves, for non-small cell lung
cancer (NSCLC; top 3 plots) and melanoma (skin cancer; bottom 2 plots) (click to embiggen).  
- The horizontal axis is time since start of treatment.  
- The vertical axis is the probability of survival (OS, or "overall survival").  The
  curves go down as people start to die.  You'd like them to stop going down, or at least
  do down more slowly!  
  - The blue curves are for patients who got ICI + a recent mRNA COVID-19 vaccine booster.  
  - The red curves are for patients who got only ICI.  
- There are some interesting computations that can be done here with Cox regression to get
  a hazard ratio and a logrank $p$-value.  
  - That $p$-value shows how statistically significant the difference in the curves is;
    lower is better.  
  - In each case, the $p$-value shown in the lower left of each plot is below 5%, showing
    the difference between the red and blue curves is significant, i.e., a _real_ thing
    likely to reproduce in the future.

You pretty much want to be a patient on the upper curves &ndash; the blue curves combining
mRNA/NLP vaccines + ICI &ndash; because they live longer.  

The really startling news here is that the patients who got the mRNA vaccine + ICI
combination therapy always did better, and that the result is statistically significant.  

__Conclusion:__ mRNA + LNP vaccines prime the immune system so it's more responsive to
immune checkpoint inhibitors in cancer therapy.  

If I had a cancer and my oncs wanted to give me immunotherapy of just about any kind, I'd
wave this paper in their faces and demand an mRNA COVID-19 vaccine booster _immediately._

## The Weekend Conclusion  

The evidence is starting to pile up:  
- The entire nation of Norway (Dahl, _et al._) says that there is a remarkable _decrease_
  in all-cause mortality among people who got COVID-19 vaccinations.  
- The entire nation of France (Semenzato, _et al._) says that there is _also_ a remarkable
  _decrease_ in all-cause mortality.  And decrease in hospitalizations.  And decrease in
  all mortalities even if you subtract out the COVID-19 deaths.  
- The entire nation of Denmark (Andersson, _et al._) says there is no short-term increase
  in 29 medical adverse effects within a month of the very latest JN.1 vaccine.  In fact,
  in 10/29 adverse effects studied, the vaccine is _protective._  
- In a study of immune checkpoint inhibitors in non-small-cell lung cancer and melanoma,
  an mRNA + lipid nanoparticle not only improves response in a variety of ways, it 
  _makes patients live longer._  
  
Don't tell me any more that you think mRNA vaccines increase long-term all-cause
mortality.  You're just ignoring the truth, at this point.  

Though, alas, I do not expect this will change any minds of anti-vaxers.  Disinformation
is a powerful drug.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/ceterum-censeo/)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** DOI: [***](***). [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000; margin: 0 auto; display: block;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: K Kuppalli, ["Rise of anti-science rhetoric has fundamentally changed the relationship between doctors and patients"](https://www.statnews.com/2025/12/10/anti-vaccine-rhetoric-doctors-emotional-toll/), _STAT News_, 2025-Dec-10. [↩](#fn1a)  

<a id="fn2">2</a>: D Eldeib, ["Amid Confusing CDC Guidance About Vaccines, Study Highlights New Risk of COVID-19 During Pregnancy"](https://www.propublica.org/article/covid-pregnancy-risk-autism-study-cdc), _Pro Publica_, 2025-Nov-26. [↩](#fn2a)  

<a id="fn3">3</a>: J Dahl, _et al.,_ ["COVID-19 mRNA-vaccination and all-cause mortality in the adult population in Norway during 2021-2023: a population-based cohort study"](https://www.medrxiv.org/content/10.1101/2024.12.15.24319058v1), _medR&chi;iv_, 2024-Dec-16. DOI: [10.1101/2024.12.15.24319058](https://doi.org/10.1101/2024.12.15.24319058).  

__NB:__ This is an as yet not peer-reviewed preprint.  [↩](#fn3a)  

<a id="fn4">4</a>: L Semenzato, _et al.,_ ["COVID-19 mRNA Vaccination and 4-Year All-Cause Mortality Among Adults Aged 18 to 59 Years in France"](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2842305), _JAMA Network Open_ 8:12, 2025-Dec-04. DOI: [10.1001/jamanetworkopen.2025.46822](https://www.doi.org/10.1001/jamanetworkopen.2025.46822). [↩](#fn4a)  

<a id="fn5">5</a>: NW Andersson, _et al.,_ ["Safety of JN.1-Updated mRNA COVID-19 Vaccines"](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2836889), _JAMA Network Open_, 8:7, 2025-Jul-28. DOI: [10.1001/jamanetworkopen.2025.23557](https://www.doi.org/10.1001/jamanetworkopen.2025.23557). [↩](#fn5a)  

<a id="fn6">6</a>: AJ Grippin, _et al.,_ ["SARS-CoV-2 mRNA vaccines sensitize tumours to immune checkpoint blockade"](https://www.nature.com/articles/s41586-025-09655-y), _Nature_ 647, pp. 488-497, 2025-Nov-13. DOI: [10.1038/s41586-025-09655-y](https://doi.org/10.1038/s41586-025-09655-y). [↩](#fn6a)  
