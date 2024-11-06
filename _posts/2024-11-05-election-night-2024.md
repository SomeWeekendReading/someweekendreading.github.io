---
layout: post
title: Election Night 2024
tags: MathInTheNews Politics
comments: true
commentsClosed: true
---

So&hellip; election night it is, then?  


## A Momentary Distraction  

Yeah, I can't face it either.  Gonna wait until more polls close, or maybe tomorrow.  

I'd hoped to put up a little math-y post about what people mean by "a path to electoral
college victory".  But I got tired of fighting with some graphical software, so I'm gonna
just punt, show a distorted graph, and talk about the idea.  

<a href="{{ site.baseurl }}/assets/2024-09-28-electoral-paths-barplot.png"><img src="{{ site.baseurl }}/assets/2024-09-28-electoral-paths-barplot-thumb.jpg" width="400" height="400" alt="Frequencies of sizes of elements of the powerset of 7 swing states" title="Frequencies of sizes of elements of the powerset of 7 swing states" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Imagine the powerset graph of the 7 swing states.  There would be 2^7 = 128 subsets of
various sizes, the frequencies of which are shown here.  
- Size 0 would be the empty set, the score of a candidate who struck out and didn't get
  any of the swing states.  
- Size 7 would be the score of a candidate who ran the board, and got all of them.  

<a href="{{ site.baseurl }}/assets/2024-09-28-electoral-paths-1.png"><img src="{{ site.baseurl }}/assets/2024-09-28-electoral-paths-1-thumb.jpg" width="400" height="400" alt="Powerset DAG of swing states" title="Powerset DAG of swing states" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
We can arrange those subsets in a directed acyclic graph (the subset lattice) as shown
here.  (Click to expand; the original is 3000 x 3000.  If you zoom in on that, you can
just about make out the state names in a set and their electoral vote total.  I struggled
to make it even slightly legible.  Also, the layout will apparently do anything _except_
the sensibly symmetric thing.)  The empty set is at the bottom, and the union of all 7
sets is at the top.  

A candidate would enter the graph at the bottom, the empty set, carrying electoral votes
of all the other states that are likely decided.  
- For Harris this amounts to 226 electoral votes.  
- For Trump it amounts to 219 electoral votes.  

They then travel up the graph, capturing a state and its electoral votes as they go.  They
stop when their total exceeds the victory threshold of 270 electoral votes.  

A likely winner will have many short paths from the bottom, meaning they can win even if
they get only a few swing states.  A less likely winner would have to travel all the way
to up near the top, needing to capture almost all the swing states.  

I wanted to colorize the graph for Harris and Trump, to see who had many short paths
versus a long path requiring near total command of the swing states.  Yes, I know this
isn't what the politicos of the Word Tribe "mean" by "path to victory".  But it's the only
thing my math brain can wring out of it that's at least in the neighborhood of sensible.  

But:  
- Mostly that reflects the number of electoral votes with which they enter, i.e., slight
  advantage Harris.  
- There is no real "path", i.e., one does not capture the swing states in sequence.  They
  all happen in one night.  In particular, tonight.  
- It's been some years since I've used
  [Rgraphviz](https://www.bioconductor.org/packages/release/bioc/html/Rgraphviz.html),
  and it's fighting me tooth and nail on every little issue.  There's a
  [tidyverse](https://www.tidyverse.org/) version of finite graph drawing that looks
  pretty cool, but I'd have to forget everything I know and learn a whole new system.  Not
  gonna do that, at least not over this.

So&hellip; frustration.  

Somehow, that's the perfect allegory for a frustrated progressive in American politics.  


## The Weekend Conclusion  

I really want this to be _over._  But not in the way that elects Trump and causes American
democracy to be _over._  

I hope we get a Democratic trifecta in Washington, and then I can go back to ignoring
politics from time to time.  Wouldn't it be great not to have to think about Trump every
day, except when he gets sentenced?  

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
