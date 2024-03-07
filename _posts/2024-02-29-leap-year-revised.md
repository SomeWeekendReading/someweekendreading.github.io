---
layout: post
title: A Better Leap Year
tags: Beauty Math Obscurantism TheDivineMadness &Gammad;&Tau;&Phi;
comments: true
commentsClosed: true
---

So, it's [Leap Year Day](https://en.wikipedia.org/wiki/Leap_year).  Is the Gregorian
calendar we use in any sense optimal?  


## Why Leap Years?  

<img src="{{ site.baseurl }}/images/2024-02-29-leap-year-revised-epicycle.jpg" width="400" height="345" alt="Epicycles and deferents in Ptolomean systems, or how planetary orbits look from the surface of the Earth" title="Epicycles and deferents in Ptolomean systems, or how planetary orbits look from the surface of the Earth" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The thing is, the mean solar year, determined astronomically, is 365.2421897 days.  It may
perhaps come to your attention that this is not an integer.  This is because there is no
particular reason the earth should rotate on its axis an integer number of times during
the time it goes once around the sun.  These are celestial bodies, not gears (Hipparchus, 
Ptolemy and their [epicycles and deferents](https://en.wikipedia.org/wiki/Deferent_and_epicycle) 
notwithstanding!).  

Why should we care?  

Consider your average Neolithic farmer in northern Europe.  The growing season is short,
and the ancestral grain strains didn't grow as fast as modern ones.  If you plant to
early, your crops freeze and die.  If you plant too late, fall comes before maturity and
your crops freeze and die.  Shortly after that, you and everyone you know and love 
will starve and die, since you had no harvest.  

So it becomes a matter of some urgency to grab your local priest by the scruff of the neck,
shake extra hard, and demand: "What day is it?!"  

Something similar happened in ancient Egypt, where predicting when the Nile would flood
was the thing you needed to know to avoid starvation (though probably not freezing).  

(In the New World, things were a bit different.  The Mayans and Aztecs, for example, still had to
predict when the rainy season would come.  They had
rather more [complex](https://en.wikipedia.org/wiki/Aztec_calendar) kinds of
[calendars](https://en.wikipedia.org/wiki/Maya_calendar),
involving both a 260 day and 365 day calendar with big stone sculptures that could be
rotated like gears.  They're doing &hellip; well, something _interesting_&hellip; but also something
_else,_ so we'll save them for another time.)  

So you need an accurate calendar not just for religious observations by priests, and not
just for fuss-budget astronomy nerds, but also to know when to plant crops so you _don't die._  


## Some Calendars from Mediterranean Antiquity and Europe  

The Egyptians figured out the length of the year and could time the Nile floods, so
everybody could raise grain successfully.  Their polytheistic religious system assigned
lots of political and economic functions to different gods, but it more or less worked.
Eventually, they figured out their calendar was a bit off, and so
[Egyptians introduced a leap day every 4 years](https://en.wikipedia.org/wiki/Egyptian_calendar#:~:text=The%20introduction%20of%20a%20leap%20day%20to%20the%20Egyptian%20calendar%20made%20it%20equivalent%20to%20the%20reformed%20Julian%20calendar).
There were interactions with a lunar calendar, but it was mostly solar.  

The Romans inherited this.  <sup id="fn1a">[[1]](#fn1)</sup>  The Roman _kalends_ were
primarily solar.  Indeed, my favorite way to say "when Hell freezes over"
<sup id="fn2a">[[2]](#fn2)</sup> is to mutter _ad Kalendas Graecas_, i.e., "when the
Greeks count time by the kalends", or pretty much _never._  

Alas, Roman politicians &ndash; much like the modern species &ndash; couldn't resist
monkeying about with the calendar to lengthen the terms of office of their friends and
shorten those of their enemies.

Eventually Gaius Julius Caesar in 45BCE stepped in and said, "My dudes!  No more _kalends_
monkey-business.  Years are now 365 days and every 4th year we add one more day to
Februarius.  Anybody who disagrees gets stabbed."  (Ok, maybe he didn't say the _stabbed_
thing out loud.  But when the _dux imperator_ speaks, the stabby bit is taken as read.)  

That gets us the [Julian calendar](https://en.wikipedia.org/wiki/Julian_calendar), with a
mean year length (averaged over the 4 year period) of 365.25 days.  


## Why is That Not Good Enough?

Well, it's mostly good enough to be getting on with&hellip; _for a while_.

The true length of the year is [365.2421897 days](https://en.wikipedia.org/wiki/Tropical_year#:~:text=Mean%20tropical%20year%20current%20value%5B,synch%20with%20the%20seasons%20(see%20below).).  So we're overestimating the true length of each year by:  

$$ 
\begin{align*}
365.25\:\mathrm{days} - 365.2421897\:\mathrm{ days} &= 0.0078103\:\mathrm{ days} \\
                                                    &= 674.81\:\mathrm{ sec}
\end{align*}
$$

... or about 11 minutes and change each year.  In about 128 years, we'll be off by a whole
day.  In about 896 years, we'll be off by a week.  If you plant your crops in northern
Europe a week off from the correct time, you're at the edge where your crops will fail
and&hellip; wait for it&hellip; you and everyone you know and love will starve and die.  

And so it was in the year 1582CE.  That's 1582 + 45 = 1627 years from the start of the
Julian calendar, so we're off by 12.71 days.  People are planting crops too late in the
year to get a good harvest!  

Something had to be done, and in the system of that time Pope Gregory XIII apparently felt
he was the one to do it.  He convened some scholars, who labored mightily and gave birth
to the [Gregorian calendar](https://en.wikipedia.org/wiki/Gregorian_calendar).  This is
still our calendar, in which a year is 365 days with sometimes 1 extra day for a leap year:  
- Normally a year is not a leap year,  
- Unless it's divisible by 4, in which case it is,  
- Unless it's divisible by 100, in which case it's not,  
- Unless it's divisible by 400, in which case it is.  

It set the calendar 10 days forward, to re-establish the spring equinox for planting and
Easter calculations, so that [Thursday 4 October 1582 was followed by Friday 15 October 1582](https://en.wikipedia.org/wiki/Gregorian_calendar#:~:text=To%20reinstate%20the%20association%2C%20the%20reform%20advanced%20the%20date%20by%2010%20days%3A%5Bc%5D%20Thursday%204%20October%201582%20was%20followed%20by%20Friday%2015%20October%201582.%5B3%5D).  

This bit of whimsical gimcrackery leads to a year length of:  

$$
\begin{align*}
365\:\mathrm{days} + \frac{1}{4}\:\mathrm{day} - \frac{1}{100}\:\mathrm{day} + \frac{1}{400}\:\mathrm{day} &= 365 + \frac{97}{400} \:\mathrm{days} \\
                           &= 365.2425 \:\mathrm{days}
\end{align*}
$$

So now each year we're off a bit, _over_ estimating the length of the year by:  

$$
\begin{align*}
365.2425\:\mathrm{days} - 365.2421897\:\mathrm{days} &= 0.0003103\:\mathrm{days} \\
                                                     &= 26.81\:\mathrm{sec}
\end{align*}
$$

That means the Gregorian calendar has reduced the error rate per year with respect to the
Julian calendar by a factor of 674.81 sec / 26.81 sec = 25.71!  That's pretty impressive:
if the Julian calendar got into trouble in just under 1,000 years then the Gregorian
calendar will avoid similar trouble for maybe 25,000 years.

## Can We Do Better?  

Most people would say "good enough" and move on.  But for those of us in the Nerd Tribe,
well&hellip; we want to know what's _optimal_, i.e., what's the _best_ we could do.  

I first encountered this analysis in a post by Adam P Goucher, on the venerable Math-Fun
mailing list, back in the day.  <sup id="fn3a">[[3]](#fn3)</sup>

If you look at the above equations, it's pretty easy to intuit that any set of rules
about what years include or do not include a leap day will result in a _rational_ number
of days; we could have written the rational version above and stopped there:  

$$
365\:\mathrm{days} + \frac{1}{4}\:\mathrm{day} - \frac{1}{100}\:\mathrm{day} + \frac{1}{400}\:\mathrm{day} = 365 + \frac{97}{400} \:\mathrm{days}
$$

So what's the "best" rational approximation to the mean solar year length?  "Best" needs
some technical definition, since for a rational of arbitrarily large denominator we can
make arbitrarily accurate approximations.  So pretty much what we mean here is smallest
error for a given numbe of digits in the denominator (or smaller, after dividing out
common factors).  

We observe the year length is 365.2421897 days, but the rest is some real number with
unobserved decimal places out the wazoo.  We could convert _that_ finite decimal to a
rational, observe 0 error, and be done.  But can we do it with a smaller denominator?  

[Dirichlet's Approximation Theorem](https://en.wikipedia.org/wiki/Dirichlet%27s_approximation_theorem)
says (approximately) the best approximation to a real number by a rational with a given
size of denominator is the one we get by unwinding a continued fraction.  (Yes, I could
look up the details; no, I will not.)  

The continued fraction is (by standard methods which again, I could exhibit, but won't because
it's tedious to explain):  

$$
365.2421897 = 365 + \frac{1}{4 + \frac{1}{7 + \frac{1}{1 + \frac{1}{3 + \frac{1}{27 + \cdots}}}}}
$$

The 5th continuand is 27, which is rather larger than its predecessors.  This is a clue to
truncate just before that, since the corrections will be tiny.  This gives us the 4th
convergent of:  

$$
\begin{align*}
365 + \frac{1}{4 + \frac{1}{7 + \frac{1}{1 + \frac{1}{3}}}} &= 365 + \frac{31}{128} \\
                                                            &= 365 + \frac{1}{4} - \frac{1}{128} \\
                                                            &= 365.2421875
\end{align*}
$$

This gives us an error each year  (_under_ estimation, this time) of only a fraction of a
second per year!  

$$
365.2421897\:\mathrm{days} - 365.2421875\:\mathrm{days} = 0.0000022\:\mathrm{days} = 0.19\:\mathrm{sec}
$$

This system gives us a calendar in which a year is 365 days, with 1 extra day for a leap
year, and the following leap year rules:  
- Normally a year is not a leap year,  
- Unless it's divisible by 4, in which case it is,  
- Unless it's divisible by 128, in which case it's not.

The next year in which this calendar differs from the present Gregorian calendar is
2048 = 128 * 16.  

This rule system is simpler than the Gregorian (3 rules instead of 4) and has a shorter
period (128 years instead of 400), and is about 141 times more accurate (0.19 sec/yr vs
26.81 sec/yr).  

Also, the decision points (every 4 years and 128 years) are powers of 2, so in the Nerd
Tribe where we do mental arithmetic in binary, all is simple. <sup id="fn4a">[[4]](#fn4)</sup>  


## A Worst Case  

Goucher goes on to explore the nightmare of a sadistic deity who wants to make it hard to
determine when a leap year occurs.  The mean year length would be $365 + \Phi$ days, where 
$\Phi = (\sqrt{5} + 1) / 2 = 1.618033\cdots$ is the
[Golden Ratio](https://en.wikipedia.org/wiki/Golden_ratio).  

$\Phi$ has a continued fraction of all 1's, so it converges slowly with no natural cutoff
point.  The sequence of leap years would be the Golden String, closely related to
Fibonacci numbers.  


## The Weekend Conclusion  

Yes, we can do better than the Gregorian calendar.  

No, we almost certainly will not.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: The [Greeks went their own way with a calendar of 12 lunar months](https://en.wikipedia.org/wiki/Ancient_Greek_calendars) and an intercalary period at the end of the year to patch things up.  It was a mess the Romans declined to continue. [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/2024-02-29-leap-year-revised-Gustave_Dore_Inferno32.jpg"><img src="{{ site.baseurl }}/images/2024-02-29-leap-year-revised-Gustave_Dore_Inferno32-thumb.jpg" width="400" height="321" alt="Gustav Dor&eacute; illustration of Dante's Inferno, Canto 32" title="Gustav Dor&eacute; illustration of Dante's Inferno, Canto 32" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a id="fn2">2</a>: That whispering sound you hear is the ghost of [Dante Alighieri](https://en.wikipedia.org/wiki/Dante_Alighieri), who heard the phrase "when Hell freezes over", would like a word with you about the center of Hell in his [_Inferno_](https://en.wikipedia.org/wiki/Inferno_(Dante)).  In his vision, the center of Hell was a vast frozen lake, Cocytus, into which people were frozen in various horrible ways.  

So feel free to tell that Dante voice in your head to shut up and come back at a more semantically appropriate time.  [↩](#fn2a)  

<a id="fn3">3</a>: AP Goucher, ["Calendars and continued fractions"]({{ site.baseurl }}/assets/2024-02-29-leap-year-revised-goucher.txt), Math-Fun mailing list, 2011-Jan-25. 
<!-- See also his blog, https://cp4space.hatsya.com/2012/09/12/lunisolar-calendars/ -->
[↩](#fn3a)  

<a id="fn4">4</a>: Yes, I am aware that I am not _quite_ making the case to the non-members of the Nerd Tribe, here. [↩](#fn4a)  
