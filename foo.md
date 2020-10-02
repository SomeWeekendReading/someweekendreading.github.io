---
layout: post
title: Night of the Living Beta Binomials
tags: MathInTheNews Politics
comments: true
---

As you may have heard, the US is about to face an election more conentious than any since
the Civil War.  With vote counting likely drawn out due to right-wing mischief at, for
example, the Post Office, what are we to make of partial returns as far as predicting the
outcome?  And will there be [zombies](https://en.wikipedia.org/wiki/Night_of_the_Living_Dead)?  

<img src="{{site.baseurl }}/images/2020-10-02-night-of-the-living-beta-binomials-movie.jpg" width="220" height="325" alt="Night of the Living Dead" title="Night of the Living Dead" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
## The problem  

Imagine we lived in a simplified, and and much more desireable, world:  
- There are only 2 candidates for election, hereinafter termed GoodGuy and BadGuy.  (US politics is downright [Manichaean](https://en.wikipedia.org/wiki/Manichaeism) at the moment.)  
- There is no [Electoral College](https://en.wikipedia.org/wiki/United_States_Electoral_College); rather the election is decided by direct popular vote.  
- There is no [red mirage/blue shift effect](https://www.cnn.com/2020/09/01/politics/2020-election-count-red-mirage-blue-shift/index.html) (in-person votes preferred by one party are known on election night, but mail-in ballots preferred by the other get counted more slowly over the next couple days).  
- The number of popular votes to be cast, $N$, is somehow known in advance.  
- The candidate accruing $K \geq \lceil N/2 \rceil$ votes wins.  Since there are only 2 candidates and all $N$ ballots always vote either GoodGuy or BadGuy, this will surely happen one way or the other.  

So here we are on election night, anxiously listening to the returns (on NPR or PBS, of
course, since we're GoodGuys &mdash; though the BBC and the _Guardian_ get honorable mention).  
- Out of $N$ ballots to be counted, just $n < N$ have been counted so far.  
- They add up to $k < n$ votes for GoodGuy.  

What should we predict about the final outcome from this partial information?  In
particular, what is the probability distribution $\Pr(K | k, n, N)$ for the final number of
GoodGuy votes?  What is the probability $\Pr(K \geq \lceil N/2 \rceil | k, n, N)$ for a
GoodGuy win, i.e., the cumulative distribution function?  Will the media ever learn this,
and report accordingly?  

With the exception of the last question, for which the answer is apparently and
unfortunately a hard "no", the other questions can be addressed probabilistically.  

## The model

Meet your new best friend, the
[beta-binomial distribution](https://en.wikipedia.org/wiki/Beta-binomial_distribution),
which, as from its name <sup id="fn1a">[[1](#fn1)]</sup>, combines features from:
- the [binomial distribution](https://en.wikipedia.org/wiki/Binomial_distribution) (probability distribution of votes for GoodGuy out of $n$ voters, each with probability $p$ of voting GoodGuy), and  
- the [Beta distribution](https://en.wikipedia.org/wiki/Beta_distribution) (probability
distribution for $p$, based on previously observed voters in the same population).  

Binomial and beta are [conjugate priors](https://en.wikipedia.org/wiki/Conjugate_prior):
if you observe some binomially-distributed votes (say, $k$ out of $n$ here) then the beta
distribution tells you what to believe about the underlying $p$ that generated those
votes.  Heckerman's Bayesian tutorial (reference 4), for example, explores this in a
tutorial way, with a coin-toss example to estimate how the coin is loaded.

$$
\Pr(K | N) = \binom{N}{K} p^{K} (1-p)^{(N-K)}
$$


---

## Notes  

<a id="fn1">1</a>: As they say in Japan: "名は体を表す" (_na wa tai o arawasu_), or "names
reveal the inner nature of things".  In equally pretentious Latin, _nomen omen est_.  This is,
of course, strictly false; but it is occasionally useful for pretending one knows whereof
one speaks. [↩](#fn1a)

## References

1. T Vladeck, ["Unpacking the election results using bayesian inference"](https://tomvladeck.com/2016/12/31/unpacking-the-election-results-using-bayesian-inference/), _TomVladeck.com_, 2016-12-31.  

1. E Kaplan &amp; A Barnett, ["A new approach to estimating the probability of winning the presidency"](http://www.columbia.edu/~mh2078/NewApproach.pdf),  _Operations Research_ 51:1, 2003-Jan/Feb, 32-40.  

1. ["Beta-binomial distribution"](https://en.wikipedia.org/wiki/Beta-binomial_distribution), _Wikipedia_, last edited 2020-04-26.  

1. D Heckerman, ["A tutorial on learning with Bayesian networks"](https://arxiv.org/pdf/2002.00269.pdf), Arxive.org, 1996-Nov (revised 2020-Jan).  

1. T Minka, ["Estimating a Dirichlet distribution"](https://tminka.github.io/papers/dirichlet/), Microsoft Technical Report, 2000 (revised 2003, 2009, 2012).

1. RC Tripathi, _et al._, ["Estimation of parameters in the beta binomial model"](https://www.ism.ac.jp/editsec/aism/pdf/046_2_0317.pdf), _Ann Inst Stat Math_, 46:2 (1994), pp 317-331.

1. Y Qassim, A Abassi, ["Parameter estimation of Polya Distribution"](http://people.oregonstate.edu/~qassimy/Joe_Qassim_Site/Projects/Entries/2011/11/8_ECE_565__ESTIMATION,_DETECTION,_AND_FILTERING_files/ECE565%20Est%20Project%20Presentation.pdf), unpublished talk.
