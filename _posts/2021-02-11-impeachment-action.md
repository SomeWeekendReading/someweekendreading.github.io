---
layout: post
title: Impeachment actions&colon; sine qua non
tags: MathInTheNews Politics R
comments: true
---

So.  US politics: it seems The Creature is being impeached.  Again.  What can we do
to make sure the impeachment makes a difference this time?  


## Why it matters  

<img src="{{ site.baseurl }}/images/2021-02-11-impeachment-action-pbs.jpg" width="400" height="238" alt="PBS: it's all impeachment news now" title="PBS: it's all impeachment news now" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Normally I love to listen to the news on [NPR](https://www.npr.org/), or even watch the 
[PBS News Hour](https://www.pbs.org/newshour/).  But now, I just can't: it's all
Trump impeachment, all the time.  The Democratic arguments are horrifying memories of a
traumatic time; the Republican arguments are delusional, sociopathic, or fascist like the
man they're defending. I just want Trumpism to be _irrelevant_, and for government to be
at least mostly rational.  

Still&hellip; I can't ignore it.  It _matters_.  3 reasons:  

1. Without conviction, he will have gotten away not just with 4 years of incompetent
   buffoonery, but clear crimes: most obviously digging for political dirt by soliciting
   election interference from Ukraine as in the Mueller report, or the recent incitement
   to insurrection.  If mere resignation ahead of impeachment worked as an escape hatch,
   we'd see no end of criminality in government at the end of terms.  
2. Without conviction, Republican obstruction of justice will be normalized: acquitting
   the clearly guilty for political convenience.  That level of tribalism and lust for
   retaining office has to be crushed in order for there to be any sort of rule of law.  
3. Without conviction, Trump cannot be banned from holding federal office ever again.  This may
   also be enforced in a court by appealing to the 
   [Constitution's 14th amendement, section 3](https://en.wikipedia.org/wiki/Fourteenth_Amendment_to_the_United_States_Constitution#Text): 
   those involved in insurrection cannot hold federal _or state_ office.  It's
   important that one or both of those paths be taken.  


## How many Republican senators have to vote for conviction  

In order to get conviction, the US constitution requires a 2/3 supermajority of the
senators _then present_ (Article 1, section 3, paragraph 6 <sup id="fn1a">[[1]](#fn1)</sup>).
There are 2 ways this can happen:  

- __50 Democratic votes + 17 Republican votes = 2/3 of all 100 senators.__  The 50 Democratic
  votes seem assured.  Maybe 6 Republican votes are likely, as that many voted yesterday
  that the impeachment trial was constitutional.  The next 11 are a problem,
  since the rest are basically cowards afraid of being primaried on the right by Trump
  revanchists, and clinging to office is for them more important than democracy.  
- __At least 25 Republicans absent themselves from the chamber so the 50 Democratic votes 
  are 2/3 of the 75 senators then present.__  This could possibly work, giving 25 Republicans up for
  election a chance to strut for their Trumpy constituents and another 25 to have
  semi-plausible deniability, or at least ambiguity, due to absence.  

(NB: Of course, a mixture of these paths could occur.  Say, 50 Democrats + 10 Republicans = 60
senators vote for conviction.  Then that's 2/3 of 90.  So only 10 Republicans need to find
urgent business out of the chamber, while the rest can be present and vote to acquit.  

<!--
Convict:  50 + R
R acquit: S - 50 - R = 75 + floor(3R/2) - 50 - R = 25 + floor(R/2)
R absent: 100 - S    = 100 - 75 - floor(3/2 R)   = 25 - floor(3R/2)

convict / (convict + R acquit) 
= (50 + R) / (50 + R + 25 + \floor*(1/2 R))
= (50 + R) / (75 + \floor*{3R/2})
= (50 + R) / [3/2 * (50 + R)]
= 2/3
-->

In general, if you can get 50 Democratic votes and $R$ Republican votes for conviction,
that has to be 2/3 of the number $S$ of senators present: $50 + R = 2/3 S$.  Solve for the
maximum senators present: $S = \lfloor 3/2 (50 + R) \rfloor = 75 + \lfloor 3R/2 \rfloor$.
That gives us:  

| _Bipartisan votes for conviction:_            | $50 + R$                                |
| _Republicans present, voting for acquittal:_   | $S - 50 - R = 25 + \lfloor R/2 \rfloor$ |
| _Republicans absent,  not voting:_            | $100 - S = 25 - \lfloor 3R/2 \rfloor$   |

Those 3 groups add up to 100 senators, and the conviction votes are 2/3 _of those present_.
We can easily generate a table with a tiny bit of [R](https://www.r-project.org/) to
verify this numerically and see all the examples:  
```R
> D <- 50; R <- seq(from = 0, to = 17, by = 1)
> ans <- data.frame("D.Convict" = D,
                    "R.Convict" = R,
                    "R.Acquit"  = 25 + floor(R/2),
                    "R.Absent"  = 25 - floor(3*R/2))
> transform(ans, 
            "Senators.Total" = rowSums(ans),
            "Pct.Convict"    = round(100.0 * 
                                       (D.Convict + R.Convict) / (D.Convict + R.Convict + R.Acquit), 
                                     digits = 2))
   D.Convict R.Convict R.Acquit R.Absent Senators.Total Pct.Convict
1         50         0       25       25            100       66.67
2         50         1       25       24            100       67.11
3         50         2       26       22            100       66.67
4         50         3       26       21            100       67.09
5         50         4       27       19            100       66.67
6         50         5       27       18            100       67.07
7         50         6       28       16            100       66.67
8         50         7       28       15            100       67.06
9         50         8       29       13            100       66.67
10        50         9       29       12            100       67.05
11        50        10       30       10            100       66.67
12        50        11       30        9            100       67.03
13        50        12       31        7            100       66.67
14        50        13       31        6            100       67.02
15        50        14       32        4            100       66.67
16        50        15       32        3            100       67.01
17        50        16       33        1            100       66.67
18        50        17       33        0            100       67.00
```

The currently relevant numbers would lead us to speculate that perhaps 10 Republicans
would vote for conviction, 30 Republicans could be present and vote for acquittal to pose
for their Trumpy constituents, and 10 Republicans would have to be absent and ambiguously
not voting.)  

I'm too angry and disgusted with the GOP to see much hope that either of those ways will
happen.  They both require getting into the heads of Republican senators, knowing what
moves them, what drives them, and what persuades them.  


## What drives them and how you can push a little  

What persuades them is constituents.  They want to know what the voters in their state
think, how likely they are to be primaried or how likely to be re-elected.  (There are
other influences, like party whip instructions, campaign funding, and so on.)  

So: should you find yourself so unfortunate as to be the constituent of a Republican
senator (particularly one that is retiring or not immediately up for re-election in 2022
and hence not under immediate political pressure to appear Trumpy),
you should _call them and __politely__ tell the staffer who answers that you want your senator to vote for
conviction in the impeachment trial._ It doesn't matter if you think your senator is a nimrod who
won't listen; the point is that if enough _of their own constituents_ call saying this, it
will create a moment of doubt in which the right choice might be made.  (But please don't
bother any senator of whom you are not a constituent.)  

So the question is: how to contact them, and how to speak effectively so the staffer will
start counting up pro-impeachment-conviction constituents?  

<img src="{{ site.baseurl }}/images/2021-02-11-impeachment-action-coleman.jpg" width="400" height="408" alt="Coleman: contacting legislators and not getting ignored" title="Coleman: contacting legislators and not getting ignored" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Emily Coleman, a former Congressional staffer, offered some advice on Twitter a couple
years ago:  
- Don't bother with Twitter or Facebook or texting or even email; that's uniformly ignored.  
- Writing a letter is pretty good, especially to the district office.  A _paper_ letter,
  not an email.  
- But really the only thing that matters is a phone call where you talk to a staffer.  Coleman
  recommends the district office instead of DC, but see below.  

<img src="{{ site.baseurl }}/images/2021-02-11-impeachment-action-ucs.jpg" width="400" height="215" alt="UCS: productive conversations with legislator's staff" title="UCS: productive conversations with legislator's staff" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Similar material from 2008 by the Union of Concerned Scientists <sup id="fn2a">[[2]](#fn2)</sup>
(hey, remember _my_ tribe) also suggests calling.  But in
cases like this where it's about an imminent vote, definitely call the DC office.  Ask to
speak to the aide who handles informing your senator about constituent opinions on
impeachment.  If that's complicated, just speak with whomever it is that answers the phone, as the
call will be logged in the constituent database system either way.  Let them know you are a
constituent, and are registered to vote.  They may ask your name, address, and zip code.
Know your facts, and be brief. <sup id="fn3a">[[3]](#fn3)</sup>  

So, there it is: if you are a constituent of a Republican senator (especially one retiring
or not immediately up for re-election in 2022), call their DC office and tell the
aide you are a constituent and a registered voter who wants a vote to convict Trump in the
impeachment trial.  

_They will ignore everything else._

---

## Notes &amp; References  
<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: US Constitution, [Article 1, section 3, paragraph 6](https://www.senate.gov/civics/constitution_item/constitution.htm#a1_sec3). [↩](#fn1a)  

<a id="fn2">2</a>: Union of Concerned Scientists, ["How to Have a Productive Phone Call With Your Legislator's Office"](https://www.ucsusa.org/resources/how-have-productive-phone-call-your-legislators-office), _UCUSA_ blog, 2008-Jul-17. [↩](#fn2a)  

<a id="fn3">3</a>: A brief email consultation with a current congressional staffer
confirms this, at least in broad outline.  They also offered a _de rigueur_ cautionary note:  
>"To change a senator’s mind, though, you need a lot of phone calls. And we know that
>sometimes the most active constituents do not represent the broader view. But it’s still
>worth a call, because all calls get logged. And, you know, democracy."  

[↩](#fn3a)  
