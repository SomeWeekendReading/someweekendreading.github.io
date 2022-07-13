---
layout: post
title: Is COVID-19 Omicron/BA.4-5 the Most Infectious Viral Disease in Human History?
tags: CatBlogging COVID JournalClub MathInTheNews Politics SomebodyAskedMe Statistics
comments: true
commentsClosed: false
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) about how seriously we
should take the COVID-19 Omicron/BA.4-5 variants, given that so many people are "done with
COVID" and refuse to mask.  Response: basically, we should take it _very_ seriously; people
without masks are being very silly.  Silly in a deadly fashion, irresponsible to the health
of the rest of us.  To answer the titular question: yes, unfortunately, it appears so.  


## But isn't COVID-19 mostly over?  

In a word: no.  

<img src="{{ site.baseurl }}/images/2022-07-12-most-infections-disease-cdc-1.jpg" width="400" height="150" alt="US CDC COVID-19 Data Tracker" title="US CDC COVID-19 Data Tracker" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

One might be excused for _thinking_ it's over, given the wildly incompetent media
reports, the corporate pressure for "business as usual", the glacial government reaction
times, and the social conformity pressure to pretend so by doffing masks.  (Hey, the 
[Asch conformity experiments](https://en.wikipedia.org/wiki/Asch_conformity_experiments)
are a Real Thing!)  For example, many news sources consult the CDC's COVID Data tracker
<sup id="fn1a">[[1]](#fn1)</sup>, which is normally a very good source indeed.  

But&hellip; for inscrutable reasons, it by default reports the most sunny view of the
data, and buries the darker and more forward-looking view under a drop-down menu.  

Let's have a look and see what it says.  

### The default view (the current snapshot): community level  

<a href="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-cdc-2.jpg"><img src="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-cdc-2-thumb.jpg" width="400" height="243" alt="US CDC COVID Tracker: Community levels, 2022-Jul-12" title="US CDC COVID Tracker: Community levels, 2022-Jul-12" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-07-12-most-infections-disease-cdc-3.jpg"><img src="{{ site.baseurl }}/images/2022-07-12-most-infections-disease-cdc-3-thumb.jpg" width="400" height="509" alt="US CDC COVID Data Tracker: community level definition" title="US CDC COVID Data Tracker: community level definition" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
If you just na&iuml;vely open the CDC COVID Data Tracker and ask for all US data at the
county level, you get by default the reassuring map shown here.  There's all that lovely,
calming green in here in the fastness of New England, so here at Ch&acirc;teau Weekend we
always like to see that.  Sure, Florida's a disaster, but they shoot themselves in the feet
with great regularity, so no surprise there.  The conservative red states of the south and
west are somewhat similar.  California's a bit surprising to me, but perhaps not to people
who keep up with this sort of thing.  

Generally speaking, this says community levels are currently manageable.  It's an
over-interpretation to say "COVID is over", but you can see how overly excitable people
might look at this map and conclude that.  

But what do they _mean_ by "community level" of COVID-19?  The explainer box tells us.  It's
the higher of 2 measures: hospital admissions or inpatient beds of those already
hospitalized, per 100,000 population over the trailing 7 days.  There are separate
thresholds for calling low/medium/high depending on whether there are more or less than
200 cases.  

While one can argue endlessly over the details of whether or not this measures what you
care about, one thing is clear: it is a snapshot of _current_ hospital loads over 1 week
in time.  It is _not_ a forward-looking measure that can give you an idea of what's to
come!  

### The forward-looking view: community transmission  

<img src="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-cdc-4a.jpg" width="400" height="320" alt="US CDC COVID Data Tracker: Community transmission in drop-down, after scrolling" title="US CDC COVID Data Tracker: Community transmission in drop-down, after scrolling" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-cdc-4.jpg"><img src="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-cdc-4-thumb.jpg" width="400" height="243" alt="US CDC COVID Data Tracker: Community transmission levels, 2022-Jul-12" title="US CDC COVID Data Tracker: Community transmission levels, 2022-Jul-12" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2022-07-12-most-infections-disease-cdc-5.jpg"><img src="{{ site.baseurl }}/images/2022-07-12-most-infections-disease-cdc-5.jpg" width="400" height="169" alt="US CDC COVID Data Tracker: community transmission definition" title="US CDC COVID Data Tracker: community transmission definition" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

There are other metrics one might prefer, to get a more forward-looking picture.  To their
credit, the CDC does provide those.  To their discredit, they are not the default, and are
in fact buried in a drop-down that must be scrolled down to the bottom to find them!
That's the situation highlighted here: click on the "Data Type" drop-down, scroll _all the
way to the bottom_ to find "Community Transmission" (which I've circled in red), or how
COVID-19 is currently growing in the US at the county level of granularity.  

Current community levels tell you about what's happening _right now;_ community
transmission levels tell you where things are going.  It's just bizarre to me that this is
not the default, and that the default is a measure so misleadingly sunny in its outlook.  

The community transmission level is quite grim: almost everywhere in US territory is now
high.  

Another bonus point is that the definition of community transmission level is simpler than
the above rules for community levels, i.e., just a combination of _per capita_ case rates
and positive test rates.  (And the positive test rates are woefully underestimated, since
most people don't report home tests.  The real numbers are likely much worse.)  

This looks to me like another wave is forming up.  Feel free to call me on this in a
couple of months if I'm wrong!  


## What about COVID-19 Omicron/BA.4-5 transmission?  

<img src="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-guardian-1.jpg" width="400" height="211" alt="Esterman @ Guardian: BA.4-5 subvariants are most contagious yet" title="Esterman @ Guardian: BA.4-5 subvariants are most contagious yet" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-siderea-1.jpg" width="400" height="238" alt="Sibylla Bostoniensis: R0 = 18.6" title="Sibylla Bostoniensis: R0 = 18.6" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So it looks like there's a lot of COVID-19 being passed around.  Is that due to the
Omicron variants, specifically the BA.4 and BA.5 subvariants, or is it something else?  

I came across an article by Esterman in _The Guardian_ <sup id="fn2a">[[2]](#fn2)</sup>
on this topic. Understandably he's mostly focused on Australia, but we all know by now
that pandemics are global in nature, and you can't hide simply by being on the opposite
side of the world.  (Ok, maybe New Zealand or Tonga, if you're an island nation willing to
seal your borders _completely,_ even to your own citizens.)  

It was also signal-boosted at _Sibylla Bostoniensis_ <sup id="fn3a">[[3]](#fn3)</sup>, by
Siderea in her role as "freelance psychopomp" to the "Greater-Boston Weirdo-American
community".  (I _wish_ I could make up titles that cool!)  

Here's the key paragraph:  

> __How transmissible are BA.4/5?__  
>  
> We measure how contagious a disease is by the basic reproduction number (R0). This is
> the average number of people an initial case infects in a population with no immunity
> (from vaccines or previous infection).  
>  
> New mutations give the virus an advantage if they can increase transmissibility:  
>  
> - the original Wuhan strain has an R0 of 3.3  
> - Delta has an R0 of 5.1  
> - Omicron BA.1 has an R0 of 9.5  
> - BA.2, which is the dominant subvariant in Australia at the moment, is 1.4 times more
>   transmissible than BA.1, and so has an R0 of about 13.3  
> - a pre-print publication from South Africa suggests BA.4/5 has a growth advantage over
>   BA.2 similar to the growth advantage of BA.2 over BA.1. That would give it an R0 of 18.6.  
>  
> This is similar to measles, which was until now was our most infectious viral disease.  

$R_0 \sim 18.6$?!  That's&hellip; eye-popping.  We better check out his references to make
sure that's what they really say.  Also, this seems like a good place to collect those
references in one big bag, so we have an easy source to which to refer people.  

So let's check each of those 6 points:  

1. __Original Wuhan variant:__ The source cited here is from an Australian public
   health agency <sup id="fn4a">[[4]](#fn4)</sup>, though since it's only the appendix we
   can't really see who the authors are or the main thrust of the report.  It seems to
   have been written at a time when Australia was moving from Delta- to
   Omicron-dominance.   Page 2 confirms the numbers Esterman cited in his first 3 claims:
   ancestral $R_0 \sim 3.28$, Delta $R_0 \sim 5.08$, Omicron/BA.1 $R_0 \sim 9.5$.  
2. __Delta variant:__ The source cited is a paper by Liu &amp;
   Rockl&ouml;v <sup id="fn5a">[[5]](#fn5)</sup>, which estimates Delta $R_0$.
   It is a meta-analysis of 5 other studies, finding a range of 3.2 &ndash; 8, with a mean
   of 5.08.  So that successfully documents Esterman second claim.  
3. __Omicron/BA.1:__ The source cited is a follow-up paper by Liu &amp;
   Rockl&ouml;v <sup id="fn6a">[[6]](#fn6)</sup> about 6 months later.  This is another
   meta-analysis of 5 other studies, separately estimating $R_0$ and $R_e$.  About halfway
   down Table 1 is the punchline: Omicron/BA.1 $R_0 \sim 9.5$.  Confirmed again.  
4. __Omicron/BA.2:__ Here we have a bit of an ambiguity.  The source cited is a
   paper in _Nature Signal Transduction &amp; Targeted Therapy_ by Fan,
  _et al._ <sup id="fn7a">[[7]](#fn7)</sup>  They don't _quite_ state that $R_0 \sim
   13.3$, but they do say:  
   - Delta $R_0 \sim 3.2 - 8$ with a mean of 5.08, from the work above by Liu &amp; Rockl&ouml;v  
   - Omicron (presumably BA.1?) is approximately 3.2x more transmissible than Delta  
   - Omicron/BA.2 is approximately 1.4x more transmissible than Omicron/BA.1  
   However, you can't just multiply $5.08 \times 3.2 \times 1.4$ to get an $R_0$ for
   Omicron/BA.2 from Delta.  (The transmissibility numbers refer to transmission rates among household
   contacts.)  Now, I haven't scrutinized every single sentence in this paper, but I read
   through it quickly and couldn't find any explicit claim that Omicron/BA.2 
   $R_0 \sim 13.3$.  Esterman _might_ have taken the Omicron/BA.2 $R_0$ and just
   multiplied by 1.4: $9.5 \times 1.4 = 13.3$, which is what he claimed.  
5. __Omicron/BA.4-5:__ The sources cited here are a South African preprint on
   BA.4-5 <sup id="fn8a">[[8]](#fn8)</sup> and a _Nature_ news explainer on the subject by
   Ewen Callaway. <sup id="fn9a">[[9]](#fn9)</sup>  Neither of them quote an $R_0 \sim
   18.6$, or, for that matter, any other value.  The closest I can get is the statement
   that "&hellip; BA.5 had a daily growth advantage of &hellip; 0.12 (95% CI 0.09 - 0.15)
   &hellip; relative to BA.2".  It's not especially obvious how Estermans got to the very
   specific reproduction number of 18.6.  
6. __Measles:__ The measles comparison cites a meta-analysis by FM Guerra,
   _et al._ <sup id="fn10a">[[10]](#fn10)</sup>  It is unfortunately behind an execrable
   paywall, but their abstract declares they found _significantly more variation_ than the
   usually cited $R_0 \sim 12 - 18$.  So again, no precise quantitative confirmation.  
   
__Summary:__ 
- Claims 1-3 are solidly verified as occurring in explicit form in the
  scientific literature.  
- Claims 4-6 appear to be a result of fiddling around with multiplying "more
  transmissible" numbers by previous versions of $R_0$.  


## The Weekend Conclusion  

We can't sign off on full agreement with Esterman at the quantitative level.  However, we
_can_ agree with him on a qualitative basis, i.e., $R_0$ for Omicron/BA.5 is hella huge,
whatever the particular value on which we converge.  

<img src="{{ site.baseurl }}/images/2022-07-12-most-infectious-disease-weekend-publisher.jpg" width="400" height="533" alt="The Weekend Publisher is somewhat disengaged" title="The Weekend Publisher is somewhat disengaged" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
It may or may not be as bad as measles, which is so far the most contagious viral disease
known.  But it's surely very bad.  

Alas, it's hard to wake people up to this reality.  Most of my acquaintances, even here in
liberal New England, are hypnotically transfixed by the "end of COVID-19", and keep
telling those of us wearing masks we can take them off.  As you can see from the evidence
above, nothing of the sort is the case: community transmission levels are high, and
Omicron/BA.5 appears to be a contender for the worst viral disease of all time, with a
good chance to take the title from measles.  

I tried to explain this to the Weekend Publisher.  But as you can see here, he's like my
acquaintances: too busy napping to pay attention.  

His excuse is that he's just a cat.  What's everybody else's excuse?  

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

<a id="fn1">1</a>: US CDC Staff, ["COVID Data Tracker"](https://covid.cdc.gov/covid-data-tracker/#county-view?list_select_state=all_states&list_select_county=all_counties&data-type=CommunityLevels&null=), US Centers for Disease Control &amp; Prevention, downloaded 2022-Jul-12. [↩](#fn1a)  

<a id="fn2">2</a>: A Esterman, ["New Covid subvariants BA.4 and BA.5 are the most contagious yet – and driving Australia’s third Omicron wave"](https://www.theguardian.com/world/2022/jul/05/new-covid-variants-ba4-ba5-most-contagious-australia-third-omicron-wave-coronavirus-subvariants-ba-4-5), _The Guardian_, 2022-Jul-04. [↩](#fn2a)  

<a id="fn3">3</a>: Siderea, ["R0 18.6"](https://siderea.dreamwidth.org/1767577.html), _Sibylla Bostoniensis_, 2022-Jun-11. [↩](#fn3a)  

<a id="fn4">4</a>: Unnamed Australian health agency staff, ["COVID-19 CDNA National Guidelines for Public Health Units, Appendix A - Current variants of concern"](https://www1.health.gov.au/internet/main/publishing.nsf/Content/7A8654A8CB144F5FCA2584F8001F91E2/%24File/App-A-Current-variants-concern.pdf), early 2022, retrieved 2022-Jul-12. [↩](#fn4a)  

<a id="fn5">5</a>: Y Liu &amp; J Rockl&ouml;v, ["The reproductive number of the Delta variant of SARS-CoV-2 is far higher compared to the ancestral SARS-CoV-2 virus"](https://academic.oup.com/jtm/article/28/7/taab124/6346388?login=false), _J Travl Med_ 28:7, 2021-Oct-11, taab124.  DOI: [10.1093/jtm/taab124.](https://doi.org/10.1093/jtm/taab124). [↩](#fn5a)  

<a id="fn6">6</a>: Y Liu &amp; Ja Rockl&ouml;v, ["The effective reproductive number of the Omicron variant of SARS-CoV-2 is several times relative to Delta"](https://academic.oup.com/jtm/article/29/3/taac037/6545354?login=false), _J Travel Med_ 29:3, 2022-Mar-09, taac037.  DOI: [10.1093/jtm/taac037](https://doi.orgp/10.1093/jtm/taac037). [↩](#fn6a)  

<a id="fn7">7</a>: Y Fan, _et al.,_ ["SARS-CoV-2 Omicron variant: recent progress and future perspectives"](https://www.nature.com/articles/s41392-022-00997-x), _Nature Sig Transd &amp; Targ Ther_ 7:141, 2022-Apr-13. DOI: [10.1038/s41392-022-00997-x](https://doi.org/10.1038/s41392-022-00997-x). [↩](#fn7a)  

<a id="fn8">8</a>: H Tegally, _et al.,_ ["Continued Emergence and Evolution of Omicron in South Africa: New BA.4 and BA.5 lineages"](https://www.medrxiv.org/content/10.1101/2022.05.01.22274406v1.full), preprint at _medR&chi;iv_, 2022-May-02.  DOI: [10.1101/2022.05.01.22274406](https://doi.org/10.1101/2022.05.01.22274406). [↩](#fn8a)  

<a id="fn9">9</a>: E Callaway, ["What Omicron’s BA.4 and BA.5 variants mean for the pandemic"](https://www.nature.com/articles/d41586-022-01730-y), _Nature_ 606, 848-849 (news explainer), 2022-Jun-23. [↩](#fn9a)  

<a id="fn10">10</a>: FM Guerra, _et al.,_ ["The basic reproduction number (R0) of measles: a systematic review"](https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(17)30307-9/fulltext), _The Lancet Infectious Diseases_ 17:12, e420-e428, 2017-Dec-01.  DOI: [10.1016/S1473-3099(17)30307-9](https://doi.org/10.1016/S1473-3099(17)30307-9). [↩](#fn10a)  
