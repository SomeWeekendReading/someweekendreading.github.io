---
layout: post
title: When Book Reviews Grow Fangs
tags: JournalClub Math Sadness
comments: true
commentsClosed: true
---

Usually, academic book reviews are a genteel and polite affair, at worst damning with
faint praise.  Usually&hellip; but not _always!_  


## The Theorem and the Rebel Mathematician  

Modern mathematics is full of problems that are easy to state, but extremely difficult to
prove (the [4-color theorem](https://en.wikipedia.org/wiki/Four_color_theorem), 
[Fermat's last theorem](https://en.wikipedia.org/wiki/Fermat%27s_Last_Theorem), 
the [Poincar&eacute; conjecture](https://en.wikipedia.org/wiki/Poincar%C3%A9_conjecture), 
the [Riemann hypothesis](https://en.wikipedia.org/wiki/Riemann_hypothesis), 
[Goldbach's conjecture](https://en.wikipedia.org/wiki/Goldbach%27s_conjecture), 
the [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture), 
the [P vs NP problem](https://en.wikipedia.org/wiki/P_versus_NP_problem), 
the [twin prime conjecture](https://en.wikipedia.org/wiki/Twin_prime#Twin_prime_conjecture),
&hellip;). When one of those problems is proven -- as with the 4-color theorem in 1976,
Fermat's last theorem in 1995, and the Poincar&eacute; conjecture in 2003) that's both big
news, and the climax of decades (or centuries!) of deep work.  

The proofs are usually long and complex, building on very specialized mathematics
(otherwise they'd not be hard).  They usually require years of checking by the
mathematical community before we're _sure_ we have a proof.  

On 2012-Aug-30, a 500 page series of preprints was released alleging such a proof of a
particularly gnarly conjecture in number theory. It still has not been resolved almost 12
years later.  Indeed, the whole affair has taken on soap-opera like qualities.  

Today we look at another episode in that soap opera.  

### The $abc$ Conjecture

Today's example is something called the
[$abc$ conjecture](https://en.wikipedia.org/wiki/Abc_conjecture).  Like much of
[number theory](https://en.wikipedia.org/wiki/Number_theory), it is a somewhat simple
statement about integers that most people can grasp.  (Though personally, I always had
some trouble grasping the _point_ of the question, not the question itself.)  In this
case, some number theorists describe it as _very_ important, since it's at the root of
several other theorems.  (Probably there's an application to cryptography, since almost
everything in cryptography is about number theory and vice versa.  Number theorists tend
to have divided feelings about that.)  

__Conjecture (weasely statement):__ Let $a$, $b$, and $c$ be positive integers which are
coprime (i.e., the only common divisor of each pair is 1) and which satisfy $a + b = c$.
Then the theorem tells us that the product of the prime factors of $abc$ is "usually not
much smaller" than $c$.  

Note well the weasel-word phrasing: "usually not much smaller".  This loosely captures the
_intent_ of the more formal statement, but has to be made precise.  So let's make it (a
little bit?) more precise:  

__Definition:__ Positive integers $a$ and $b$ are
[_coprime_](https://en.wikipedia.org/wiki/Coprime_integers) if their greatest common
divisor is 1.  

In order for that to happen, consider the prime factorizations of $a$ and $b$.  If they
had any prime in common, they would both be divisible by that prime.  Integers that are
coprime are therefore "made of" different primes compared to each other, in the sense of prime
factorization.  Integers that are _actually_ prime are coprime to _every_ other integer.  

For example, $8 = 2^3$ and $9 = 3^2$ are coprime, but neither is prime.  Their prime
factorizations indicate that they are made of different primes: 8 is a bunch of 2's, and 9
is a couple of 3's.  

So our theorem starts with 3 integers $a$, $b$, and $c$ which are pairwise coprime.  In
fact, if $a + b = c$ then any common factor of two of them is necessarily a factor of the
third.  So it's fine just to require they be pairwise coprime.  

Next, let's consider that funny notion of an integer being "made of" a bunch of primes.
That is, if $n$ has a prime factorization like:  

$$
n = p_1^{m_1} \times \cdots \times p_k^{m_k}
$$

Then it's "made of" the primes $p_1 \cdots p_k$.  The smallest integer which is made of
the same primes is the product, with all the exponents $m_i = 1$.  So let's get a notation
for that:  

__Definition:__ The [_radical_](https://en.wikipedia.org/wiki/Radical_of_an_integer) of a
positive integer $a$ is the product of the prime factors of $a$:  

$$
\text{rad}(a) = \prod_{p|n,\:p\:\text{prime}} p
$$

So, for example, we just drop all the exponents in the prime factorization to get the radical:  

$$
\begin{align*}
n             &= p_1^{m_1} \times \cdots \times p_k^{m_k} \\
\text{rad}(n) &= p_1 \times \cdots \times p_k
\end{align*}
$$

Now we can state the $abc$ conjecture (in one of several equivalent ways):  

__Conjecture:__ Let $a$, $b$, and $c$ be positive integers which are pairwise coprime, and
satisfy $a + b = c$.  Then for every real $\epsilon \gt 0$, there exist only finitely many
examples such that:  

$$
c \gt \text{rad}(abc)^{1 + \epsilon}
$$

Let's see how our weasel-word version corresponds to this:  
- "Not much smaller": $\text{rad}(abc)$ is the smallest integer with the same primes as
  $abc$.  If you raise $\text{rad}(abc)$ to a power slightly larger than 1, it's only
  "a little bit bigger" than without that power.  Then only a finite number of times is
  $c$ bigger.  Since the exponent is only slightly larger than 1, you don't have to work 
  very hard to make $\text{rad}(abc)^{1 + \epsilon}$ big; it's not a stretch to call that
  "not much smaller".  
- "Usually": of all the infinity of triplets $(a, b, c)$, there are only a finite number
  of times $c$ comes out larger.  So "usually" means just a finite number of times, out of
  the infinite possibilities.  
- Of course, if you let $\epsilon$ become larger, there will be very few exceptions.  If
  you grind $\epsilon$ down toward 0, the number of exceptions will rise, but stay
  finite as long as $\epsilon$ doesn't reach 0.  

So that's what the fight is about.  People who work in the area say it's important; your
humble Weekend Editor is an outsider who will just take their word for that.  

### The Rebel Mathematician  

<img src="{{ site.baseurl }}/images/2024-04-12-book-review-with-fangs-mochizuki.jpg" width="400" height="265" alt="Shinichi Mochizuki, in front of the Research Institute for Mathematical Sciences @ Kyoto University" title="Shinichi Mochizuki, in front of the Research Institute for Mathematical Sciences @ Kyoto University" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Enter mathematician [Shin'ichi Mochizuki (望月 新 一)](https://en.wikipedia.org/wiki/Shinichi_Mochizuki), of the Research Institute for Mathematical Sciences at Kyoto University.  

Let me emphasize at the outset that this is a _serious_ mathematician.  He got his PhD at
Princeton, and is now a major figure at a major Japanese university (really, a major
_world_ university).  He's a senior guy who's well known in the community for his work on
a variety of subjects.  He is emphatically _not_ a crank, outsider, or in any way
marginal.  When he says something, people might be a bit skeptical, but no more than
usual.  He'll get attention, and will deserve it.  

He attacked the $abc$ conjecture in a novel way, inventing something with the ponderous name
[Inter-universal Teichm&uuml;ller Theory](https://en.wikipedia.org/wiki/Inter-universal_Teichm%C3%BCller_theory),
usually understandably abbreviated IUT theory.  So he's invented this whole new branch of
mathematics, related to arithmetic geometry, elliptic curves, and all kinds of stuff.  All
he has to do to motivate everybody to learn IUT is to show he can do something important
with it.  

Well, he certainly did _that!_  (Or, at least appeared to do so, pending checking by other
mathematicians.)  In 2012, he released a set of 4 preprints <sup id="fn1a">[[1]](#fn1)</sup>
<sup id="fn2a">[[2]](#fn2)</sup> <sup id="fn3a">[[3]](#fn3)</sup> <sup id="fn4a">[[4]](#fn4)</sup>
amounting _in toto_ to about 500 pages.  It alleges a proof of the $abc$ conjecture!  

#### Some Problems Crop Up  

Understandably, this was greeted with great initial enthusiasm, and the proof-checking
began.  Custom would normally dictate that he be invited to various places around the
world to give talks, and discuss the proof.  Suddenly everyone is your friend who wants
you to come visit, and pays for your trip!  But Mochizuki mysteriously wouldn't do that,
and just wanted people to plow through 500 pages of new math on their own.

By 2017, [Peter Scholze](https://en.wikipedia.org/wiki/Peter_Scholze) and
[Jakob Stix](https://en.wikipedia.org/wiki/Jakob_Stix) had pointed to Corollary 3.12 in
the third preprint as having some problems.  They visited Mochizuki, resulting in some
back-&amp;-forth papers, but no agreement.  

The proof was eventually published&hellip; in a journal of which Mochizuki is
editor-in-chief.  

And that's more or less where things stand: most mathematicians think the proof is flawed
in at least one specific place, while some others defend it but with explanations that the
rest cannot understand.  _This does not normally happen._  

#### Some _Weirdness_ Crops Up  

Why did I refer to Mochizuki as a "rebel" mathematician?

Look, scientists and mathematicians can handle weird people.  We _are_ weird people.  But
sometimes, things are just consistently off in some way we don't get:  
- Instead of publicizing his proof, Mochizuki just uploaded it to his university's
  preprint server and said approximately nothing.  
- The refusal to give talks at math departments around the world to explain his ideas is
  just difficult to comprehend.  
- He's tended to argue that critics need to sort of give up the math they already know,
  and let his new approach take over.  Even if that's right, it's not an argument; it's a
  polemic.  
- Just to add a bizarre note, it's even been 
  [speculated he's Satoshi Nakomoto](https://en.wikipedia.org/wiki/Satoshi_Nakamoto#:~:text=In%20May%202013%2C%20Ted%20Nelson,a%20source%20for%20the%20denial.),
  the (in)famous anonymous inventor of blockchain and Bitcoin.  Mochizuki has been said to
  deny this, but nobody can find the actual denial.  (Really, though: how exactly should
  he "prove" that he's not the guy whose identity nobody knows?  Satoshi Nakomoto, should
  he be an actual person who is still alive, can reveal himself reliably in exactly 1 way:
  applying his signature to the blockchain in a public way.)  

So, it's all a bit inconclusive, and more than a bit weird.  


## A Book&hellip; and a _Vehement_ Review  

Now there are books about the whole situation, usually taking sides.  And when there are
books, there will be book reviews.  Usually they're genteel and polite&hellip; but this is a
_special_ situation.

### A Semi-Popular Book on the Whole Mess  

<img src="{{ site.baseurl }}/images/2024-04-12-book-review-with-fangs-kato.jpg" width="400" height="127" alt="Kato's book @ Google Books" title="Kato's book @ Google Books" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2024-04-12-book-review-with-fangs-Fumiharu-Kato.jpg" width="400" height="400" alt="Prof Fumiharu Kato of Tokyo Institute of Technology" title="Prof Fumiharu Kato of Tokyo Institute of Technology" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The book in question is a 2019 book for popular audiences by  Fumiharu Kato of the Tokyo
Institute of Technology:
_Mathematics that Bridges Universes: The Shock of IUT Theory_.  <sup id="fn5a">[[5]](#fn5)</sup>

It hasn't been translated into English yet, and I have about as much chance of
understanding a technical treatment as my cats have of understanding how cat food gets
into cans.  So this is just a link to the Google Books page, and we'll rely on others to
interpret it for us.  

Again, this is meant to be a popular book, but by a serious guy &ndash; Todai is a
top-flight Japanese university.  Kato is apparently more or less in favor of Mochizuki's
proof.  

### A Reviewer Has&hellip; _Thoughts_  

Not every one agrees.  This was brought to my attention by a mathematician on Mastodon,
who seems to be a category theorist posting under the cognomen "The Higher Geometer":  
<a href="https://mathstodon.xyz/@highergeometer/112255984315670343"><img src="{{ site.baseurl }}/images/2024-04-12-book-review-with-fangs-higher-geometer.jpg" width="550" height="759" alt="Higher Geometer @ Mastodon: Nishmura's review of Kato's book on Mochizuki" title="Higher Geometer @ Mastodon: Nishmura's review of Kato's book on Mochizuki" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<img src="{{ site.baseurl }}/images/2024-04-12-book-review-with-fangs-rg-1.jpg" width="400" height="190" alt="Nishimura @ ResearchGate: Review of Kato's book on Mochizuki" title="Nishimura @ ResearchGate: Review of Kato's book on Mochizuki" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2024-04-12-book-review-with-fangs-zbmath-1.jpg" width="400" height="102" alt="Nishimura @ zbMath Open: Review of Kato's book on Mochizuki" title="Nishimura @ zbMath Open: Review of Kato's book on Mochizuki" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
He's pointing us at a review written by Hirokazu Nishimura of the University of 
Tsukuba. <sup id="fn6a">[[6]](#fn6)</sup> It's been published _zbMath Open_ (the new
incarnation of _Zentralblatt MATH_), which is sort of the proper venue for reviews and
abstracts like this.  But the link below is to the "unexpurgated" version stored on
_ResearchGate_.  

Now&hellip; whenever there's an "unexpurgated" version of something, there's a deep enough
disagreement that someone felt the need for censorship.  Let's see what it is.  
- It's never good when a reviewer starts out with words like "hulking inter-universal
  Teichm&uuml;ller theory"  
- Or when he describes the book as "spectacularly rickety", and refers directly to Peter
  Scholze, who above found the problems with Corollary 3.12 in preprint 3.  
- The sarcasm is dry: "Shinichi Mochizuki has contributed a sentence to the book."  

That's sort of the set-up.  The knife now flashes a few times:

> This is completely wrong. This shows only that the author is a good bit ignorant of
> modern mathematics.  

And even more:  

> The author gives a lot of episodes telling how nice a guy Shinichi Mochizuki is, but it
> is not easy to reconcile those episodes with the well-established figure of Shinichi
> Mochizuki in international mathematical community.  
>  
> &hellip;  
>  
> In December 2014, he [Mochizuki] wrote that to understand his work, there was a "need
> for researchers to deactivate the thought patterns that they have installed in their
> brains and taken for granted for so many years". To mathematician Lieven Le Bruyn of the
> University of Antwerp in Belgium, Mochizuki's attitude sounds defiant. "Is it just me,"
> he wrote on his blog earlier this year, "or is Mochizuki really sticking up his middle
> finger to the mathematical community".  

And it gets personal:  

> I should say regrettably that Shinichi Mochizuki is, far from being a nice guy, mentally
> ill in the midst of paranoia.   I guess that Mochizuki's paranoia has affected greatly
> his solution of the ABC conjecture, just as John Nash's solution of the Riemann
> hypothesis, on which he gave a lecture at Corolado [_sic_] University in 1959, was affected by
> his paranoia.  

Being compared to John Nash is pretty nice, but not like _that._  

In explaining Mochizuki's refusal to talk to groups outside Japan:  

> The author argues that Mochizuki’s IUT theory is radically new even in comparison with
> Wiles’ solution of Fermat’s last theorem, so that it is impossible to explicate the
> theory by such a lecture. I know well that such grandiosity often accomapanies [_sic_]
> paranoia. Such a claim reminds me of Zen Buddhism, in which it is claimed that nirvana
> is unspeakable, so that you should do only Zazen for years or decades to attain
> nirvana. Daisetz Suzuki (1870–1966) is famous for propagating Zen Buddhism worldwide by
> speaking and writing a lot about Zen Buddhism in English. Some cynics say that Daisetz
> Suzuki became famous by speaking a lot about the unspeakable. The author of this book
> has written a book for general public on the unspeakable.  

I don't suppose it would help to say Westerners, via Wittgenstein, also know about the
unspeakable?  

> [“Wovon man nicht sprechen kann, darüber muß man schweigen.”]({{ site.baseurl }}/quotes/#:~:text=%E2%80%9CWovon%20man%20nicht%20sprechen%20kann%2C%20dar%C3%BCber%20mu%C3%9F%20man%20schweigen.%E2%80%9D%20(Whereof%20one%20cannot%20speak%2C%20thereof%20must%20one%20remain%20silent.)%20%E2%80%94%20Ludwig%20Wittgenstein%2C%20Tractatus%2C%20Proposition%207%20(at%20which%20point%20the%20Tractatus%20ends)) (Whereof one cannot speak, thereof must one remain silent.) — Ludwig Wittgenstein, _Tractatus_, Proposition 7 (at which point the _Tractatus_ ends)  

<iframe width="400" height="224" src="https://www.youtube.com/embed/HZpVIi3IWhs?si=DcLsa9NCvuKK9Olc" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
Just to make his frustration _very_ clear, Nishimura closes with this music video.
It's&hellip; very, very angry.  It comes from some sort of anime, the song being covered
by a live singer here in English.  

The song is very, very angry and rude to a degree highly atypical of Japanese.  It's also
clever, in a weird way:  
- The tag line "You say wrong" sounds vaguely like the title of the song in Japanese,
  "Usseewa".  
- "Usseewa" is a slangy short form of "Urusai wa", roughly "that's noisy".  
- But when you put it in the short form, it kind of means "shut up", which is shockingly
  rude.  
  
Clever, angry, and a bit mean.  


## The Weekend Conclusion  

So I asked a couple mathematicians, one personally and the other through a group where
we're both members.  
- My acquaintance's private opinion was that we have here "a sad situation for a long
  time". Most number theorists are apparently even _more_ dismissive in private, and now
  there are lots of "public exchanges of insults".  
- My other acquaintance described a recent comment by Mochizuki as "taking a blowtorch to
  his own credibility".  
  
And that's pretty much what we saw in this review.  

I know better than to have an opinion about the math, but in terms of how mathematicians
and scientists work together, "sad situation" seems apt here.  The review is pointed,
personal, clever, and more than a little bit mean.  I hope never to write such a thing,
but even more so I hope never to be confronted with subject matter and colleagues
like this.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  

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

<a id="fn1">1</a>: S Mochizuki, ["Inter-universal Teichmuller Theory I: Construction of Hodge Theaters"](https://www.kurims.kyoto-u.ac.jp/~motizuki/Inter-universal%20Teichmuller%20Theory%20I.pdf), 2012. [↩](#fn1a)  

<a id="fn2">2</a>: S Mochizuki, ["Inter-universal Teichmuller Theory II: Hodge–Arakelov-theoretic Evaluation"](https://www.kurims.kyoto-u.ac.jp/~motizuki/Inter-universal%20Teichmuller%20Theory%20II.pdf), 2012. [↩](#fn2a)  

<a id="fn3">3</a>: S Mochizuki, ["Inter-universal Teichmuller Theory III: Canonical Splittings of the Log-theta-lattice"](https://www.kurims.kyoto-u.ac.jp/~motizuki/Inter-universal%20Teichmuller%20Theory%20III.pdf), 2012. [↩](#fn3a)  

<a id="fn4">4</a>: S Mochizuki, ["Inter-universal Teichmuller Theory IV: Log-volume Computations and Set-theoretic Foundations"](https://www.kurims.kyoto-u.ac.jp/~motizuki/Inter-universal%20Teichmuller%20Theory%20IV.pdf), 2012. [↩](#fn4a)  

<a id="fn5">5</a>: F Kato, [_Mathematics That Bridges Universes: The Shock of IUT Theory_](https://www.google.com/books/edition/%E5%AE%87%E5%AE%99%E3%81%A8%E5%AE%87%E5%AE%99%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%E6%95%B0%E5%AD%A6/gaMJxQEACAAJ?hl=en), (JP) Zbl Zbl 07530203 Tokyo: Kadokawa Shoten (ISBN 978-4-04-400417-0/pbk), 304 pp., 2019.  

The book has not (yet) been published in English; this link goes to the Google Books page for it. [↩](#fn5a)  

<a id="fn6">6</a>: H Nishimura, ["Another review of Kato, Fumiharu _Mathematics that bridges universes. The shock of IUT theory_"](https://www.researchgate.net/publication/363921065_Another_review_of_Kato_Fumiharu_Mathematics_that_bridges_universes_The_shock_of_IUT_theory), 2022-Sep.  

This is a link to the apparently "unexpurgated" version uploaded by the author on _ResearchGate_ of [a review that appeared on _zbMath Open_](https://zbmath.org/07530203). I'm not sure how to feel about the existence of an 'expurgated' version, as opposed to an 'edited' version.  

Just to avoid any further 'expurgation', we've [archived a copy of this version of the review]({{ site.baseurl }}/assets/2024-04-12-book-review-with-fangs-nishimura-unexpurgated.pdf). [↩](#fn6a)  
