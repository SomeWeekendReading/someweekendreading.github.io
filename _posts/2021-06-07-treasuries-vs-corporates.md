---
layout: post
title: Stock Diversifiers&colon; Treasury vs Corporate Bonds?
tags: Investing MathInTheNews Retirement R Statistics
comments: true
---

If you invest in US stocks, you certainly want to diversify with some bonds for risk
control, availability of funds for rebalancing, and earning some income.  Should you use
Treasury bonds (which earn approximately nothing, but are safe) or corporate bonds
(which earn _something_, but are riskier)?  


## Why bonds at all?  

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-harvey-asset-class-returns.gif" width="340" height="295" alt="Campbell Harvey @ Duke: historical asset class returns (log scale)" title="Campbell Harvey @ Duke: historical asset class returns (log scale)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
There's a well-known plot that gets shown to beginning investors, to induce thought about
the long term, and to overcome reluctance to invest in stocks.  Here's a version from a
[web site of Prof. Campbell Harvey, of Duke](https://people.duke.edu/~charvey/classes/ba350/history/history.htm).
Note the vertical log scale: from 1926 - 1995,
stocks returned _hundreds of times more_ than bonds.  Today, the case for stocks sounds even
more convincing, since bond yields are so low following the 2007 - 2008 financial crisis.
(And really: negative in real terms, after inflation.)  

So why have _any bonds at all?_  

The answer is 3 things: risk control, rebalancing, and maybe a little income.  Yes, a lot of
stock will raise the mean value of your portfolio.  But it will also increase the
probability you go broke!  All it takes is one bad recession, combined with job loss or a
medical problem (under the cruel US healthcare system), and you suddenly find yourself
50ish, sick, and broke.  

If you have some bonds, then you can (a) preserve some capital from the cruel market
standard deviation (risk control), (b) have some bonds to sell into a decline to maintain
a constant stock/bond ratio (rebalancing), and (c) maybe get some interest paied for your
trouble.  

So that's my model: those 3 factors, _in that order,_ motivate me to hold a 60/40 portfolio
(60% stocks from all over the world and 40% bonds).  


## Ok, but can I at least pick some high-return bonds?  

People who invest in a lot of stock index funds often look at bond index funds somewhat
grudgingly.  They figure they're giving up a lot of return, so want to demand that the
bonds pay their way.  Treasury bond rates are so low, they sort of want to load up on
corporate bonds instead.  

Our research question for today is whether that's a good idea.  

Given that I primarily want bonds for risk control and rebalancing, basically diversifying
away some of the risk of the stock market, I'm guessing that the answer is no.  If you
want more return, adjust your asset allocation to include more stock: take your risks on
the stock side, not the bond side.  

That's my _intuition_, but what do the data say?  


## Available data  

[Bogleheads.org](https://www.bogleheads.org) is a web site/discussion group for followers
of [John Bogle](https://en.wikipedia.org/wiki/John_C._Bogle), the founder of 
[Vanguard](https://en.wikipedia.org/wiki/The_Vanguard_Group) and the first to make 
[index funds](https://en.wikipedia.org/wiki/Index_fund) a reality for ordinary investors.  

They've done a great deal of work assembling data the historical returns of a wide variety
of asset classes.  <sup id="fn1a">[[1]](#fn1)</sup>  What's more, they've extended the
index fund returns into the past using historical indices, and corrected them to account
for index fund expense levels.  So they look just like something you could actually buy as
an investment.

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-simba-data.jpg" width="400" height="243" alt="Bogleheads historical returns: nominal &amp; real for stocks, intermediate treasuries &amp; corporates" title="Bogleheads historical returns: nominal &amp; real for stocks, intermediate treasuries &amp; corporates" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
We snapshotted that data for analysis with an 
[R script](https://www.r-project.org). <sup id="fn2a">[[2]](#fn2)</sup>  The resulting
dataset contains returns from 1871 - 2020, for the total stock market (TSM), intermediate
term treasuries (ITT), and intermediate term corporates (ITC) on both nominal and real
(adjusted for inflation) terms. <sup id="fn3a">[[3]](#fn3)</sup>


## Pre-specified tests  

Like good little statisticians, we should pre-specify the analyses we're going to do, what
they mean, and what it would take for them to come up positive and answer the question.
(And, though the dataset contains both nominal and real returns, only the
latter really matter.  So we'll focus on real returns only.)  Our pre-specified
statistical tests are:  

1. __Correlations:__  We'll measure the 
[Pearson correlation](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient)
of stock returns vs corporate bond returns, and between stock returns vs Treasury
returns.  We expect that the Treasury correlation with stocks should be lower, and hence a
slightly better diversifier, because corporate bonds contain some corporate stock-like
risk.  We'll assess the statistical significance of any such difference by taking the
[Fisher $Z$ transform](https://en.wikipedia.org/wiki/Fisher_transformation) of the
difference in correlations, and getting a 1-tailed $p$-value from the normal CDF.  If $p \le 0.05$,
we'll buy the alternative hypothesis that Treasuries are better.  Otherwise, we will accep
the null hypothesis of no such evidence.  
2. __Scatterplots:__ We'll also scatterplot the ITC return vs ITT and TSM in 3 dimensions,
and see if the visible structure reflects what we conclude from the correlations.  This is
visual, not quantitative.  
3. __Regressions:__ We'll also perform some linear regressions of ITC on ITT and TSM.
First we'll do LASSO-regulated regression with [`glmnet()`](https://glmnet.stanford.edu/) to
see if use of both ITT and ITC as predictors is justified.  If so, we'll compare the
regression model obtained there with a more ordinary least squares model, in terms of
coefficient sizes.  In order to believe that the model is signficant, we'll demand (a)
that `glmnet()` not reject either ITT or ITC, (b) that the overall $F$-statistic of the
regression be significant, and (c) that the $t$-statistic for the TSM term be significant,
indicating that it's really contributing something.  
4. __Starting point sensitivity:__ We'll repeat this analysis for more recent data, e.g.,
1980 - 2020, since the US economy a century ago was very different.  Also, we'll assess
whether the $p$-values change with a start date from 1970 - 1990, going up to 2020.  That
will tell us if any recent changes in the behavior of bonds have figured in the result.  

If all of that checks out, then we'll believe that corporate bonds are a bit like
corporate stocks, and hence are not the best tool to diversify away stock risk.  


## Analyses  

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-correlation-chart-Real.png" width="500" height="500" alt="Pearson correlation of real returns: stocks, treasuries, and corporates 1871 - 2020" title="Pearson correlation of real returns: stocks, treasuries, and corporates 1871 - 2020" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Here's what the correlations among these 3 variables look like:
- First, note on the center right and center bottom that intermediate-term Treasuries
  (ITT) and intermediate-term corporates (ITC) are very, very highly correlated.  They're
  both bonds, so that makes sense.  
- Second, note on the center left and bottom left the scatterplots of total stock market
  (TSM) vs ITT and ITC.  Both show very little relationship, which is exactly what we
  want: a good diversifier with stocks will be not very correlated with stocks.  
- Third, note at the top center and top right that the correlations of ITT with TSM and
  ITC with TSM are 0.16 and 0.28, respectively.  These are fairly small as these things
  go, which is just reinforcing what we saw in the scatterplots.  

Finally, let's assess the significance of 0.28 vs 0.16 with a Fisher $Z$ transform.
Transform each correlation $R_i$ by:  

$$
Z_i = \frac{1}{2} \left(\frac{1 + R_i}{1 - R_i}\right)
$$

Then we compute an overall $Z$ score by:  

$$
Z = \left|Z_1 - Z_2\right| \sqrt{\frac{N - 3}{2}}
$$

That gets us a $p$-value via the normal CDF.  (This is the method used by the function
[`paired.r()`](https://www.rdocumentation.org/packages/psych/versions/2.1.3/topics/paired.r)
in the [`psych` library](https://cran.r-project.org/web/packages/psych/index.html)
in [R](https://www.r-project.org).)  

This gives us $Z = 1.09$ and $p = 0.28$.  So this difference is _not_ statistically
significant.  (Came as a surprise to me!  But&hellip; that's how you learn things.)  

Next is the 3d scatterplot.  (My animated graphic software is a bit wounded right now, so
this is a kludge for which I apologize.)  You can pretty well see that ITT and ITC real
returns are highly correlated (lying in a plane), but that neither is much correlated with
TSM.  This confirms the result above.  

![3d animated scatterplot: real return of stocks, treasuries, corporates 1871 - 2020]({{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-scatterplot-3d-Real.gif "3d animated scatterplot: real return of stocks, treasuries, corporates 1871 - 2020")

The last analysis here is to do a regression model:  

$$
\mathrm{ITC.Real} = \beta_0 + \beta_1 \times \mathrm{ITT.Real} + \beta_2 \times \mathrm{TSM.Real}
$$

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-cv-lasso-regression-Real.png" width="400" height="400" alt="LASSO regularization: how many parameters to use to predict real return of corporates 1871 - 2020?" title="LASSO regularization: how many parameters to use to predict real return of corporates 1871 - 2020?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Now, first we use [`glmnet()`](https://glmnet.stanford.edu/) to do a LASSO-regularized
regression.  This imposes an $L^1$ penalty parameter $\lambda$ which, the larger it gets,
the more varibles it suppresses and insists on a simpler model.  Here we start with 2
predictor variables (ITT.Real and TSM.Real).  We want to know if we really need them both
or if we can dispense with one or the other.  

In the plot, we see values of $\log(\lambda)$ along the horizontal axis, and the
mean-squared error of the resulting model under 3-fold crossvalidation on the vertical
axis.  Along the top of the plot is the number of predictors retained (mostly 2, then
eventually 1).  The moral here is that the very best predictor (vertical dotted line at
the left) uses both ITT.Real and TSM.Real.  In fact, the simplest model that is within 1
standard error of this MSE (vertical dotted line at the right) _still_ does that.
Basically, `glmnet()` is telling us that it would be a gross mistake not to use both ITT.Real
and TSM.real to predict ITC.real.  

The coefficients used in both of those `glmnet()` models are similar to the simple linear
regresson model we get with `lm()`:  

```
Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.17198    0.29205  -0.589    0.557    
ITT.Real     0.94562    0.03109  30.419  < 2e-16 ***
TSM.Real     0.06585    0.01437   4.584 9.68e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.14 on 147 degrees of freedom
Multiple R-squared:  0.8736,	Adjusted R-squared:  0.8719 
F-statistic: 507.9 on 2 and 147 DF,  p-value: < 2.2e-16
```

This says the regression's $F$-statistic $p$-value is insanely significant, as is the
$t$-statistic for $\beta_2$ on TSM.Real, at $9.68 \times 10^{-6}$.  

Of the pre-specified tests above, we've passed all _except_ the demand that the
correlations of ITT and ITC with TSM be statistically significantly different.  That
suggests this test is more stringent than the others, or that there is an artifact of the
time window chosen (1871 - 2020) that is suppressing significance here.  Let's investigate
that next.  


## Analyses using just recent data  

In the [Bogleheads Discussion Group](https://www.bogleheads.org), there is a gentleman
using the cognomen of 'Nisiprius'.  Whenever anyone makes a claim about investing data
from a particular time series, he wanders by to challenge the endpoints.  "Does your
conclusion hold if you wiggle the endpoints a couple years either way?  How about if you
take rolling 20-year periods, does it hold all the time then?"  He's _always right to do
this._  So let's get out ahead of him.  

The thing about looking back to 1871 is that you are not only constructing artificial data
based on questionable indices, but you're also looking at a very different world in the
US.  There was no Federal Reserve.  Thre was no Securities &amp; Exchange Commission, and
indeed no meaningful regulation or enforcement of law in securities trading.  There was a
gold standard for the dollar.  There was no anti-monopoly law (though, to be sure, there's
very little left of that now).  It was, to use a phrase popular with Americans, "the Wild
West".  

So maybe data that far back is from a different financial universe.  Let's just consider
the data from, say, 1980 - 2020 as representative of the modern financial universe.  (And
yes, Nisiprius, we will consider alternatives even to _that_, below.)

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-correlation-chart-Real-1980-2020.png" width="500" height="500" alt="Pearson correlation of real returns: stocks, treasuries, and corporates 1980 - 2020" title="Pearson correlation of real returns: stocks, treasuries, and corporates 1980 - 2020" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- We see that ITT and ITC are still correlated with each other.  Unsurprising, they're
  still both bonds.  
- But we see a surprising difference: the correlation of Treasuries with stocks is -0.01, while
  corporate bonds have a correlation of +0.39!  Repeating the Fisher $Z$-transform
  analysis of above, this gives $Z = 1.83$ with a $p = 0.068$.  Now&hellip; that's not
  _quite_ $p \le 0.05$&hellip; but its' getting right close!  
  
Clearly, something is different in the modern era that makes corporate bonds more
correlated with stocks than Treasuries, or at least more so than formerly.  

The scatterplot is, as above, more difficult to interpret.  Clearly ITT and ITC are
correlated (nearly in a plane together), but the degree of relationship to TSM is hard to
assess.  This is why we prefer quantitative statistics to visual judgements.  

![3d animated scatterplot: real return of stocks, treasuries, corporates 1980 - 2020]({{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-scatterplot-3d-Real-1980-2020.gif "3d animated scatterplot: real return of stocks, treasuries, corporates 1980 - 2020")

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-cv-lasso-regression-Real-1980-2020.png" width="400" height="400" alt="LASSO regularization: how many parameters to use to predict real return of corporates 1980 - 2020?" title="LASSO regularization: how many parameters to use to predict real return of corporates 1980 - 2020?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The `glmnet()` LASSO regulated regressions show the same kind of result as above: both ITT
and TSM are essential for predicting ITC.  Corporate bonds still have some stock-like
aspects.  The very best predictor model (the dashed vertical line at the left) uses both
ITT and TSM as predictors.  The simplest model that is within 1 standard error of the MSE
of the best model (the dashed vertical line at the right) also uses the same 2 variables.
Note that the $\lambda$ parameter, which imposes the $L^1$ penalty, is _3 orders of
magnitude higher_, i.e., we're putting 1000x times more pressure on the model to give up a
parameter, but it refuses.  It really, really believes that corporate bonds have
stock-like risk characteristics!  

But consider also what happens to the regression coefficients in modernity vs the whole time
series:  
```
Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.12055    0.94350  -0.128    0.899    
ITT.Real     0.80151    0.09057   8.850 9.09e-11 ***
TSM.Real     0.21179    0.04582   4.622 4.29e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.636 on 38 degrees of freedom
Multiple R-squared:  0.7223,	Adjusted R-squared:  0.7077 
F-statistic: 49.41 on 2 and 38 DF,  p-value: 2.682e-11
```

Note that the regression overall is still significant, as is the coefficient for TSM.  But check
out the effect size: the regression coefficient is a bit over _3 times larger_ for this
time period than over the whole time series.  

Clearly something is different in modernity, and _it favors diversifying stocks with
Treasuries, not corporates!_  

## Sensitivity to start date  

In one final salute to Nisiprius, let's keep the end year fixed at 2020, but let the start
year range from 1970 - 1990.  For each of those intervals, we'll compute the $p$-value of
the Fisher $Z$-transformed _difference_ in correlation between (TSM, ITT) and (TSM, ITC).
Our hypothesis is that _something_ is causing those 2 correlations to be driven further
apart so that today Treasuries are the appropriate sort of bond to hold to diversify
stocks.  

Here's what it looks like:  

<img src="{{ site.baseurl }}/images/2021-06-07-treasuries-vs-corporates-start-year-dependency.png" width="400" height="400" alt="Treasury/Corporate real return correlation difference: dependency on start year" title="Treasury/Corporate real return correlation difference: dependency on start year" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- In the early 1970's, it's about 5%.  If we had accidentally chosen those years as a
  starting point, we'd be tempted to claim statistical significance: Treasuries were less
  correlted with stocks than corporates.  (And then Nisiprius would have come by to let
  the air out of our tires, which would have been a valuable service.)  
- In 1976 - 1980, something reversed that: corporates and Treasuries were still
  differently correlated to stocks, but the statistical significance waned a bit.  No idea
  why, but the high inflation of those years seems a suspect.  
- In 1980 - 1990, the effect reversed.  (This is about the time Volker raised interest
  rates to the moon and broke the back fo systematic inflation in the US.  Recall, though,
  that these are _real_, post-inflation returns.)  Choosing any time after about 1983 is a
  slam-dunk: the data through 2020 clearly indicate that Treasuries are a better
  diversifier than corporates.  
  

## The Weekend Conclusion  

Well&hellip; what a long strange trip it's been!  

- We looked at data on return from a total stock market index fund, an interdiate-term
  Treasury bond index fund, and an intermediate-term corporate bond index fund.  
- Using the (largely synthetic) data going back to 1871, we found that the evidence was
  _mostly_ statistically significant pointing to Treasuries as a better stock
  diversifier.  The exception was the difference in correlations wit corporates.  
- Looking at more modern eras, we saw that things had changed: _everythign_ was
  statistically significant in saying Treasuries were the better stock diversifier.  
- The regressions support a model saying intermediate corporates are a bit like a Treasury
  bond with a small slice of the stock market.  _You cannot diversify stock market risk
  with more stock market risk._
  
So our 60/40 portfolio is 40% bonds, divided equally among:  
- [VSBSX](https://investor.vanguard.com/mutual-funds/profile/VSBSX), the Vanguard
  short-term Treasury index fund,
- [VSIGX](https://investor.vanguard.com/mutual-funds/profile/VSIGX), the Vanguard
  intermeidate-term Treasury index fund,
- [VTAPX](https://investor.vanguard.com/mutual-funds/profile/VTAPX), the Vanguard
  short-term TIPS fund, and
- [VTABX](https://investor.vanguard.com/mutual-funds/profile/VTABX), the Vanguard
  international bond index fund.  (This is mostly government bonds of developed nations.
  It hedges currency back to the dollar, so it looks a lot like Treasuries.  The best
  evidence for it Vanguard could present said it might not help much, but it at least
  wouldn't hurt.  I decided to take their advice.)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Bogleheads community, ["Simba backtesting spreadsheet"](https://www.bogleheads.org/wiki/Simba%27s_backtesting_spreadsheet), [_Bogleheads.org_](https://www.bogleheads.org), data snapshot 2021-Jun-01.[↩](#fn1a)  


<a id="fn2">2</a>: Weekend Editor, ["Corporate vs Treasury analysis script in R"]({{ site.baseurl }}/assets/2021-06-07-treasuries-vs-corporates-corporates-vs-treasuries.r), [_Some Weekend Reading_ blog]({{ site.baseurl }}), 2021-Jun-07.  There is also available, for peer review, [a transcript of running the analysis]( {{ site.baseurl }}/assets/2021-06-07-treasuries-vs-corporates-corporates-vs-treasuries-transcript.txt).[↩](#fn2a)  

<a id="fn3">3</a>: Weekend Editor, ["US Stock, Treasury, and Corporate Bond Returns 1871 - 2020"]({{ site.baseurl }}/assets/2021-06-07-treasuries-vs-corporates-tsm-itt-itc-data.tsv), [_Some Weekend Reading_ blog]({{ site.baseurl }}), 2021-Jun-07.  Note that this contains both nominal and real returns.  Since real returns are what really matters, we haven't made much use of the nominal returns here. [↩](#fn3a)  
