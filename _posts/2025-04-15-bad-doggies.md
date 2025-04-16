---
layout: post
title: Bad Doggies!
tags: CorporateLifeAndItsDiscontents Politics Sadness &Gammad;&Tau;&Phi;
comments: true
commentsClosed: true
---

It appears some DOGE boys have been Very _Bad_ Little Doggies, over at the National Labor Relations
Board.  


## Prolegomenon to&hellip; All This

I'm really trying to scale back on my news reading.  The US has taken such an _evil_ and
_stupid_ turn that I just have to defend my mental health.  So, this Crummy Little Blog
that Nobody Reads (CLBTNR) is _not_ going to become your chronicler of the outrage
_du jour._  

But&hellip; sometimes the outrage _du jour_ is just __so__ outrageous, we need to take
notice and catalog the evidence (either for posterity or for later prosecutions).  


## NLRB: The Sitch  

<img src="{{ site.baseurl }}/images/2025-04-15-bad-doggies-npr-1.jpg" width="400" height="439" alt="J McLaughlin @ NPR: DOGE exfiltrates sensitive NLRB data, immediately loses account credentials to Russians" title="J McLaughlin @ NPR: DOGE exfiltrates sensitive NLRB data, immediately loses account credentials to Russians" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
From NPR today, in an extensively documented report by Jenna McLaughlin
<sup id="fn1a">[[1]](#fn1)</sup>, comes a frighteningly stupid and dangerous set of crimes
apparently committed by Musk's DOGE boys. NPR documented what you're about to read below
via interviews with 30 sources, and 11 technical experts in other government branches.
This isn't just 1 guy flinging wild accusations.  

In early March, DOGE rolled up in a black van with a police escort at the offices of the
National Labor Relations Board (NLRB).  The NLRB adjudicates unfair labor practices, union
busting, workplace safety issues, and so on.  Needless to say, they have a great deal of
sensitive data about labor cases, including identities of whistleblowers and their
testimony, plan of attack in lawsuits against corporate violators, trade secrets that were
allegedly leaked, and so on.  

The DOGE guys said their mission was to:  

> "... review agency data for compliance with the new administration's policies and to cut
> costs and maximize efficiency" 

But&hellip; what _actually_ happened looked more like a spy incursion or a black bag job:  

- They demanded accounts with the absolute highest permissions ("tenant owner level"),
  allowing them to see anything, change anything, and even delete anything.  This is a 
  _deeply weird_ thing to ask for, if you have a legitimate purpose.  Pretty much _nobody_
  gets that; it would usually be reserved to things like the backup software that archives
  data, or something.  Even more weirdly, they _could not say why_ they needed such
  access.  When NLRB IT staff suggested a simpler way for them to get read access with the
  usual level of security logging, they were told to "stay out of DOGE's way".  
- Then they asked for _logging to be turned off!_  This is completely unheard-of for access
  to sensitive data.  Every hospital in the US logs every time a user touches their data,
  so they can comply with HIPAA.  Government systems guarding sensitive life-or-death data
  are even more so.  This absolutely contradicts all best practice guidelines for
  security: people should say what they need to do, and be given just enough access to do
  that, but no more.  
- Interestingly, the NLRB budget hasn't allowed for insider-threat-monitoring technology
  for years.  They monitor outside threats, but not so much from the inside.  One wonders
  if this made them a particularly ripe target for DOGE.  
- With most of the logging turned off, they did whatever they did.  Given that some
  logging couldn't be turned off, they _manually deleted the logs_ to cover their tracks.
  This is a common way to cover, or at least muddy, your tracks in a criminal infiltration.
  It also violates a rule, _thou shalt not mess with logs, lest thou be presumed guilty._  
- They installed a container for their own software.  Think something like Docker, with a
  virtual machine inside that can hide everything it does from the host.  Why are they
  hiding what they're doing, if it's legitimate?  
- They gave them selves SAS tokens ("shared access signature").  There's no way to track
  what they did with the permissions so granted, and afterward they deleted the SAS
  tokens.  Only a stray log file, apparently, told of their existence?  
- They disabled a number of security controls:  
  - Disabled controls to prevent logins from insecure mobile devices  
  - Opened an insecure internet interface  
  - Manually turned off some more internal logging &amp; security systems  
  - Disabled multifactor authentication  
  - Installed libraries which appear to be designed to automate _and hide_ data exfiltration  
  - Set up DNS tunnelling to hide the data transfer.  
  
In other words, they almost completely disabled security, wreaked some sort of havoc, and
made a reasonably credible attempt to cover their tracks.  

The systems were left in such a weak state, they might as well have had a "Please Hack Me"
sign on them.  Indeed, in almost real time, there was an attempt to log in to NLRB systems
__from an IP address in Russia,__ using the correct username and password for one of the
newly created DOGE accounts!  

The score so far: they demanded unreasonable access, smashed security to pieces, installed
what appears to be hacking software as well as other things we can't track, exfiltrated a
bunch of sensitive data, maybe changed other data, and immediately leaked their passwords
to Russians.  

Not bad enough for you?  Read on!  

<a href="{{ site.baseurl }}/images/2025-04-15-bad-doggies-npr-3.jpg"><img src="{{ site.baseurl }}/images/2025-04-15-bad-doggies-npr-3-thumb.jpg" width="400" height="311" alt="McLaughlin @ NPR: spike in outgoing network traffic when DOGE guys came" title="McLaughlin @ NPR: spike in outgoing network traffic when DOGE guys came" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
NLRB staff kept track of network traffic.  What you see here is gigabytes of outgoing
network traffic on the vertical axis vs time on the horizontal axis.  See that spike on
the morning of March 4?  That's DOGE, taking about 10Gb of data.  (We don't know if they
compressed stuff, so it could be much more.)  

