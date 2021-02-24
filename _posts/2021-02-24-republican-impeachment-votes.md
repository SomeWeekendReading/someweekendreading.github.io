---
layout: post
title: Why did Republicans block a Trump impeachment guilt decision?
tags: MathInTheNews Politics R Statistics
comments: true
---

It's been a couple weeks, so we've all calmed down a little.  But still&hellip; _why_ did
43 Republican senators vote to block the obvious guilty verdict in Trump's impeachment?  

## What we're after  

<img src="{{ site.baseurl }}/images/2021-02-24-republican-impeachment-votes-npr.jpg" width="400" height="263" alt="NPR: Trump Impeachment Verdict Votes" title="NPR: Trump Impeachment Verdict Votes" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The Senate voted: 57 guilty, 43 not guilty. <sup id="fn1a">[[1]](#fn1)</sup>  While that's
a bipartisan supermajority for the guilty vote, it's not sufficient: 67 guilty votes were
needed.  The facts in evidence were brutally clear.  All 50 Democrats and 7 Republicans
acknowledged this.  So that raises the question: _what were the other 43 Republican senators thinking?!_  

At some level, I'd like to get inside their heads to understand their thinking.  They had
to have some way of rationalizing their vote against the facts, perhaps prioritizing
political expediency.  Was it fear of public retaliation from Trump in the media?  Fear of
their Trump-addled constituents?  Fear of being primaried by some QAnon far to their right
in an upcoming reelection campaign?  Fear of insufficient tribal loyalty to the Republican tribe?  

It could be any of those things, or all in combination.  And upon reflection, I really
_don't_ want to "get inside their heads", because I wouldn't like what I would find.  I'll leave 
[narrated trips through hell to professionals like Dante](https://en.wikipedia.org/wiki/Inferno_(Dante)), 
and to [his modern admirers, like Niven & Pournelle](https://en.wikipedia.org/wiki/Inferno_(Niven_and_Pournelle_novel)).  


## Some possible explanations  

Basically, we just elaborate the fears enumerated above, in technical ways that we can
actually test statistically:  
- To what degree does simple membership in the Republican party force their vote?  Given
  the ideological extremism of the Republicans, this bare fact may foreclose on any other
  option, all by itself.  
- Did a senator vote earlier that the impeachment trial was unconstitutional?  While the
  position is ridiculous &ndash; law professors, for example are near-unanimous that it
  _was_ constitutional &ndash; a senator might have wanted to vote "not guilty" out of
  consistency.  
- If Trump won the popular vote in a senator's state by a large margin, might the senator
  feel compelled to defend Trump?  This could be a misplaced desire to represent
  constituents even to defending criminality and incompetence.  Or it could be they have
  no stomach to face hordes of Trumpy voters.  
- Is the senator running for reelection in 2022?  A reelection campaign hot on the heels
  of impeachment means voters will still remember this vote, and perhaps punish the
  senator if he voted guilty.  If the next campaign is in 2024 or 2026, this may be less
  the case, as American voters have notoriously and regrettably short memories.  
- Is the senator retiring?  If so, a senator who doesn't have to face voters ever again
  might be able to muster up the courage for a guilty vote.  
  

## The available data  

Most importantly, we want more than just _talk_, much more than just _story_.  We want
actual statistial _evidence_ for or against these hypotheses.  For that, we need data.  

Here's the data we used:  
1. __Votes on the final verdict:__ We got these from the web pages of the Senate 
   itself <sup id="fn2a">[[2]](#fn2)</sup>, slightly rearranged in
   [Emacs](https://www.gnu.org/software/emacs/) for loading into 
   [R](https://www.r-project.org).  
2. __Votes on the constitutionality of the impeachment trial:__ Also from the web pages of
   the Senate itself <sup id="fn3a">[[3]](#fn3)</sup>, similarly rearranged for processing
   by our scripts.  
3. __Popular vote margins in each state:__ From the table compiled in 
   Wikipedia <sup id="fn4a">[[4]](#fn4)</sup>, suitably rearranged for processing by our
   scripts.  Also, we combined the multiple districts into which Maine and Nebraska were
   broken down into state-wide data.  (Those states split electoral votes by congressional
   district.)  
4. __Reelection 'classes' for each senator:__ Again from the web pages of the Senate
   itself, describing the 'class' for each Senator.
   Class I is up for reelection in 2024. <sup id="fn5a">[[5]](#fn5)</sup>
   Class II is up for reelection in 2026. <sup id="fn6a">[[6]](#fn6)</sup>
   Class III is up for reelection in 2022. <sup id="fn7a">[[7]](#fn7)</sup>  It's this
   last class which is most likely to feel the heat of angry Trumpy voters in their
   upcoming reelection campaigns.  (There were some amusing issues here.  These datasets
   included spelling some senator's names with accent marks that were not used in the roll
   call vote reports.  Also, there are 2 senators surnamed "Scott", from Florida and South
   Carolina.  It's the presence of headaches like this that you know you're dealing with
   real data!)  
5. __Senator retirement intentions, as of the impeachment trial date:__ We assembled these
   data from 2 sources.  The first, from _FiveThirtyEight_ <sup id="fn8a">[[8]](#fn8)</sup>,
   detailed the definitely known retirements of Burr, Toomey, and Portman.  The second,
   from _CNN_ <sup id="fn9a">[[9]](#fn9)</sup>, confirmed those and added several "maybe"
   twists to the data.  Significantly, all those flirting with retirement are up for
   election in 2022, i.e., nobody said "one more time and _then_ I'll retire":  
|Senator  | State          | NextElection | Retiring |
| ------- | -------------- | ------------ | -------- |
|Burr     | North Carolina | 2022         | Yes      |
|Grassley | Iowa           | 2022         | Maybe    |
|Johnson  | Wisconsin      | 2022         | Maybe    |
|Portman  | Ohio           | 2022         | Yes      |
|Shelby   | Alabama        | 2022         | Maybe    |
|Thune    | South Dakota   | 2022         | Maybe    |
|Toomey   | Pennsylvania   | 2022         | Yes      |

<img src="{{ site.baseurl }}/images/2021-02-24-republican-impeachment-votes-omnibus.jpg" width="400" height="207" alt="Omnibus impeachment vote dataset: sample rows in a spreadsheet" title="Omnibus impeachment vote dataset: sample rows in a spreadsheet" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Now, that's a lot of data sources, and a lot of careful hand manipulation to assemble them
in useful form.  So, to facilitate peer review, we've written 
our analysis script <sup id="fn10a">[[10]](#fn10)</sup> to assemble all of them into a
single, omnibus, tab-separated-value formatted text file <sup id="fn11a">[[11]](#fn11)</sup>.
That's suitable for import into a spreadsheet, or any other analysis tool for peer review
of this analysis.  

## Exploratory data analysis  

First, let's look at some crosstabulations to see if there are any interesting hypotheses
to explain the <code>VoteVerdict</code> column from the others.  

Looking at <code>VoteConst</code>, the vote for whether the trial was constitutional,
shows the stark breakdown by <code>Party</code>.  All Democrats (and 2 Independents who
caucus with them) voted that it was constitutional.  All but 6 Republicans voted the other
way.  So&hellip; yes, there's a strong partisan divide, but 6 Republicans at least
admitted there was something to do:  
```
         Party
VoteConst  D  I  R
      Yea 48  2  6
      Nay  0  0 44

```

The same is pretty much true of the final decision in <code>VoteVerdict</code>:  
```
           Party
VoteVerdict  D  I  R
  Guilty    48  2  7
  NotGuilty  0  0 43
```

And the correlation between <code>VoteConst</code> and <code>VoteVerdict</code> is of
course darn near perfect, since you wouldn't vote Guilty in a procedure you thought was
constitutional:  
```
           VoteConst
VoteVerdict Yea Nay
  Guilty     56   1
  NotGuilty   0  43
```

If we dig into the changes, we see that just 1 vote changed between the 2, and it was
Senator Burr of North Carolina who is interestingly going to retire in 2022.  In news
interviews, he said the Democrats changed his mind when the impeachment managers presented
such a damning case:  
```
Senator          State Party VoteVerdict VoteConst TrumpMargin NextElection   Retiring
   Burr North Carolina     R      Guilty       Nay        1.34         2022        Yes
```

Next, let's look at the breakdown of <code>VoteVerdict</code> versus the next year the
senator has to run for reelection.  This looks a little disappointing, like there's
absolutely no difference in the 2022 class, a significant difference in the 2024 class,
and not much difference in the 2026 class:  
```
           NextElection
VoteVerdict 2022 2024 2026
  Guilty      17   24   16
  NotGuilty   17    9   17
```

That does not bode well for our hypothesis that senators immediately up for reelection
might need to vote "not guilty"!  What might be the reason?  If we look at the number of
seats up for reelection in each year broken down by party, we see the reason.  2024 has a
lot more Democratic seats up for reelection by more than 2/3 vs 1/3, while 2022 and 2026
are biased toward Republican seats, though somewhat less so.  That would explain why there
were so many Guilty votes in the 2024 class:  
```
            Party
NextElection  D  I  R
        2022 14  0 20
        2024 21  2 10
        2026 13  0 20
```

Finally, what about retirements?  There are so few, it's kind of hard to say there's
anything meaningful going on here:  
```
           Retiring
VoteVerdict Yes Maybe No
  Guilty      2     0 55
  NotGuilty   1     4 38
```

<img src="{{ site.baseurl }}/assets/2021-02-24-republican-impeachment-votes-correlations.png" width="400" height="300" alt="Pearson correlation of impeachment predictors" title="Pearson correlation of impeachment predictors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Finally, we might ask how many independent predictors do we really have here, anyway?  It
certainly looks like some of them are heavily correlated!  After turning all of them into
numeric variables (turn votes into booleans, and thence into 0/1), we can calculate the
Pearson correlations, as shown.  

It looks like there's 1 block of <code>TrumpMargin</code>, <code>PartyRepublican</code>,
and <code>VotedUnconst</code> that are heavily correlated.  This makes sense, and is
really just an expression of party identity.  

<code>NotRetiring</code> and <code>Running2022</code> are less correlated with that block,
and anti-correlated with each other.  If I converted to <code>NotRetiring</code> to
<code>Retiring</code>, then they'd be correlated: everybody retiring was going to have to
run in 2022.  So that makes sense, too.  

Basically, it looks like there are maybe 2 independent predictors here?  


## Machine learning: feature selection  

The crosstabulations were not especially encouraging in the quest for explanations beyond
brute-force party identity.  Still, let's press forward.  We'll qualify each of the
columns that might predict <code>VoteVerdict</code> in a univariate regression model.  For
example, for the predictor <code>TrumpMargin</code>, we do:  

$$ \log\left(\frac{\Pr(\mathrm{Guilty})}{1 - \Pr(\mathrm{Guilty})}\right) = \beta_0 + \beta_1 * \mathrm{TrumpMargin}
$$

We'll report the $p$-value for statistial significance of the $\beta_1$ coefficient, for
all senators and for just the Republican senators.  Then we'll do a Benjamini-H&ouml;chberg
multiple hypothesis correction to get the False Discovery Rate.  A small(ish) FDR presages
that column as a good predictor.  The results are intriguing:  
```
        Predictor        p pRepublican      FDR FDRRepublican
1 PartyRepublican 9.92e-01          NA 9.94e-01            NA
2    VotedUnconst 9.94e-01       0.995 9.94e-01         0.995
3     TrumpMargin 2.21e-07       0.028 1.10e-06         0.113
4     Running2022 3.11e-01       0.867 5.19e-01         0.995
5     NotRetiring 1.36e-01       0.247 3.40e-01         0.495
```

According to this analysis, the only variable worth considering is 
<code>TrumpMargin</code>.  It's understandable: Trumpy voters elect Trump, and also elect
Trumpy senators who will defend Trump.  Not very satisfying, but understandable.  

(And I don't understand why <code>PartyRepublican</code> wasn't a good predictor?!  Might
be something wrong there&hellip;)  


## Machine learning: supervised classification  

It might be that the other features taken together will predict a bit more, so let's move
on to multivariate model.  Here we'll be using the redoubtable 
[glmnet package](https://cran.r-project.org/web/packages/glmnet/index.html) <sup id="fn12a">[[12]](#fn12)</sup>, which will
handle the multivarite logistic regression, LASSO regulation to impose an L1 penalty on
model complexity ("choose the simplest model that's adequately predictive") and 3-fold
crossvalidation to estimate out-of-sample predictivity.  

Here's how that works in broad, schematic outline:  
- __Crossvalidation:__ We divide the data into three subsets called "folds", making sure
  everything is equitably divided among them.  Each fold has the same number of Democrats
  &amp; Republicans, the same Guilty and Not Guilty votes, the same number of Republican
  Guilty votes, and so on.  
- __Training vs test datasets:__ The we train a logistic regression model on 2 of the 3
  folds (the training data), and estimate its performance by running it on the witheld
  fold (the test data).  We do that for all combinations of training/test data subsets.  
- __Multivariate logistic regression:__ Ostensibly, we're training a 6-parameter predictive
  model for the log odds ratio of a guilty vote (1 inhomogeneous offset $\beta_0$ + 5
  predictor variables $\beta_i$).  

$$
\begin{align*}
  \log\left(\frac{\Pr(\mathrm{Guilty})}{1 - \Pr(\mathrm{Guilty})}\right) = \beta_0 &+ \beta_1 * \mathrm{PartyRepublican}\\
&+ \beta_2 * \mathrm{VotedUnconst}\\
&+ \beta_3 * \mathrm{TrumpMargin}\\
&+ \beta_4 * \mathrm{Running2022}\\
&+ \beta_5 * \mathrm{NotRetiring}
\end{align*}
$$

- __LASSO regularization:__ However, using all 5 predictors might overspecify the model,
  when a simpler subset of the predictors would do better out-of-sample.  So glmnet uses
  the LASSO penalty, which imposes an L1 norm penalty on the number of variables used.
  Basically, you only get to add a variable if it does enough good for you, in terms of
  crossvalidated predictions made correctly.  It will choose, for each crossvalidation
  round, the model that performs best and is simplest.  

(There's a lot more to know, but those are the high points.)  

We then get a model which performs reasonably on the witheld test data, and which has the
smallest number of parameters that is reasonably plausible.  (Hastie adds a heuristic:
find the best-predicting model, then choose an even _simpler_ model whose crossvalidated
error rate is within 1 standard error of the optimum.  I.e., choose the simplest thing
that's statistically indistinguishable from the best.  We won't be bothering with that,
for reasons you'll see below.)  

So let's see what we can get!  

<img src="{{ site.baseurl }}/assets/2021-02-24-republican-impeachment-votes-cv.png" width="400" height="400" alt="Crossvalidation: error vs model complexity" title="Crossvalidation: error vs model complexity" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
This shows the error in the predictions made ("binomial deviance") as a function of model
complexity.  The numbers along the top show the number of variables used in making the
prediction, with the simpler models on the right.  The error bars around the red dots show
the variation across the rounds of crossvalidation.  The 2 vertical dotted lines show the
best-predicting model, and Hastie's simpler but statistically indistinguishable from best
heuristic.  

The best model uses 3 variables to predict the final verdict vote: the constitutionality
vote, the Trump margin in a senator's state, and whether the senator is retiring.
Intriguingly, while <code>TrumpMargin</code> is the best single predictor, it is eclipsed
by the other 2 in a multivariate model:
```
                          1
(Intercept)     -6.65610938
PartyRepublican  .         
VotedUnconst     8.21255164
TrumpMargin      0.03186794
Running2022      .         
NotRetiring      1.96220073

```

The simpler model chosen by the Hastie heuristic uses the constitutionality vote alone.  

The performance of the best model is pretty good.  Here is a crosstabulation of the
predicted votes (along the rows) and the actual votes (along the columns):  
```
          Actual
Predicted FALSE TRUE Total
    FALSE    56    0    56
    TRUE      1   43    44
    Total    57   43   100

 Percent Correct:  0.99 
```
99% correct means we missed only 1 senator's vote.  A bit of digging reveals that it was
Burr, who changed his mind between the constitutionality vote and the verdict vote.  

<img src="{{ site.baseurl }}/assets/2021-02-24-republican-impeachment-votes-roc.png" width="400" height="400" alt="ROC curve: crossvalidated, LASSO regularized, multivariate regression impeachment predictor" title="ROC curve: crossvalidated, LASSO regularized, multivariate regression impeachment predictor" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>

Finally, the Receiver Operating Characteristic curve (ROC curve) here shows the True
Positive rate vs the False Positive Rate.  The red curve is for the best model, and the
gray curves are for the other models tested with different subsets of predictors.
Normally, we'd use this curve to set a threshold on $\Pr(\mathrm{Guilty})$ to make an
actual up-or-down Guilty prediction, so we could understand the tradeoffs between True
Postive Rates (don't miss any Guilty votes) vs False Positive Rate (don't over-predict
Guilty votes). But as you can see here, it's near-perfect: party identity as expressed in
the constitutionality vote predicts all.  (Except, of course, Burr.  Bless his little
heart.)  


## Thinking about the results  

So what does it all mean?!  

I was hoping for some kind of deep understanding of the pressures on senators: Trumpy
constituents, reelection schedules, retirements, party identity, and so on.  But it turns
out those are all pretty correlated, and we have just a story about party identity:
- Trumpy voters elect Trump.  
- Trumpy voters also elect senators likely to defend Trump.  

There's probably not much more here than that.  We took a long time to find such a simple
thing, no?  As James Branch Cabell described the work of a bizarre bard in _Music from
Behind the Moon_, one of the best short stories I've ever read, our song "ran confusedly,
shuddering to an uncertain end". <sup id="fn13a">[[13]](#fn13)</sup>  

But at least we know that the root of all evil here is the [right-wing authoritarianism](https://en.wikipedia.org/wiki/Right-wing_authoritarianism) of the Trump crowd.  Altemeyer's exceptional book <sup id="fn14a">[[14]](#fn14)</sup> summarizing his research career on political authoritarianism is looking better each year in terms of its explanatory power, and more chilling each year as well.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: B Booker, ["Trump Impeachment Trial Verdict: How Senators Voted"](https://www.npr.org/sections/trump-impeachment-trial-live-updates/2021/02/13/967539051/trump-impeachment-trial-verdict-how-senators-voted), _NPR_, 2021-Feb-13.[↩](#fn1a)  

<a id="fn2">2</a>: United States Senate, ["Vote Number 59: Guilty or Not Guilty (Article of Impeachment Against Former President Donald John Trump)"](https://www.senate.gov/legislative/LIS/roll_call_lists/roll_call_vote_cfm.cfm?congress=117&session=1&vote=00059), _Roll Call Vote 117th Congress &ndash; 1st Session_, 2021-Feb-13. [↩](#fn2a)  

<a id="fn3">3</a>: United States Senate, ["Vote Number 57: On the Motion (Is Former President Donald John Trump Subject to a Court of Impeachment for Acts Committed While President?)"](https://www.senate.gov/legislative/LIS/roll_call_lists/roll_call_vote_cfm.cfm?congress=117&session=1&vote=00057), _Roll Call Vote 117th Congress &ndash; 1st Session_, 2021-Feb-09.[↩](#fn3a)  

<a id="fn4">4</a>: Wikipedia, ["2020 United States presidential election (results by state)"](https://en.wikipedia.org/wiki/2020_United_States_presidential_election#Results_by_state), retrieved 2021-Feb-15. [↩](#fn4a)  

<a id="fn5">5</a>: United States Senate, ["Class I &ndash; Senators Whose Term of Service Expire in 2025"](https://www.senate.gov/senators/Class_I.htm), _Qualification & Terms of Service_, 2021-Feb-13. [↩](#fn5a)  

<a id="fn6">6</a>: United States Senate, ["Class II &ndash; Senators Whose Term of Service Expire in 2027"](https://www.senate.gov/senators/Class_II.htm), _Qualification & Terms of Service_, 2021-Feb-13. [↩](#fn6a)  

<a id="fn7">7</a>: United States Senate, ["Class III &ndash; Senators Whose Term of Service Expire in 2023"](https://www.senate.gov/senators/Class_III.htm), _Qualification & Terms of Service_, 2021-Feb-13. [↩](#fn7a)  

<a id="fn8">8</a>: N Rakich &amp; G Skelley, ["What All Those GOP Retirements Mean For The 2022 Senate Map"](https://fivethirtyeight.com/features/what-all-those-gop-retirements-mean-for-the-2022-senate-map/), _FiveThirtyEight_, 2021-Jan-25. [↩](#fn8a)  

<a id="fn9">9</a>: A Rogers, M Raju, &amp; Ted Barrett, ["Retirements shake up 2022 map as Republican senators eye exits"](https://www.cnn.com/2021/01/26/politics/retirements-republicans-2022/index.html), _CNN_, 2021-Jan-26. [↩](#fn9a)  

<a id="fn10">10</a>: Weekend Editor, ["R script for Republican impeachment vote analysis"]({{ site.baseurl }}/assets/2021-02-24-republican-impeachment-votes.r), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Feb-24.  There is also [a text transcript of running this script]({{ site.baseurl }}/assets/2021-02-24-republican-impeachment-votes-transcript.txt), to verify the results reported here.[↩](#fn10a)  

<a id="fn11">11</a>: Weekend Editor, ["Omnibus dataset for 2021 senate impeachment votes"]({{ site.baseurl }}/assets/2021-02-24-republican-impeachment-votes-omnibus.tsv), [_SomeWeekendReading_ blog]({{ site.baseurl }}/), 2021-Feb-24.[↩](#fn11a)  

<a id="fn12">12</a>: J Friedman, T Hastie, R Tibshirani, ["Regularization Paths for Generalized Linear Models via Coordinate Descent"](https://www.jstatsoft.org/article/view/v033i01), _Journal of Statistical Software_, 2010 33(1), 1–22.[↩](#fn12a)  

<a id="fn13">13</a>: J B Cabell, [_Music from Behind the Moon: An Epitome_](https://www.google.com/books/edition/The_Music_from_Behind_the_Moon/MwA-AAAAMAAJ?hl=en), 1926.[↩](#fn13a)  

<a id="fn14">14</a>: B Altemeyer, [_The Authoritarians_](https://theauthoritarians.org/options-for-getting-the-book/), [_The Authoritarians_ web site](https://theauthoritarians.org/), 2006.[↩](#fn14a)  
