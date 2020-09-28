---
layout: post
title: What's that stupid avatar?
tags: SomebodyAskedMe About
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe), "What's that stupid avatar
on your blog?"  It's a reminder that even simple problems show infinite complexity if you
look closely enough.  

## The Problem  

Suppose you want to look for the cube roots of unity in the complex $z$ plane.  That is,
you're looking for the roots of a simple polynomial function $f(z) = z^3 - 1 = 0$.  The
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
what to guess for $z_0$?"  If Nature were kind, you could guess anything you like.  Bad
guesses might converge more slowly than good ones, but they'd all converge to the same
place.  Or, in our case, one of the 3 places.  

## Nature is Not Kind

<img src="{{ site.baseurl }}/images/2020-08-07-whats-that-stupid-avatar-expected.png" width="400" height="400" alt="Expected basins of attraction" title="Expected basins of attraction" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
That sort of thinking is illustrated here.
