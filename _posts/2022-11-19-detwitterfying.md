---
layout: post
title: De-twitter-fying This Blog
tags: About Obscurantism Sadness
comments: true
commentsClosed: true
---

It seems Twitter is dying.  Time to armor plate this blog so quote tweets survive.  


## RIP Twitter?  

<a href="https://xkcd.com/2347/">
  <img src="{{ site.baseurl }}/images/2022-11-19-detwitterfying-xkcd-2347-dependency.png" width="400" height="508" alt="XKCD 2347 has the dependency problem uncannily right!" title="XKCD 2347 has the dependency problem uncannily right!" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>
So, yeah: Twitter seems to be dying.  Musk has fired all the site reliability engineers,
made demands senior engineers deemed unacceptable enough to quit, and generally destroyed
internal knowledge of bespoke systems.  Years of building have created undocumented (and
unknown) circular dependencies, so when it next crashes&hellip; it may never come back.
XKCD #2347, shown here, is (as usual) uncannily on point.  

It would be ironic but useless to refer to Twitter threads about this, so here's a _Vanity Fair_
article that covers the nontechnical ground. <sup id="fn1a">[[1]](#fn1)</sup>  

in the roughly 2.5 years of this blog's existence, it has embedded tweets many times,
using Twitter's own embed code.  When Twitter disappears, so do those references!  

So I've spent the last 2-3 days screenshotting the $O(10^2)$ tweets quoted, and
hyperlinking the resulting image to the actual tweet, while it lasts.  Crude, but effective:  
- Page loads are way faster  
- Clicks still go through to the tweet and its surrounding conversation  
- If Twitter goes, the screen shots stay here, because I host it now  
- But&hellip; I have to use up some storage for those screenshots.  

It's a fair trade.  

Feel free to tell me if I've missed any, but my friend grep and his crew think I got them all:  
```sh
    $ grep "twitter-tweet" _posts/*.md | tr -d "[:blank:]"| sort | uniq | wc -l
       0

    $ ls -l ./images/ | grep ".*twitter.*" | wc -l
     133
```

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***">

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: D Cai, ["Twitter Is Dying, and I Don’t Feel So Good Myself"](https://www.vanityfair.com/style/2022/11/twitter-is-dying-and-i-dont-feel-so-good-myself), _Vanity Fair_, Nov 2022. [↩](#fn1a)  
