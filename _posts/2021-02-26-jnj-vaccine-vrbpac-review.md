---
layout: post
title: Johnson &amp; Johnson COVID-19 review by FDA external advisory committee
tags: COVID PharmaAndBiotech Politics SomebodyAskedMe
comments: true
---

Today the J&amp;J COVID-19 vaccine gets reviewed by VRBPAC (Vaccines &amp; Related
Biological Products Advisory Committee) at the FDA, for an EUA (Emergency Use
Authorization).  Let's have a look through their submission documents!  


## What's the sitch?  

An intial amusing confusion: technically, this vaccine was not developed by Johnson &amp;
Johnson.  It was developed by
[_Janssen Pharmaceuticals_](https://en.wikipedia.org/wiki/Janssen_Pharmaceuticals),
headquartered in Belgium.  But in spite of having a separate identity, they were acquired
by Johnson &amp; Johnson in 1961.  The similar-sounding names lead to no end of amusing
confusions.  

Now, this crummy little blog is not the first to look into these data, and probably never will
be.  So we'll respect the people who _have_ dug into it by examining their conclusions
first, and then diving into the FDA submission docs for our own take.  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-statnews.jpg" width="400" height="467" alt="STAT News: FDA scientists endorse J&amp;J COVID-19 vaccine" title="STAT News: FDA scientists endorse J&amp;J COVID-19 vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
First up, as usual from [_STAT News_](https://www.statnews.com/), is an
article by Matthew Herper &amp; Helen Branswell <sup id="fn1a">[[1]](#fn1)</sup>.  Their
title ("FDA scientists endorse J&amp;J's Covid vaccine&hellip;") reminds us of how this
process works.  When you submit something to the FDA for approval, something like this happens:  
1. They first throw out your conclusions.  Well, not exactly throw out, but at least put
   away in a drawer where they won't look at it yet.  
2. They extract the raw data from the package.  They analyze it using _exactly_ the
   analysis methods specified in the clinical trial protocol as specified at registration.  
3. _Now_ they get out your conclusions and compare with their own analysis.  If they
   differ, you're gonna get a frown and a warning letter that you'd better withdraw the
   application (better to withdraw than to be rejected; it's hard to resubmit after a
   rejection).  
4. If their results match yours, then they are compared with either controls or standard of
   care to see if there's reasonable efficacy, and the adverse events are compared with
   background to see if there's reasonable safety.  
5. They make a recommendation to the external review committee.  

It's the output of step 4 &amp; 5 that Herper &amp; Branswell are telling us about. The
review committee (VRBPAC) meeting is happening today even as we're writing this.  

The bottom line:  
- _General picture:_ This is a single-shot vaccine with a much simpler cold chain
  requirement than either Moderna or Pfizer.  So it's going to be easier to get into
  hospitals, clinics, and doctor's offices.  It's going to be _a lot_ easier to get into
  the developing world; that's important because as they say in public health, "none of us
  is safe until all of us are safe."  
- _Vaccine efficacy:_ There was 66.1% efficacy moderate/severe COVID if you only count
  infections 28 days after vaccination (which is totally fair). A quick &amp; dirty check:
  66 cases in the vaccine arm and 193 in the control arm.  If we assume the arms were of
  exactly the same size &ndash; not exactly, but approximately true &ndash; then with
  $N_{vac} = N_{ctl}$ we can get pretty close:   
  
$$
\begin{align*}
  VE & = 1 - \frac{\Pr(\mathrm{infected}|\mathrm{vaccinated})}{\Pr(\mathrm{infected}|\mathrm{control})} \\
     & = 1 - \frac{66 / N_{vac}}{193 / N_{ctl}} \\
     & = 1 - \frac{66}{193} \\
     & = 65.8\%
\end{align*}
$$

- The odd part, [as we reported previously]({{ site.baseurl }}/jnj-vaccine-relatively-pretty/), 
  is that the efficacy numbers are kind of all over the place, depending on where the
  trial site was!  The US site had 72% efficacy, Latin America had 66%, and South Africa
  had 57%.  Which one should we believe?  Both the Latin American and South African
  populations are likely coronavirus variants.  South Africa, in particular, has the
  B.1.351 variant with the N501Y mutation that appears to increase transmission and the
  E484K mutation that seems to increase escape from immune surveillance.  So it's not
  surprising that a vaccine based on "coronavirus classic" would be less effective there.  
- It's tempting to compare this unfavorably with the &ge; 95% efficacy of Pfizer/BioNTech
  and Moderna.  But don't go there: recall those trials were done summer and fall of 2020,
  when the South African variant ws not circulating (or at least not widely).  _So the
  mRNA vaccines have not been tested against these variants._  Even now, Pfizer and
  Moderna are investigating a booster vaccine against the variants and the FDA has
  promised a streamlined approval process for those boosters, about which more in a later
  post.  
- _Vaccine efficacy against severe COVID:_ They report 81.7% after 28 days, compared to
  64% against moderate COVID.  So it's still pretty good at avoiding severe disease.  
- _Hospitalizations and deaths:_ If you look 28 days or more past vaccinations, there were 0 COVID
  hospitalizations or deaths in the treatment arm.  There were 16 hospitalizations and 7
  deaths in the control arm.  That's 100% efficacy against hospitalization and death.
  (Confidence intervals later, if we dive deeply enough into the submission docs.)  
- _Side effects:_ Mostly the usual.  One exception was blood clotting conditions: 15
  people in the treatment arm vs 10 in the control arm.  So&hellip; a _little_ more in the
  treatment arm, but not much and not very frequently out of 10s of thousands of
  subjects.  Still, the FDA says they'll "recommend monitoring for thromboembolic events"
  if an EUA is granted.  A bit cautious, but fair.  
- _Single dose vs double dose:_ Yes, this trial monitored single dose.  But they're doing
  a 2-dose trial as well.  I think it was Fauci who said he thought the second booster
  dose would get efficacy up in the 90% range, comparable to Pfizer and Moderna.
  Interestingly, the Russian Sputnik V/Гам-КОВИД-Вак vaccine also a viral vector vaccine 
  like J&amp;J, and with 2 doses it gets to about 91% efficacy.  So there's a hint of
  evidence that if you're willing to give up some convenience of single dose
  administration, you can get back some higher efficacy.  Maybe.  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-lowe.jpg" width="400" height="236" alt="In the Pipeline: J&amp;J vaccine goes before FDA" title="In the Pipeline: J&amp;J vaccine goes before FDA" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Next up, as now seems to be the custom of this blog for some reason, is the formidable
med-chem blogger Derek Lowe at his blog
[_In the Pipeline_](https://blogs.sciencemag.org/pipeline/) <sup id="fn2a">[[2]](#fn2)</sup>, 
hosted by _Science Translational Medicine_.  (His blog, by the way, is one of the few
Internet venues where the comments are actually worth reading.)  

- Lowe confirms a crucial summary fact: this vaccine, like all the others, is observed in
  randomized clinical trials to _prevent completely deaths from COVID-19._  So I don't want
  to hear any whining in the comments about efficacy differences, ok?  Get vaccinated so
  you'll live and not die.  Remember that if you remember nothing else about this!  
- Interestingly, this trial also checked for asymptomatic infection.  Unlike the others,
  which waited until you reported feeling sick, this one took about 2900 people out of the
  about 10,000 in each arm and tested them regardless of symptoms.  The FDA analysis says
  there's approximately no protection against asymptomatic infection up to day 29, and
  about 60% &ndash; 70% protection thereafter.  _This is very important:_ aysmptomatic
  carriers are major spreaders of infection, so reducing that is a major step in stopping
  community transmission.  
- Vaccine efficacy: Lowe also points out that efficacy differences between Pfizer/Moderna
  and J&amp;J are hopelessly convolved with different coronavirus variants in circulation
  at the time of each trial.  If Pfizer/Moderna had to cope with South African B.1.351
  variants with the E484K mutation, they might not have looked so great.  (Hence, in my
  view, the need for boosters to cope with the newer variants to get out ahead of the
  virus evolution!)  
- EUA approval is almost certain (and today we'll find out).  Production of an adenovirus
  vector vaccine is really complicated, as Lowe pointed out in an excellent tutorial on
  the process. <sup id="fn3a">[[3]](#fn3)</sup> (Of course, making the mRNA vaccines is a
  bizarre art form of its own, as Lowe also explained.  <sup id="fn4a">[[4]](#fn4)</sup>
  Anybody who tells you we could "just make more" if only the evil pharma companies would
  share their designs is deeply ignorant and spreading disinformation.)  

I really like his bottom line:  
> But the big message is the same: right now, variants and all, we're winning. The
> vaccines work, there is a whole list of them, and their production is increasing while
> we watch. The countries that have gotten off to faster starts vaccinating their
> populations are already seeing the effects, and no bad safety signals are yet
> complicating things. Nor are we seeing evidence so far of antibody-dependent enhancement
> (worse infections recurring in people who have already been vaccinated). If we can keep
> this pressure up and keep ramping up vaccine supplies and their rollout around the
> world, we are going to beat this virus. Good riddance to it.  

That's important to understand, in the midst of our fear, anxiety, and depression.  

  
## The JnJ FDA EUA application briefing documents  

The briefing documents submitted by Johnson &amp; Johnson (really by _Janssen_) are up on
the FDA web site, along with the FDA internal analysis.
<sup id="fn5a">[[5]](#fn5)</sup> <sup id="fn6a">[[6]](#fn6)</sup> <sup id="fn7a">[[7]](#fn7)</sup>
<sup id="fn8a">[[8]](#fn8)</sup> <sup id="fn9a">[[9]](#fn9)</sup> <sup id="fn10a">[[10]](#fn10)</sup>
As with any such endeavor as important and complex as a drug application, there's a lot
here to troll through!  (And we're not even counting all the clinical trial documents,
data reports, safety review board reports, &hellip this is just the _summary_ for the
VRBPAC.)  

So what's in there?  


### Overall claims  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-1.jpg" width="400" height="225" alt="Janssen: Key Efficacy Claims" title="Janssen: Key Efficacy Claims" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Their summary claims about efficacy, shown here, are:
- About 85% vaccine efficacy against _severe_ COVID-19, 28 days after injection globally,
  including the B.1.351 strain in South Africa.  
- About 72% vaccine efficacy against _moderate-to-severe_ COVID-19 in the US population and
  virus strains.  
- About 66% vaccine efficacy against _moderate-to-severe_ COVID-19 globally.  
- No drastic changes in efficacy across subgroups by age, ethnicity, etc.  

When you recall that the FDA's threshold for "good enough to stop community transmission"
is 50% vaccine efficacy, this is clearly good enough.  We of course want to see confidence
intervals around those numbers, but the summary is good.  

The logistical advantages are significant: single dose (though a second dose is being
tested), stable for 3 months at ordinary refrigerator temperatures (2&deg; &ndash; 8&deg;C), stable
for 2 years at ordinary freezer temperatures (-25&deg; &ndash; -15&deg;C), large scale
manufacturing available (100 million doses in US by 2021H1), and easily shipped by ordinary
refrigerator trucks.  These are _significant_ advantages, for which we might voluntarily
sacrifice a few points of vaccine efficacy.  If necessary, we can always come back with
Pfizer/Moderna later, so long as we get people immunized _now_ with something like
J&amp;J.  


### Mechanism of action  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-2.jpg" width="400" height="225" alt="Janssen: Ad26 Viral Vector Mechanism of Action" title="Janssen: Ad26 Viral Vector Mechanism of Action" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
This is a _viral vector_ vaccine.  They take an ordinary adenovirus (roughly: "common
cold"), and mess with it in a couple of ways:
1. They make it _replication incompetent_, i.e., incapable of growing inside a human
   body.  This is done by genetic engineering on the Ad26 genome so that it can only
   reproduce in rather bizarre laboratory environments, and so that it has basically no
   chance to mutate back to a virus capable of infecting humans.  So it can enter one
   cell, one time, no more.  
2. They add the gene for the SARS-CoV-2 spike protein to the Ad26 genome.  So when it
   enters a cell, it tries to get the cell to make more viral proteins so it can
   replicate.  The Ad26 replication fails, as above.  The spike protein gets made, but no
   other SARS-CoV-2 proteins: _it absolutely cannot give you COVID-19._
3. The cell in question displays the spike protein on its surface, in essence asking the
   immune system: "Hey, anybody know if this is supposed to be here?"  
4. The immune system does something really complicated involving antigen-presenting cells,
   plasma cells, B cells, T cells of a couple kinds, etc.  (And probably more,
   because&hellip; _immunology_.)  The question of whether the spike protein
   belongs here is answered along the lines of "oh, hell no!"  
5. Antibody production against the spike protein begins.  Memory B cells remember this so
   they can manufacture more antibodies in the future if needed.  Inflammatory cytokines
   get sprayed around, all over everything thereby making you feel like crap for a day.
   But _you are not sick:_ your immune system thinks you are, and gears up to fight it.
   But really it's just being trained in case of a real infection.  
   

### The Phase 3 Study Populations  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-3.jpg" width="400" height="449" alt="Janssen: Phase 3 Study Populations" title="Janssen: Phase 3 Study Populations" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>

The study design is massive: 44,325 people initially, divide about equally between
treatment and control arms.  There was an initial safety run-up, to make sure things were
ok with a slightly smaller initial group.  The interesting places are the primary efficacy
population (since day 0, day 14, and day 28).  The last population is the most interesting
as it gave the subjects' immune systems time to react; it was the focus in their overall
claims.  In that case, we're talking 19,306 treatment and 19,178 controls.  

Side note: when vaccine skeptics think these vaccines haven't been tested enough, remind
them of these numbers!  The test populations are _huge_.  

When you break down the trial population by sex, age, race, and so on the result is that
the treatment and control groups look pretty similar.  This is as it should be.  I note
with some satisfaction that 23% of the treatment arm subjects were &ge; 65 or &ge 75 years
old.  So we have pretty reasonable sampling of response in the elderly.  


### Vaccine efficacy  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-4.jpg" width="400" height="226" alt="Janssen: Global Effiacy" title="Janssen: Global Effiacy" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-5.jpg" width="400" height="449" alt="Janssen: Kaplan-Meier curves show onset @ day 14" title="Janssen: Kaplan-Meier curves show onset @ day 14" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Using the first table, showing results on moderate/severe COVID globally, we can amend our
quick-and-dirty calculation of vaccine efficacy above.  Now we know the exact sizes of the
treatment and control arms ($N_{vac}$ and $N_{ctl}$) at day 28, so:

$$
\begin{align*}
  VE & = 1 - \frac{\Pr(\mathrm{infected}|\mathrm{vaccinated})}{\Pr(\mathrm{infected}|\mathrm{control})} \\
     & = 1 - \frac{(66 / 19306}{193 / 19178} \\
     & = 66.03\%
\end{align*}
$$

That's within a gnat's whisker of the 66.1% result reported here.  The remaining
difference is probably due to their (proper!) use of Cox regression methods to account for
censorship (people dropping out of the trial).  We don't have the censorship data here to
do that, but we can get mightily close with just the overall totals.  

So they report a vaccine efficacy against moderate/severe COVID-19 of 66.1% with a
95% confidence interval of 55.0% &ndash; 74.8%.  I haven't checked the math on the
confidence interval, but it looks like they're using the Clopper-Pearson method (not quite
my favorite, but certainly good enough).  That means we are 97.5% confident that the true
vaccine efficacy is above 55%, which means we beat the 50% efficacy threshold for
approval.  

The Kaplan-Meier curve (here: percent infections in each arm vs time) is also
interesting.  It's not as shockingly beautiful as 
[the one from Pfizer]({{ site.baseurl }}/beautiful-vaccines/#a-beautiful-survival-plot) or 
[the one from Moderna]({{ site.baseurl }}/beautiful-vaccines-2/#fine-but-whats-in-those-briefing-documents), 
but those were really, wonderfully exceptional.  This one is still very good:  
- The gray curve, representing the control arm, has rising approximately linearly from day
  0 to day 91.  (Ok, there's a little curvature.  Doesn't matter: still rising at a
  frightening rate.)  
- The blue curve, representing the treatment arm, still rises a bit.  You aren't
  bullet-proof against infection here, but it's _better_.  In fact, it's remarkably better
  than the control arm.  Once you get past day 14, or day 28 to be really careful,
  immunity has set in.  

This is evidence the vaccine _works._  

### Efficacy against severe or critical COVID-19  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-6.jpg" width="400" height="453" alt="Janssen: Kaplan-Meier curves for severe/critical COVID" title="Janssen: Kaplan-Meier curves for severe/critical COVID" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
This is where the rubber really hits the road: severe and critical COVID-19 cases lead to
hospitalization and death.  That's what this is all about: relieving the strain on medical
systems by avoiding hospitalization, and _people not dying_.  (I don't know why we have to
keep repeating that.  People somehow lose focus that the goal is _not to die_.)  

The Kaplan-Meier curve at the top shows something interesting:  
1. The blue curve for the treated population is almost completely flat after day 48,
   meaning that about a month and a half after vaccination the protection against
   severe/critical COVID is nearly ironclad.  
2. Also, this protection starts to set in even earlier, at day 7.  

This is very good news!  

The bottom plot is kind of interesting: it shows the vaccine efficacy calculated
apparently with a moving window in time, looking out from day 0 to day 65 or so.  The blue
curve is (apparently?) the Maximum Likelihood estimator of the vaccine efficacy, i.e., the
best bet you can make from the data about efficacy.  The gray band around it is a
confidence interval, probably 95% confidence (though it doesn't say exactly).  Interesting
things to note:
1. The confidence interval is broad (uncertain) at the beginning, but narrows as we go
   along (becoming more certain).  (The broadening at the end is probably because the
   confidence interval depends on future as well as past data in its time window, maybe?)
2. The ML estimate _rises with time_, i.e., the immunity is _improving_ with time from
   vaccination.  Perhaps this is antibody maturation, where the immune system keeps honing
   its antibodies to be better and better binders to the target spike protein?  
   
This is also very good news!  

### Group breakdown and viral variants  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-7.jpg" width="400" height="452" alt="Janssen: Efficacy breakdown by groups and by viral variants" title="Janssen: Efficacy breakdown by groups and by viral variants" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
They also broke down the vaccine efficacy by various subject subgroups and by viral
variants.  The results look pretty good:  
- It's slightly less efficacious in the &ge; 60 age cohort, though we sort of expect
  that.  In fact, it's not _much_ less, and the 95% confidence interval is still mostly
  above 50% ("good enough").  
- The effect on the cohort with comorbidities is no worse than the effect of age.  
- Not much difference between men and women (ok, a little; no idea why).  
- No particular effect differences by race.  
- The efficacy across 6 different mutations shows some difference, but not a lot.  The
  worrisome cases appear to be CAL.20C and D614G where the 95% confidence interval drops
  down to around 0%.  (NB: the negative lower bound in the CAL.20C case is evidence that,
  like Pfizer, they're using the Clopper-Pearson method for proportion uncertainty, but
  for some reason don't know about the special case for near-zero counts.  Just substitute
  0% in your mind and move on.)  

### Safety  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-janssen-8.jpg" width="400" height="224" alt="Janssen: Safety reports of thrombotic and thromboembolic events" title="Janssen: Safety reports of thrombotic and thromboembolic events" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The safety results show adverse events were mostly grade 1-2 (annoying to very annoying,
but not enough to hospitalize), and resolved within a day or two.  Basically you might
feel like crap for a day or so, but it gets better fast.  More good news.  

There's some _slight_ possibility of increased blood clotting problems ("thrombotic and
thromboembolic events").  But with only 14 out of 21,895 in the treatment arm and 10 out
of 21,888 in the control arm, it's both rare and unlikely to prove statistically
significant.  I couldn't resist doing the test of proportion myself; as you can see the
result below is $p \sim 54%$ (not at all statistically significant):  
```R
> prop.test(x = c(14, 10), n = c(21895, 21888))

	2-sample test for equality of proportions with continuity correction

data:  c(14, 10) out of c(21895, 21888)
X-squared = 0.37425, df = 1, p-value = 0.5407
alternative hypothesis: two.sided
95 percent confidence interval:
 -0.0003016102  0.0006666983
sample estimates:
      prop 1       prop 2 
0.0006394154 0.0004568713 
```
Still, the FDA scientists, in an abundance of caution, recommend monitoring for thrombotic
events if an EUA is approved.  Ok, cautious is good, so long as people _get vaccinated._

So&hellip; looks pretty good.  Ok, not _quite_ as good as Pfizer and Moderna, but those
were exceptional.  This is very good, and has extremely strong logistical advantages over
Pfizer and Moderna in rural areas or in the developing world.  And remember: we _must_
vaccinate all people in all countries, or the virus will continue to mutate until it
evades our vaccines and comes back to bite us.  In public health: "None of us is safe
until everybody is safe."  

So let's get everybody safely vaccinated.  


### A Twitter thread summary from Hilda Bastian  

Hilda Bastian has a Twitter thread in which she goes through the tables in the submission
documents, reaching the same conclusions we did from the VRBPAC slide presentation.  It's
worth reading, just for confirmation:  

<blockquote class="twitter-tweet">
<p lang="en" dir="ltr">
  Away we go. J&amp;J ENSEMBLE trial evaluation has landed - 8am again - thanks, FDA! ....1/n<a href="https://t.co/Poy7N72Rnt">https://t.co/Poy7N72Rnt</a>
</p>
&mdash; Hilda Bastian, PhD (@hildabast) <a href="https://twitter.com/hildabast/status/1364561482185199625?ref_src=twsrc%5Etfw">February 24, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>


## VRBPAC Verdict  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-vrbpac-question.jpg" width="400" height="223" alt="FDA: formal statement of the question on J&amp;J vaccine before the VRBPAC" title="FDA: formal statement of the question on J&amp;J vaccine before the VRBPAC" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Here's the formal statement of the question before the VRBPAC, formulated by the FDA
scientists who did the reanalysis of the J&amp;J data.  Basically, "does it help or hurt
to approve this thing for emergency use in adults?"  

Note that they did _not_ make the mistake that Pfizer did, where they tried for approval
in 16 years old and up.  That triggers all sorts of headaches about pediatric trials,
which were not done.  Pfizer had some young folk in their trial, but the statistics were
laughably uncertain due to small numbers.  This was enough of a blunder that some of the
VRBPAC members _actually voted against the Pfizer EUA on this basis alone._  So it's good
to know that Moderna didn't repeat that mistake, and neither has Johnson &amp; Johnson.  

<img src="{{ site.baseurl }}/images/2021-02-26-jnj-vaccine-vrbpac-review-statnews-liveblog-vrbpac.jpg" width="400" height="438" alt="STAT news: live-blogging the FDA VRBPAC meeting on the J&amp;J vaccine" title="STAT news: live-blogging the FDA VRBPAC meeting on the J&amp;J vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Over at [_STAT News_](https://www.statnews.com/), Helen Branswell and
Matthew Herper ("the old reliables") have been publishing notes in real time about the
VRBPAC meeting as they've watched it today. <sup id="fn11a">[[11]](#fn11)</sup>  It's
pretty revealing about the topics that concern the VRBPAC members (one dose vs two,
severity of sickness, advese event analysis, why communicating with the public about
vaccines is difficult and about to get worse, anaphylaxis, &hellip;).  

Here's their report on the verdict:  
>__The vote__  
>__5:05 p.m.:__ It all comes down to this. The panel voted on only a single question:  
>
> Based on the totality of scientific evidence available, do the benefits of the Janssen Covid-19 vaccine outweigh its risks for individuals 18 years of age and older?  
>
>The results:  
>
>22 Yes, 0 No  
>
>Unanimous! Now there will be a discussion on why the panelists think about their votes, which could be as important as the vote in determining how the vaccine is authorized.  

The FDA scientists didn't have to agree with Janssen; but they did.  The VRBPAC didn't
have to agree with the FDA scientists; but they did.  The FDA itself doesn't have to agree
with the VRBPAC; but they usually do.  

For Pfizer and Moderna, the FDA formal EUA issued the same evening of the decision.  (But
some of that was Trump being an idiot making pointless blustery threats.  At least
_that's_ fixed now.)  So&hellip; the way to bet is an EUA either tonight or at the worst
early next week.  

Today was a _good_ day.  


## How do the vaccines compare?  

There are now multiple vaccines, with different delivery mechanisms (mRNA and viral
vector), somewhat different vaccine efficacy at preventing overall infection, different
cold chain requirements, different supply availabilities, &hellip; _complicated!_  How
should we compare them and thereby make rational choices?  

The best summary I've seen so far was from Ashish Jha, now 
[dean of the School of Public Health at Brown](https://www.brown.edu/academics/public-health/about/people/dean/ashish-jha), 
formerly of the 
[Havard TH Chan School of Public Health](https://www.hsph.harvard.edu/ashish-jha/) (either of which
would be an excellent capstone to a career; he has both, and is thus someone to whom we
should listen carefully).  He summarizes the results across 5 vaccines &amp; vaccine candidates
in a simple table:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Am often asked about different vaccines and their efficacy<br><br>
    Each trials tracks, reports efficacy differently<br><br>
    Currently, we have preliminary results for Novavax and J&amp;J<br><br>
    But what numbers matter? What should you look for? <br><br>
    Here&#39;s one set of data to track. In a simple table 
    <a href="https://t.co/9m2OBgqcla">pic.twitter.com/9m2OBgqcla</a>
  </p>
  &mdash; Ashish K. Jha, MD, MPH (@ashishkjha)
  <a href="https://twitter.com/ashishkjha/status/1356079020878786561?ref_src=twsrc%5Etfw">February 1, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

__Summary:__ There are 2 conclusions that he makes blunt-trauma-obvious here:
- _Column 2:_ The vaccines have all been tested on _large_ populations: $\geq O(10^4)$ trial
  subjects (except for AstraZeneca/Oxford, whose somewhat messed up trial and somewhat
  botched reporting [we've detailed before]({{ site.baseurl }}/astrazeneca-oxford-vaccine-readout/);
  even they still look pretty good).  That pretty much demonstrates they're _safe_.
- _Columns 3-5:_ Look at all those 0's!  Each vaccine might have somewhat variable
  efficacy in preventing all disease including even mild infections.  But they are, as far
  as the clinical trial data can show, __100% effective at preventing COVID hospitalization,
  COVID death, or vaccine-related death.__  (With the last one, he's just yanking our chain
  about how _safe_ vaccines are&hellip; but he's welcome to do it since that chain
  periodically needs yanking, hard.)  
  
So&hellip; yeah, they're all good.  

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) a while ago which vaccine
they should get.  First, because of supply constraints and the need to get _everybody_
through the vaccine process, you probably won't get a choice.  Second, the data above
shows _the best vaccine is the first one you're offered._ Take the shot, _thank_ the person
who gives it to you, and _smile_.  


## What does it all mean?!  

The J&amp;J vaccine is good enough.  

It _may_ slightly inferior to Moderna and Pfizer or it may not be: Moderna and Pfizer were
tested before some of the gnarly SARS-CoV-2 variants started appearing.  Only a Phase IV
trial (post-approval monitoring of people who get each vaccine) will tell, and that will
take upwards of a year, maybe.  So _good enough_ will do here.  

Also, J&amp;J has remarkably superior logistics: cold chain requirements are much more
lax, shipping is easier, a single dose is much less effort when you only have to see your
patient once, and so on.  (Though your humble Weekend Editor remains optimistic that the
2-dose trial of the J&amp;J vaccine will reveal efficacy north of 90% and everybody will
get a second dose anyway.) 

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: M Herper &amp; H Branswell, ["FDA scientists endorse J&J's Covid vaccine, as new data shed light on efficacy"](https://www.statnews.com/2021/02/24/new-data-shed-light-on-efficacy-of-jjs-single-dose-vaccine-against-covid-19/), [_STAT News_](https://www.statnews.com/), 2021-Feb-24. [↩](#fn1a)  

<a id="fn2">2</a>: D Lowe, ["The J&amp;J Vaccine at the FDA"](https://blogs.sciencemag.org/pipeline/archives/2021/02/24/the-jj-vaccine-at-the-fda), [_In the Pipeline_](https://blogs.sciencemag.org/pipeline/) blog at [_Science Translational Medicine_](https://stm.sciencemag.org/), 2021-Feb-24.[↩](#fn2a)  

<a id="fn3">3</a>: D Lowe, ["How You Make an Adenovirus Vaccine"](https://blogs.sciencemag.org/pipeline/archives/2021/02/08/how-you-make-an-adenovirus-vaccine), [_In the Pipeline_](https://blogs.sciencemag.org/pipeline/) blog at [_Science Translational Medicine_](https://stm.sciencemag.org/), 2021-Feb-08.[↩](#fn3a)  

<a id="fn4">4</a>: D Lowe, ["Myths of Vaccine Manufacturing"](https://blogs.sciencemag.org/pipeline/archives/2021/02/02/myths-of-vaccine-manufacturing), [_In the Pipeline_](https://blogs.sciencemag.org/pipeline/) blog at [_Science Translational Medicine_](https://stm.sciencemag.org/), 2021-Feb-02.[↩](#fn4a)  

<a id="fn5">5</a>: R Zhang &amp; Y Hefter, ["FDA Review of Efficacy and Safety of the Janssen COVID-19 Vaccine Emergency Use Authorization Request"](https://www.fda.gov/media/146267/download), FDA/CBER Office of Vaccines Research and Review, 2021-Feb-26. [↩](#fn5a)  

<a id="fn6">6</a>: M Allende, ["Emergency Use Authorization: Overview and Considerations for COVID-19 Vaccines"](https://www.fda.gov/media/146266/download), FDA/CBER Office of Vaccines Research and Review, 2021-Feb-25. [↩](#fn6a)  

<a id="fn7">7</a>: Janssen Biotech, ["COVID-19 Vaccine Ad26.COV2.S VAC31518 (JNJ-78436735): SPONSOR BRIEFING DOCUMENT"](https://www.fda.gov/media/146219/download), Janssen Biotech/Johnson &amp; Johnson, 2021-Feb-26. [↩](#fn7a)  

<a id="fn8">8</a>: Janssen Biotech, ["Janssen Ad26.COV2.S Vaccine for the Prevention of COVID-19"](https://www.fda.gov/media/146217/download), Janssen Biotech/Johnson &amp; Johnson, 2021-Feb-26. [↩](#fn8a)  

<a id="fn9">9</a>: Janssen Biotech, ["COVID-19 Vaccine Ad26.COV2.S VAC31518 (JNJ-78436735): SPONSOR BRIEFING DOCUMENT ADDENDUM"](https://www.fda.gov/media/146218/download), Janssen Biotech/Johnson &amp; Johnson, 2021-Feb-26. [↩](#fn9a)  

<a id="fn10">10</a>: J van Hoof, H Schuitemaker, M Douoguih, &amp; G Poland, ["Emergency Use Authorization (EUA) Application for Ad26.COV2.S"](https://www.fda.gov/media/146265/download), Janssen Biotech/Johnson &amp; Johnson, 2021-Feb-26. [↩](#fn10a)  

<a id="fn11">11</a>: H Branswell &amp; M Herper, ["Tracking an FDA advisory panel's meeting on J&J's Covid-19 vaccine"](https://www.statnews.com/2021/02/26/tracking-an-fda-advisory-panels-meeting-on-jjs-covid-19-vaccine/), [_STAT News_](https://www.statnews.com/), 2021-Feb-26. [↩](#fn11a)  
