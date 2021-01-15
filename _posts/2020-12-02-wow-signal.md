---
layout: post
title: Proposed source of the &quot;Wow!&quot; signal?
tags: Physics
comments: true
---

The [sad news about Arecibo]({{ site.baseurl }}/alas-arecibo/) brings up
the topic of SETI.  In better news, an amateur astronomer has proposed a particular star
as the source of the famous "Wow!" event, using the Gaia Archive.  Wait, _what?_  

Popular physics reporting went a bit nuts last week or two
<sup id="fn1a">[[1]](#fn1)</sup> <sup id="fn2a">[[2]](#fn2)</sup> <sup id="fn3a">[[3]](#fn3)</sup> 
(though the professional physics venues have yet to say much at all) about a preprint
describing a search for a sun-like star, potentially with planets, that is positioned to
have been the source of the "Wow!" signal in SETI.  Let's unpack what that may, or may not, mean.  


## SETI  

[SETI](https://en.wikipedia.org/wiki/Search_for_extraterrestrial_intelligence) is a
physics research area devoted to searching for evidence of extraterrestrial intelligence.
Mainly, this is done through radio astronomy for various reasons involving low cost to
send an interstellar message, fairly obvious ways to stand out against background noise,
reasonable knowledge of physics directing the choice of frequencies, and so on.  Most
natural phenomena are wide-band, i.e., smeared out over a wide range of radio
frequencies.  So the holy grail of this entire enterprise is to find a signal which is (a)
highly localized to a specific location in the sky that tracks sidereally, and (b) is very
narrow-band in the way its power is spread across frequencies.  (There are other
requirements, like scintillation, but we'll gloss over the details.)  


## The &quot;Wow!&quot; signal  

<img src="{{ site.baseurl }}/images/2020-12-02-wow-signal-wow.jpg" width="400" height="222" alt="Wow! signal" title="Wow! signal" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
On 1977-Aug-15, that happened.  

Observers using the "Big Ear" radio telescope at OSU detected a narrow-band signal coming
from Saggitarius.  Jerry Ehman, the astronomer on duty, wrote "Wow!" on the compuer
printout, and so to this day it's called the 
[Wow! signal](https://en.wikipedia.org/wiki/Wow!_signal).  (Time is on the vertical axis in the
printout, increasing downward.  The horizontal axis is for frequency bands.)  There was no
detectable modulation that anyone could figure out, but it was remarkably spatially
localized and narrow-band.  

The Big Ear telescope observed it for a time window of 72 seconds.  This is to be
expected: the instrument relied on the rotation of the earth to scan it across the sky,
and given that rotation, a sidereal-tracking signal (stationary with respect to the stars) 
should be bright for about 72 seconds, with peak intensity in the middle of that interval.  

<img src="{{ site.baseurl }}/images/2020-12-02-wow-signal-wow-gaussian.jpg" width="400" height="222" alt="Wow! signal vs time" title="Wow! signal vs time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>

The mysterious "6EQUJ5" is an idiosyncratic way of recording the signal intensity vs time,
given the instruments of the day.  Each frequency band listened for 10 seconds, processed
for 2 seconds, and then printed out a single character describing the average power (minus
baseline) for that 10 second interval, divided by the standard deviation.  (It was blind
during the 2 second compute interval.)  

The value reported is the dimensionless ratio of background-subtracted intensity to
standard deviation (noise, basically).  It frustrtes me that no quickly-available source
would write the equation, but I'm guessing it was combining the signal from horns 1 and 2
in some way like:  

$$
\begin{align*}
  \mathrm{Signal} & = \frac{|\mu_1 - \mu_2|}{\sqrt{\sigma_1^2 + \sigma_2^2}} \\
\end{align*}
$$

That's printed out as a single alphanumeric character in [0-9A-Z], basically a single
digit base 36.  "6EQUJ5" is the series of observations at 12-second intervals of that
signal-to-noise ratio.  E.g., a "5" means the mean difference in average power between the
2 horns was about 5 times the combined noise in both horns.  The "U" is about 30&sigma;
above noise.  

It fits a Gaussian versus time; as expected given the rotation of the earth taking
the dish away from the source, it peaked right in the middle of the 72 second window of
observation.  It was at a center frequency of 1420.4556 &plusmn; 0.005 MHz, just above the
[hydrogen line](https://en.wikipedia.org/wiki/Hydrogen_line).  The bandwidth was below
10kHz, that being the minimum bandwidth the Big Ear's instruments could handle, back in
the day.  Terrestrial sources are unlikely, since that frequency is in a protected band.
(Though apparently the military does occasionally flout that protection?)  

It has never been seen since.  


## Enter Gaia  

<img src="{{ site.baseurl }}/images/2020-12-02-wow-signal-gaia.jpg" width="400" height="244" alt="Artistic impression of Gaia in space" title="Artistic impression of Gaia in space" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
In 2013, the [European Space Agency](https://en.wikipedia.org/wiki/European_Space_Agency)
launched the [Gaia space observatory](https://en.wikipedia.org/wiki/Gaia_(spacecraft)).
It's measuring the position, distance, and proper motion of stars, quasars, some of the
larger exoplanets, and more domestic things like comets.  It does so with astounding
precision.  For stars, it also uses a spectrophotometer to record luminosity, surface
temperature, gravity, and composition (such as metallicity).  

By observing each of about 1 billion objects 70 times during the spacecraft
lifetime, it is building a 3D map of objects along with their proper velocities.  

It's truly extraordinary!  


## Gaia and Wow!  

Back in 1977, when the Wow! signal happened, people used the star catalogs of the day to
see if there was a particular sun-like star in the 2 patches of sky whence came the
signal.  (2 patches because the instrument had 2 feed horns.)  They found nothing of
interest, meaning the star catalogs back then were quite sparse and there were a plethora
of stars not really adequately characterized.  

Enter amateur astronomer, Alberto Caballero, who searched the Gaia Archive for stars
somewhat like our own, in the right area(s) of Saggitarius. <sup id="fn4a">[[4]](#fn4)
He used these filters:  
- Spectral type K to G  
- Estimated stellar radius 0.83 - 1.15 solar radius
- Estimated temperature 4450 - 6000 K
- Estimated luminosity 0.34 - 1.5 solar luminosity

That found 38 candidate stars in the positive feed horn's patch of sky, and 28 for the
negative feed horn.  

<img src="{{ site.baseurl }}/images/2020-12-02-wow-signal-2MASS_19281982-2640123.jpg" width="400" height="263" alt="2MASS 19281982-2640123 from Caballero preprint" title="2MASS 19281982-2640123 from Caballero preprint" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2020-12-02-wow-signal-2MASS_19281982-2640123-IR.jpg" width="400" height="303" alt="2MASS 19281982-2640123 from NASA/IPAC Infrared Science Archive" title="2MASS 19281982-2640123 from NASA/IPAC Infrared Science Archive" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
However, with more conservative filters (e.g., demanding temperatures between 5730 - 5830&deg;K
to be more like the sun), there were no stars in the positive horn beam and exactly 1 in
the negative horn beam: Gaia source_id 6766185791864654720, known in the 
[2-Micron All-Sky Survey (2MASS)](https://en.wikipedia.org/wiki/2MASS) archive as
2MASS 19281982-2640123:  
- Range: 552 parsec = 1801 ly  
- Temperature: 5783 K  
- Radius: 0.9965662 solar radius  
- Luminosity: 1.0007366 solar luminosity  

There are other candidates, depending on how you flex the cutoffs in the query, or whether
you admit dim stars not catalogued, or extragalactic sources.  But this is the best star
with reasonable data, apparently by a reasonable margin.  And even for 2MASS
19281982-2640123, we still don't have good data on metallicity, age, stellar companions,
and so on.  

Maybe an exoplanet search targeting 2MASS 19281982-2640123 would be potentially
interesting&hellip; even though the Wow! signal _still_ hasn't repeated for the last 43 years.  

---

## Notes &amp; References  

<a id="fn1">1</a>: B Yirka, ["Amateur astronomer Alberto Caballero finds possible source of Wow! signal"](https://phys.org/news/2020-11-amateur-astronomer-alberto-caballero-source.html),
phys.org, 2020-Nov-24. [↩](#fn1a)  

<a id="fn2">2</a>: Physics arXiv Blog, ["Sun-Like Star Identified As the Potential Source of the Wow! Signal"](https://astronomy.com/news/2020/11/sun-like-star-identified-as-the-potential-source-of-the-wow-signal), _Astronomy_, 2020-Nov-23. [↩](#fn2a)  

<a id="fn3">3</a>: P Anderson, ["Did the Wow! signal come from this star?"](https://earthsky.org/space/source-of-wow-signal-in-1977-sunlike-star-2mass-19281982-2640123), _Earth/Sky_, 2020-Dec-02. [↩](#fn3a)  

<a id="fn4">4</a>: A Caballero, ["An approximation to determine the source of the WOW! Signal"](https://arxiv.org/abs/2011.06090), arXiv.org, 2020-Nov-08 (revised 2020-Dec-01). __NB:__ This is a _preprint_, not yet having passed peer review. [↩](#fn4a)  
