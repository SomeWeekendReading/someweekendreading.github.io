---
layout: post
title: Blog Comments Temporarily Disabled
tags: About MeaCulpa Obscurantism Sadness
comments: true
commentsClosed: true
---

Comments on this Crummy Little Blog That Nobody Reads (CLBTNR) are temporarily disabled, due to
Heroku lossge.  


## What?  

This CLBTNR is a largely static HTML site, generated by [Jekyll](https://jekyllrb.com/)
from [markdown](https://github.github.com/gfm/) files in a [Github](https://github.com/)
repository.  

It handles comments (by definition dynamic content) via
[Staticman](https://staticman.net/).  Staticman is used, obviously, for providing dynamic
content to static sites.  It handled comments via a remote process running on
[Heroku](https://heroku.com/) which turned your submitted comments into pull requests
at the Github repository, which I would either delete (spam) or merge (the rest of you).  

Alas, Heroku has terminated the free level of its service, and I don't want to pay them.
So comments will cease working sometime today, until I migrate the comment handling to
somewhere else (e.g., fly.io, netlify.com, render.com).  

Nobody's written a detailed migration tutorial yet, and I don't feel like figuring it out
on my own.  (It was kinda gnarly getting Heroku to work, even _with_ a tutorial!)  So
pending that tutorial appearing somewhere in the Staticman community, comments will likely
cease working sometime today.  

You can of course contact me via the email link at the top of every page. (Click on the
envelope icon.)  

Sorry for the interruption!  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"> 
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: Nope.  