---
layout: post
title: What's that stupid avatar?
tags: About Math R SomebodyAskedMe &Gammad;&Tau;&Phi;
comments: true
commentsClosed: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe), "What's that stupid avatar
on your blog?"  It's a reminder that even simple questions show infinite complexity if you
look closely enough.  And sometimes even if you don't!  

## The question  

Suppose you want to look for the cube roots of unity in the complex $z$ plane.<sup id="fn1a">[[1](#fn1)]</sup>
That is, you're looking for the roots of a simple polynomial function $f(z) = z^3 - 1 = 0$.  The
answer is pretty simple; there are 3 roots distributed equally about the unit circle:

$$
\begin{align*}
  z &= 1               \\
  z &= e^{2 \pi i / 3} \\
  z &= e^{4 \pi i / 3} \\
\end{align*}
$$

But suppose, as is usually the case, you don't _know_ the analytical solution.  You're
looking for it numerically, say by 
[Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method).  This is a method
much-beloved of numerical analysts, and for good reason.  You start out with a guess $z_0$
at where the root might be.  Then you improve it by this iteration, based on finding where
the tangent intesects the axis:  

$$
z_{n+1} = z_{n} - \frac{f(z_n)}{f'(z_n)}
$$

Iterate until sufficiently converged, or sufficiently tired &amp; frustrated.  

Now, upon encountering this for the first time, every single undergrad in the history of
forever has asked, "But where does that initial guess come from?  What if I have no idea
what to guess for $z_0$?"  Until you know how critical the initial guess is, you simply
_cannot_ trust the output of the numerical method.  

If Nature were kind, you could guess anything you like.  Bad guesses might converge more
slowly than good ones, but they'd all converge to the same place.  (Or, in our case, one 
of the 3 places above.)  

So: do you think Nature is kind?  

## Nature is _not_ kind

<!-- *** figure/figcaption -->
<img src="{{ site.baseurl }}/images/2020-08-07-whats-that-stupid-avatar-expected.png" width="200" height="200" alt="Expected basins of attraction" title="Expected basins of attraction"  style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
That sort of thinking is illustrated here.  You might hope that wherever in the complex
$z$ plane you pick as your initial guess, you'd converge to the nearest root.  Thus we
expect 3 basins of attraction: initial guesses in the red basin converge to $1$, those in
the green basin converge to $e^{2 \pi i / 3}$, and those in the blue basin converge to
$e^{4 \pi i / 3}$ (the colors are brightest at those points).  If the world were really
that simple, _it would not matter_ where you started out, because you'd surely &amp;
predictably end up at the nearest root.  Nifty, no?  

<!-- *** figure/figcaption -->
<img src="{{ site.baseurl }}/images/root-fractal-1000.png" width="300" height="300" alt="Actual basins of attraction" title="Actual basins of attraction" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Alas, this is _not_ what actually happens!  What actually happens (reference 2) is illustrated in the
second (slightly larger) figure.  As before, the red, green, and blue basins converge to 
$1$, $e^{2 \pi i / 3}$, and $e^{4 \pi i / 3}$, respectively, as we predicted above.  
But take a look at those lovely, fractal boundaries!  And we're not zoomed in here to some 
absurd level where we're looking at numerical roundoff: the horizontal and vertical extents are
$[-1, +1]$.  

You can't cross from red to green without encountering blue.  In fact, you can't cross from
any color to any other color without encountering the third color.  Think about what that
means recursively: you can never cross a simple border, because if you zoom in on the
border you'll see that it's infinite numbers borders with colors interposing between each
other, forever.  _You can never have a simple border between these basins of attraction._  

So our hapless undergrad could pick an initial guess in the blue zone at the upper right,
and end up converged to the blue root in the lower left &mdash; the root that is
_maximally distant_ from the initial guess.  Sometimes, you really have to understand
where to start, and in some detail.  

## So... cope with it!  

That's why this blog uses it as a logo: the world can be complex in its details, but we
can sometimes tease them apart with analysis, mathematics, and patience.  What we _cannot_
do is just ignore the complexity and hope it will go away.  We have to cope with it, and
since it's built in down at the keel-blocks of reality, we cannot escape
it.  This is the spirit of the "Litany of [Gendlin](https://en.wikipedia.org/wiki/Eugene_Gendlin)",
as it is sometimes (pretentiously) called:  

>What is true is already so.  
>Owning up to it doesn't make it worse.  
>Not being open about it doesn't make it go away.  
>And because it's true, it is what is there to be interacted with.  
>Anything untrue isn't there to be lived.  
>People can stand what is true,  
>for they are already enduring it.  
> &mdash; Eugene Gendlin

The world is complicated; rather than pretending we can ignore the complexity, we should engage it.  

---

## Notes  

<a id="fn1">1</a>: This particular example is not original to me.  I found it via Steven
Strogatz (reference 1), who in turn provides more extensive references. [↩](#fn1a)  

---

## References  

1. S Strogatz, ["Finding Your Roots"](http://opinionator.blogs.nytimes.com/2010/03/07/finding-your-roots/), _NYT Opinionator_, 2010-Mar-07.  

2. Weekend Editor, [`root-fractal.r`]({{ site.baseurl }}/assets/2020-08-07-whats-that-stupid-avatar-root-fractal.r), _Some Weekend Reading_, 2020-Aug-07.  