At the same time, other monitors (apparently not disabled), found large amounts of data
leaving their case management system "nucleus", where all the data on current labor cases
resides.  This includes whistleblower identities and testimony, case notes by department
lawyers for upcoming civil and criminal cases, and all the most sensitive stuff you can
imagine.  

Also at the same time, logs showed further evidence of manual tampering in such a way as
to delete records of what was done.  

There's apparently no legitimate reason for data to be leaving the NLRB in that volume,
and _particularly_ not from the case management system.  

We don't know entirely what they got, except that it included all the lawyers who worked
with the NLRB on their cases.  Remember how Trump has lately been threatening law firms he
doesn't like (for example, for having represented Hillary Clinton) with criminal charges,
pulling security clearances so they couldn't work wit the government, and even banning
them from federal buildings so they couldn't go to court?  

Now think about what he'll do with this list of labor lawyers.  

<a href="{{ site.baseurl }}/images/2025-04-15-bad-doggies-npr-2.jpg"><img src="{{ site.baseurl }}/images/2025-04-15-bad-doggies-npr-2-thumb.jpg" width="400" height="481" alt="McLaughlin @ NPR: Screenshot of Wick's GitHub showing 'NxGenBdoorExtract'" title="McLaughlin @ NPR: Screenshot of Wick's GitHub showing 'NxGenBdoorExtract'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
It gets even better.

There's a DOGE dude by the name of Jordan Wick.  Apparently these guys put their stuff on
GitHub, a public source-code control and management system used by your humble Weekend
Editor for this very blog.  He apparently forgot, and made one of his repositories public,
and it was screenshotted to show the name "NxGenBdoorExtract", shown here.  (It was
quickly hidden.)  

Now, you can name your software anything you want.  But it happens that the NLRB's
internal case management software is called "NxGen".  Seeing that on a DOGE repository
next to the words "back door" and "extract" looks awfully suspicious.  To put it plainly,
it's a hint that DOGE may have left back doors (ways to allow unauthorized access) in the
NLRB's most sensitive systems.  

Interviewing people who know how the NxGen system works, McLaughlin reported:  

> The engineers explained that while many of the NLRB's records are eventually made
> public, the NxGen case management system hosts proprietary data from corporate
> competitors, personal information about union members or employees voting to join a
> union, and witness testimony in ongoing cases. Access to that data is protected by
> numerous federal laws, including the Privacy Act.  

One software security expert said something to the effect of, "I'd be fired if I operated
like that."  Yeah, umm&hellip; I think being _fired_ would be the least of your worries.
You'd quickly end up in _prison_ if you did that to government systems.  

Then the murder threats started.  Once the main whistleblower tried to get the incident
investigated by government cybersecurity experts and the FBI, this happened:  

> &hellip; someone "physically taping a threatening note" to his door that included sensitive
> personal information and overhead photos of him walking his dog that appeared to be
> taken with a drone&hellip;  

So he's being surveilled, and the safety of himself and his family threatened. But the NLRB
press secretary denied all of it, essentially lying.  Attempts to get other 
government security agencies involved were stopped without explanation.


## Why Would They Do Such A Thing?  

At first, I wondered why anybody would go to this much trouble, putting themselves at
considerable risk (if we still enforced laws on Trump stooges, anyway).  

But it's clear there are at least 2 reasons.

The first is the general right-wing Republican animus against government at all, but
particularly against labor laws requiring them to treat workers fairly and safely.  GK
Chesterton captured that sentiment nicely:  

