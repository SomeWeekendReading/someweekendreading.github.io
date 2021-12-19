---
layout: post
title: &rsquo;Tis the season&hellip; of the Analemma
tags: Beauty Math Obscurantism Physics R TheDivineMadness
comments: true
---

It's that season again: the time of nerdly meditations on the analemma.  The shortest day
of the year, Dec 21, is yet to come.  But for night owls, the day of earliest sunset (at
the latitude of Ch&acirc;teau Weekend) was Dec 7th.  How can that be?  That's the tale of
the analemma!  


## Many years ago&hellip;

<img src="{{ site.baseurl }}/images/2020-12-21-solstice-vs-dodds-day-Symbolics3640_Modified.jpg" width="203" height="400" alt="Symbolics 3640 Lisp Machine (Wikipedia)" title="Symbolics 3640 Lisp Machine (Wikipedia)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
<img src="{{ site.baseurl }}/images/2020-12-21-solstice-vs-dodds-day-doug-dodds.jpg" width="200" height="200" alt="Doug Dodds (LinkedIn)" title="Doug Dodds (LinkedIn)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>

Many years ago &ndash; where "many" may here be understood as meaning &ge; 35 years
&ndash; I was working for a very strange company in Cambridge called
[Symbolics](https://en.wikipedia.org/wiki/Symbolics), which made very strange (and
wonderful) computers known as [Lisp machines](https://en.wikipedia.org/wiki/Lisp_machine).
One of my main joys in life at that time was that I got to work with not only smart
people, but also with people who were at least as strange as me, if not stranger.  (In
some cases, very _much_ stranger.  I could tell you stories, but would first have to check
if the statute of limitations is expired.)  

One of those smart and interestingly strange colleagues was an excellent fellow called
[Doug Dodds](https://www.linkedin.com/in/doug-dodds-3ab495/): an expert in user interface,
operating system build procedures, trivia Cantabrigiae, and an inveterate night person.
It was from him I learned the axiom: "the only problem with morning is that it comes too
early in the day to be useful".  


## The analemma

<img src="{{ site.baseurl }}/images/2020-12-21-solistice-vs-dodds-day-analemma-di-cicco.jpg" width="400" height="281" alt="Analemma by Dennis di Cicco" title="Analemma by Dennis di Cicco" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
As with most people, in deep mid-winter Doug yearned for the return of daylight. (Though I
do not: I like dark winter days.  See above, re "strange".)  

Now, since Doug came from St. Louis, his freshman year here at MIT was rather hard on him
for more than the usual ways in which the first year at MIT is hard on people: northern
winters!  He spent a fair amount of time working out the orbital mechanics of when sunrise
&amp; sunset happened, and noticed a funny thing called the
[analemma](https://en.wikipedia.org/wiki/Analemma) &ndash; if you
photograph the sun each day at the same time each day for a year, it traces out a figure-8
in the sky, as shown in this now-iconic year-long time-lapse photograph by 
[Dennis di Cicco](https://en.wikipedia.org/wiki/Dennis_di_Cicco)
from 1978-1979 <sup id="fn1a">[[1]](#fn1)</sup>.  

The source of this peculiarity, if you really work your way down into the orbital
mechanics, is an interaction between the earth's very slightly elliptical orbit and its
23.5&deg; axial tilt.  


## Mixing analemmas, nerds and the winter holiday season

So back at Symbolics we were talking one day about how the amount of daylight would get
better after the Winter Solstice, on Dec 21.  But Doug pointed out that for night people
who didn't _care_ about sunrise, the sunsets had already begun to get better!  How could
that be, that sunsets started to get later before the Winter Solstice?!  

The fascinating explanation is part celestial mechanics, part hobby astronomy, and part
pretty pictures.  (Oh, and some math.  There's always some math!)  These factors producing
the analemma conspire to create an interesting effect: while the Winter Solstice is always
on Dec 21 (a fixed point of the Gregorian solar calendar, regardless of latitude), the
earliest sunset is a bit before that and the latest sunrise is a bit after (both depending on
latitude).  It led to a series of annual emails from Doug, in which he would, each year,
alert us to the day of earliest sunset. <sup id="fn2a">[[2]](#fn2)</sup> By now-ancient
tradition among the now-ancient _Symbolici Cantabrigiae_, this is known as "Dodds's Day".  

For the Weekend Editrix, on the other hand &ndash; well, let's just say she's a morning person
who inexplicably-but-actually _cares_ that the sun should rise before she does.  So we call
the day of latest sunrise, after which her mornings begin to get brighter, 
"Weekend Editrix's Day".  (In the current epoch, it also turns out to be when the earth 
is nearest the sun, believe it or not.)  

This year, though, the Weekend Editrix has told me she cares less these days about
sunrise, and more about sunset.  So the day she cares about the most is Dodds's Day, like
the rest of us.  (We'll leave the nomenclature in place, though, if only for historical
purposes.)  


## 2021: _Another_ year of the dumpster fire

Isn't it supposed to be _against the rules_ to have 2 dumpster-fire years in a row?  What
do you mean,
[_there aren't any rules here?!_](https://www.brainyquote.com/quotes/thomas_a_edison_105328)  

Ok&hellip; calming down now.  

This year, at Boston's latitude (42.3581&deg; North), Dodd's day was on December 8th and
the Weekend Editrix's Day will be January 3rd.  It's mainly a function of latitude: if
you're further north, Dodd's Day and the Weekend Editrix's Day are closer to the solstice;
if you're further south, they're farther apart.  (If you're in the southern hemisphere,
you'll have to do the calculation for yourself; please let me know if you do.)  

![Dodd's Day and the Weekend Editrix's Day, 2021 Boston]({{ site.baseurl }}/assets/2021-12-15-analemma-season-sun-times-2021-Cambridge.png "Dodd's Day and the Weekend Editrix's Day, 2021 Boston")

Using some data scraped from the web <sup id="fn3a">[[3]](#fn3)</sup> and an
[R](https://www.r-project.org/) script <sup id="fn4a">[[4]](#fn4)</sup>, you can produce
the above plot of times of sunrise, local solar noon, and sunset to see the effect.  
- The blue curve is for sunset time, and it obviously reaches its minimum first at
  2021-Dec-08, at our latitude.  
- The red curve at the bottom is for sunrise, and obviously reaches its maximum last at
  2022-Jan-03, at our latitude.  
- The green curve is for local solar noon, which is just changing gently and slowly.  

You can see Dodds's Day, the winter solstice, and the Weekend Editrix's Day called out at
the appropriate places along the curves.  

It's been a dark couple of years: a pandemic, the march of fascism &amp; authoritarianism,
the rise of defiant ignorance to resist vaccines, and the right wing employing direct
attacks on previously stable institutions like democracy itself.  

Here, then, is a wish for increased literal light, and the corresponding figurative light
of intellectual and moral enlightenment for which we are all longing.  

Let's work together &ndash; and work hard &ndash; to return the world to sanity and to our
mutual moral duty of care for each other.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: D di Cicco, "Exposing the Analemma", _Sky and Telescope_, June 1979, pp. 536-540. [↩](#fn1a)  

<a id="fn2">2</a>: D Dodds, ["Analemma, My Analemma"]({{ site.baseurl }}/assets/2020-12-21-solstice-vs-dodds-day-analemma-email/), once an annual email from Doug Dodds. [↩](#fn2a)  

<a id="fn3">3</a>: Time and Date, ["Boston, Massachusetts, USA — Sunrise, Sunset, and Daylength, December 2021"](https://www.timeanddate.com/sun/usa/boston), timeanddate.com, retrieved 2021-Dec-15.  Also used the corresponding files for November and January.  

Removed Nov 01 &ndash; Nov 06 to avoid complexity of daylight savings time change, flushed a bunch of Unicode troublemakers, and dropped irrelevant columns.  See [the cleaned-up version suitable for input to the R script]({{ site.baseurl }}/assets/2021-12-15-analemma-season-sun-times-2021-Cambridge.tsv), which combines Nov 2021 to Jan 2022.  

Use results for other cities at other latitudes.  Particularly let me know if you're in the southern hemisphere and work out the details around your summer solstice! [↩](#fn3a)  

<a id="fn4">4</a>: [Weekend Editor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script for sun times, Dodds Day, and Weekend Editrix Day"]({{ site.baseurl }}/assets/2021-12-15-analemma-season-sun-times.r), [www.someweekendreading.blog]({{ site.baseurl }}/), 2021-Dec-15. [↩](#fn4a)  
