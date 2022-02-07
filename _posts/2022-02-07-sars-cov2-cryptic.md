---
layout: post
title: SARS-CoV2 Cryptic Sequences in NYC Wastewater: Why Not to Sleep Well at Night
tags: COVID JournalClub PharmaAndBiotech Politics Statistics
comments: true
---

As long as [we've got our heads in the sewers]({{ site.baseurl }}/wastewater-reredux/), what else is happening with wastewater SARS-CoV2 analyses?  It turns out, New York City rather alarmingly has some "cryptic sequences" not yet observed in humans.  This is how the virus is scheming to throw another wave at us.  


## Astounding SARS-CoV2 diversity in NYC wastewater  

We've been saying for a while now (3 years into a global pandemic!) that the unvaccinated
pose various dangers: 
- to themselves, with higher risk of sickeness and death,  
- to those around them, whom they will likely infect,  
- to their local population, because they will clog the hospitals making people with heart
  attacks and broken legs wait for care behind the stubbornly unvaccinated, and
- to all of humanity because they are a reservoir for breeding new viral variants like
  Delta, and now Omicron.  

Turns out it's even _worse_ than that.  

Every day that we drag our feet, bungling global vaccination with glacial speed, the
SARS-CoV2 virus is mutating, moving into other animals ("reverse zo&ouml;nosis"), mutating
some more, and getting poised for a return to humans of yet another variant ("zo&ouml;nosis").  

<img src="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-1.jpg" width="400" height="283" alt="Smyth @ NatComm: Cryptic SARS-CoV2 sequences in NYC wastewater" title="Smyth @ NatComm: Cryptic SARS-CoV2 sequences in NYC wastewater" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Last Friday came news, via a publication by DS Smyth and 20 co-authors (the corresponding
authors are [MC Johnson](mailto:marcjohnson@missouri.edu) and 
[JJ Dennehy](mailto:john.dennehy@qc.cuny.edu)).  Writing in _Nature Communications_, they tell
us just how bad that problem is becoming. <sup id="fn1a">[[1]](#fn1)</sup>  (Keep in mind
that NYC is rather heavily vaccinated and boosted; you should expect the picture painted
below to be _much worse_ in the red states where vaccination has been resisted.)  

In today's Weekend Journal Club, we'll go through their paper and see what's what.  

__Blunt instrument summary:__  
- They've done targeted sequencing in wastewater for the receptor binding domain (RBD) of
  SARS-CoV2, for each of a dozen or so wastewater treatment facilities (WWTFs).  
- Their data tracks well with both the total patient count and with the clinical variants
  observed.  
- _However,_ they have also discovered multiple lineages of new viral variants, not yet
  observed in human.  
- These variants show increased affinity for human, mouse, and rat ACE2 receptors
  ("expanded receptor tropism"), and share mutations in several places with the very
  infectious Omicron strain.  
- They are also somewhat immune evasive, being largely resistant to the older monocloanl
  antibody infusions.  
- Obviously, if this is a new variant forming up, it is of serious concern.  

Yes, people say the devil is in the details, but so is G-d.  If you don't engage with the
details, you never get to see him.  So let's look through the details.  

### What they looked at  

There's a lot here about their methods: what instruments (iSeq and MiSeq), what primers
(in the Supplement), what software for NGS assembly, how to build lentiviral expression
constructs for the cryptic RBDs, how to make pseudoviridions for testing infection&hellip;
Yadda, yadda, yadda &ndash; lots of fun was had in the lab.  I didn't read it closely, but
as a person who used to know a thing or two about bioinformatics it looked more or less
reasonable.  I'm quite certain the _Nature_ referees _did_ take a close look, so let's
just trust them and look at the results.  

<a href="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-2.jpg"><img src="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-2-thumb.jpg" width="400" height="547" alt="Smyth @ NatComm Fig 1 A&amp;B: amplifications tracked and clinical/wastewater abundances over time" title="Smyth @ NatComm Fig 1 A&amp;B: amplifications tracked and clinical/wastewater abundances over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Here in Figure 1A they show us which parts of the viral genome they sequenced for.  It's
all in the S gene (for the spike protein), and in particular the RBD.  There were 2
versions done in the study: a short one from 435 - 505 done on an iSeq and later a longer
one from 412 - 579 done on a MiSeq.  (No samples were processed by both instruments as a
bridging study, but at least both saw the same constellation of mutations.)  

In Figure 1B they show pie charts breaking down (on the left) the distribution of patient
sequences observed in clinics, and (on the right) the distribution of sequences they
observed overall in wastewater.  We observe 2 things here:  
1. They accurately track the rise of the Alpha variant (orange sector) in both the
   clincial samples and the wastewater samples.  So they're measuring something in sewage
   that is relevant to medical need, over the time period 2021-Feb through 2021-Apr.  
2. The dark blue sector rises over time, indicating the slow rise of uknown lineages found
   only in wastewater but never (yet) in human clincial sequences as represented by the
   GISAID EpiCov database.  

__Conclusion:__ The wastewater signal appears to correlate with the clinical levels of
viral variants, e.g., the rise of Alpha.  It also tells us there's a lot more going on,
with new variants out there _somewhere_, but not showing up in clinical sequences!  

<a href="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-3.jpg"><img src="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-3-thumb.jpg" width="400" height="242" alt="Smyth @ NatComm Suppl Fig 1: NYC wastewater viral titer tracks confirmed clinical cases" title="Smyth @ NatComm Suppl Fig 1: NYC wastewater viral titer tracks confirmed clinical cases" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
We might also wonder if the signal they're extracting from wastewater tracks the level of
cases in the pandemic.  If not, then they might be measuring noise or something else, but
it's not clinically relevant.  If so, then they're onto something.

That's the subject of Supplement Figure 1 shown here (inexplicably banished to the
supplementary material, in keeping with modern tradition where All the Good Stuff is in
the supplement).  Here we see the time track over the first half of 2021 of the wastewater
viral titer (flow weighted across all the WWTF's in NYC) and the weekly average of
confirmed clinical cases.  We see that (a) they both tracked nicely together and (b)
wasn't that a great time in the middle of last year when we thought it might be over?  

__Conclusion:__ The wastewater signal appears to highly correlated with, and probably
related to, medical need.  

It would be one thing if they just discovered random mutations all over the place.  Then
the most likely explanation would be "sample handling", i.e., RNA is a delicate molecle
and shipping it through a sewer is not the best way to preserve the information in it.
However:  
- These cryptic sequences are _not rare_; at one point in one sewershed they constituted
  almost half the sequences recovered.  So they're not just rare errors.  
- The same mutations are seen over time, and more mutations accumulate over time and
  remain stable.  This indicates that the variant RNA is probably going _into_ the sewer,
  not being created afterwards while in the sewer.  
- The signals are geographically constrained: not very WWTF in NYC, just certain ones, and
  even then not all mutations show up at all of those.  This indicates some local
  population of host organisms that is not very mobile: humans in long-term care
  facilities or territorial animals.  

Some theories about what might be going on:  
- _Human patients who are highly geographically bound,_ like long-term are residents with
  asymptomatic infection might be one source.  A long infection would give the virus lots
  of time to mutate and adapt to the host.  
- _Viral cultures from other than the nasopharynx_ might have different sequences.
  SARS-CoV2 is known to like epithelial cells, so it might be that samples from the gut
  have different sequences from those we normally observe.  Swab your nose as deep as you
  like, you're probably not sampling your intestine!  (And if you are: I _beg_ you not to
  tell me about it.)  
