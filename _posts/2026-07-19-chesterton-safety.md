---
layout: post
title: Chesterton and Hollnagel's Safety I/II
tags: CatBlogging NotableAndQuotable Obscurantism Religion TheDivineMadness &Gammad;&Tau;&Phi;
comments: true
commentsClosed: true
---

I never that knew GK Chesterton, a 19th - 20th century writer, raconteur and master of the
_bon mot,_ knew about 21st century industrial and laboratory safety culture.  Neither did
Chesterton, probably.


## Types of Safety, Type-Safety, and Good Ol' GKC  

<img src="{{ site.baseurl }}/images/2026-07-19-chesterton-safety-haskell-blog-1.jpg" width="400" height="179" alt="Duncan @ Haskell Blog: a couple million lines of Haskell in a financial services company" title="Duncan @ Haskell Blog: a couple million lines of Haskell in a financial services company" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So I was reading &ndash; as one does &ndash; about software safety and the use of the 
[programming language Haskell](https://en.wikipedia.org/wiki/Haskell) to make certain
kinds of faults impossible <sup id="fn1a">[[1]](#fn1)</sup>, what with isolation of
side-effects in monads, an expressive (!) but strict type system, lazy evaluation
order, and so on.  You know: the stuff we all understand, but which software management
(and corporate management more generally) just _insists_ on denying?  Yeah, that stuff.  

<img src="{{ site.baseurl }}/images/2026-07-19-chesterton-safety-hollnagel-1.jpg" width="200" height="302" alt="Hollnagel: Safety-I and Safety-II" title="Hollnagel: Safety-I and Safety-II" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Duncan's article began talking about software safety, lamenting that people usually
relegate it to unit tests, integration tests, fault logs, and so on.  This means you get
very, very good at finding out what went _wrong,_ but not so good at understanding and
designing for what makes things go _right._  

This is very much _au courant_ among laboratory/industrial safety experts, particularly
following Eric Hollnagel's book <sup id="fn2a">[[2]](#fn2)</sup> on the types of safety:  
- _Safety-I_ is the usual study of how things go wrong, while  
- _Safety-II_ is the less widely performed safety work on how to force things to go _right._  

I was initially intrigued because this sounded like what we statisticians call 
[type-I and type-II errors](https://en.wikipedia.org/wiki/Type_I_and_type_II_errors),
i.e., false positives and false negatives.  That's certainly present, in terms of
identifying faults, but not completely right.  It's more like the cynical old adage about
public health, which goes something like:  

> Proper public health policy execution _always_ looks pointless, because we never talk
> about the disasters it __prevents.__  

That's some Safety-II talk, there!  In the US right now, with federal health programs
being not just dismantled but facing outright hostility, we might think about the return
of measles, babies bleeding to death because of refused vitamin K shots, screw worm
infestations, and now explosive diarrhea from _Cyclospora._  

A medical friend compared this once to how hospitals try to prevent _and fix_ medical
errors.  Through the use of checklists, rounds by other practitioners of various sorts,
computer systems checking meds, and so on, they try to make sure the right thing happens 
_even when somebody makes a mistake._  That is, they try to be _robust_ against single mistakes,
requiring multiple screw-ups before bad things happen.  Bad things still happen, but this
helps a _lot_ against the bad things you never hear about _because they were caught &amp; fixed._  

<img src="{{ site.baseurl }}/images/2022-07-20-onion-fences-chesterton-the-thing.jpg" width="200" height="286" alt="GK Chesterton: The Thing" title="GK Chesterton: The Thing" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/gk-chesterton.jpg"><img src="{{ site.baseurl }}/images/gk-chesterton-thumb.jpg" width="200" height="256" alt="Gilbert Keith Chesterton in 1909, via Wikipedia" title="Gilbert Keith Chesterton in 1909, via Wikipedia" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
As it happens, I was also &ndash; reasonably recently &ndash; reading some
[GK Chesterton](https://en.wikipedia.org/wiki/G._K._Chesterton).  (Hey, don't judge me!
It may actually be a virtuous vice.)  

In this case, it was _The Thing_ <sup id="fn3a">[[3]](#fn3).  It was later subtitled "Why
I am a Catholic", just so you know what you're getting into.  What is "the thing"?  In
another essay so titled in _A Miscellany of Men_ <sup id="fn4a">[[4]](#fn4)</sup>, GKC
calls "The Thing" the occasional ability of religious spirit to break free of its
ceremonies, becoming something like an elemental breaking down inequality and injustice
everywhere.  (This is, of course, an _occasional_ thing, or settled civilization would be
impossible.)  

> The wind awoke last night with so noble a violence that it was like the war in heaven;
> and I thought for a moment that the Thing had broken free.  
> &hellip;  
> Let me explain. The vitality and recurrent victory of Christendom have been due to the
> power of the Thing to break out from time to time from its enveloping words and
> symbols. Without this power all civilisations tend to perish under a load of language
> and ritual.  
> &hellip;  
> The wind sang and split the sky like thunder all the night through; in scraps of sleep
> it filled my dreams with the divine discordances of martyrdom and revolt; I heard the
> horn of Roland and the drums of Napoleon and all the tongues of terror with which the
> Thing has gone forth: the spirit of our race alive. But when I came down in the morning
> only a branch or two was broken off the tree in my garden; and none of the great country
> houses in the neighbourhood were blown down, as would have happened if the Thing had
> really been abroad.  

So _The Thing_ is a book of essays about a certain degree of "wild spirit" in humanity.
Repeat offenders at reading this Crummy Little Blog That Nobody Reads (CLBTNR) may recall
that
[we made similar use of an essay in _The Thing_, whence the concept of Chesterton's Fence.](https://www.someweekendreading.blog/onion-fences/)  

Today's memory that reached out the back of my skull &amp; yanked on my ponytail is from
Chapter 9, "What Do They Think?" ([enshrined on the quotes page]({{ site.baseurl }}/quotes/#:~:text=All%20science%2C%20even%20the%20divine%20science%2C%20is%20a%20sublime%20detective%20story%2E%20Only%20it%20is%20not%20set%20to%20detect%20why%20a%20man%20is%20dead%3B%20but%20the%20darker%20secret%20of%20why%20he%20is%20alive%2E%E2%80%9D) of this very CLBTNR):  

> All science, even the divine science, is a sublime detective story. Only it is not set to
> detect why a man is dead; but the darker secret of why he is alive.  

So: 
- A detective solving the mystery of a murder is Safety-I (what went wrong);
- The rest of us attacking the mystery of how we can all live meaningful and good lives is
  Safety-II (how to make it all go right).  

Chesterton is qualified to have an opinion here, both as the author of books on relgion &amp;
ethics, as well as the author of the
[Father Brown mysteries](https://en.wikipedia.org/wiki/Father_Brown)!  


## The Weekend Conclusion  

<img src="{{ site.baseurl }}/images/2026-07-19-chesterton-safety-haskell-publisher.jpg" width="400" height="300" alt="The Weekend Publisher&hellip; unimpressed." title="The Weekend Publisher&hellip; unimpressed." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Corporate managers, being the generally unimaginative sorts that they seemed to me to be,
are generally unimpressed with Haskell since it's not what their sibling MBA's are
chattering about.  Similarly, as you can see here, the Weekend Publisher is
unimpressed with my insight about Chesterton and Hollnagel.  

Ah, well.  He may be right.  He is, after all, a cat of very good taste while I'm just a
cranky old retired hippie scientist with a blog.  Who ya gonna trust?  

[(_Ceterum censeo, Trump incarceranda est!_)]({{ site.baseurl }}/ceterum-censeo/)  

(_Et ceterum censeo, index Epsteiniani divulganda est!_)  

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

<iframe width="400" height="224" src="***?rel=0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: I Duncan, ["A Couple Million Lines of Haskell: Production Engineering at Mercury"](https://blog.haskell.org/a-couple-million-lines-of-haskell/), _Haskell Blog_, 2026-Mar-30.  See, in particular, [footnote 3](https://blog.haskell.org/a-couple-million-lines-of-haskell/#safety-one). [↩](#fn1a)  

<a id="fn2">2</a>: E Hollnagel, ["Safety-I and Safety-II: The Past and Future of Safety Management"](https://www.taylorfrancis.com/books/mono/10.1201/9781315607511/safety-safety-ii-erik-hollnagel), _CRC Press_, 2014. DOI: [10.1201/9781315607511](https://doi.org/10.1201/9781315607511). [↩](#fn2a)  

<a id="fn3">3</a>: GK Chesterton, [_The Thing_](https://www.gkc.org.uk/gkc/books/The_Thing.html), London: Sheed &amp; Ward, 1929-Jan-01. The relevant portion here is the opening paragraphs of Chapter 9, "What Do They Think?". [↩](#fn3a)  

<a id="fn4">4</a>: GK Chesterton, [_A Miscellany of Men_](https://www.gkc.org.uk/gkc/books/misc.html), 1912.  The relevant bit here is the essay called "The Thing". [↩](#fn4a)  
