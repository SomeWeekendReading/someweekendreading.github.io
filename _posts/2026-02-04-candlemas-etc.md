---
layout: post
title: Candlemas, and Other Observations of the Season 
tags: MathInTheNews R Statistics &Gammad;&Tau;&Phi;
comments: true
commentsClosed: true
---

So, Candlemas, eh?  Also something about groundhogs.  And &ndash; sadly &ndash; sportsball.  


## Candlemas  

<a href="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-candlemas.jpg"><img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-candlemas-thumb.jpg" width="400" height="251" alt="Candlemas, a minor holiday in the canonical Christian calendar" title="Candlemas, a minor holiday in the canonical Christian calendar" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
This past Sunday, 2026-Feb-02, was a minor and usually unremarked holiday in the Christian
canonical calendar: [Candlemas](https://en.wikipedia.org/wiki/Candlemas).  

Like most such holidays, it's sort of pasted on top of an older Roman holiday, in this
case [Lupercalia](https://en.wikipedia.org/wiki/Lupercalia).  

Traditionally, Candlemas celebrated the presentation of Jesus at the Temple 40 days
(inclusive) after his birth, and the ritual purification of Mary.  It thus represents the
end of the Christmas part of the canonical calendar, and in some places was the occasion
for removing Christmas decorations.  (In other places, they were removed on
[Twelfth Night](https://en.wikipedia.org/wiki/Twelfth_Night_(holiday)).  Here at Ch&acirc;teau
Weekend, the Weekend Editrix and I have differing opinions on this subject.  I rather like
the lights on the long, dark nights, and hence want to hold out for keeping things going
until Candlemas.  She, on the other hand, notes that New Year's Day is, in Japan, a Very
Big Deal with its own decoration requirements, and wants the other stuff out
of the way as soon as possible.)  

The name "Candlemas" comes from having new candles in church, and having domestic candles blessed for
use throughout the year.  There's a whole light-sharing thing going on, though sometimes I
suspect it's just a matter of, "It's dark.  It's cold.  We want to have a holiday about
sharing light and warmth."  

That works for me, too. 

__Conclusion:__ It's good to seek wisdom &amp; light, and it's good to be with your neighbors.  


## Weather Divination by Hibernating Rodents  

Then the history takes a turn for the weird, which is how you know it's true history.  

<img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-xkcd-3202.jpg" width="400" height="588" alt="XKCD 3202: Groundhog Day as 2 different things, each quite improbable" title="XKCD 3202: Groundhog Day as 2 different things, each quite improbable" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The candle-blessing thing made its way to Germany, where the locals decided that if it was
sunny on Candlemas, as measured by the ability of a hedgehog to see its shadow, then more
winter was on the way.  Just _why_ they decided this is left as an exercise for the reader.  

Later, many of the settlers in the US state of Pennsylvania came from Germany, so they
brought this custom with them.  And
[that's when it gets _really_ weird](https://en.wikipedia.org/wiki/Groundhog_Day#Origins).
As always, XKCD has the goods, in this case [XKCD #3202](https://xkcd.com/3202/), shown
here.  Munroe's pointing out the absurdity of weather divination from shadows of usually
hibernating rodents, as well as the more modern film comedy,
[Groundhog Day](https://en.wikipedia.org/wiki/Groundhog_Day_(film)),
which involves inexplicable time loops instead of, or in addition to, inexplicable weather
divination by rodents.  

As to why it's now a groundhog and not the original German hedgehogs &amp; badgers, the XKCD mouseover
text offers the usual surreal 'explanation':  

> Originally, the ceremony used a variety of rodents and mustelids, but over time most
> people agreed it made sense to standardize on a specific individual ground squirrel in
> Pennsylvania.  

(There's a lot to be said of the alternative, and saner, French tradition: one simply eats 
cr&ecirc;pes on this day, "La Chandeleur".  I think the groundhogs would also prefer we do
that, and just left them to hibernate.)  

<img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-groundhog-1.jpg" width="400" height="294" alt="Groundhog Day in Punxsutawney, PA: A sleepy/confused groundhog is held by scary old white guys with beards and top hats" title="Groundhog Day in Punxsutawney, PA: A sleepy/confused groundhog is held by scary old white guys with beards and top hats" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-groundhog-2.jpg"><img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-groundhog-2-thumb.jpg" width="400" height="312" alt="Groundhog Day: NOAA temperature predictions as of 2026-Feb are colder for the eastern US" title="Groundhog Day: NOAA temperature predictions as of 2026-Feb are colder for the eastern US" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Still, it's become a big deal here.  

The Pennsylvania town of Punxsutawney, population about 5700 and otherwise unremarkable as
far as I can tell, is the epicenter.  They have a ceremony in which they announce whether
"Punxsutawney Phil", as he is inevitably called, has seen his shadow or not.  (I have no
idea how they know what the groundhog sees or does not see.)  

As you can see here, the ceremony involves handling an otherwise hibernation-adjacent
groundhog in front of news cameras by a rather large number of older white men, mostly
bearded, all in top hats.  It's difficult to know what the groundhog makes of all that.
It's difficult to know what _I_ should make of all that.  

This year, they declared that the shadow was indeed seen, and thus there would be 6 more
weeks of winter.  The accompanying temperature forecast for the month of February from the
National Oceanographics and Atmospheric Administration (what's left of it), agrees that
the eastern half of the US will be colder than usual.  

Still&hellip; are groundhogs at all accurate in this regard?  I mean, there must be _some_
reason that people have held on to this custom, beyond just the surreal fun of it!  

I am (not at all reliably) informed that this _mishegoss_ has been going on for 139
years, and that the groundhog has been accurate about 35% of the time.  

Sniff&hellip; sniff&hellip;  That smells like _data!_  

We know what to _do_ with data, here on this Crummy Little Blog That Nobody Reads (CLBTNR).  

The Null Hypothesis is always something of the form "there's nothing going on here".  In
this case, it's a binary decision ("more winter" vs "less winter").  So if the weather
prediction is a guess, then it should be right about 50% of the time.  Anything which
deviates from that (up _or_ down!) indicates that _something_ is happening, which is the
Alternative Hypothesis.  

<a href="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-groundhog-3.jpg"><img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-groundhog-3-thumb.jpg" width="400" height="177" alt="Groundhog Day: If you're only right 35% of 139 tries, that's way worse than guessing." title="Groundhog Day: If you're only right 35% of 139 tries, that's way worse than guessing." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
So we performed a
[test of proportion](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/prop.test.html)
in [R](https://www.r-project.org/), as shown here.  

The result is shown in the 2 red boxes:  
- The probability that the predictions are truly random coin flips, and we _still_ got it
  right only 35% of the time in 139 tries is very tiny: $p \sim$ 0.000056, or about 5 one
  hundredths of one percent.  

  In other words, there is _not a chance_ we should buy the Null Hypothesis!  
- The probability of a correct prediction at 35% after 139 tries has a 95% confidence
  interval of 27.2% &ndash; 43.6%.  
  
  Note that this does _not_ overlap 50%!  
  
__Conclusion:__ Weather divination by rodent is statistically significantly _worse_ than random.  Either:  
- That rodent is lying!  

  Maybe he's mad at being awoken from a perfectly good hibernation,
  or is just scared of all the old white guys with beards &amp; top hats.  If they woke
  you out of a sound sleep and waved you around in the sun in front of cameras, you'd be a
  mite tweaked too, I've no doubt.  
- That poor, innocent rodent has been miscalibrated!  

  We've been reading his predictions _backwards_ for 139 years: if we just decided seeing
  his shadow meant early spring, then he'd have been correct a very solid 65% of the time.  

From this we learn that: (a) accuracy of prediction is uncannily _not_ one of the things
people care about, and (b) we can nonetheless seek wisdom &amp; light by looking objectively
at data.  

So far, the Candlemas theme of seeking wisdom &amp; light is holding up.  (Sort of.)  


## Sportsball and Its Discontents  

There is, alas, in the US, yet another ritual at this time of the year, involving
sportsball.  I try very hard to speak of the Super Bowl in terms that are only _mildly_
derisive, but I often fail at that level of restraint.  

<a href="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-superb-owl-1.jpg"><img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-superb-owl-1-thumb.jpg" width="400" height="193" alt="Google Trends: 'Super Bowl' and 'How to Read Roman Numerals'" title="Google Trends: 'Super Bowl' and 'How to Read Roman Numerals'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-superb-owl-2.jpg" width="400" height="543" alt="A superb owl, head nodded to one side, eyes closed, holding up 1 claw as if to say: 'No, actually...'" title="A superb owl, head nodded to one side, eyes closed, holding up 1 claw as if to say: 'No, actually...'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2026-02-04-candlemas-etc-superb-owl-3.jpg" width="400" height="491" alt="An owl carving in Chauvet Cave, France, approximately 32,000 years old" title="An owl carving in Chauvet Cave, France, approximately 32,000 years old" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The only interesting fact about the Super Bowl for me is that they are mysteriously
numbered consecutively with Roman numerals.  This year is Super Bowl LX, i.e., the 60th
iteration of this ritual of concussions and puzzlement over Roman numerals.  

Someone showed me a Google Trends plot of queries for the Super Bowl and how to read Roman
numerals over the years, showing uncanny correlations.  However, that particular graph
seems to be at least exaggerated, and thus is
[not in good odor at Snopes](https://www.snopes.com/fact-check/roman-numerals-super-bowl-chart/).  

But I couldn't resist checking the data personally, because that's what we do here on this
CLBTNR.  The graph shows a 5 year retrospective of queries for the Super Bowl in blue, and
queries for how to read Roman numerals in red.  They're both on the same scale, so of
course the Super Bowl dwarfs the Roman numeral queries.  But&hellip; there is a germ of
truth here: every year, around Super Bowl time, people wonder how to read MMCMDXLVII or
the like.  (That example, BTW, is malformed.)  

So every year, people do seek a _bit_ of wisdom.  Just like this _superb owl,_ raising a
claw and reminding us that "No, actually&hellip; there's a great deal more to be
experienced in the world beyond sportsball."  (Listen to the owl.  He is, after all, a
symbol of wisdom.)  

In fact, this has been true pretty much forever.  The first owl is reminding us of his
venerable colleague, possibly an owl forebear of his, shown below him.  This is a bit of
cave art is from the
[_Grotte Chauvet-Pont d'Arc_, or Chauvet Cave, in France](https://en.wikipedia.org/wiki/Chauvet_Cave).
It was apparently a bustling scene of Upper Paleolithic life, but then fell out of use and
was undiscovered until 1994-Dec-18.  It contains some of the best preserved ancient cave
paintings currently known to humanity.  

This _especially_ Superb Owl painting is thought to be about 32,000 years old.  To compare
with the age of the Super Bowl, I remind you that in Roman numerals one uses a _vinculum_,
or bar above the numbers, to mean "times a thousand".  You'd write XXXII for 32, and then
put a line over it for 32,000.  

So, which ya gonna watch: a mere Super Bowl LX or a Superb Owl $\overline{\mbox{XXXII}}$?  

__Conclusion:__ We can look up from the sportsball gladiatorial ceremonies, and celebrate
Superb Owl Sunday by looking at some of these absolutely gorgeous animals, traditionally
symbols of wisdom.  

(And yes, 'Sportsball and Its Discontents' is yet another Nerd Tribe joke. Do not tell me
you are surprised by this.)  


## The Weekend Conclusion  

Coulda been worse; just be thankful I didn't go with Super Bowel as a metaphor.  

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

Nope.  
