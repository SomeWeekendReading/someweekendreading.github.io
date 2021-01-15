---
layout: post
title: COVID-19 loves Republican politicians
tags: COVID MathInTheNews Politics R
comments: true
---

__DRAFT__ Suppose you had 2 groups of politicians, but one of them thought a pandemic was "fake
news", refused to wear masks, congregated indoors with no social distancing, blocked
public health spending, _mocking_ public health guidance, _proud_ of their ignorance, and
were general jerks about the subject.  Do you think they'd get infected with a disease
more often?  

Well, _I_ would certainly think so!  But is there any data to guide us in that opinion?  


## Some initial hints  

<img src="{{ site.baseurl }}/images/2021-01-14-covid-loves-republicans-usa-today.jpg" width="400" height="369" alt="USA Today: COVID hits Republicans harder" title="USA Today: COVID hits Republicans harder" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
_USA Today_ ran an article last 
December <sup id="fn1a">[[1]](#fn1)</sup> making a partial case, looking at the President,
Congress, and some haphazard sampling of state-level officials.  

I didn't want to write about it, because it was clear that their statistical sampling was
not so good.  They only looked at the state-level data where it was easily available,
apparently with not terribly much attempt to ferret out the rest.  This introduces all
sorts of biases, e.g., the states that are most transparent with their data might be most
likely to be blue states.  So, let's not fall for the 
[availability heuristic](https://en.wikipedia.org/wiki/Availability_heuristic),
[confirmation bias](https://en.wikipedia.org/wiki/Confirmation_bias), or
the [representativeness heuristic](https://en.wikipedia.org/wiki/Representativeness_heuristic).  

Instead, let's look at it as preliminary, 
[anecdotal evidence](https://en.wikipedia.org/wiki/Anecdotal_evidence).  Even so, the
anecdotes are terrifying:  

>Republicans' refusal to adhere to safety measures puts not only the elected officials themselves at risk, but also the public, health experts told USA TODAY. Those who hold office set the example of expected behavior. And it starts, they said, with the commander in chief.  
>  
>"We’re incredibly frustrated, angry, sad and despondent," said epidemiologist Eric Feigl-Ding, a senior fellow at the Federation of American Scientists.  He likens it to Trump piloting a plane on a trajectory to crash with 330 million Americans aboard.  
>  
>"Epidemiologists who know how to steer this plane are pounding on the cockpit door begging him to please listen, please follow the evidence," Feigl-Ding said. "It’s a living nightmare."  

Yup.  Checks out.  

<img src="{{ site.baseurl }}/images/2021-01-14-covid-loves-republicans-usa-today-2.jpg" width="400" height="256" alt="USA Today: COVID transmission @ 2020-Sep-26 Rose Garden ceremony for now-Justice Barrett" title="USA Today: COVID transmission @ 2020-Sep-26 Rose Garden ceremony for now-Justice Barrett" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
And it's not hard to see why epidemiologists feel this way.  Consider this photo of the
2020-Sep-26 Rose Garden ceremony when Trump nominated Barrett to the US Supreme Court
(_another_ stone in my sandal!).  _USA Today_ has colorized the photo to indicate the people
not wearing masks, and circled those later testing positive for COVID-19.  

I mean, _look_ at these fools!  Almost no masks.  Almost no social distancing.  Madly
spreading the virus betwixt each other, placing their own lives in danger as well as the
lives of their families.  It's just _brutally_ stupid, and they're _proud_ of it.  That's
the Republican brand, gradually since Reagan: brutal, stupid, and proud.  


## Got any better data?  

<img src="{{ site.baseurl }}/images/2021-01-14-covid-loves-republicans-nyt.jpg" width="400" height="301" alt="NYT: COVID hits congressional Republicans harder" title="NYT: COVID hits congressional Republicans harder" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
As it turns out, the _New York Times_ just published an article by 
John Keefe <sup id="fn2a">[[2]](#fn2)</sup> which provides us with some better data, at
least sampling-wise.  They looked at Congress, so that's 535 data points, and they got all
of them.  (With a few nits about non-voting delegates/commissioners, because Nothing is
Ever Simple.)  

The nice thing here is that the defined their sample population _before_ analyzing the
data (as opposed to the _USA Today_ which just took partial data and pretended it was
complete or a random sample).  

<img src="{{ site.baseurl }}/images/2021-01-14-covid-loves-republicans-nyt-2.jpg" width="400" height="217" alt="NYT: COVID infections in Congress" title="NYT: COVID infections in Congress" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
So&hellip; whadda we got here?  

For each chamber, they report:  

|  __Senate__  | __Healthy__ || __Infected__ |
|:------------:|:-----------:||-------------:|
| _Republicans_  |   43        ||   8          |
| _Democrats_    |   46        ||   2          |


|  __House__   | __Healthy__ || __Infected__ |
|:------------:|:-----------:||-------------:|
| _Republicans_  |   177       ||   36         |
| _Democrats_    |   211       ||   15         |

There are a couple anomalies here:  
- The total number of Senators tracked here is 99, instead of 100.  
- The total number of Representatives tracked here is 439, instead of 435.  The _NYT_
  article mentions that totals "include five delegats and one resident commissioner".
  That's 6 extras, whereas we have only 4 extras, so the explanation isn't exact.  But it
  acknowledges that we shouldn't hit _exactly_ 435.  
  
Little nits like this are how you know the data is real, sadly enough.  


## Analysis  

If we combine both houses, we can make a contingency table of party x infection status
(using [R](https://www.r-project.org/), as is the custom of my tribe):  

```R
> nRepub <- 51 + 213; nRepubInfected <- 8 + 36
> nDemo  <- 48 + 226; nDemoInfected <- 2 + 15
> mx <- matrix(c(nRepub - nRepubInfected, nRepubInfected, nDemo - nDemoInfected, nDemoInfected), nrow = 2, byrow = TRUE, dimnames = list(c("Republicans", "Democrats"), c("Healthy", "Infected"))); mx
```
```
            Healthy Infected
Republicans     220       44
Democrats       257       17
```

[Fisher's exact test](https://en.wikipedia.org/wiki/Fisher%27s_exact_test) (devised,
according to legend, for the problem of 
[The Lady Tasting Tea](https://en.wikipedia.org/wiki/Lady_tasting_tea)) is sort of the canonical way
to ask if the row &amp; column proportions in a contingency table are really different.  A small
_p_-value means there's very little chance the differences are random, and that the effect
is real.  Here $p \sim 10^{-4}$, so it's significant:  
```R
> fisher.test(mx)
```
```
	Fisher's Exact Test for Count Data

data:  mx
p-value = 0.0001251
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 0.1723310 0.6117566
sample estimates:
odds ratio 
 0.3313971 
```

Another way to test this is using a [test of proportion](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/prop.test). It
tests just what we want to know: whether getting infections are more likely among
Republicans than Democrats (i.e., the null hypothesis is that they're the same). 
Here again, a tiny $p \sim 2 \times 10^{-4}$ tells us the effect is real:  

```R
> prop.test(mx)
```
```
	2-sample test for equality of proportions with continuity correction

data:  mx
X-squared = 13.618, df = 1, p-value = 0.0002241
alternative hypothesis: two.sided
95 percent confidence interval:
 -0.16160372 -0.04764203
sample estimates:
   prop 1    prop 2 
0.8333333 0.9379562 
```

Finally, Keefe's article notes that the background against which this should be compared
is the national average of the COVID-19 infection rate, estimated at 6.5%.  The infection
rates in each party can be calculated pretty straightforwardly:  
```R
> transform(mx, Prop = round(100.0 * Infected / (Healthy + Infected), digits = 1))
```
```
            Healthy Infected Prop
Republicans     220       44 16.7
Democrats       257       17  6.2
```

So the Democrats are infected at a rate of about 6.2%, well in line with the national
average of 6.5%.  But the Republicans clock in at 16.7%, which is just disease-ridden!  

But we might argue that the samples aren't large enough to be certain of those
proportions, and we should get some uncertainty measures to see if 16.7% of Republicans is
_really_ greater than 6.5% of all Americans.  

For that, we do our usual Bayesian analysis: start with the prior that the probabilty
of being infected is uniformly distributed, and after observing $K$ infections out of $N$
polititians, we have a posterior Beta distribution:  
$$
\begin{align*}
 \Pr(p)        & \sim \mathrm{Uniform}(0, 1) \\
 \Pr(p | N, K) & \sim \mathrm{Beta}(K + 1, N - K + 1)
\end{align*}
$$

... TBD: Bayesian posterior Beta's plotted compared to 6.5% national average

## What should we make of that?  

... TBD

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: D Pulver, C Procell, and J Zaccarina, ["Republicans are hit the hardest as coronavirus spreads among elected leaders"](https://www.usatoday.com/in-depth/news/2020/12/03/coronavirus-hits-republican-elected-officials-hardest/6413673002/), _USA Today_, 2020-Dec-08. [↩](#fn1a)  

<a id="fn2">2</a>: J Keefe, ["Which Members of Congress Have Tested Positive for the Coronavirus"](https://www.nytimes.com/interactive/2021/01/13/us/congressional-members-with-coronavirus.html), _New York Times_, 2021-Jan-14. [↩](#fn2a)  
