---
layout: post
title: When Was the Norse Settlement at L'Anse aux Meadows in Newfoundland?
tags: Math Physics Statistics
comments: true
---

Hey, let's think about something that's not COVID-19!  Like, for example: when _exactly_
did the Norse settlement at L'Anse aux Meadows in Newfoundland happen?  


## How long Europeans have been in the Americas  

This used to be a simple question when I was in primary school: how long have Europeans
been in the Americas?  It was a frequently asked question, becase it tested 3 things:  
- whether you knew the current year,  
- whether you knew Columbus came in 1492, and  
- whether you could reliably subtact two 4-digit integers.  

It's also the sort of thing that turns kids off to history.  They think it's a bunch of
tedious memorization of dates of doubtful relevance to be regurgitated at the appropriate
moment for teachers and tests of doubtful motives.  And indeed, that's true for how
history is usually taught.  There's none of the reason _why_ people did things, or refused
to do other things: food, territory, power, marriages, slavery, spices, cloth, &hellip;
all kinds of things that are interesting and relevant get pressed out of the pablum fed to
kids.  

No wonder they're bored.  

The other half that still frosts me is that we used to idealize Columbus, when even a kid
could look at the facts and realize this was a terrible, terrible man.  He introduced
slavery of the most vicious sort, began the process of decimation of Native Americans and
generally started the European destruction of 500 or so nations that were just in North
America alone.  

