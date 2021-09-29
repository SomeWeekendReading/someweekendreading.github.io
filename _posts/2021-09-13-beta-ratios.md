---
layout: post
title: On the ratio of Beta-distributed random variables
tags: CatBlogging Math Statistics TheDivineMadness
comments: true
---

[Warning: Post contains full frontal nerdity.  Bug reports appreciated!] I finally got a
copy of Pham-Gia's paper on the distribution of the ratio of 2 independent Beta-distributed
random variables.  While I still have some childhood trauma around hypergeometric functions like
${}\_{2}F\_{1}()$ and its scarier brother ${}\_{3}F\_{2}()$&hellip; time to face my fears.  


## The three B's: Bernoulli, Binomial, and Beta  

Suppose you flip a loaded coin that has probability $p$ of coming up heads.  That's a 
[Bernoulli distribution](https://en.wikipedia.org/wiki/Bernoulli_distribution), with just
2 discrete values.  

Now suppose you do that $N$ times, and observe that heads comes up $k$ times.  That's a 
[binomial distribution](https://en.wikipedia.org/wiki/Binomial_distribution):  

$$
\Pr(k | N, p) = \binom{N}{k} p^k (1-p)^{(N-k)}
$$

Next, suppose you don't know how _much_ the coin is loaded.  Somebody lets you take $N$
flips, and you observe $k$ heads.  What should you believe about $p$, the probability the
coin comes up heads?  A na&iuml;ve estimate would just give the single point value 
$p = k/N$.  

A better approach is to regard $p$ as a random variable, whose distribution you're
inferring from experiment.  The Bayesian way to do this is to start with a prior
distribution that summarizes your knowledge before the experiment.  If you don't know
anything, then it's hard to beat a uniform distribution on $[0, 1]$.  This can
conveniently be done with the
[Beta distribution of the first kind](https://en.wikipedia.org/wiki/Beta_distribution):  

$$
\Pr(p | \alpha, \beta) = \frac{p^{\alpha - 1} (1 - p)^{\beta - 1}}{B(\alpha, \beta)}
$$

where the normalization is
$B(\alpha, \beta)$ is the [complete Beta function](https://en.wikipedia.org/wiki/Beta_function).  

It's pretty clear that the uniform distribution is $\alpha = 1, \beta = 1$.  At that point
it's a pretty straightforward application of Bayes Rule to show that the posterior
distribution for $p$ will be Beta-distributed with parameters 
$\alpha = k + 1, \beta = N - k + 1$.  So all you have to do is _count_ the number of
trials and successes to get a posterior probability distribution that reflects your
complete knowledge (and uncertainty!) of $p$.  


## Why we're interested: vaccine efficacy confidence intervals  

The reason we're interested in this is vaccine efficacy confidence intervals.  Basically
you have $N_v$ people enrolled in the vaccine arm of the trial, and see $I_v$ infections.
At the same time, you have $N_c$ people enrolled in the control arm, and observe $I_c$
infections.  

The coin we flipped above here is: heads you get the disease, tails you don't.  We'd like
to know how much the vaccine lowers your risk of disease.  

So point estimates of the probability of infection in each arm are:  

$$
\begin{align*}
p_v &= I_v / N_v \\
p_c &= I_c / N_c
\end{align*}
$$

(We'd of course like to use a posterior Beta distribution instead of a point estimate
here.)  

Then the vaccine efficacy is how much the risk is lowered, compared to the unvaccinated
control arm:  

$$
VE = \frac{p_c - p_v}{p_c} = 1 - \frac{p_v}{p_c}
$$

Now if we believe that $p_v$ and $p_c$ are Beta-distributed, given the clinical trial as a
bunch of disease-catching coin flips, then vaccine efficacy is distributed as (a trivial linear
function of) the ratio of a couple of independent Beta variables.  

Ok, so what's the distribution of a ratio of independent Beta variables?  There are a
variety of ways to approach this, and we'll compare several of them in an upcoming post.  For
now, we're going to fight our way through a paper which gives the exact Bayesian result.  


## Exact solution: the probability distribution function (PDF) of a ratio of 2 Beta-distributed random variables  

We'll look specifically at the application of all this to the case of vaccine efficacies
in a later post.  For now, let's just examine the mathematical question of what the
distribution is for the ratio of two Beta-distributed variables.  The exact solution was
published in 2000 by Pham-Gia. <sup id="fn1a">[[1]](#fn1)</sup> It lives behind an
execrable paywall, and was thus devilishly difficult to acquire without paying ransom.
Fortunately, I know people who know people who know people; somebody or other in that
chain found it or had institutional access, and passed it back up the chain.  Whoever you
are, my thanks.  

### The problem  

Consider 2 Beta-distributed variables $p_1$ and $p_2$:  

$$ 
\begin{align*}
  \Pr(p_1) &= \frac{p_{1}^{\alpha_{1}-1}(1-p_{1})^{\beta_{1}-1}}{B(\alpha_1, \beta_1)} \\
  \Pr(p_2) &= \frac{p_{2}^{\alpha_{2}-1}(1-p_{2})^{\beta_{2}-1}}{B(\alpha_2, \beta_2)} 
\end{align*} $$

We then ask: if we compute their ratio $R = p_1 / p_2$, then what is the PDF of $\Pr(R)$?  If
we knew the answer, particularly the CDF (or even better the quantile function, which is
the functional inverse of the CDF!), we could calculate 95% confidence intervals on the
ratio.  

### Ranges  

It's important to understand the ranges of each of the variables $p_1$, $p_2$, and $R$ so
that as we transform variables we don't accidentaly step outside reality.  This will help
us keep the integration limits straight.  Because $p_1$ and $p_2$ are from the standard
Beta distribution, we have:  

$$
0 \le p_1, p_2 \le 1
$$

(Usually these are proportions or probabilities, so we certainly want to stay in $[0, 1]$!)  

$R$, on the other hand, is a bit more gnarly.  Since both $p_1$ and $p_2$ are
non-negative, then surely 0 is a lower bound for $R$.  But the denominator $p_2$ can of
course be arbitrarily near 0, so if at the same time the numerator $p_1$ is finite
(stepping carefully around the land mine at 0/0), then the upper bound must be infinite:  

$$
0 \le R \le +\infty
$$

(Values of $R \gt 1$ will, when we apply this to vaccine efficacies, result in _negative_
efficacies.  Is that meaningful?  Sure: your vaccine could make things _worse_, making the
vaccinees _more_ susceptible to disease&hellip; which is surely negative efficacy, no?)  

### Changes of variables  

Our strategy is to start with the joint density $\Pr(p_1, p_2)$ and then do various
tortured changes of variables to eliminate one of $p_1$ or $p_2$ in favor of $R$, and
express the residual integral in terms of a hypergeometric function ${}\_{2}F\_{1}()$.  

How complicated can it be?  Well, there's lots of detail coming up, but really it comes
down to the fact that with 3 variables $p_1, p_2, R$ there are only 2 ways to eliminate
one of them in favor of $R$.  Either we substitute out $p_1$ in favor of $p_2, R$ via:  

$$
\begin{align*}
  p_1  &= p_2\, R \\
  dp_1 &= p_2\, dR
\end{align*}
$$

This is appropriate for $0 \le R \le 1$, since if $R \gg 1$ it could force a value of 
$p_1 > 1$, which takes us out of its allowed range.  

Or we substitute out $p_2$ in favor of $p_1, R$ via:  

$$
\begin{align*}
  p_2  & = \frac{p_1}{R} \\
  dp_2 &= -\frac{p_1}{R^2} dR
\end{align*}
$$

This is correspondingly appropriate for $1 \lt R$, as it guarantees $p_2 \le 1$, as the
range requires.  (We'll eventually lose the minus sign, taking absolute value of
Jacobians.)  

So we'll need to do _both_ transformations, piecewise over the range of $R$.  

Double the workload.  Le sigh&hellip; who coulda seen _that_ coming?  

### Reading off the distribution of $R$  

I like to do these changes of variable by looking at the normalization integral for the
joint distribution.  That way, as you change variables, the integration measure will force
you to pick up the Jacobian properly.  The joint distribution of $p_1$ and $p_2$ is, since
they're assumed independent, just the product of their individual distributions.  So the
normalization integral is pretty straightforward to write down:  

$$ 
1 = \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \int_0^1\!\!\!\!dp_1 \int_0^1\!\!\!\!dp_2\, p_1^{\alpha_1 - 1} (1-p_2)^{\beta_1 - 1} p_2^{\alpha_2 - 1} (1-p_2)^{\beta_2 - 1}
$$

Next, we'll use _both_ the transformations above to get the integral in 2 pieces, one
using $(p_2, R)$ and another using $(p_1, R)$.  The first will involve an integral over
$R$ from 0 to 1, while the second will integrate from 1 to $+\infty$.  Then we'll do a
little razzle-dazzle high school algebra to pull the $R$ integrations to the left, and
thus be able to read off the distribution of $R$.  It'll be a piecewise function, with one
piece for $0 \le R \le 1$ and another for $R \gt 1$:  

$$
\begin{alignat*}{4}
1 & =  \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} && \left[ \int_0^1\!\!\!\!dp_2 \int_0^1\!\!\!\!dR\, p_2 (Rp_2)^{\alpha_1 - 1} (1 - Rp_2)^{\beta_1 - 1} p_2^{\alpha_2 - 1} (1-p_2)^{\beta_2 - 1} \right. \\
  & && \left. + \int_0^1\!\!\!\!dp_1 \int_1^{+\infty}\!\!\!\!\!\!\!\!dR\, \frac{p_1}{R^2} p_1^{\alpha_1 - 1} (1-p_1)^{\beta_1 - 1} \left(\frac{p_1}{R}\right)^{\alpha_2 - 1} \left(1 - \frac{p_1}{R}\right)^{\beta_2 - 1}\right] \\
  & = \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} && \left[ \int_0^1\!\!\!\!dR\, R^{\alpha_1 - 1} \int_0^1\!\!\!\!dp_2\, p_2^{\alpha_1 + \alpha2 - 1} (1-p_2)^{\beta_2 - 1} (1-Rp_2)^{\beta_1 - 1} \right. \\
  & && \left. + \int_1^{+\infty}\!\!\!\!\!\!\!\!dR\, \frac{1}{R^{\alpha_2 + 1}} \int_0^1\!\!\!\!dp_1\, p_1^{\alpha_1 + \alpha_2 -1} (1-p_1)^{\beta_1 - 1} \left(1 - \frac{p_1}{R}\right)^{\beta_2 - 1}\right]
\end{alignat*}
$$

From this we can directly read off the PDF for $R$, piecewise for $0 \le R \le 1$ and
similarly for $R \gt 1$, respectively from each of the 2 terms:  

$$
\left\{
  \begin{alignat*}{6}
    \Pr(R | 0 \le R \le 1) &= \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} & \cdot & R^{\alpha_1 - 1} & \cdot & \int_0^1\!\!\!\!dp_2\, p_2^{\alpha_1 + \alpha2 - 1} (1-p_2)^{\beta_2 - 1} (1-Rp_2)^{\beta_1 - 1} \\
    \Pr(R | R \gt 1) &= \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} & \cdot & \frac{1}{R^{\alpha_2 + 1}} & \cdot & \int_0^1\!\!\!\!dp_1\, p_1^{\alpha_1 + \alpha_2 -1} (1-p_1)^{\beta_1 - 1} \left(1 - \frac{p_1}{R}\right)^{\beta_2 - 1}
  \end{alignat*}
\right.
$$

These still contain a residual $p$-integral each, but we'll see next how to interpret those in
terms of the hypergeometric function ${}\_{2}F\_{1}()$ with various tortured arguments.  

### Hypergeometric functions  

Ok, so what's this hypergeometric thingummy I've been mumbling about?  I approach this
subject with some caution, due to some childhood trauma around hypergeometric 
functions. <sup id="fn2a">[[2]](#fn2)</sup>  

[Hypergeometric functions](https://en.wikipedia.org/wiki/Hypergeometric_function) got
their start in the 1600s, but hit it big in the 1800s with major players like Euler,
Gauss, Riemann, and Kummer coming up for bat.  They're at once mind-numbingly complex (at
least to me, since they're kind of my kryptonite) with a bajillion special cases, and
amazingly versatile.  You can express almost all the special functions of theortical
physics (Bessel functions and the like) in terms of hypergeometric functions.  

So there's a temptation: if you can just learn everything about hypergeometric functions,
you can master nearly all of 19th century physics.  The bug, of course, is that _nobody_
can master all of the lore of hypergeometric functions.  Least of all me!  

Like most magical artifacts, they are best approached by wizards and avoided by mundanes.
I am not a wizard in these matters, and thus approach with some fear and considerable
respect for the virtue of keeping one's fingers out of the gears.  

As a matter of definition, in the unit disk $|z| \lt 1$ in the complex plane, the
hypergeometric function of interest at the moment is defined by a power series (and by
analytic continuation outside the disk, stepping carefully around the branch points at 1
and infinity):  

$$
{}_2F_1(a, b; c; z) = \sum_{n=0}^{+\infty} \frac{(a)_n (b)_n}{(c)_n} \frac{z^n}{n!} = 1 + \frac{ab}{c} \frac{z}{1!} + \frac{a(a+1)b(b+1)}{c(c+1)} \frac{z^2}{2!} + \cdots
$$

If $c$ is a non-positive integer, it's undefined or infinite.  The funny parenthetical
dingus is the 
[rising Pochammer symbol](https://en.wikipedia.org/wiki/Falling_and_rising_factorials):  

$$
(q)_n = \left\{ 
          \begin{array}{ll}
            1 & n = 0 \\
            q(q+1)\cdots(q+n-1) & n > 0
          \end{array}
        \right. = \frac{\Gamma(q+n)}{\Gamma(q)}
$$

An interesting special case for us will be when $a$ or $b$ are nonpositive integers (as
with counts in a clinical trial), in which case the Pochammer symbols eventually include a
0 and the series thus terminates, resulting a polynomial.  True, it will be a polynomial
of very high order (say 15,000 participants in a trial arm), but a polynomial nonetheless!

That's all&hellip; fine, if you like that sort of thing.  But what does it have to do with
the integrals we have to do above?  Well, it turns out that ${}\_{2}F\_{1}()$ has an integral
representation, as well, apparently due to Euler:  

$$
{}_2F_1(a,b;c;x) = \frac{1}{B(a, c-a)} \int_0^1\!\!\!\!du\, u^{a-1} (1-u)^{c-a-1} (1-xu)^{-b}
$$

This is the trick that Pham-Gia used to get the density distribution in closed form (at
least, if you regard ${}\_{2}F\_{1}()$ as "closed"&hellip;), by recognizing the integrals
above as special cases of this.  

### Expressing the residual $p$-integrals in hypergeometric terms  

Basically we take the above equations for $\Pr(R)$ with residual integrals , and recognize
that the annoying integral in them can, with a suitable change of variables, be made
identical to the integral representation of ${}\_{2}F\_{1}()$.  

#### Case $0 \le R \le 1$:  

The dictionary of variables to recognize the hypergeometric integral is:  

$$
\begin{align*}
  u &= p_2 \\
  a &= \alpha_1 + \alpha_2 \\
  b &= 1 - \beta_1 \\
  c &= \alpha_1 + \alpha_2 + \beta_2
\end{align*}
$$

That gives the final result for small $R$ of:  

$$
\Pr(R | 0 \le R \le 1) = \frac{B(\alpha_1 + \alpha_2, \beta_2)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} R^{\alpha_1 - 1} {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_1; \alpha_1 + \alpha_2 + \beta_2; R)
$$

And that's Pham-Gia's first result on p. 2698.  

#### Case $1 \le R$:  

Here the dictionary is slightly different:  

$$
\begin{align*}
  u &= p_1 \\
  a &= \alpha_1 + \alpha_2 \\
  b &= 1 - \beta_2 \\
  c &= \alpha_1 + \alpha_2 + \beta_1
\end{align*}
$$

That gives the final result for large $R$ of:  

$$
\Pr(R | 1 \lt R) = \frac{B(\alpha_1 + \alpha_2, \beta_1)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{1}{R^{\alpha_2 + 1}} {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_2; \alpha_1 + \alpha_2 + \beta_1; 1/R)
$$

And that's Pham-Gia's second result on p. 2699.  

To summarize the PDF result:  

$$
\left\{
  \begin{alignat*}{6}
    \Pr(R | 0 \le R \le 1) &= \frac{B(\alpha_1 + \alpha_2, \beta_2)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} &\cdot& R^{\alpha_1 - 1} &\cdot& {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_1; \alpha_1 + \alpha_2 + \beta_2; R) \\
    \Pr(R | 1 \lt R) &= \frac{B(\alpha_1 + \alpha_2, \beta_1)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} &\cdot& \frac{1}{R^{\alpha_2 + 1}} &\cdot& {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_2; \alpha_1 + \alpha_2 + \beta_1; 1/R)
  \end{alignat*}
\right.
$$

To map between the 2 solutions, swap $\alpha_1 \leftrightarrow \alpha_2$, swap 
$\beta_1 \leftrightarrow \beta_2$, and swap $R \leftrightarrow 1/R$.  (Well, _almost_: the
exponent of $R$ in the middle has a +1 that becomes a -1, because nothing is ever simple.)  

### Continuity at $R = 1$  

Pham-Gia did not address in his paper whether the 2 different expressions for $\Pr(R)$
matched up at $R = 1$, i.e., that the probability distribution is continuous.  We can show
that the above expressions for $\Pr(R \| 0 \le R \le 1)$ and $\Pr(R \| 1 \lt R)$ are equal
in the left and right limits approaching $R = 1$, establishing continuity at that point.  

We need 2 identities:  
- From [Wikipedia's entry on ${}\{2}F\_{1}()$ and values at special points](https://en.wikipedia.org/wiki/Hypergeometric_function#Values_at_special_points_z) comes an
identity for evaluating ${}\{2}F\_{1}()$ at 1, provided $\Re(c) \gt \Re(a+b)$.  For the
positive values of $\alpha_i, \beta_i$ we're considering, this is the case so:

$$
{}_{2}F_{1}(a,b;c;1) = \frac{\Gamma(c) \Gamma(c-a-b)}{\Gamma(c-a) \Gamma(c-b) }
$$

- Also, we need to decompose complete Beta functions into Gamma functions, via the
  standard identity we all learned at our mother's knees:  

$$
B(a, b) = \frac{\Gamma(a) \Gamma(b)}{\Gamma(a+b)}
$$

#### Case $0 \le R \le 1$:  

$$
\begin{align*}
\Pr(R | 0 \le R \le 1) &\xrightarrow[R \to 1^{-}]{} \frac{B(\alpha_1 + \alpha_2, \beta_2)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2 + \beta_2) \Gamma(\beta_1 + \beta_2 - 1)}{\Gamma(\beta_2) \Gamma(\alpha_1 + \alpha_2 + \beta_1 + \beta_2 - 1)} \\
  &= \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2) \Gamma(\beta_2)}{\Gamma(\alpha_1 + \alpha_2 + \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2 + \beta_2) \Gamma(\beta_1 + \beta_2 - 1)}{\Gamma(\beta_2) \Gamma(\alpha_1 + \alpha_2 + \beta_1 + \beta_2 - 1)} \\
  &= \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2)\Gamma(\beta_1 + \beta_2 - 1)}{\Gamma(\alpha_1 + \alpha_2 + \beta_1 + \beta_2 - 1)} \\
  &= \frac{B(\alpha_1 + \alpha_2, \beta_1 + \beta_2 - 1)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)}
\end{align*}
$$

#### Case $1 \le R$:  

$$
\begin{align*}
\Pr(R | 0 \le R \le 1) &\xrightarrow[R \to 1^{+}]{} \frac{B(\alpha_1 + \alpha_2, \beta_1)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2 + \beta_1)\Gamma(\beta_1 + \beta_2 - 1)}{\Gamma(\beta_1)\Gamma(\alpha_1 + \alpha_2 + \beta_1 + \beta_2 - 1)} \\
  &= \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2)\Gamma(\beta_1)}{\Gamma(\alpha_1 + \alpha_2 + \beta_1)} \frac{\Gamma(\alpha_1 + \alpha_2 + \beta_1)\Gamma(\beta_1 + \beta_2 - 1)}{\Gamma(\beta_1)\Gamma(\alpha_1 + \alpha_2 + \beta_1 + \beta_2 - 1)} \\
  &= \frac{1}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{\Gamma(\alpha_1 + \alpha_2)\Gamma(\beta_1 + \beta_2 - 1)}{\Gamma(\alpha_1 + \alpha_2 + \beta_1 + \beta_2 - 1)} \\
  &= \frac{B(\alpha_1 + \alpha_2, \beta_1 + \beta_2 -1)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)}
