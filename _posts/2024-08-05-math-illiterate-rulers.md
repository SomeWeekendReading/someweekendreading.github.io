---
layout: post
title: The Innumeracy of the Rulers
tags: CatBlogging CorporateLifeAndItsDiscontents MathInTheNews Politics Statistics
comments: true
commentsClosed: true
---

Have you ever wondered just how mathematically illiterate our rulers really are?  Buckle
up, Buttercup: it's worse than you think.  


## Lawyers Are Not Good Thinkers?!  

During a period of youthful idealism, many years ago, I fell in love with formal logic.
And I mean, in _love._  I had that same idealism that
[led Leibniz to hope for "calculemus"](https://en.wikiquote.org/wiki/Gottfried_Leibniz#:~:text=quando%20orientur%20controversiae%2C%20non%20magis%20disputatione%20opus%20erit%20inter%20duos%20philosophos%2C%20quam%20inter%20duos%20computistas.%20Sufficiet%20enim%20calamos%20in%20manus%20sumere%20sedereque%20ad%20abacos%2C%20et%20sibi%20mutuo%20(accito%20si%20placet%20amico)%20dicere%3A%20calculemus)
as a path to world peace.
(Yes, I knew about
[G&ouml;del's Incompleteness Theorem](https://en.wikipedia.org/wiki/G%C3%B6del%27s_completeness_theorem)
and what that did to
[Russell &amp; Whitehead's _Principia Mathematica_](https://en.wikipedia.org/wiki/Principia_Mathematica);
I meant we should get as close as possible to that limit.)
To get a formal understanding of certain ritual prayers in my religious community, I even
went so far as to learn [denotational semantics](https://en.wikipedia.org/wiki/Denotational_semantics),
hoping it would help. (It did not help.  Opened a lot of other doors, but not _that_ one.)  

Now&hellip; I knew that _I myself_ was na&iuml;ve.  But I had no idea just _how_
na&iuml;ve. (That's the nature of na&iuml;vet&eacute;: almost by definition we are blind to
our own, almost by definition!)  

I actually thought &ndash; true story &ndash; that our world leaders would (or _should!_)
be seized by a dread sense of their deep responsibility, and therefore be deeply moved
toward correct thinking.  Most of them are lawyers, like it or not, so clearly lawyers
must be deeply concerned with the proper application of logic, no?  

Well&hellip; no.  I was a theoretical physics grad student in those days, but had friends
who where in various law schools in Boston.  I asked a friend at Harvard Law whether
lawyers studied logic.  He _laughed_ at me (though not in a mean way).  He then explained,
in a way seared into my brain so deeply I remember it today, 45 years later:  

> Once in class, I pointed out to someone a flaw in their reasoning, saying 'That's __post
> hoc.__' He said 'Thank you', thinking it was a compliment.  

So, umm&hellip; no.  No, they are _not_ concerned about needing logic to guide their
thinking.  They seem, if anything, more concerned with _sophistry:_ the art of abusing
logic to craft arguments that _sound_ correct in order to hoodwink others into supporting
a preferred conclusion.  

People with some intellectual ability seem to me to sort into 2 tribes: 
- _Math/Models/Things Tribe:_ those who do mathematics, models, and comparison with the
  objective world of things,  
  _vs_  
- _Words/Stories Tribe:_ those who get very good at _words_ and their use to persuade, inform,
  or command _people_ instead of things.  

Guess which tribe thinks it has a right to rule?  

Of course we want people to be able to use language properly and clearly, or else we'd be
constantly [_ibis_/_redibis_-ing each other](https://en.wikipedia.org/wiki/Ibis_redibis_nunquam_per_bella_peribis)
until it was just sad slapstick.  But I am continually amazed at people who think
words are somehow the way reality works, e.g., that they can out-talk physics and
make the world to work differently, as if reciting a magickal spell.  

And so it is today, when my face was more or less rubbed in 3 examples.  

### Statistical Significance in Court  

It appears Justice Sotomayor, for whom I generally have 'significant' admiration, said something that is
either na&iuml;ve on the surface, or in need of interpretation to find the deeper meaning:  

<a href="https://x.com/DataSciFact/status/1820523965380440455"><img src="{{ site.baseurl }}/images/2024-08-05-math-illiterate-rulers-twitter-1.jpg" width="550" height="208" alt="Justice Sotomayor disses statistical significance" title="Justice Sotomayor disses statistical significance" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

On the surface, this is _obviously_ wrong: of course statistical significance matters,
since it's what tells you if your observations are _real_ or not, i.e., whether they're an
artifact of noise.  

<img src="{{ site.baseurl }}/images/2024-08-05-math-illiterate-rulers-rss-1.jpg" width="400" height="152" alt="Ziliak @ Significance: significance in courts" title="Ziliak @ Significance: significance in courts" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So let's dig into this a bit.  The source, other than court documents, appears to be an case
study article in _Significance_, a journal of the Royal Statistical
Society.  <sup id="fn1a">[[1]](#fn1)</sup>  

(__NB:__ The title's phrase "Student _vs_ Fisher" is a delicious pun.  'Student' was the
pseudonym under which [WS Gosset](https://en.wikipedia.org/wiki/William_Sealy_Gosset)
published in the early 20th century, since his employers at Guinness saw little point in
scientific publication.  Fisher, of course, is [RA Fisher](https://en.wikipedia.org/wiki/Ronald_Fisher),
one of the great founders of 20th century statistics.  They had a famous feud about
balanced vs random experiment design, and the practical utility of statistical
significance.  But Gosset was apparently a friend of both Fisher and
[Karl Pearson](https://en.wikipedia.org/wiki/Karl_Pearson); this was a feat of notable
diplomacy because both Fisher and Pearson had enormous egos and absolutely despised each
other.)  

The matter in the case was whether a pharmaceutical company had to disclose side effects
that were not statistically significant.  It makes sense not to do so, since such side
effects might well have been noise, i.e., "not real" in the statistical sense of
reproducibility.  There _could_, of course, be a relation, just not one that the available
datasets support adequately.  

The paper chronicles a long, sad, back-and-forth discussion which mostly just confuses the
issues.  This is only to be expected, when both judges and lawyers have no statistical or
mathematical training.  They are confusing 3 entirely separate statistical domains:  
1. _Statistical Significance:_  This measures whether an observation is _real_, i.e.,
   unlikely to be just an artifact of noise in the cruel wold of the Null Hypothesis that
   says it shouldn't happen regularly.  
   
   If you achieve statistical significance, then the observation is likely to repeat in a
   replication experiment.  This is what the much-maligned and misunderstood $p$-values
   are all about.  

2. _Strength of Effect:_ Once you've achieved statistical significance, you of course want
   to ask whether the "real" effect is a big deal or not!  It could be real, but still be
   too tiny to matter.  

   This is the subject of a variety of statistics, like
   [Cohen's $d$](https://en.wikipedia.org/wiki/Effect_size#Cohen's_d) and 
   [Cohen's $h$](https://en.wikipedia.org/wiki/Cohen%27s_h).  It is also the subject of a
   good many pragmatic measures.  For example: during my days analyzing gene expression
   data, we used:

   - a $p$-value for a ratio with controls to assess statistical _significance_ of a
     gene's expression going up or down, and  
   - the _fold induction_ ratio, i.e., the expression ratio with respect to controls to
     measure strength of effect.  

   It was typical to demand $p \lt 0.05$ for significance and a fold ratio &ge; 2 (up or
   down) as a minimum strength of effect.  

3. _Causality:_ This is the hardest thing of all to measure!  Just finding $A$ and $B$ are
   associated in a statistically significant and large strength of effect way is not
   enough.  
   - $A$ might cause $B$, or  
   - $B$ might cause $A$, or  
   - some unmeasured quantity $C$ might cause both $A$ and $B$, or  
   - you might have conditioned collecting your data on a factor $D$ which influences the
     normally independent distributions for $A$ and $B$, or  
   - &hellip; well, all sorts of things, really!  

   This is the subject of things like the
   [Granger causality test](https://en.wikipedia.org/wiki/Granger_causality), as well as
   much more elaborate causal inference methods in network systems like genes with
   [Bayesian networks](https://en.wikipedia.org/wiki/Bayesian_network).  

Both significance and strength are necessary, but not sufficient, before one can start to
infer causality.  (More importantly, one might ask why causality is even the standard,
since significance and strength establish that you have repeatable effect strong enough to
matter.  It's a deep problem to decide where to _stop._)  

It's not surprising that lawyers might be confused about which of these does what, and
which should be used in a given situation.  

What _is_ surprising &ndash; and disturbing &ndash; is that they seem to feel they should have the power
to prescribe that!  It used to be in the US we had something called the
["Chevron deference"](https://en.wikipedia.org/wiki/Chevron_U.S.A.,_Inc._v._Natural_Resources_Defense_Council,_Inc.#:~:text=The%20decision%20articulated,of%20the%20statute%22.),
in which courts were expected to show deference to scientific expert opinion, e.g., in
regulatory agencies.  In one of the more stupendously ignorant own-goals Republicans have
recently scored, this has been weakened: lawyers should decide _everything._  

Brrr!  

### Bayesian Probability in Court  

[Bayes Rule](https://en.wikipedia.org/wiki/Bayes%27_theorem) is an absolutely essential
way for reasoning about conditional probabilities (which is to say: about almost
_everything_, when you get down to it).  For example, 
[as we previously wrote on how to interpret home COVID-19 tests]({{ site.baseurl }}/weekend-editrix-exposed/),
we'd like to know the probability we don't have COVID-19 if we test negative.  
- This is the Negative Predictive value, or $\Pr(\mbox{No COVID} \| \mbox{Test Negative})$.  
- However, all the reported data on the test is for engineering the test, like the False
  Positve Rate $\Pr(\mbox{Test Positive} | \mbox{No COVID})$.  
  
The relevant relationship is Bayes' Theorem:  

$$
\Pr(\mbox{No COVID} | \mbox{Test Negative}) = \frac{\Pr(\mbox{Test Negative} | \mbox{NoCOVID}) \Pr(\mbox{NoCOVID}) }{\Pr(\mbox{Test Negative})}
$$

We used the data on the test box to infer that when the Weekend Editrix tested negative,
we could be about 89% sure that she was in fact negative.  Phew!  

<img src="{{ site.baseurl }}/images/2024-08-05-math-illiterate-rules-uu-1.jpg" width="400"
height="122" alt="Spiegelhalter @ UU: British courts ban Bayes" title="Spiegelhalter @ UU: British courts ban Bayes" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So it was a bit&hellip; _surprising?!_&hellip; to hear that an English Court of Appeals
decided Bayes Rule was inadmissible, and that probability could never be used as a measure
of uncertainty! <sup id="fn2a">[[2]](#fn2)</sup>  

This is not just unusual, but flouts the very foundation of the Bayesian view of
probability: that probability expresses our uncertainty about events, _even events which
have already happened but about whose outcome we remain ignorant._  

To be fair, this decision and related decisions have all been rehashed, and probability in
both US and European courts is safe again.  

But consider: a judge just said "well, that doesn't apply to me" and hoped that the
natural world would obey!  

Fortunately, the natural world has a way of slapping back.  

### Counting Votes with&hellip; _Fractions_  

<iframe width="400" height="224" src="https://www.youtube.com/embed/4HgUh5bOgbM?si=BXQeXZ1CGKgXHdny" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
[Truro, Massachusetts](https://en.wikipedia.org/wiki/Truro,_Massachusetts) is a small town
on the outer Cape, just below the tip of Cape Cod.  It's a charming place for
tourists, and for all I know, also a lovely place to live.  It was the subject of satire
in the SF comedy [Men in Black II](https://en.wikipedia.org/wiki/Men_in_Black_II), in
which we learn that everyone working at the Post Office is either a space alien or someone who
specializes in dealing with them.  

But keep in mind what's _behind_ the satire: that this is such a deeply tolerant place
that even space aliens can have good jobs and be good community members.  Go ahead and
laugh, but remember what we value up here in New England.  

<img src="{{ site.baseurl }}/images/2024-08-05-math-illiterate-rulers-cct-1.jpg" width="400" height="166" alt="Bragg @ Cape Cod Times: Town meeting unable to comprehend practical meaning of 'two thirds'" title="Bragg @ Cape Cod Times: Town meeting unable to comprehend practical meaning of 'two thirds'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Alas, that's not a _complete_ summary.  As reported in a startling article in the
_Cape Cod Times_ <sup id="fn3a">[[3]](#fn3)</sup>, their local politicians have some
mathematical literacy problems with&hellip; grade school fractions.  

Back in 2009 &ndash; and no, I still haven't forgiven them for this &ndash; they were
voting on some zoning nicety whose exact details do not matter.  What does matter is that:  

- There were 206 votes cast at the town meeting, and 2/3 were required to pass.  
- The vote was 136 for and 70 against.  

The town clerk, whom I mercifully will not name, got out her calculator and noted that:  

$$
206 * 0.66 = 135.96 \le 136
$$

&hellip; so 136 votes was enough to pass the 2/3 threshold.  

But "an anonymous caller" pointed out that using 4 decimal places, the outcome changes:  

$$
206 * 0.6666 = 137.3196 \gt 136
$$

&hellip; so the 136 votes were _not_ enough to pass the 2/3 threshold.  

At the risk of being pedantic, I will point out that exact rational arithmetic is possible
here:  

$$
206 * \frac{2}{3} = 137\frac{1}{3}
$$

You can round down to the nearest integer human and get 137, but more in the spirit of the
law would be to round up to 138 to ensure that _at least 2/3 votes are cast in favor._
Either way, the measure should fall with only 136 votes.  

But&hellip; that is most definitely not what they did!  Being members of the Word Tribe,
mathematically phobic at best and illiterate at worst, they sought support from their
peers and superiors &ndash; Word Tribe approval.  
- Calling around to other towns revealed that everybody did it _differently_, which is
  maddening enough.  
- But almost incomprehensibly, they decided to ask the Massachusetts Attorney General for
  an official legal ruling on the value of 2/3!  
  
Which value of 2/3 is "right for you"?  C'mon, this is not a place for relative truths:
you can't assert "my truth about 2/3".  (Actually, asserting "my truth" is almost always
nonsense: truth is what _is_, independent of who realizes it. Or even whether that truth is
knowable in the first place, as G&ouml;del taught all of us.)  

Sooner or later, such devotion to words and stories _instead of reality_ leads to
nonsensical acts like asking for a legal ruling on the value of 2/3.  

Do not do that.  


## The Weekend Conclusion  

The title is a joke about the
[_Hypostasis of the Archons_, or the _Reality of the Rulers_](https://en.wikipedia.org/wiki/Hypostasis_of_the_Archons)
from Codex II of the Nag Hammadi library.  

Alas, it is a joke few will perceive and even fewer appreciate.  Still: this bit of
Gnostic writing is useful, as an example of what happens when people go _very_ far down
the rabbit hole and think their words and stories capture reality.  It reads, frankly,
like religious visions on acid.  There _might_ be something there, but it's hard to tell
past all the deflections and mysticism.  

You _could_ just say what you actually mean, even if it takes you several tries.  That's
always an option, assuming you have a meaning in the first place.  

As [Eugene Gendlin](https://en.wikipedia.org/wiki/Eugene_Gendlin) reminded us:

> What is true is already so.  
> Owning up to it doesn’t make it worse.  
> Not being open about it doesn’t make it go away.  
> And because it’s true, it is what is there to be interacted with.  
> Anything untrue isn’t there to be lived.  
> People can stand what is true,  
>for they are already enduring it.  

Seek truth.  Embrace reality.  Escape the words of fantasy that whisper in your ear about
having _personal_ beliefs about the value of 2/3.  

As [George Santayana](https://en.wikipedia.org/wiki/George_Santayana) urged:  

> “The truth is cruel, but it can be loved, and it makes free those who have loved it.”
> &ndash;  [_Little Essays_](https://archive.org/stream/littleessaysdraw00santuoft/littleessaysdraw00santuoft_djvu.txt) (1920) "Ideal Immortality"  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  


## Addendum 2024-Aug-21: Enfield's book  

<img src="{{ site.baseurl }}/images/2024-08-05-math-illiterate-rulers-enfield-1.jpg" width="200" height="293" alt="NJ Enfield @ MIT Press: Language vs Reality" title="NJ Enfield @ MIT Press: Language vs Reality" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) if I'd seen this post made
[Hacker News at Y Combinator](https://news.ycombinator.com/item?id=41228696).  No, I very
much had not.  (Gotta get the page view counter working again so I can detect reader
surges!)  

Notably, they cited a book by Nick Enfield on this subect. <sup id="fn4a">[[4]](#fn4)</sup>

I haven't read Enfield's book, but as far as I can tell from the reviews it makes pretty
much the same point, but with more data (and somewhat less bile) than I did above.
Basically, language is _not_ about precise description and conveyance of information, or
at least not completely.  Rather, it is mostly about social coordination, i.e., getting
people to do things.  (Though it _sounds_ from the reviews as though he's buying into the
[Sapir-Whorf hypothesis](https://en.wikipedia.org/wiki/Linguistic_relativity), which is a
slightly dicey choice.)  

Still, yeah: people involved in social coordination and power over others prioritize
language over logic, mathematics, and science.  It _could_ be a reasonable division of
labor, if the putative leaders would at least _listen_ when we nerds tell them what's
possible or advisable.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** DOI: [***](***). [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: ST Ziliak, ["Matrixx v. Siracusano and Student v. Fisher: Statistical significance on trial"](https://rss.onlinelibrary.wiley.com/doi/full/10.1111/j.1740-9713.2011.00511.x), _Signficance_, 2011-Aug-25. DOI: [10.1111/j.1740-9713.2011.00511.x](https://doi.org/10.1111/j.1740-9713.2011.00511.x). [↩](#fn1a)  

<a id="fn2">2</a>: D Speigelhalter, ["Court of Appeal bans Bayesian probability (and Sherlock Holmes)"](https://understandinguncertainty.org/court-appeal-bans-bayesian-probability-and-sherlock-holmes), _Understanding Uncertainty_ blog of the Statistical Laboratory at the University of Cambridge, 2013-Feb-25.  

__NB:__ _Understanding Uncertainty_ is, unfortunately, no longer updated as of 2022-May-23, so this reference points to what amounts to an archival copy. [↩](#fn2a)  

<a id="fn3">3</a>: MA Bragg, ["Truro zoning decision hinges on single vote"](https://www.capecodtimes.com/story/news/politics/government/2009/04/30/truro-zoning-decision-hinges-on/52012503007/), _Cape Cod Times_, 2009-Apr-30. 

Yes, this story is from 15 years ago.  No, I still have not forgiven them.  Stupidity like this leaves a welt upon my soul. Those heal only slowly, with much harrumphing.  Another 15 or 20 years oughta do it.[↩](#fn3a)  

<a id="fn4">4</a>: NJ Enfield, ["Language Vs. Reality: Why Language Is Good for Lawyers and Bad for Scientists"](https://mitpress.mit.edu/9780262548465/language-vs-reality/), _MIT Press_, 2022-Mar-09. ISBN: [9780262046619](https://isbnsearch.org/isbn/9780262046619). [↩](#fn4a)  