Besides, after a while, it got around that Leif Erikson's kids got here earlier anyway.
And unlike Columbus, they sort of took a look around, shrugged, and left.  There was no
damage to Native American culture.  (The story with Greenland and the 
[_skrælingi_](https://en.wikipedia.org/wiki/Skr%C3%A6ling) was, of
course, another matter.  That, along with a cooling climate, eventually led to the
abandonment of Greenland.)  


## L'Anse aux Meadows  

That brings us to the question: how long _exactly_ since Europeans began exploring North
America?  

<img src="{{ site.baseurl }}/images/2021-11-01-viking-american-dates-LAM.jpg" width="233" height="265" alt="Wikipedia: L'Anse aux Meadows in Newfoundland/Labrador" title="Wikipedia: L'Anse aux Meadows in Newfoundland/Labrador" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
One of the earliest (maybe _the_ earliest) site of undisputed Norse settlement is 
[L'Anse aux Meadows](https://en.wikipedia.org/wiki/L%27Anse_aux_Meadows) on the northern
tip of Newfoundland.  

So&hellip; when _exactly_ was that?  


## The usual dating methods  

That brings us to a _Nature_ paper by Kuitems, _et al._ <sup id="fn1a">[[1]](#fn1)</sup>
which actually answers that question in a very satisfying way!  

The usual methods one would try here are dendrochronology and carbon-14 dating:  
- __Dendrochronology:__ Here you hope to get a big piece of wood, with lots of tree growth
  rings.  Since not every year is the same for trees, sometimes they have thick growth
  rings for years with good rain/soil/etc. and think growth rings with bad rain/fire/etc.
  If you can nail down the date of a piece of wood in the same region, you can use the
  thick/thin pattern of the layers of wood to match up other trees and build a timeline.  
  
  Unfortunately for us, there's no such database of dated wood samples for Newfoundland
  around 1000CE.  
- __Carbon-14 dating:__ Here you look at the amount of carbon-14 in a sample, and use the
  fact that carbon-14 decays with a half-life of 5730 years.  Carbon-14 is taken in by
  living things from the environment, and stops being taken in when they die.  So if you
  have some idea what the original carbon-14 to carbon-12 ratio should have been while a
  tree was living, you can figure out how long ago that was.  
  
  Unfortunatley, 3 problems:  
  - The amount of carbon-14 is not constant, but varies a bit: about 2 parts per thousand
    per year.  So that introduces some noise.  
  - The calculation involves backward extrapolation of an exponential, which is
    numerically very unstable.  
  - The original carbon-14 work at L'Anse aux Meadows was done in the 1960s, by methods
    which are somewhat crude today.  

  <img src="{{ site.baseurl }}/images/2021-11-01-viking-american-dates-crude-dates.jpg" width="400" height="277" alt="Crude carbon-14 dates combined for L'Anse aux Meadows" title="Crude carbon-14 dates combined for L'Anse aux Meadows" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
  So the carbon-14 answers, using some sophisticated methods called "wiggle-matching"
  (yes, really) to account for yearly differences initially tell us roughly 700CE &ndash; 
  1100CE as a date for L'Anse aux Meadows.  If you carefully combine all the samples from
  many different pieces, you can narrow that down to 1019CE &ndash; 1024CE, as shown in
  Figure 1 from the paper.

That's&hellip; nice, but Kuitems _et al._ decided to do better!  


## An intriguing dating method  

What if you could _combine_ carbon-14 dating and dendrochronology?  If you had a strong
reference year when carbon-14 was high world-wide, due to some sort of radiation event all
over the planet, then you could find tree rings that match and work outward from there.  

<img src="{{ site.baseurl }}/images/2021-11-01-viking-american-dates-775-spike.jpg" width="400" height="390" alt="Wikipedia: the 775 spike in Be10, C14, and CL36" title="Wikipedia: the 775 spike in Be10, C14, and CL36" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Fortunately, there are 2 events that pretty much fit the bill.  There were carbon-14 "spikes"
in [774CE &ndash; 775CE](https://en.wikipedia.org/wiki/774%E2%80%93775_carbon-14_spike)
and [993CE &ndash; 994CE](https://en.wikipedia.org/wiki/774%E2%80%93775_carbon-14_spike).
Since there's an increase of beryllium-10 as well, the origin is probably in a massive
solar storm.  Massive solar aurora observations were recorded in late 992CE in Korea,
Germany, and Iceland: a planet-wide event.  

The figure here from Wikipedia shows the spikes in Be10, C14, and CL36 all clustered
around the 774CE - 775CE spike.  (The 993CE spike is more relevant, but I didn't see a
similar plot for that one.)  

<img src="{{ site.baseurl }}/images/2021-11-01-viking-american-dates-1021CE.jpg" width="400" height="276" alt="Date of tree felling: 1021CE, exactly" title="Date of tree felling: 1021CE, exactly" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"> 
By identifying which ring in their sample was the 993 spike in C14, it was mostly a matter
of counting outward to the outermost bark ring to determine the year the tree was felled.
Identifying the 993 ring was done by minimizing a $\chi^2$ statistic.  

$$
\chi^2_{(x)} = \sum_{i=1}^n \frac{(R_i - C(x-r_i))^2}{\delta R_i^2 + \delta C(x - r_i)^2}
$$

where: 
- $R_i \pm \delta R_i$ are the measured carbon-14 sample dates,  
- $C(x - r_i) \pm \delta C(x - r_i)$ are the carbon-14 concentrations for the year $(x - r_i)$,  
- $x$ is the trial age for the outermost (bark) ring of the wood, and  
- $r_i$ is the tree-ring number (with the outer ring being 0 and counting down into
  negative numbers as one goes inward).  

The value of $x$ is chosen to minimize $\chi^2$, and this is what's shown in Figure
2a with a _sharp_ minimum indicated.  

While the details are interesting, Figure 2a from the paper shows that there is absolutely
no argument about where the date of tree felling should be placed: __1021CE, exactly,
across multiple samples.__ (By looking at the structure of the outer ring, one can even
determine that it was springtime!)  

They went to a lot of other effort to compare this result with sources like the Icelandic
Sagas: an oral history that was written down a couple centuries later.  Bottom line: it's
all consistent.  


## The Weekend Conclusion  

So, if you're a primary school student today and your teacher asks you how long have Europeans
been exploring North America, what should you answer?  

In this year of 2021CE, you should maybe look at your phone to get the time of day as a
little extra florish, and then answer "exactly 1000 years, perhaps 6 months more if the
trees at L'Anse aux Meadows were really felled in the spring, given that it's now November."  

You're still gonna get sent to the principal's office for the crime of being a smartass,
no way around that.  But it'll be satisfying to know you can prove your answer was _right_
by referring to the scientific literature, yes?  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: M Kuitems, ["Evidence for European presence in the Americas in AD 1021"](https://www.nature.com/articles/s41586-021-03972-8), _Nature_, 2021-Oct-20.  DOI: [10.1038/s41586-021-03972-8](https://doi.org/10.1038/s41586-021-03972-8). [↩](#fn1a)  