\end{align*}
$$

These 2 expressions being identical, we have established continuity at $R = 1$.  

### Smoothness at $R = 1$  

We'd like to believe that in addition to being continuous at $R = 1$, the PDF is also
smooth, i.e., some rather large number of derivatives are also continuous.  There is no
particular reason to expect a kink in the PDF here, so it would be nice to know that our
piecewise representation of the PDF has not introduced a kink.  

This requires differentiating ${}\_{2}F\_{1}(a, b; c; z)$ with respect to $z$.
One can stare at [Wikipedia's hypergeometric function differentiation formulas](https://en.wikipedia.org/wiki/Hypergeometric_function#Differentiation_formulas),
or just differentiate the power series above to get the same answer: the derivative of a
hypergeometric function is a constant times another hypergeometric function, with +1 added
to the parameters:

$$
\begin{alignat*}{4}
  \frac{d}{dz}     &{}_{2}F_{1}(a,b;c;z) &&= \frac{ab}{c}                &\times&{}_{2}F_{1}(a+1, b+1; c+1; z) \\
  \frac{d^2}{dz^2} &{}_{2}F_{1}(a,b;c;z) &&= \frac{a(a+1)b(b+1)}{c(c+1)} &\times&{}_{2}F_{1}(a+2, b+2; c+2; z) \\
                   &                     &&  \vdots                      &                                     \\
  \frac{d^n}{dz^n} &{}_{2}F_{1}(a,b;c;z) &&= \frac{(a)_n (b)_n}{(c)_n}   &\times&{}_{2}F_{1}(a+n, b+n; c+n; z)
\end{alignat*}
$$

&hellip; where the last expression for the derivative in the general case again uses the 
[rising Pochammer symbols](https://en.wikipedia.org/wiki/Falling_and_rising_factorials),
just as above in the series definition of ${}\_{2}F\_{1}(a, b; c; z)$.  

While it's tempting to do the general case of the $n^\mathrm{th}$ derivative to show it's
$C^\infty$ smooth, we'll content ourselves here with just the first derivative and the
knowledge there's no kink at $R = 1$.  

We'll assemble the goods from 6 identities for the piecewise definition of our
distribution, how to differentiate it, a formula for the value at unity of ${}\_2F_{1}(\cdots; 1)$, 
and some lore of $B()$ and $\Gamma$ functions, all assemblere here in one spot for quick reference:  

$$
\begin{align*}
  \Pr(R | 0 \le R \le 1) &= \frac{B(\alpha_1 + \alpha_2, \beta_2)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \cdot R^{\alpha_1 - 1} \cdot {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_1; \alpha_1 + \alpha_2 + \beta_2; R) \\
  \Pr(R | 1 \lt R) &= \frac{B(\alpha_1 + \alpha_2, \beta_1)}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \cdot \frac{1}{R^{\alpha_2 + 1}} \cdot {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_2; \alpha_1 + \alpha_2 + \beta_1; 1/R) \\
  \frac{d}{dz} {}_{2}F_{1}(a,b;c;z) &= \frac{ab}{c} \times{}_{2}F_{1}(a+1, b+1; c+1; z) \\
  {}_2F_1(a, b; c; 1) &= \frac{\Gamma(c) \Gamma(c-a-b)}{\Gamma(c-a) \Gamma(c-b)} \\
  B(\alpha, \beta) &= \frac{\Gamma(\alpha) \Gamma(\beta)}{\Gamma(\alpha + \beta)} \\
  \Gamma(n + 1) &= n \Gamma(n)
\end{align*}
$$

#### Case $0 \le R \le 1$:  

$$
\begin{align*}
&\frac{d}{dR} \Pr(R | 0 \le R \le 1) \\
&= \frac{B(\alpha_1 + \alpha_2, \beta_2}{B(\alpha_1, \beta_1) B(\alpha_2, \beta_2)} \frac{d}{dR} \left[R^{\alpha_1 - 1} \cdot {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_1; \alpha_1 + \alpha_2 + \beta_2; R)\right] \\
&= \frac{B()}{ B() B()} \left[ (\alpha_1 - 1) R^{\alpha_1 - 2} {}_2F_1(\alpha_1 + \alpha_2, 1 - \beta_1; \alpha_1 + \alpha_2 + \beta_2; R) + R^{\alpha_1 - 1} \frac{(\alpha_1 + \alpha_2)(1 - \beta_1)}{\alpha_1 + \alpha_2 + \beta_2} {}_2F_1(\alpha_1 + \alpha_2 + 1, 2-\beta_1; \alpha_1 + \alpha_2 + \beta_2 + 1; R)\right] \\
&\xrightarrow[R \to 1^{-}]{} \frac{B()}{ B() B()} \left[\cdots &\quad\quad\quad + \cdots\right] \\
\end{align*}
$$

#### Case $1 \le R$:  

to be typeset

Those two derivative expressions being identical, we have established equality of the
derivatives at $R = 1$, so our distribution is first-order smooth.  

The higher derivatives will have to wait until I can invent a trick for doing it in finite
time.  Or until I forget the problem.  Whichever comes first.  


## Ok, what about the cumulative distribution function (CDF)?  

That gives us the PDF (probability distribution function); if we want the CDF (cumulative
distribution function) to calculate quantiles, we'll have to go beyond Pham-Gia's paper.
Now, it turns out that Julian Saffer has already worked this out, and what's more put a
library in Python on Github. <sup id="fn3a">[[3]](#fn3)</sup>  Now, I'm not so much with
the Python; I'm more of an [R](https://www.r-project.org) guy.  But let's have a look.  

Saffer relies on 2 integrals of hypergeometric functions times algebraic functions, with
results using _generalized_ hypergeometric functions ${}\_{3}F\_{2}()$&hellip; even more
fearsome than ${}\_{2}F\_{1}()$!  I don't know quite how to derive these, though I did manage to
confirm the first at Wolfram:  

<!-- ***
The first one is reported at https://functions.wolfram.com/HypergeometricFunctions/Hypergeometric2F1/21/01/02/01/0001/

The second one maybe requires a change of variables z = 1/w get the argument to 2F1() in
canonical form.
-->

!["Saffer: integral of 2F1() times power"]({{ site.baseurl }}/images/2021-09-13-beta-ratios-saffer-3F2-1.jpg "Saffer: integral of 2F1() times power")
!["Saffer: integral of 2F1() times inverse power"]({{ site.baseurl }}/images/2021-09-13-beta-ratios-saffer-3F2-2.jpg "Saffer: integral of 2F1() times inverse power")

Now, I have to admit I don't know where these integrals come from and don't feel up to
trying to derive them myself, at least not today.  Maybe another day that hasn't been
spent facing my fears&hellip;  

But I _can_ see that, given these identities, the cumulative distribution functions (the
running integral from 0 to some value of the PDF) will give us the given CDFs.  (In
Saffer's notation, what we've called $R$ he calls $w$.)  

For $0 \le w \le 1$:  

!["Saffer: CDF for 0 < w < 1"]({{ site.baseurl }}/images/2021-09-13-beta-ratios-saffer-CDF-1.jpg "Saffer: CDF for 0 < w < 1")

And for $w > 1$:  

!["Saffer: CDF for w > 1"]({{ site.baseurl }}/images/2021-09-13-beta-ratios-saffer-CDF-2.jpg "Saffer: CDF for w > 1")


## Computational realization for practical use  

<!-- ***
https://pdfs.semanticscholar.org/3866/cbf3952622134674bbca215ee1269e33ba39.pdf
https://journal.r-project.org/archive/2015/RJ-2015-022/RJ-2015-022.pdf
https://cran.r-project.org/web/packages/hypergeo/vignettes/hypergeometric.pdf
Introduces the hypergeo package in R (2015).

Also see, re numeric 3F2():
https://www.tandfonline.com/doi/abs/10.1080/10652469.2016.1231674?journalCode=gitr20
-->

At some point soon, I'd like to implement this in [R](https://www.r-project.org), perhaps
mirroring Saffer's Python implementation.  There are some gnarly issues with numerical
roundoff. Even though the hypergeometric series terminates as a polynomial for integer
$\beta$'s, one simply cannot na&iuml;vely compute a polynomial of order 15,000 for a large
clinical trial and expect to get anything other than nonsense!  

I note that Saffer sensibly computes everything in log space first, and then
exponentiates.  This does, though, run the risk of exponentiating the roundoff in a
catastrophic fashion.  Some rigorous test cases with known answers are required before
I'll trust it.  

That's work for another day.  

<!-- ***
Quantile function:
- estimate numerically with Newton's method and the CDF, as Saffer does?
-->


## The Weekend Conclusion  

<img src="{{ site.baseurl }}/images/2021-09-13-beta-ratios-weekend-publisher.jpg" width="400" height="533" alt="Weekend Publisher, mid-critique, providing purr review" title = "Weekend Publisher, mid-critique, providing purr review" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
In a spirit of proper collegiality, I wish to acknowledge warmly the assistance of the
Weekend Publisher at several points in this analysis.  He provided encouragement when I
wanted to give up.  He is shown here in mid-critique, providing valuable purr review.  

That acknowledgement having been made, we've worked our way through the relevant parts of
Pham-Gia's paper (though there's a lot more there!), and confirmed the primary result that
the PDF of the ratio of 2 independent Beta-distributed random variables is a variety of
hypergeometric function ${}\_{2}F\_{1}()$.  

Somewhat beyond Pham-Gia's paper, we've also proven the continuity of the PDF at
$R = 1$, i.e., that the expression for $0 \le R \le 1$ and the one for $R \gt 1$ match up
at $R = 1$.  

However, there are several things we _haven't_ done:  
- While we have _continuity_ at $R = 1$, we haven't proven _smoothness_.  We don't
  strictly need that, but as there's no particular reason for a kink at $R = 1$, it would
  be nice to show the derivative from the left equals the derivative from the right.
  We suspect it's more than first derivative smooth at $R = 1$, and there may be a way to
  parlay the derivative relation on ${}\_{2}F\_{1}()$ into a derivative recurrence
  relation on $\Pr(R)$ to show that to all orders, if we're ambitious.  
- We haven't confirmed all the details of how to get the CDF; there's probably some bit of
  hypergeometric lore that will tell us the integral identities above from which the CDFs
  follow straightforwardly (or as straightforwardly as things go here).  
- We also haven't wrestled with all the numeric issues of implementing this, say in 
  [R](https://www.r-project.org), though Saffer's Python code is probably a good guide.  
- Furthermore, we haven't investigated the quantile function (functional inverse of the CDF)
  which would let us read off quantiles directly.  Looking at Saffer's code, he hasn't
  either: he's using Newton's method to solve the relevant equation directly from the CDF,
  which is totally fair.  

So we've got a bit more work to do to make this useable in a practical sense.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title = "***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
-->

<a id="fn1">1</a>: T Pham-Gia, ["Distributions of the ratios of independent beta variables and applications"](https://www.tandfonline.com/doi/abs/10.1080/03610920008832632), _Comm Stat: Theory &amp; Methods_, 29:12, 2693-2715. [DOI: 10.1080/03610920008832632](https://doi.org/10.1080/03610920008832632).  Since it was so hard to get, it's archived [here]({{ site.baseurl }}/assets/2021-09-13-beta-ratios-pham-gia2000.pdf).  

__NB:__ We believe there are several errata in this paper which make it much harder to read
than need be.  We've worked through the details, and with these corrections, obtain the
same eventual result in terms of ${}\_{2}F\_{1}()$.  Specifically:  
- p. 2696, in the definition of the Pochammer coefficients: $K$ should be $\ldots$  
- p. 2698, in the equation for the marginal density $f(w)$:  
  - The upper limit of integration should be $+1$, not $+\infty$  
  - The exponent of $(1-x_2)$ should be $\beta_{2}-1$, not $\beta_{2}$  
- p. 2698, in the integral for $f(w)$ for $0 \le w \le 1$:  
  - the integration measure is missing, and should be $dx_2$  
  - in the rightmost expression, the exponent of $(1-x_2)$ should again be $\beta_{2}-1$,
    not $\beta_{2}$  
- p. 2703, in the variables for a Dirichlet distribution, $K$ should again be $\ldots$  

While there may or may not be similar typos in the rest of the paper, we haven't checked
carefully since it does not bear directly on our interests.  But with the corrigenda above,
we were able to reproduce Pham-Gia's main result, the piecewise PDF on pp. 2698-2699. [↩](#fn1a)  

<a id="fn2">2</a>: OK, the truth is that I was actually 23 years old and in my first year of physics grad school at MIT.  I got wrapped around the axle pretty tight because the notation between a couple texts was confusingly and subtly different.  I thought I'd suddenly become stupid!  It took years to get past that, and now even 40+ years later it's a sensitive spot.  Still&hellip; time to face my fears. [↩](#fn2a)  

<a id="fn3">3</a>: J Saffer, ["Beta Quotient Distribution"](https://github.com/jsaffer/beta_quotient_distribution), _GitHub Repository_, last committed 2020-Jun-06, retrieved 2021-Sep-13. [↩](#fn3a)  