- _Minority variants_ that get stepped on by sequence consensus algorithms might not be
  reported to GISAID EpiCov.  (Seems like a long shot to me, but ok.)  
  <img src="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-significance.jpg" width="400" height="345" alt="Auerbach @ Significance: Number of rats in NYC" title="Auerbach @ Significance: Number of rats in NYC" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
- _Animal reservoirs_ could also hold variant infections, as the virus adapts to a new
  non-human host.  One of the theories for the origin of Omicron is reverse zo&ouml;nosis
  from human to an animal, adaptation to the animal, then zo&ouml;nosis back into human.
  - They do some interesting work on this, looking for mammalian genetic material in
    wastewater.  They found human, cow, pig, rat, dog, cat, and sheep signals (but it was
    unclear if they looked for others; in particular, why not mouse and pigeon?).  
  - The cow, pig, and sheep signals are probably from food handling, and were discarded.  
  - That left dog, cat, and rat.  
    - Apparently there are 576,000 registered cats and 345,177
      registered dogs in NYC, with the actual number being about twice that, so call it 1.6
      million dogs and cats.  
    - But the rat population is estimated between 2 million and 8 million (emphasizing the
      lower end of that range), i.e., comparable to or more than the human
      population. <sup id="fn2a">[[2]](#fn2)</sup>  Also, rat rRNA was second only to
      human rRNA, representing almost 1% of the total reads.  So&hellip; Team Rat is
      lookin' kinda' guilty, there.  
  - However, different cryptic sequences were seen in different WWTFs, along with
    different animal populations.  So there may be no single animal population
    responsible.  

__Conclusion:__ The rat reservoir is looking awfully suspicious.  

### Why it matters  

So what?  If these putative new variants leave humans alone, can we just leave them alone?  

Maybe&hellip; but the evidence is that they probably _won't_ laeve humans alone!  

#### Binding to animal ACE2 receptors  

<a href="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-4.jpg"><img src="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-4-thumb.jpg" width="400" height="303" alt="Smyth @ NatComm Fig 2: Cryptic sequences binding to rat and mouse ACE2" title="Smyth @ NatComm Fig 2: Cryptic sequences binding to rat and mouse ACE2" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
To see if these lineages matter, they constructed some transduction-competent lentiviral
pseudoviruses (i.e., artificial and largely safe viruses, but which make cells express the
cryptic variant of the spike protein).  Then they exposed cells with human, rat, and mouse
ACE2 receptors (the SARS-CoV2 target) and saw how well they bound.  The result is shown
here in Figure 2: while the original SARS-CoV2 is not interested in mice or rats, these
new ones bind to mouse and rat ACE2 quite handily.  The result is statistically
significant by a 2-way ANOVA ($F$ = 17.81, df = 3, $p \lt 10^{-4}$).  

Now some SARS-CoV2 variants, like Beta and Gamma, have also learned to infect rats and
mice.  So this isn't completely convincing evidence that the cryptic sequences are from
mice and rats, but it's consistent with that.  

Whatever species does this, it has to do 4 things:  
1. Be present in the sewershed.  (SARS-CoV2 can infect lions and tigers, but relatively
   few lions and tigers are walking around NYC using toilets or street inlets to sewers.)  
2. Have a high enough population to matter.  (Way more rats than cats and dogs.)  
3. Be geographically localized, or territorial.  (Humans tend to wander about.)  
4. Have a route for wast to get into the sewers.  (Rats apparently happily inhabit
   sewers.)  

They didn't conclude this, being cautious, but rats are starting to look like a pretty
good target population to me.  Relatively few people would object to an urban rat
elimination program, too.  There would be little political opposition: while many
conservative politicians are rats, most rats are not politicians.  

So there's at least some evidence of reverse zo&ouml;nosis from human to rat, which
presages another zo&ouml;nosis from rat back to human, with yet another variant.  

It would be nice to avoid that, no?  

__Conclusion:__ The cryptic variants are consistent with mutations acquired to infect rats
and mice.  (However, Beta and Gamma can do that too, so we can't go further than
"consistent with".)  

#### Resistance to monoclonal antibodies  

<a href="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-5.jpg"><img src="{{ site.baseurl }}/images/2022-02-07-sars-cov2-cryptic-natcomm-5-thumb.jpg" width="400" height="235" alt="Smyth @ NatComm Fig 3: Cryptic sequences resist monoclonal abs, but less so with convalescent plasma" title="Smyth @ NatComm Fig 3: Cryptic sequences resist monoclonal abs, but less so with convalescent plasma" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

Still&hellip; even if these cryptic sequences indicate a new variant-to-be, if we have
effective treatments that might not matter much, right?  

This paper was submitted before paxlovid and molnupiravir, so we can't say much about
those.  (Other than my personal opinion that they're likely to be effective, since they
target things vastly different from the spike protein RBD.)  On the other hand, our stock
of monoclonal antibodies might be impacted!  

So: they looked at how cells infected (presumably with their constructed pseudoviruses)
reacted to the monoclonal abs available in mid-2021.  (NB: this is well before Omicron,
and the only monoclonal effective against Omicron, sotrovimab, was not available then.)  

They tested 4 cryptic variants, dubbed WNY 1-4, and a putative parental version of
SARS-CoV2, the D614G variant.  These were exposed to cells and then tested with 3
therapeutic antibodies: LY-CoV016 (etesevimab), LY-CoV555 (bamlanivimab), and REGN10987
(imdevimab).  These span the 3 classes of monoclonals then available, based on ther
binding characteristics.  

The results are shown in the top row of Figure 3.  The horizontal axis is concentration,
and the vertical axis is a luminance signal from an assay, where lower values indicate
lower values of virus.  What you want ot see is a curve that goes down with antibody
concentration, i.e., the antibody is driving out the virus.  The curve to compare with is
the purple curve, which is the putative parental lineage D614G.  
- 2 strains are completely resistant to LY-CoV016  
- All 4 strains are completely resistant to LY-CoV555  
- 2 strains are completely resistant to REGN10987 and the other two are partially
  resistant  
  
__Conclusion:__ The monoclonals typically available in the first half of 2021 are likely
to show anywhere from reduced efficacy to no efficacy at all against the cryptic
variants.  However, sotrovimab, the only remaining monoclonal against Omicron, was not
tested as it was not available then.  

In the bottom half of Figure 3, they compared the effect of human convalescent serum.
This is more broadly sensitive to the virus, not just the spike protein and not just the
RBD.  The picture here was a little better: 3 out of 4 cryptic variants showed
sensitivity.  

__Conclusion:__ Human convalescent serum still showed some protective effect.  But in
order to get this protection, you either must have had COVID-19 yourself, or receive serum
from somebody who has.  Either way, somebody had to get sick in a truly unfortunate way.  

So&hellip; the virus is apparently lurking in animal populations, mutating away, ready to
launch another variant against which at least some of our therapies won't work.  This is
_very_ bad news to anybody who's unvaccinated, and pretty bad news to the rest of us that
we haven't vaccinated fast enough to stop this evil nonsense.  


## The Weekend Conclusion  

Ok, so what have we learned in today's Weekend Journal Club?  

1. The wastewater signal appears to correlate with the clinical levels of viral variants,
   e.g., the rise of Alpha.  It also tells us there's a lot more going on,  
   with new variants out there _somewhere_, but not showing up in clinical sequences!  
2. The wastewater signal appears to highly correlated with, and probably
   related to, medical need.  
3. The rat reservoir is looking awfully suspicious.  
4. The cryptic variants are consistent with mutations acquired to infect rats
   and mice.  (However, Beta and Gamma can do that too, so we can't go further than
   "consistent with".)  
5. The monoclonals typically available in the first half of 2021 are likely
   to show anywhere from reduced efficacy to no efficacy at all against the cryptic
   variants.  However, sotrovimab, the only remaining monoclonal against Omicron, was not
   tested as it was not available then.  
6. Human convalescent serum still showed some protective effect.  But in
   order to get this protection, you either must have had COVID-19 yourself, or receive serum
   from somebody who has.  Either way, somebody had to get sick in a truly unfortunate
   way.  
   
You may think you're done with COVID-19.  And in the sense of a psychological event
occuring in your mind, that may indeed be the case.  __But:__ COVID-19 is not done with
you!  SARS-CoV2 is out there, spreading into animal reservoirs and the unvaccinated,
mutating to become even more infectious&hellip; and that's the next wave.  

How long can this go on?  As we've seen previously: if we do nothing, as Republicans in
the US insist, then [20,000 years is not out of the question.]({{ site.baseurl }}/really-long-covid/)
That's how long the ancient coronavirus in Asia took to burn itself out.  It left
permanent marks on the human genome, until everybody who didn't have resistance mutations
was dead.  

I would like to offer up my mild preference that we _not_ do that.  Getting vaccinated and
boosted _immediately_ is a good first step.  We'll probably need annual boosters at this
point.  Because we've dragged our feet so much catering to unvaccinated knuckleheads and
being slow about helping the developing world, we now have highly infectious variants like
Omicron, and cryptic variants in animals near us.  

It might take a generation of annual boosters to stomp that out.  A generation is better
than 20,000 years.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: DS Smyth, _et al.,_ ["Tracking cryptic SARS-CoV-2 lineages detected in NYC wastewater"](https://www.nature.com/articles/s41467-022-28246-3), _Nature Communications_ 13:635, 2022-Feb-04.  DOI: [10.1038/s41467-022-28246-3](https://doi.org/10.1038/s41467-022-28246-3).  

Amusingly, it appears an editor at _Nature_ may have forced a change from "wastewater treatement facility" (WWTF) to "wastewater treatment plant" (WWTP), because of the obvious "WTF" jest.  But they didn't catch _all_ instances of WWTF in the paper, which looks like passive resistance on the part of the authors to leave in this little jape.  

To which we can only respond, [&Gammad;&Tau;&Phi;]({{ site.baseurl }}/https://www.someweekendreading.blog/tags/#%CF%9C%CE%A4%CE%A6)?  [↩](#fn1a)  

<a id="fn2">2</a>: J Auerbach, ["Does New York City really have as many rats as people?](https://rss.onlinelibrary.wiley.com/doi/pdf/10.1111/j.1740-9713.2014.00764.x), _Significance_ 11, 22-27, 2014-Oct. [↩](#fn2a)  
