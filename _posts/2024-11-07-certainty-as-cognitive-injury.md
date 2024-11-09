---
layout: post
title: On Certainty as Cognitive Injury
tags: CatBlogging MathInTheNews Obscurantism Politics Religion Sadness
comments: true
commentsClosed: true
---

People who are _absolutely_ certain about something kind of scare me.  


## Absolute Certainty  

This Crummy Little Blog That Nobody Reads (CLBTNR) probably has no long-term readers.
But, were anyone rash enough to be such a reader, they would by now have figured out that
your humble Weekend Editor is a member of a religious community.  It's probably not
obvious _which_ community, but the signs should be there.  

On occasion, I hear people say things like, "I know beyond a shadow of a doubt
that&hellip;" And it almost doesn't matter how they end that sentence, because I can't
hear them over the screaming inside my head.  I don't know _any_ religious propositions
"beyond a shadow of a doubt".  I _hope_ some things are true, and find it _useful_ to behave
as though they were for the effects that has on me.  

But this kind of extreme statement, particularly in the service of a conservative
religious proposition, sounds like a sort of fanaticism that scares
me.  <sup id="fn1a">[[1]](#fn1)</sup>  

Similarly, when I hear political statements of similar extreme commitment, I also get
scared.  

I'm always a bit itchy about conservatives pushing hard on an idea that sounds absurd to
me.  As Voltaire put it:  

> ["Those who can make you believe absurdities can make you commit atrocities." &ndash; Voltaire]({{ site.baseurl }}/quotes/#the-one-who-is-voltaire:~:text=%E2%80%9CThose%20who%20can%20make%20you%20believe%20absurdities%20can%20make%20you%20commit%20atrocities.%E2%80%9D)  
> 
> (A loose translation from the original, in __Questions sur les miracles__, 1765: "Certainement qui est en droit de vous rendre absurde est en droit de vous rendre injuste.")  

<img src="{{ site.baseurl }}/images/2022-08-29-authoritarian-cops-altemeyer-1.jpg" width="200" height="289" alt="R Altemeyer, The Authoritarians" title="R Altemeyer, The Authoritarians" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Why am I so scared?  Because this sort of absolute certainty correlates with the
authoritarian mindset, and the  violence involved in defending it.  Bob Altemeyer's book
_The Authoritarians_  <sup id="fn2a">[[2]](#fn2)</sup> is extremely illuminating in this
regard, confirming the snark from Voltaire about violence.  I first read it during the
Lesser Bush years, and it was scary then how it modeled the anti-intellectual, violent
right.  

Nowadays, it's even more so.  


## What Exactly _Do_ They Mean?  

So I'm pretty motivated to understand what people _mean_ when they say things like that.
As a fan of Bayes and Popper, in order for things to make sense to me they have to be
falsifiable: there has to be some kind of evidence that will make you _change your mind._  

> ["In so far as a scientific statement speaks about reality, it must be falsifiable; and in so far as it is not falsifiable, it does not speak about reality."
&ndash; Karl Popper, __The Logic of Scientific Discovery__, 1959]({{ site.baseurl }}/quotes/#:~:text=%E2%80%9CIn%20so%20far%20as%20a%20scientific%20statement%20speaks%20about%20reality%2C%20it%20must%20be%20falsifiable%3B%20and%20in%20so%20far%20as%20it%20is%20not%20falsifiable%2C%20it%20does%20not%20speak%20about%20reality.%E2%80%9D%20%E2%80%93%20Karl%20Popper%2C%20The%20Logic%20of%20Scientific%20Discovery%2C%201959.)  

So let's take some guesses about what might be going on in the minds of these very, very
certain people.  They can't explain it to us, so we'll have to start making plausible
guesses.  

### Extreme Priors Lead to Fixpoints of Bayes Rule  

I'm going to start from Bayes Rule, but with extreme priors.  

Suppose we have an extreme prior, in which we believe $A$ is impossible: $\Pr(A) = 0$;
equivalently $\Pr(\neg A) = 1$.  What happens when you attempt to learn from new evidence
$B$?  

We have conditional probabilities $\Pr(B|A)$ and $\Pr(B|\neg A)$, i.e., the probability of
evidence $B$ in worlds where our belief about $A$ is either true or false.  We can use Bayes
Theorem to update our beliefs about $A$:  

$$
\begin{align*}
\Pr(A|B) &= \frac{\Pr(B|A)\cdot\Pr(A)}{\Pr(B|A)\cdot\Pr(A) + \Pr(B|\neg A)\cdot\Pr(\neg A)} \\
         &= \frac{0}{0 + \Pr(B|\neg A) \cdot 1} \\
         &= 0
\end{align*}
$$

That is, there is no change in your belief about $A$; you still think it's
impossible! <sup id="fn3a">[[3]](#fn3)</sup>  You have absolutely failed to learn a single
thing from the new evidence $B$.  

Of course, the same sort of thing happens if you flip the sign on $A$, believing it
absolutely certain: $\Pr(A) = 1$, then $\Pr(\neg A) = 0$ and we get the same intransigent
refusal to budge from your prior on $A$:

$$
Pr(A|B) = Pr(B|A) / (Pr(B|A) + 0) = 1
$$

So 0 and 1 are Bayesian fixpoints!  If you start out absolutely certain, then _no amount of
evidence whatsoever will change your mind, never ever forever._  You are incapable of
learning anything further from experience.  

### Uniqueness of the Bayes Rule Fixpoints  

Now let's see if there are any _other_ fixpoints to Bayes Rule. Without loss of
generality, concentrate on $\Pr(A)$ over $\Pr(\neg A) = 1 - \Pr(A)$.  A fixpoint is when
$\Pr(A|B) = \Pr(A)$, i.e., evidence B won't budge you.  ("Nobody likes an un-budger", as Buffy
used to say.)  

$$
\Pr(A) = \frac{\Pr(B|A)\cdot \Pr(A)}{\Pr(B|A)\cdot\Pr(A) + \Pr(B|\neg A)\cdot(1 - \Pr(A))}
$$

Let's investigate that equation in a slightly more compact notation.  Let $a = \Pr(A)$,
$b = \Pr(B|A)$, and $b' = \Pr(B|\neg A)$.  The previous equation becomes:  

$$
\begin{align*}
  a(ba + b'(1-a)) &= ba \\
  ba^2 + b'a - ba - b'a^2 &= 0 \\
  (b - b')a^2 + (b' - b)  a &= 0 \\
  (b - b')a(a-1) &= 0
\end{align*}
$$

So for a solution, either:
- $b \neq b'$ and $a = 0$ or $a = 1$, i.e., the fixpoints $\Pr(A) = 0$ and $\Pr(A) = 1$ we
  found above, or   
- $b = b'$ & $a$ is whatever, any probability in [0, 1].  That means
  $\Pr(B|A) = \Pr(B|\neg A)$, which says $B$ is independent of $A$.  Fine, we can ignore
  irrelevant evidence.  

__Conclusions:__  

1. So $\Pr(A) = 0$ and $\Pr(A) = 1$ are confirmed as Bayes Rule fixpoints.  
2. Additionally, _irrelevant evidence_ where $B$ is _independent_ of $A$, may also be
   ignored.  You can ignore irrelevant evidence and keep your current beliefs
   _if and only if you are correct that the evidence is irrelevant._  

The ability to ignore irrelevant evidence is a good one, and I had not anticipated finding
that.  However, our main finding is: if you are absolutely certain about something, then
you are absolutely incapable of further learning about it.  


## The Weekend Conclusion  

<a href="{{ site.baseurl }}/images/2024-11-07-certainty-as-cognitive-injury-assistant-certainty.jpg"><img src="{{ site.baseurl }}/images/2024-11-07-certainty-as-cognitive-injury-assistant-certainty-thumb.jpg" width="400" height="533" alt="The Assistant Weekend Publisher, absolutely certain that he is safe and loved in the arms of the Weekend Editirx.  Fair enough.  Good cat." title="The Assistant Weekend Publisher, absolutely certain that he is safe and loved in the arms of the Weekend Editirx.  Fair enough.  Good cat." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Being _absolutely certain_ about something means you can never, ever hope to learn from
new evidence on that topic.  

That sounds to me like a _bad_ idea.  

I will, however, make an exception for some things.  For example, the Assistant Weekend
Publisher, shown here, is _absolutely certain_ that he is safe and loved in the arms of
the Weekend Editrix.  

I will happily go along with _that._  

Some things, after all, are holy.  I'm just very choosy about _which_ things.  

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

<a id="fn1">1</a>: In my mis-spent youth, I used to think the only thing I knew "beyond a shadow of a doubt" was mathematics. Then I encountered [Kurt G&ouml;del and his various incompleteness theorems](https://en.wikipedia.org/wiki/G%C3%B6del%27s_incompleteness_theorems): there exist things that are true, but unprovable.  

So I retreated to more basic matters: maybe I could be certain "beyond a shadow of a doubt" about arithmetic?  Surely the integers are trustworthy!  Then I stumbled upon [Gottlob Frege and his _Die Grundlagen der Arithmetik_](https://en.wikipedia.org/wiki/The_Foundations_of_Arithmetic), which called into question even _that_ foundation.  

Okay, maybe set theory?  Nope, [Russell's Paradox](https://en.wikipedia.org/wiki/Russell%27s_paradox).  While resolvable, that nonetheless cautioned me one final time against believing just about _anything_ "beyond a shadow of a doubt".  

Foundations are best approached cautiously, and seldom by amateurs.  [↩](#fn1a)  

<a id="fn2">2</a>: R Altemeyer, [_The Authoritarians_](https://theauthoritarians.org/), 2006. __NB:__ This book, as well as much supplementary material, is available on Altemeyer's web site, as well as in print form. [↩](#fn2a)  

<a id="fn3">3</a>: __NB:__ if $\Pr(B|\neg A) = 0$ also, then we have a 0/0 problem.  I wonder what that's all about? [↩](#fn3a)  
