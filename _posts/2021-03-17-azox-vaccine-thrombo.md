---
layout: post
title: The AstraZeneca/Oxford Vaccine vs Blood Clots
tags: COVID MathInTheNews PharmaAndBiotech R SomebodyAskedMe Statistics
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) whether worries the
AstraZeneca/Oxford vaccine and dangerous blood clotting seen in some patients were a real
problem.  You know what the anti-vaxxers are gonna say; what do the _data_ say?  


## What's the sitch?  


### The Bayesian prior on AZ/OX here at Chez Weekend   

Here at Chez Weekend,
[we haven't been fans]({{ site.baseurl }}/astrazeneca-oxford-vaccine-readout/)
of the AstraZeneca/Oxford vaccine for COVID-19.  The Phase 3 trial that read out last
December had numerous problems:  
- A CMO bungled the dosing, delivering half doses instead of full doses.  
- AZ didn't assay the CMO product to check, and didn't randomize doses from different
  batches across test sites.  Efficacy was hopelessly convolved with batch.  
- So they got radically different results in the South African variant sites, but averaged
  them with other sites anyway in spite of the glaring differences.  If there's no near
  superclass of all the things being averaged, you can't do it: it's like averaging
  apples, oranges, &hellip; and sledgehammers.  
- They failed to disclose any of this;
  [the CEO even attempted to spin it as "not a mistake"]({{ site.baseurl }}/astrazeneca-oxford-vaccine-readout/#fn11)
  because they amended the trial protocol.  That's like taking a pratfall and saying "I
  meant to do that!"  

AZ/OX is now in _another_ clinical trial <sup id="fn1a">[[1]](#fn1)</sup>, this one
hopefully with more transparency and a clean readout.  It's _probably_ pretty good, but we
need evidence before the FDA will look at it.  In fact, word on the street &mdash;
assuming you travel the appropriate streets &mdash; is that this trial has reached its
required event count and will read out in the next few days:  

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">
    Sounds like the big US/international trial for the Oxford-AstraZeneca vaccine has its
	events (likely final): <a href="https://t.co/79tArvAIGr">https://t.co/79tArvAIGr</a>
	If so, there could be a press release soon (perhaps just days away).<br><br>
    My 🧵 on what I&#39;ll be keeping in mind: <a
	href="https://t.co/5JFmnZ7Emi">https://t.co/5JFmnZ7Emi</a> 
  </p>&mdash; Hilda Bastian, PhD (@hildabast) <a href="https://twitter.com/hildabast/status/1371566142221807617?ref_src=twsrc%5Etfw">March 15, 2021</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js"></script>

So when I heard that some European countries were stopping the use of AZ/OX pending an
assessment of serious adverse events (occasionally fatal blood clots) I thought, "What
have they done wrong _now?_"  ('They' meaning either AstraZeneca or the governmental
authorities.)  Either the vaccine is dangerous and lives are saved by _not using_ it, 
or the vaccine is ok and lives are saved by _using_ it.  Which is it?  


### Some terminology  

They're complaining about _thromboembolic events_, so we'd best start by getting all of us
reminded and on the same page about the meaning of thromboembolism.  Basically, some blood
partially or fully clots inside the circulatory system (a _thrombus_), which blocks
something else (an _embolism_):  
- __VTE:__ veinous thromboembolism, if it forms in a vein.  
- __DVT:__ deep vein thrombosis, a subtype of VTE when it forms in a limb, usually a leg.  A
  common worry for older people who take long flights in coach class.  
- __PE:__ pulmonary thrombolism, when a DVT embolism is "thrown" and blocks finer vessels in
  the lung (very serious, as in sudden death).  
- __CSVT:__ cerebral sinus vein thrombosis, a subtype of VTE, like PE, but when a clot is
  thrown into the brain (somewhat rare, very bad news when it happens).  
- __ATE:__ somewhat rarer case where a thrombus forms in an artery (doesn't seem to be the
  case here).  

So we're worrying about some observations of VTE (either DVT or PE) in some recent
recipients of the AZ/OX vaccine.  


### Background as seen in the general media  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-nyt.jpg" width="400" height="152" alt="NYT: Summary of AZ/OX blood clotting issues" title="NYT: Summary of AZ/OX blood clotting issues" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-buzzfeed.jpg" width="400" height="242" alt="BuzzFeed: Summary of AZ/OX blood clotting issues" title="BuzzFeed: Summary of AZ/OX blood clotting issues" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
For some background in general media, high-brow and mid-brow, we turn to articles in the
_New York Times_ <sup id="fn2a">[[2]](#fn2)</sup> and 
_BuzzFeed_ <sup id="fn3a">[[3]](#fn3)</sup>.  The content is pretty similar, in spite of
differences in tone:  
- __There does not appear to be any relationship to the vaccine at all.__  
- According to Prof Stephan Moll, of UNC medical: in the US each year there are 300,000 -
  600,000 cases of VTE (DVT or PE), so that's very roughly 100-200 cases/day.  The US is
  vaccinating about 1% of the population
  every day, so we should expect to see about 10 - 20 VTE cases/day in newly vaccinated
  people, just because that's one of the things that happens to people, vaccine or no.
  It's not _that_ rare!   
- Apparently one of the European sites saw a CSVT.  Those are rare enough to make people
  take notice, possibly explaining some of the worry here.  


## Field findings  

### What the regulatory agencies and AstraZeneca have to say  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-ema-1.jpg" width="400" height="190" alt="EMA: Investigating, but benefits outweigh risks" title="EMA: Investigating, but benefits outweigh risks" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-ema-2.jpg" width="400" height="162" alt="EMA: Not a manufacturing problem in a vaccine batch" title="EMA: Not a manufacturing problem in a vaccine batch" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-az.jpg" width="400" height="183" alt="AstraZeneca: safety update press release" title="AstraZeneca: safety update press release" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Ok, that sort of tells us the _kind_ of thing we're looking at, but what about the
specifics in the AZ/OX vaccination population?  Let's avoid the media entirely here, and
look at primary sources: the European Medicines
Agency (EMA) <sup id="fn4a">[[4]](#fn4)</sup> <sup id="fn5a">[[5]](#fn5)</sup> and 
AstraZeneca itself <sup id="fn6a">[[6]](#fn6)</sup>:  
- The EMA says it's investigating whether there are enough thromboembolic events to worry
  about the vaccine, but there is so far no indication the vaccine is at fault.  The
  stoppages are out of "caution", though it seems to me that "caution" should include the
  number of deaths due to people going without COVID-19 vaccination for a few more
  days/weeks, too!  
- Specifically, they say there were 30 throboembolic events out of 5mln people vaccinated
  as of 2021-Mar-10.  
- The first thing anybody would check would be if the events were all at a small number of
  sites.  If so, and if those sites all received the same batch of vaccine, you'd suspect
  the batch itself.  So far, no evidence for a batch-specific problem.  
- AstraZeneca fills in a couple details: 15 DVT + 22 PE = 37 VTE events as of 2021-Mar-08,
  out of ~ 17mln vaccinees in EU+UK as of 2021-Mar-08.  No idea why they say 37 when the
  EMA says 30, for reporting 2 days later.  But let's pessimistically go with the higher
  number of 37 VTE events.  
- In the clinical trial, VTE events were _lower_ in treatment arm, because COVID causes
  blood clots & control arm caught more COVID.  So in that sense you can regard the
  vaccine as _protective_ against VTE events.  
- No batch effect observed, after extensive QC by AstraZeneca of the batches shipped to the sites
  where VTEs were observed.  
  
__Summary:__ So far, nobody has actual evidence to connect the vaccine to the VTE events.
The stoppages are out of (possibly misplaced?) caution.  The numbers seem to be 30-37 VTE
events out of ~ 5 mln vaccinated.  That means the probability of VTE is
$\Pr(\mathrm{VTE} | \mathrm{vax}) = \frac{37}{5,000,000} = 7.4 \times 10^{-6}$
... or about 7 times in a million patients.  Reasonably rare, and seems like a risk worth
taking compared to COVID-19, even if we were guaranteed that many VTEs!  


### Does COVID itself cause thromboembolic events?  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-blood-adv.jpg" width="400" height="204" alt="Blood Advances: Frequency of VTE in 6513 COVID-19 patients" title="Blood Advances: Frequency of VTE in 6513 COVID-19 patients" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-thromb-jnl.jpg" width="400" height="326" alt="Thrombosis Jnl: Meta-analysis of VTE frequency in COVID-19 patients" title="Thrombosis Jnl: Meta-analysis of VTE frequency in COVID-19 patients" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-jnl-intens-care.jpg" width="400" height="290" alt="Jnl Intensive Care: Review of VTE in COVID-19 patients" title="Jnl Intensive Care: Review of VTE in COVID-19 patients" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
One question we want to consider is whether COVID-19 causes thromboembolisms.  If so, then
even if the vaccine _did_ increase the risk slightly, the fact that COVID-19 increases the
risk _a lot_ is a good reason to take the vaccine.  Not taking the vaccine doesn't mean
your VTE risk is like normal times; it means your risk is like pandemic times, where the
alternative is all the risks of catching COVID-19.  

So does COVID-19 cause VTEs?  Apparently yes!
<sup id="fn7a">[[7]](#fn7)</sup> <sup id="fn8a">[[8]](#fn8)</sup> <sup id="fn9a">[[9]](#fn9)</sup>
- In a New Orleans cohort, VTE events tended around 3.1% in all hospitalized COVID-19
  patients, and around 7.2% for those on ventilation.  Those are incredibly high numbers,
  compared to the background population, where on any given day 3% - 7% of the population
  does _not_ have VTE!  
- In a [meta-analysis](https://en.wikipedia.org/wiki/Meta-analysis) of 36 other studies,
  it was found that the chance of VTE and the 95% confidence limits were: 10% (CL: 6% -
  14%) outside the ICU, and 28% (CL: 22% - 34%) for those in the ICU.  Again, incredibly
  high!  
- The cause appears to be the cytokine storm from the immune response to SARS-CoV-2.  This
  can also cause thrombocytopenia (low platelet count), which leads to clots.   

So&hellip; yeah, COVID-19 causes lots of inconvenient and potentially lethal clots.
Avoiding _that_ risk, you should look very charitably and forgivingly at a vaccine's
alleged clot risk.  (Even if there _were_ some evidence of vaccine-induced thromboembolism,
which we _still_ haven't established!  )


### How often does thromboembolism happen in the general population?  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-ajmc.jpg" width="400" height="145" alt="Amer Jnl Manag Care: Overview of VTE" title="Amer Jnl Manag Care: Overview of VTE" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-nat-rev-cardiol.jpg" width="400" height="128" alt="Nature Reviews Cardiology: Epidemiology of VTE" title="Nature Reviews Cardiology: Epidemiology of VTE" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Of course, to do a proper analysis here, we want to know how often VTE occurs in the
general population (unvaccinated, pre-COVID days).  We want our vaccine to have a risk of
VTE no higher than that background rate, if we possibly can.  We wanted both a
practice-oriented view and a science-oriented view, so we consulted papers from the 
_American Journal of Managed Care_ <sup id="fn10a">[[10]](#fn10)</sup>
and _Nature Reviews Cardiology_ <sup id="fn11a">[[11]](#fn11)</sup>.  
- The _AJMC_ practice-oriented paper quoted VTE frequencies in the general population of
  1-2 per 1,000 person-years.  It also noted, chillingly enough, that the _"presenting
  manifestation of PE is sudden death"_.  Sounds skippable, if skipping is an option&hellip;  
- _Nat Rev Cardiol_ agreed: VTE frequency was 104 &ndash; 183 per 100,000 person years,
  which on the same scale as the preceding paper is 1.04 &ndash; 1.83 per 1,000
  person-years &mdash; so pretty consistent.  Notably, it is higher in African Americans,
  but lower in Asians, Asian Americans, and Native Americans.  
  
Quite relevantly, VTE frequency is higher in the elderly, who are the population getting
vaccinated as early as possible now.  So using 1-2 per 1,000 person-years is an
_underestimate_ of the VTE frequency in the current vaccine population.  But since that
imposes an _even more stringent_ threshold to beat, let's go with it.  


## Some statistical hypothesis tests  

We now have enough data to compute the probability per unit time (the _rate_) at which VTE
events occur in both the general population and in the recently vaccinated population.  
- Are they statistically significantly different?  
- If so, favoring which group with a lower rate?  
- By how much?  

When we can answer those questions, quantitatively, we'll be able to form an opinion about
whether AZ/OX is related to clotting disorders.  It'll be a preliminary opinion, since the
safety review boards will have full access to patient medical records for a detailed, deep
dive which we cannot do with overview numbers.  But we can tell which way to bet!  

Let's assume the observation time after a vaccination is 2 weeks.  Then our rates of
VTE/fortnight are:
$$
\begin{align*}
  d/dt \Pr(\mathrm{VTE} | \mathrm{bkgnd}) & = (1 \mathrm{VTE} / 1000 \mathrm{person-years}) \times (1 \mathrm{year} / 26 \mathrm{fortnights}) \\
                                          & = 1 \mathrm{VTE} / 26,000  \mathrm{person-fortnights} \\
							              & = 3.8 \times 10^{-5} \mathrm{VTE/person-fortnight} \\
  d/dt \Pr(\mathrm{VTE} | \mathrm{vax})   & = 37 \mathrm{VTE} / 5,000,000 \mathrm{person-fortnights} \\
                                          & = 7.4 \times 10^{-6} \mathrm{VTE/person-fortnight}
\end{align*}
$$

__NB__: the rate of VTEs is _lower_ in the vaccinated population, by a factor of 5.  In
other words, the top-line number says the vaccine is _protective against VTE_.  

We know there were about 5,000,000 AZ/OX vaccination subjects.  What should we use as the
corresponding size of the background population?  Since we're looking at a vaccination
campaign in Europe, the population of the European Union 
([446 million](https://europa.eu/european-union/about-eu/figures/living_en#size-and-population)) 
looks like about the right thing.  

Now we can build a crosstabulation showing the VTE rates in the vaccinated population and
the unvaccinated population.  We use $\Pr(\mathrm{VTE} | \mathrm{background})$ and the EU population above to
compute the background counts to show a rate of about 1/26,000 every 2 weeks in the
background population:  
```R
> popln <- 446000000
> mx <- round(matrix(c(37, 5000000, popln * 1/26000, popln), byrow = TRUE, nrow = 2, dimnames = list(c("Vax", "Bkgnd"), c("VTE", "No VTE")))); mx
        VTE   No VTE
Vax      37 5.00e+06
Bkgnd 17154 4.46e+08
```

We next apply [Fisher's exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test) (devised,
according to legend, for the problem of 
[The Lady Tasting Tea](https://en.wikipedia.org/wiki/Lady_tasting_tea))
and the somewhat more traditional
[test of proportion](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/prop.test)
to test the statistical significance of the difference in rates of VTE between the vaccinees and the
general EU population.  For both tests, the null hypothesis is that there's no difference:  

```R
> fisher.test(mx)
	Fisher's Exact Test for Count Data

data:  mx
p-value < 2.2e-16
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 0.1354152 0.2653069
sample estimates:
odds ratio 
  0.192402 

> prop.test(mx)
	2-sample test for equality of proportions with continuity correction

data:  mx
X-squared = 124.34, df = 1, p-value < 2.2e-16
alternative hypothesis: two.sided
95 percent confidence interval:
 -3.361408e-05 -2.850614e-05
sample estimates:
      prop 1       prop 2 
7.399945e-06 3.846006e-05 
```

Both tests report ridiculously strong significance, at $p \le 2.2 \times 10^{-16}$, the
lowest $p$-value that [R](https://www.r-project.org) will report without embarrassment.
That says yes, we really should believe the VTE risk is _lower_ among the vaccinees.  

Finally, we can add our usual Bayesian analysis.  We've experimentally measured 
$\Pr(\mathrm{VTE} | \mathrm{Vax})$ and $\Pr(\mathrm{VTE} | \mathrm{bkgnd})$.  Each of those should be binomially distributed, with some
underlying success parameters $p_{\mathrm{Vax}}$ and $p_{\mathrm{bkgnd}}$.  The usual Bayesian analysis says
that if we start with a uniform prior on each $p$, then 
[the posterior is a Beta distribution](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading14a.pdf).
We can calculate &amp; plot those distributions, to see if they look different:  

```R
> source("../../tools/graphics-tools.r")
> ps    <- seq(from = 0, to = 5.0e-5, length.out = 1000)
> vax   <- dbeta(ps, shape1 = 38,    shape2 = 5.00e+6)
> bkgnd <- dbeta(ps, shape1 = 17155, shape2 = 4.46e+8)
> withPNG("../images/2021-03-17-azox-vaccine-thrombo-beta.png", 600, 300, FALSE, function() { withPars(function() { matplot(ps, matrix(c(vax, bkgnd), byrow = FALSE, ncol = 2), type = "l", lty = "solid", col = c("blue", "black"), xlab = "p", ylab = "Density", main = "Bayesian Posterior Beta Distributions"); legend("topright", inset = 0.01, bg = "antiquewhite", legend = c("Vax", "Bkgnd"), col = c("blue", "black"), lty = "solid", lwd = 2) }, pty = "m", bg = "transparent", ps = 16, mar = c(3, 3, 2, 1), mgp = c(1.7, 0.5, 0)) }) 
```

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-beta.png" width="600" height="300" alt="Posterior Beta densities: VTE in vaccinees vs population" title="Posterior Beta densities: VTE in vaccinees vs population" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

These 2 resulting Beta distributions tell us what we should believe about the probability
of VTE in the general population (black) and among the vaccinees (blue).  They tell us not
just the probability at the peak, but also the _uncertainty_ around each.  It's _crucial_
when reporting a result to be clear about uncertainty!  The bottom line is that:  
- The 2 distributions are well separated.  This confirms the statistical significance
  result above, namely that the VTE frequency is _different_ among vaccinees and the
  general population.  
- __The rate of VTE among vaccinees is lower than in the general population.__  So yes,
  there is an effect; but it's _protective_ against VTE in the vaccinees.  

__Conclusion:__ Based purely on the top-level numbers &ndash; the counts of VTE and
non-VTE vaccinees and the rate of VTE in Europeans &ndash; it looks like these events are
_not_ related to the vaccination, and indeed that the vaccination may be protective
against VTE.  

## Some safety judgements from experts  

Ok, so that's what one retired scientific loudmouth with a blog thinks.  There's no
particular reason you should care.  What do _real_ experts think?  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-reuters.jpg" width="400" height="212" alt="Reuters: WHO begs us not to stop using AZ/OX vaccine" title="Reuters: WHO begs us not to stop using AZ/OX vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- _Reuters_ reports <sup id="fn12a">[[12]](#fn12)</sup> that the World Health
  Organization generally appealed to country authorities _not_ to stop using
  the AZ/OX vaccine.  Given that it's been dosed in 5 million people and the side-effects
  are in line with the general population, it's provably safe and the observed adverse
  effects show no relation to the vaccine.  Given the extreme risks of
  COVID-19, it's much better to take the vaccine than not.  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-new-scientist.jpg" width="400" height="173" alt="New Scientist: No relation between AZ/OX vaccine and clots" title="New Scientist: No relation between AZ/OX vaccine and clots" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- _New Scientist_ reports <sup id="fn13a">[[13]](#fn13)</sup> something similar, saying
  the decisions of governments to suspend use are not rational.  In particular, they note
  that the rate of VTE is not higher than the general population, and COVID-19 itself
  poses _significant_ thromboembolism risks:  

> "Many thousands of people develop blood clots annually in the EU for different reasons,”
> the EMA said in a statement. The number of blood clotting incidents in vaccinated people
> “seems not to be higher than that seen in the general population".  

> "There is absolutely no data that supports [the German government’s] decision," says
> C&eacute;sar Muñoz-Fontela at the Bernhard Nocht Institute for Tropical Medicine in Germany. He
> says that older people and people with pre-existing health conditions, who are more at
> risk of blood clots generally, have been prioritised for the vaccine, which may have
> skewed the apparent side effects. He would like to see a comparison with a control group
> that has the same characteristics as the people so far vaccinated.  

> The International Society on Thrombosis and Haemostasis recommends that all eligible
> adults continue to receive their covid-19 vaccinations. "At this time, the small number
> of reported thrombotic events relative to the millions of administered COVID-19
> vaccinations does not suggest a direct link," it said in a statement.  

> "In weighing up the merits of a medical intervention, it's really important to consider
> both sides of the argument: how risky is it for someone to have it versus how risky is
> it for them not to," says Lucy Walker at University College London. "An increased risk
> of thrombosis is one of the known complications of [coronavirus] infection. The vaccines
> we have are incredibly good at preventing the illness caused by this virus. They will
> therefore prevent people from having thrombosis associated with the infection itself."  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-ema-3.jpg" width="400" height="166" alt="EMA: Investingation continues, still no evidence of link" title="EMA: Investingation continues, still no evidence of link" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- The EMA safety committee investigates <sup id="fn14a">[[14]](#fn14)</sup>, finds no effect so
  far (emphasis in original):  

> While its investigation is ongoing, EMA currently remains of the view that __the
> benefits of the AstraZeneca vaccine in preventing COVID-19, with its associated risk of
> hospitalisation and death, outweigh the risks of side effects.__  

So it looks like "no link of VTE events to AZ/OX vaccine" is the consensus opinion of
experts, not just loudmouth retired scientist bloggers.  Maybe you should believe _that_.  

## The Weekend Conclusion  

More and more people die from COVID every day; _that's_ the risk you need to beat.  

Thinking specifically about thromboembolisms, we've seen here that the AZ/OX vaccine
appears to _lower_ the risk compared to the general population.  And since it prevents
most COVID-19 which would skyrocket the rate of VTE, it seems slam-dunk-obvious that the
vaccine is A Good Thing to Do.  Withholding the vaccine means more people are at risk of
COVID-19, and more deaths.  

There is further risk that people will become superstitiously fearful of the AZ/OX
vaccine, and reject it entirely.  This is not a theorietical risk; there's actual
precedent for the Lyme disease vaccine from GSK.  People associated it with arthritis even
though the numbers said it was just random.  Enough people refused to take it, that the
vaccine was removed from the market, leaving the population exposed to Lyme disease.
Grady &amp; Robbins in the _NYT_ piece, _op. cit._, tell the story:  

> After the Food and Drug Administration approved a highly effective vaccine for Lyme
> disease in 1998, media reports and a class-action lawsuit gave fuel to complaints from
> people who said they had developed arthritis after being vaccinated. In 2001, the
> F.D.A. reconvened a panel of experts to review the vaccine’s safety data — clinical
> trials had turned up no difference in the frequency of long-term joint symptoms between
> the vaccine and placebo groups — and concluded that the vaccine should stay on the
> market.
> 
> But by then, public perception of the vaccine was too far gone: A steep drop-off in
> sales spurred the vaccine’s maker, GlaxoSmithKline, to pull the vaccine from the market
> in 2002.

That's the _last_ outcome we need with a COVID-19 vaccine.  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-in-the-pipeline.jpg" width="400" height="256" alt="SciTranslMed/In the Pipeline: Goings on for AZ/OX vaccine" title="SciTranslMed/In the Pipeline: Goings on for AZ/OX vaccine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The formidable med-chem blogger Derek Lowe has also weighed in at 
_In the Pipeline_ <sup id="fn15a">[[15]](#fn15)</sup>:  

> Let's say that the efficacy numbers come in at a solid, inarguable 60%. You would want
> to see a higher number in a better world, but 60% is a damn sight better than not
> getting vaccinated at all. Which is effectively what a number of European countries have
> chosen to do instead. If I were living in one of those countries where the cases are
> heading right back up, I would bare my arm immediately for a 60% effective vaccine and
> hope that as many other people as possible did the same.

Indeed.  

So why is that not what's happening?  There could be several reasons; I can think of at
least 3:  

- _Maybe they know something we don't._  For all the length of this post, we really only
  know 4 numbers: the number of observed VTEs in vaccinees (37), the number of vaccinees
  (5 million), the rate of VTE per fortnight in Europeans generally (3.8e-5), and the population of
  Europe (446 million).  The PRAC knows complete medical histories, and thus may be on the
  trail of something more subtle that is not visible in the top-line numbers.  True, they
  could be more transparent, but they're not necessarily doing the wrong thing here.  
- _Maybe they're extremely cautious, beyond any ability to compare risks._  That is, they
  see the VTEs in vaccinees and are paralyzed by fear.  This is, of course, worthy of our
  sympathy even though it is not rational.  
- _Maybe they're in severe political blame-avoidance mode._  One can realize there is no
  VTE danger posed by the vaccine, but doubt the ability of voters to realize the same thing.
  While likely true, this position deserves our contempt: politicians who would
  prefer citizens die of COVID-19 rather than save them with a medically useful but
  politically perilous vaccine are paralyzed by the basilisk-like gaze of their
  sociopathic self-regard.  
  
The AZ/OX vaccine, whatever stupidities may have been perpetrated in its name in its first
clinical trial, _does not look like it's at fault for clotting adverse events_.  It should
be restored to service as fast as possible, to prevent further COVID-19 deaths.  

## Addendum 2021-Mar-18: Some details on the thromboses found  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-science.jpg" width="400" height="405" alt="Science: some unnerving details about the thromboses found" title="Science: some unnerving details about the thromboses found" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
[Gary Cornell](https://garycornell.com/) emailed to ask if we'd seen the news report in 
_Science_ on the particular thromboses observed <sup id="fn16a">[[16]](#fn16)</sup>, and
why that made the authorities want to suspend use of the AZ/OX vaccine.  

Well, no&hellip; we hadn't.  But that's one of the things friends &amp; colleagues are for.  

Remember above where we said one of the possibilities might be that the regulatory
authorities know something we don't?  We didn't have a particularly high Bayesian prior on
that, but we're updating now to raise the posterior probability on that a bit:  

- It seems that although the _rate_ of thromboembolisms are not particularly scary (as we
  showed here), the _types_ of thromboembolisms _are_ pretty scary.  Ok, fair enough: that's
  only something one could know with access to detailed medical records, not the top-line
  numbers that we analyzed here.  
- They're analyzing 13 patients in particular (out of the 37 total VTEs?), in 5 separate
  countries.  That's a very low level of incidence, so the type had better be really scary.  
- They start with immune thrombocytopenia (ITP), which lowers platelet levels and increases
  clotting.  But then it led to cerebral sinus vein thrombosis (CSVT, above), which is a
  bit unusual &mdash; usually it would throw a clot to the lungs (PE), not the brain.
  This clot blocks the vein that drains the brain, the heart keeps pumping blood in while
  none drains out, and what you think happens next is what happens next.  This is sort of rare
  as clotting problems go, and to see 7 at one time in a vaccine-related setting is
  disturbing.  That's what caused the Paul Ehrlich Institute to raise the alarm.  
- Also, the CSVT's developed in younger people: they face acute danger from CSVT, but
  would have faced less danger with COVID-19 due to their youth.  So that's an imbalance
  of risk that would be unacceptable if a link were to be proven.  
- It's possible the cases _already had COVID-19_ when getting vaccinated, as "many" were
  healthcare workers and teachers.  The combined immune reaction could have caused ITP.
  That, of course, could be fixed with a COVID-19 PCR or antigen test before vaccination.  

On the one hand, witholding the vaccine is a problem, as expressed both here and by actual
experts:  

> "The harm caused by depriving people of access to a vaccine will likely vastly outweigh
> even the worst case scenario if any link to the clotting disorders is eventually found,"
> University of Leeds virologist Stephen Griffin told the United Kingdom's Science Media
> Centre. The European Medicines Agency (EMA) and the World Health Organization have
> recommended that countries continue immunizations while they investigate the reports.  
>  
> &hellip;  
>  
> EMA will convene a panel on Thursday to help figure out whether there was a causal
> relationship between the vaccinations and the highly unusual syndrome. For the moment,
> the agency is "firmly convinced" that the vaccine’s benefits outweigh any risks, [EMA
> head Elmer] Cooke said.  

On the other hand, the hematologists have now pointed to a very weird increase in CSVT and
a link to ITP that may be linked to vaccinating aleady COVID-positive patients.  That's
both a specific disease claim and a proposed method of action, so it's something to take
seriously.  

__Revised conclusion:__ It still looks to me like over-caution, given the absolute certain
risks of COVID-19.  But the relevant experts have pointed to something somewhat
worrisome.  It is _probably_ a fluke, but nobody knows at this point.  Maybe stopping the
vaccine _for a very short time_ while they investigate looks sensible?  

## Addendum 2021-Mar-19: AZ/OX vaccinations in Europe resumed  

<img src="{{ site.baseurl }}/images/2021-03-17-azox-vaccine-thrombo-pei.jpg" width="400" height="320" alt="Paul-Ehrlich-Institut: AZ/OX vaccine resumed with favorable risk/benefit" title="Paul-Ehrlich-Institut: AZ/OX vaccine resumed with favorable risk/benefit" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Various news sources are today reporting that the European authorities have begun using
the AZ/OX vaccine again.  To get the most skeptical report, we went to the
Paul-Ehrlich-Institut, the German institue for vaccines and biomedicines that first blew
the whistle on the unusual number of CSVTs.  In today's press 
release <sup id="fn17a">[[17]](#fn17)</sup>, they quoted the PRAC (Pharmacovigilance Risk
Assessment Committee) assessment of the EMA (European Medicines Agency) as
seeing a positive risk/benefit trade-off and the addition of a warning of "very rare
cases" of CSVT on the label:  

> The safety assessment by the Pharmacovigilance Risk Assessment Committee (PRAC) at the
> European Medicines Agency (EMA) confirms the positive benefit-risk ratio of COVID-19
> Vaccine AstraZeneca. As a risk-mitigation warning, the SmPC includes the fact that in
> very rare cases, specific thromboses are found in the period up to 16 days after
> vaccination. Based on the positive safety assessment by the EMA, Germany will resume
> vaccination with the COVID-19 Vaccine AstraZeneca starting 19 March 2021. Those willing
> to be vaccinated will be informed about the above cases during vaccination
> education. Medical doctors can find information on the website of the
> Paul-Ehrlich-Institut.  

In any large dataset, you're going to sample the outliers as well as the typical cases:
there will always be _something_ outrageous in the low-probability tails.  That's what
seems to have been the case here: if you you look carefully by slicing and dicing into all
possible subsets of all possible types, eventually _something_ will look statistically
significant.  Perhaps the trouble could have been avoided by a proper
[multiple hypothesis test correction](https://en.wikipedia.org/wiki/Multiple_comparisons_problem)
([more simply, visually, and brilliantly explained by XKCD](https://xkcd.com/882/)) like
my favorite, the 
[Benjamini-H&oumlaut;chberg method](https://en.wikipedia.org/wiki/False_discovery_rate#Benjamini%E2%80%93Hochberg_procedure)?  

As we saw here, where a delay in vaccination costs lives even when everybody is trying as
hard as they can to do good in the world, _statistical methods matter._  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: AstraZeneca, ["Phase III Double-blind, Placebo-controlled Study of AZD1222 for the Prevention of COVID-19 in Adults"](https://clinicaltrials.gov/ct2/show/NCT04516746), Clinical trial NCT04516746, [ClinicalTrials.gov](https://clinicaltrials.gov), retrieved 2021-Mar-16. [↩](#fn1a)  

<a id="fn2">2</a>: D Grady &amp; R Robbins, ["Should You Be Concerned About Blood Clots, Bleeding and the AZ-Vaccine?"](https://www.nytimes.com/2021/03/15/health/astra-zeneca-vaccine-blood-clots-bleeding.html), _New York Times_, 2021-Mar-15. [↩](#fn2a)  

<a id="fn3">3</a>: P Aldhous, S Lee, ["This Is What We Know So Far About AstraZeneca’s COVID-19 Vaccine And Blood Clots"](https://www.buzzfeednews.com/article/peteraldhous/astrazeneca-covid-vaccine-blood-clots), _BuzzFeed News_, 2021-Mar-15. [↩](#fn3a)  

<a id="fn4">4</a>: European Medicines Agency, ["COVID-19 Vaccine AstraZeneca: PRAC investigating cases of thromboembolic events - vaccine’s benefits currently still outweigh risks - Update"](https://www.ema.europa.eu/en/news/covid-19-vaccine-astrazeneca-prac-investigating-cases-thromboembolic-events-vaccines-benefits), [_EMA News_](https://www.ema.europa.eu/en), 2021-Mar-11. [↩](#fn4a)  

<a id="fn5">5</a>: European Medicines Agency, ["COVID-19 Vaccine AstraZeneca: PRAC preliminary view suggests no specific issue with batch used in Austria"](https://www.ema.europa.eu/en/news/covid-19-vaccine-astrazeneca-prac-preliminary-view-suggests-no-specific-issue-batch-used-austria), [_EMA News_](https://www.ema.europa.eu/en), 2021-Mar-10.[↩](#fn5a)  

<a id="fn6">6</a>: AstraZeneca, ["Update on the safety of COVID-19 Vaccine AstraZeneca"](https://www.astrazeneca.com/content/astraz/media-centre/press-releases/2021/update-on-the-safety-of-covid-19-vaccine-astrazeneca.html), AstraZeneca Press Release, 2021-Mar-14.[↩](#fn6a)  

<a id="fn7">7</a>: J Hill, _et al._, ["Frequency of venous thromboembolism in 6513 patients with COVID-19: a retrospective study"](https://ashpublications.org/bloodadvances/article/4/21/5373/469794/Frequency-of-venous-thromboembolism-in-6513), _Blood Adv_ 4:21 (2020), 5373-5377. [DOI](https://doi.org/10.1182/bloodadvances.2020003083)[↩](#fn7a)  

<a id="fn8">8</a>: K Boonyawat, _et al._, ["Incidence of thromboembolism in patients with COVID-19: a systematic review and meta-analysis"](https://thrombosisjournal.biomedcentral.com/articles/10.1186/s12959-020-00248-5), _Thrombosis Jnl_ 18:34 (2020).  [DOI](https://doi.org/10.1186/s12959-020-00248-5)[↩](#fn8a)  

<a id="fn9">9</a>: S Mondal, _et al._, ["Thromboembolic disease in COVID-19 patients: A brief narrative review"](https://jintensivecare.biomedcentral.com/articles/10.1186/s40560-020-00483-y), _Jnl Intens Care_ 8:7 (2020).  [DOI](https://doi.org/10.1186/s40560-020-00483-y) [↩](#fn9a)  

<a id="fn10">10</a>: H Phillipe, ["Overview of venous thromboembolism"](https://www.ajmc.com/view/overview-of-venous-thromboembolism), _Am J Manag Care_ 23(20 Suppl) 2017-Dec, S376-S382. PMID: [29297660]( https://pubmed.ncbi.nlm.nih.gov/26076949/)[↩](#fn10a)  

<a id="fn11">11</a>: J Heit, ["Epidemiology of venous thromboembolism"](https://www.nature.com/articles/nrcardio.2015.83), _Nat Rev Cardiol_ 12:8 (2015-Aug), 464-474. [PMC4624298](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4624298/). [PMID:26076949](https://www.ncbi.nlm.nih.gov/pubmed/26076949). [DOI](https://dx.doi.org/10.1038%2Fnrcardio.2015.83)[↩](#fn11a)  

<a id="fn12">12</a>: S Nebehay, J Gronholt-Pederson, ["WHO urges world not to halt vaccinations as AstraZeneca shot divides Europe"](https://www.reuters.com/article/us-health-coronavirus-idUSKBN2B71PU),
_Reuters_, 2021-Mar-15. [↩](#fn12a)  

<a id="fn13">13</a>: L Liverpool, ["No indication AstraZeneca vaccine causes blood clots, says regulator"](https://www.newscientist.com/article/2271478-no-indication-astrazeneca-vaccine-causes-blood-clots-says-regulator/), _New Scientist_, 2021-Mar-16. [↩](#fn13a)  

<a id="fn14">14</a>: European Medicines Agency, ["EMA's safety committee continues investigation of COVID-19 Vaccine AstraZeneca and thromboembolic events &ndash; further update"](https://www.ema.europa.eu/en/news/emas-safety-committee-continues-investigation-covid-19-vaccine-astrazeneca-thromboembolic-events), [_EMA News_](https://www.ema.europa.eu/en), 2021-Mar-15. [↩](#fn14a)  

<a id="fn15">15</a>: D Lowe, ["What is Going on With the AstraZeneca/Oxford Vaccine?"](https://blogs.sciencemag.org/pipeline/archives/2021/03/16/what-is-going-on-with-the-astrazeneca-oxford-vaccine), 
[_In the Pipeline_](https://blogs.sciencemag.org/pipeline/), 2021-Mar-16.[↩](#fn15a)  

<a id="fn16">16</a>: G Vogel &amp; K Kupferschmidt, ["'It's a very special picture.' Why vaccine safety experts put the brakes on AstraZeneca’s COVID-19 vaccine"](https://www.sciencemag.org/news/2021/03/it-s-very-special-picture-why-vaccine-safety-experts-put-brakes-astrazeneca-s-covid-19), _Science_, 2021-Mar-17.  doi:10.1126/science.abi5259[↩](#fn16a)  

<a id="fn17">17</a>: Paul-Ehrlich-Institut, ["COVID-19 Vac­cine As­traZeneca – Safe­ty As­sess­ment Re­sult: The Vac­cine is Safe and Ef­fec­tive in the Fight against COVID-19"](https://www.pei.de/EN/newsroom/hp-news/2021/210319-covid-19-vaccine-astrazeneca-safety-assessment-result-vaccine-safe-and-effective.html;jsessionid=CACC96A97C7AD605FB3B69AB329373DB.intranet221?nn=164440),
Paul-Ehrlich-Institut press releases, 2021-Mar-19. [↩](#fn17a)  