> “The poor object to being governed badly; the rich to being governed at all.” —
> [GK Chesterton](https://en.wikipedia.org/wiki/G._K._Chesterton), 
> [_The Man Who Was Thursday_](https://en.wikipedia.org/wiki/The_Man_Who_Was_Thursday)  

<img src="{{ site.baseurl }}/images/2025-04-15-bad-doggies-prospect-1.jpg" width="400" height="268" alt="H Meyerson @ American Prospect: Musk/Bezos war against the NLRB" title="H Meyerson @ American Prospect: Musk/Bezos war against the NLRB" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2025-04-15-bad-doggies-npr-4.jpg" width="400" height="548" alt="Hsu @ NPR: Musk, Bezos sue claiming NLRB is unconstitutional" title="Hsu @ NPR: Musk, Bezos sue claiming NLRB is unconstitutional" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Musk's companies, in particular, are involved in NLRB investigations.  Were he to gain
access to the internal NLRB data, that would be of tremendous advantage to him.  Not only
could he predict what government lawyers were doing, he could also engage in witness
intimidation and firing of any whistleblowers.  

But even more damning, Musk/SpaceX, Bezos/Amazon, and Starbucks are involved in a lawsuit
to destroy the NLRB altogether.  <sup id="fn2a">[[2]](#fn2)</sup> <sup id="fn3a">[[3]](#fn3)</sup>
Even though it was established by law in 1937, and has been presumed on rock-solid ground
for the last 88 years, they claim to have suddenly discovered it is unconstitutional.
Somewhat oddly, they came to this conclusion only after the NLRB began investigating them
for violating worker rights.  

If the NLRB were to be destroyed, it would become _much_ harder to unionize or take any
kind of collective action against law-breaking employers.  Each individual worker woud
have to sue, which is of course beyond their financial capability.  

So&hellip; it seems they have pretty clear motives to wound the NLRB's internal systems
and exfiltrate as much data as they can, in order to fight their lawsuits and track down
whistleblowers.  

With a ferociously biased Supreme Court, they may get what they want.  

<img src="{{ site.baseurl }}/images/2025-04-15-bad-doggies-euronews-1.jpg" width="400" height="371" alt="Nilsson-Julien @ EuroNews: fact check on Trump involvement with Russians" title="Nilsson-Julien @ EuroNews: fact check on Trump involvement with Russians" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
And why Russians?  

I suspect _kompromat_ in the case of Trump, at least.  Relying on European fact-checkers
to get outside the American media bubble, the evidence is somewhat
tangled.  <sup id="fn4a">[[4]](#fn4)</sup> It's suggestive, but not conclusive that he's
heavily blackmailed by the Russians.  

A pretty fair number of politicians act in ways that make me suspect they're being
blackmailed.  However, as is always the case, you can't prove blackmail until _after_ the
secret comes out, whatever that is.  

So it's a consistent theory, but not (yet) provable.  


## The Weekend Conclusion  

It really looks like the DOGE boys stole sensitive data which would be of great value to
Musk.  It also looks like they trashed security and leaked account credentials to Russia.  

We'll let good ol' GKC have the last word:  

> "All that we want for Government is a man not criminal and insane&hellip;" — [GK Chesterton](https://en.wikipedia.org/wiki/G._K._Chesterton), [_The Napoleon of Notting Hill_](https://en.wikipedia.org/wiki/The_Napoleon_of_Notting_Hill), p. 44 in my edition.  

That used to be funny.  

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

<a id="fn1">1</a>: J McLaughlin, ["A whistleblower's disclosure details how DOGE may have taken sensitive labor data"](https://www.npr.org/2025/04/15/nx-s1-5355896/doge-nlrb-elon-musk-spacex-security), _NPR_, 2025-Apr-15. [↩](#fn1a)  

<a id="fn2">2</a>: H Meyerson, ["The Musk-Bezos War on Collective Bargaining"](https://prospect.org/labor/2025-02-05-musk-bezos-war-collective-bargaining/), _The American Prospect_, 2025-Feb-05. [↩](#fn2a)  

<a id="fn3">3</a>: A Hsu, ["Accused of violating worker rights, SpaceX and Amazon go after labor board"](https://www.npr.org/2024/11/18/nx-s1-5192918/spacex-amazon-nlrb-labor-board-elon-musk), _NPR_, 2024-Nov-18. [↩](#fn3a)  

<a id="fn4">4</a>: E Nilsson-Julien, ["Fact check: Was Donald Trump recruited by the KGB and codenamed 'Krasnov'?"](https://www.euronews.com/my-europe/2025/03/13/fact-checking-online-claims-that-donald-trump-was-recruited-by-the-kgb-as-krasnov), _EuroNews_, 2025-Mar-13.[↩](#fn4a)  

