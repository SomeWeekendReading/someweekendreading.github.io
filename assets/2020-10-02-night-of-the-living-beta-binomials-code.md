---
layout: post
title: Code for &quot;Night of the Living Beta Binomials&quot;
tags: MathInThe News Politics R
date: 2020-10-02
comments: false
---

Here's the script `night-of-the-living-beta-binomials.r` for the post:

```R
## Created on Thursday, October  1, 2020 at 9:21pm EDT by WeekendEditor on WeekendEditorMachine.
## Copyright (c) 2020, nobody-in-particular.  All rights reserved.  As if you care.

library("TailRank")                                    # For beta binomial distribution

## > N <- 0.45 * 328e+06                               # 45% turnout would be a new record
## > n <- 500000; k <- 260000                          # Just 500k votes counted
## > probWin(N, n, k)                                  # Mild lead
## > probWin(N, n, 250010)                             # A lousy 10 vote lead
probWin <- function(N, n, k) {                         #
  1 - pbb(ceiling(N / 2), N, k + 1, n - k + 1)         # SLOW: brute-force summation!
}                                                      #
```
