---
layout: post
title: Against Lotteries
tags: CatBlogging Investing Math SomebodyAskedMe Statistics
comments: true
commentsClosed: true
---

Years ago, [somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) (an office mate,
actually) about lottery tickets when the return was positive.  Generally, lottery tickets
are meant to lose money for you on average.  So speaking only of money, you shouldn't buy
them.  But once in a long while, they have a positive expected
return.  Should you buy one of _those?_  Still no.   


## A Lottery Ticket Model, Oversimplified  

Let's consider an oversimplified model of a lottery ticket:  
- You can buy one for price $P_0$.  
- With (very small!) probability $p$, it will pay you back $P$.  (Of course, $P \gt P_0$.)  
- With (very likely!) probability $1 - p$, it will pay you back nothing.  

That is, it's sorta like a loaded coin flip that comes up heads $p$ fraction of the time.
Stats folk call this a [Bernoulli distribution](https://en.wikipedia.org/wiki/Bernoulli_distribution), 
the simplest of all possible distributions:  
 
$$
\left\{
  \begin{align*}
    \Pr\left(\mbox{heads}\right) &= p \\
    \Pr\left(\mbox{tails}\right) &= 1 - p
  \end{align*}
\right.
$$
 
If you win, you get a net pay off of $P - P_0$; if you lose, you get $-P_0$.  Your rate of
return is then the payoff divided by $P_0$.  Let $\rho = P/P_0$, i.e., the ratio of the
jackpot to the ticket price.  Of course $\rho \gt 1$.  Then the distribution of returns $R$ is:  

$$
\Pr(R) = 
\begin{cases}
  \frac{P - P_0}{P_0} &= \rho - 1\ &\mbox{with probability}\ p \\
  -\frac{P_0}{P_0}    &= -1\       &\mbox{with probability}\ 1-p
\end{cases}
$$

That's the distribution, so let's get the mean and variance (worked out pedantically, so
this can be more of a tutorial than the way a professional would do it):  

$$
\begin{align*}
  E[R]        &= p(\rho - 1) + (1-p)(-1) \\
              &= p\rho - p - 1 + p \\
              &= p\rho - 1 \\
\\
  \sigma^2[R] &= E[(R - E[R])^2] \\
              &= p(\rho - 1 - p\rho + 1)^2 + (1-p)(-1 -p\rho + 1)^2 \\
              &= p(1-p)^2\rho^2 + p^2(1-p)\rho^2 \\
              &= p(1-p)\rho^2(1-p + p) \\
              &= p(1-p)\rho^2 \\
\\
  \sigma[R]   &= \sqrt{p(1-p)} \rho
\end{align*}
$$

(As a check on our work: we note that the Bernoulli distribution's variance is
$p(1-p)$, so our answer for $\sigma^2$ should be just a scaled version of that, which is
what we have.)  

Armed with $E[R]$, we can determine when the expected payoff is positive:  

$$ 
E[R] \gt 0 \Rightarrow p \gt 1/\rho\ \mbox{or}\ p \gt P_0/P
$$

So if you know the price $P_0$, the payoff $P$, and the probability of winning $p$ is
larger than that, then the expected return is positive.  

Should you buy a lottery ticket when that happens?  


## Return and Risk  

Still no.

Consider the standard deviation above.  This gives you an idea of how much the returns
will vary, i.e., it warns you that even with a positive expectation you still have to buy
an enormous number of tickets to win.

Let's make that more quantitative.  

In the investment world, there's always a way to compare a potential investment against a
safe investment.  The safe investment has $\sigma = 0$, i.e., no risk whatsoever.  Hence
its return $R_0$ is small, but still safe.  
- An example might be a US Treasury Bill, which pays you back your purchase price plus a
  small premium after 3, 6, 9, or 12 months.  
- For longer periods you might consider TIPS Strips, which take inflation-protected
  Treasury bonds and convert them into a zero-coupon derivative: after a few years, you
  get back your inflation-corrected purchase price plus some inflation-corrected
  interest.  

We'd like to know for an investment with expected return $E[R]$ and risk $\sigma[R]$
whether the extra return is worth the extra risk.  

For this, there's something called the [Sharpe Ratio](https://en.wikipedia.org/wiki/Sharpe_ratio):  

$$
\begin{align*}
  S &= \frac{E[R] - R_0}{\sigma[R]} \\
    &= \frac{p\rho - 1 - R_0}{\sqrt{p(1-p)} \rho}
\end{align*}
$$

- The numerator tells us how much _more_ return we're getting over the safe alternative.
  Needless to say, if this is negative you should walk away.  You're getting risk that you
  could completely avoid by using the safe investment, and make more money as well!  
- The denominator is the measure of risk, i.e., the standard deviation in the return.
- We'd like the return to be high and the standard deviation to be low, so the ratio
  compares them.  
  - Since numerator and denominator are in the same units, the ratio is dimensionless.  
  - A positive Sharpe ratio means we're getting more return than the safe investment.  
  - A large positive Sharpe ratio tells us how _much_ extra return we're getting
    _per unit of risk being taken._

So there are 3 hurdles to clear before we should consider a lottery ticket investment:  
1. As above, is the expected return positive?  If not, walk away.  
2. Is the expected return above the safe alternative (say, a 3 month T-bill)?  If not, walk
   away.  
3. Is the Sharpe ratio significantly higher than we could get (say, a portfolio of index
    funds 40% in world bonds [BNDW](https://investor.vanguard.com/investment-products/etfs/profile/bndw),
    5% in world real estate [REET](https://www.ishares.com/us/products/268752/ishares-global-reit-etf),
    and 55% in world stocks [VT](https://investor.vanguard.com/investment-products/etfs/profile/vt))?
    If not, walk away.  

Let's examine a concrete example.  We're going to look at the 
[Massachusetts Mega-Millions lottery](https://www.masslottery.com/games/draw-and-instants/mega-millions),
chosen more for convenience and our Massachusetts chauvinism, than anything else.
We'll assume the jackpot is never shared, i.e., there is always 1 winner (not actually the
case).  Furthermore, we'll simplify it down to just the maximum jackpot, ignoring all the
smaller returns.  (Those are present mostly to tease you into thinking you're making
progress, not to be an actual reward.  They complicate the analysis, without being
illuminating.  Games, like investments, that are made complicated by the seller are not
made complicated to be in your favor!)  

Their web site as of 2024-Dec-14 gives us the following parameters:  
- The cost of a ticket is \$2.  
- The current estimated jackpot is "approximately" \$740 million.  
- The chance of winning is 1 in 302,575,350.  

$$
\left\{
  \begin{align*}
    P_0 &= 2 \\
    P   &= 7.4 \times 10^{+8} \\
    p   &= \frac{1}{302{,}575{,}350} = 3.3 \times 10^{-9}
  \end{align*}
\right.
$$

Hence: 

$$
\left\{
  \begin{align*}
    \rho &= P/P0 = 7.4 \times 10^{+8} / 2 = 3.7 \times 10^{+8} \\
\\
    E[R] &= p\rho - 1 \\
         &= 3.7 \times 10^{+8} \cdot 3.3 \times 10^{-9} - 1 \\
         &= 0.221
  \end{align*}
\right.
$$

Interesting!  This is positive, so we pass hurdle 1.  Each lottery ticket looks like it
has the lofty return of 22%!  

It also passes hurdle 2, since 
[the Treasury reports that on 2024-Dec-13](https://home.treasury.gov/resource-center/data-chart-center/interest-rates/TextView?type=daily_treasury_bill_rates&field_tdr_date_value=2024)
the coupon-equivalent yield on a 1-year Treasury was: 

$$
R_0 = 0.0424
$$

Since our lottery ticket's $E[R]$ comfortably exceeds that, we can consider it further as
it will have a positive numerator in the Sharpe Ratio.  

But what's the Sharpe Ratio of this lottery ticket?  We need the standard deviation to
calculate that:  

$$
\left\{
  \begin{align*}
    \sigma[R] &= \sqrt{p(1-p)} \rho \\
              &= \sqrt{3.3 \times 10^{-9} \cdot (1 - 3.3 \times 10^{-9})} \cdot 3.7 \times 10^{+8} \\
              &= 21{,}254.88 \\
\\
    S         &= (0.221 - 0.0481) / 21254.88 \\
              &= 8.1 \times 10^{-6}
  \end{align*}
\right.
$$

This is tiny!  In it's offering you a few parts per million of "extra" return in exchange
for each additional percent of risk, which is absurd.  The source of the absurdly small
$S$ here is the ginormous standard deviation $\sigma$.  (Also, if we were to take a more careful
approach and estimate error bars on $S$, it would be statistically indistinguishable from
0 or even negative values.)  

<img src="{{ site.baseurl }}/images/2024-12-14-against-lotteries-portfolio.jpg" width="400" height="200" alt="A simple, conservative ETF portfolio of world bonds, world real estate, and world stocks" title="A simple, conservative ETF portfolio of world bonds, world real estate, and world stocks" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
For comparison purposes, let's consider the portfolio of world bonds, world real estate,
and world stock alluded to above.  Using
[Portfolio Visualizer](https://www.portfoliovisualizer.com/optimize-portfolio?s=y&sl=3ev9z1khD9aPOfLgw4ayF8),
I am reliably informed that using 2023-2024 data the Sharpe ratio is:  

$$
S = 0.93
$$

Now, to be sure, it was a pretty good year!  But it's almost _a million times better_ than
the lottery ticket, in terms of return over the safe asset per unit of risk taken!  

The lottery ticket is a terrible, terrible choice.  The alternatives are easily
available.  You can much more sensibly invest, as shown here, in human economic activity
of all sorts, all over the world.  


## Paths Not Taken  

Of course, there are many other risk-adjusted return metrics with which to evaluate
investment opportunities: using
[Sharpe ratio with downside risk only (semi-variance)](https://en.wikipedia.org/wiki/Downside_risk), the
[Treynor Ratio (comparison to stock market risk $\beta$)](https://en.wikipedia.org/wiki/Treynor_ratio),
the
[Modigliani risk-adjusted measure (leverage/cash dilution to match the market)](https://en.wikipedia.org/wiki/Modigliani_risk-adjusted_performance),
the [Sortino ratio (with respect to a  hurdle rate, or required return, and using semi-variance)](https://en.wikipedia.org/wiki/Sortino_ratio), 
and many others.  Also, there are many other approaches which do not use mean and standard
deviation, but either use a non-normal distribution, or are parametric in nature, or take
a totally different Bayesian approach.  

We've used all of those at one time or another, but here chose the Sharpe ratio because we
understand what it means, it is widely used, and readily interpretable.  


## The Weekend Conclusion  

We have derived a formula for the Sharpe ratio (extra return per unit risk taken) for a
lottery ticket.  With ticket price $P_0$, payoff $P$, probability of winning the payoff
$p$, and safe return of something like a short term Treasury $R_0$:  

$$
\left\{
  \begin{align*}
    \rho &= P/P_0 \\
    S    &= \frac{p\rho - 1 - R_0}{\sqrt{p(1-p)} \rho}
  \end{align*}
\right.
$$

__The economic argument__ against lottery tickets is 3-fold:  
- The expected return is almost always negative.  
- When the expected return is positive, it is still often less than safe investments.  
- When the expected return exceeds safe investments, the Sharpe ratio is _miserable_
  compared to easily assembled investment portfolios.  That is, you're getting offered
  miserably small amounts of profit for taking enormous risks.  

__The moral argument__ against lottery tickets is less mathematical, bu also compelling:  
- I believe we have a moral duty serve society, making the world better for our presence
  in it.  This is true even if the task seems hopelessly daunting:  

  > It is not your duty to finish the work, but neither are you at liberty to neglect
  > it&hellip; &ndash;  [Pirkei Avot 2:16](https://www.sefaria.org/Pirkei_Avot.2.16?ven=Mishnah_Yomit_by_Dr._Joshua_Kulp&vhe=Torat_Emet_357&lang=bi&with=all&lang2=en) (Talmud).  

  Lotteries do _not_ do this.  Investing in the general welfare of all humanity does do
  this.  One way is by choices of a good occupation, a good spiritual life, and a good
  community &amp; family life.  Another is by investing in the progress of all humanity, as the
  portfolio above.   

<a href="{{ site.baseurl }}/images/2024-12-14-against-lotteries-publishers.jpg"><img src="{{ site.baseurl }}/images/2024-12-14-against-lotteries-publishers-thumb.jpg" width="400" height="533" alt="The Weekend Publisher (R) and the Assistant Weekend Publisher (L) agree: ignore lottery tickers for more interesting opportunities." title="The Weekend Publisher (R) and the Assistant Weekend Publisher (L) agree: ignore lottery tickers for more interesting opportunities." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- We must not attempt to gain simply by _taking_ value from others, allegedly by being smarter
  in a gambling "game". That's using your intellectual stiletto to cut the wallet out of
  others clothes, steal their money, leave them nothing. 

  You've hoisted the Jolly Roger, and thereby declared your intent for piracy.  Don't be surprised
  when I show you the disrespect this decision merits.  When you eventually go broke, I
  will be minimally sympathetic ("without some scot of penitential tears", approximately
  quoting
  [Beatrice's final requirement of Dante in _Il Purgatorio,_ Canto XXX, LL 144-145](https://archive.org/stream/DivineComedyVol.IIPurgatoryTheDanteAlighieriMarkMusa/Divine%20Comedy%2C%20Vol.%20II_%20Purgatory%2C%20The%20-%20Dante%20Alighieri%20%26%20Mark%20Musa_djvu.txt#:~:text=without%20having%20to%20pay%20at%20least%20some%20scot%20144%20%0A%0Aof%20penitence%20poured%20forth%20in%20guilty%20tears.);
  of course repentance earns great credibility and forgiveness).  

The Weekend Publisher and the Assistant Weekend Publisher, shown here, agree.  There are
far more profitable &amp; interesting things in life than lottery tickets!  

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

Nope.  
