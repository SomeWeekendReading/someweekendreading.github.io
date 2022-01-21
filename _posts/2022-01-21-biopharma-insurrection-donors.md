---
layout: post
title: Shameful BioPharma Donations to Insurrectionists
tags: PharmaAndBiotech Politics R
comments: true
---

Regrettably, it has come to light that my former industry has some bad actors who are
funding the Republican politicians who attempted to overthrow the last election.  Who are
these funders of insurrectionists, and once we know their companies can we shame them into
stopping?  


## A shame for the US biopharma sector  

<img src="{{ site.baseurl }}/images/2022-01-21-biopharma-insurrection-donors-lowe.jpg" width="400" height="283" alt="Derek Lowe: Shame on biopharma donors to insurrectionists" title="Derek Lowe: Shame on biopharma donors to insurrectionists" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-21-biopharma-insurrection-donors-usdin.jpg" width="400" height="254" alt="Usdin @ BioCentury: BioPharmas contributing to pols who voted to overthrow election" title="Usdin @ BioCentury: BioPharmas contributing to pols who voted to overthrow election" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2022-01-21-biopharma-insurrection-donors-capaction.jpg" width="400" height="248" alt="CAP Action: Corporations funding McCarthy's insurrection caucus" title="CAP Action: Corporations funding McCarthy's insurrection caucus" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Sometime last week, I came across an article by the estimable med-chem blogger Derek Lowe,
at _In the Pipeline_, titled simply "Shame". <sup id="fn1a">[[1]](#fn1)</sup> True enough,
it is about some shameful behavior: he discusses an article from Steve Usdin in
_BioCentury_ <sup id="fn2a">[[2]](#fn2)</sup> on donations by biopharma companies to US
representatives (and 1 senator) who tried _to overthrow the US government_ last year, by
overruling the election results.  If you think that's unique to biopharma, consult the
article in _CAP Action_ from mid-2021 which documented how much corporate America is funding
insurrectionist politicians. <sup id="fn3a">[[3]](#fn3)</sup>   

It's hard to describe just how much this angers me.  BioPharma scientists are among the
most ethical people I've met in my life. <sup id="fn4a">[[4]](#fn4)</sup>  It's espcially
galling since many of these companies pledged not to donate to any members of Congress who voted to
decertify the election&hellip; but within a few months, the 
[dog had returned to the vomit](https://en.wikipedia.org/wiki/As_a_dog_returns_to_his_vomit,_so_a_fool_repeats_his_folly#:~:text=%22As%20a%20dog%20returns%20to,New%20Testament%2C%202%20Peter%202%3A).  

Derek apparently feels the same way.  It should be noted that since Derek is well to the
right of me, he and I agree on approximately nothing in politics.  Nothing, that is,
except the execrable nature of Trump and all but a very few of the current crop of Republicans.  

From the insurrection riot on 2021-Jan-06 through 2021-Nov-03, 9 biopharmas and their
trade group BIO contributed to 42 lawmakers who voted for decertification of the
election.  (PhRMA, another trade group, has adopted a policy of not donating to candidates
who reject election results.  As far as anyone can tell, they seem to have stuck to it.)  

Here are the donors, ranked by the number of insurrectionists they funded:  

| __Donor__ | | __NRecipients__ |
|:---------:|-|----------------:|
| Pfizer    | |              24 |
| Merck     | |              19 |
| Lilly     | |              15 |
| Amgen     | |              13 |
| J&amp;J   | |              11 |
| GSK       | |               9 |
| BIO       | |               8 |
| Genentech | |               5 |
| Novartis  | |               5 |
| AbbVie    | |               4 |

Clearly the top offenders are Pfizer, Merck, Lilly, Amgen, and J&amp;J.  I'm _slightly_
gratified to note the absence of any of my former employers in this list of the damnable.
(However, another article -- reference 3 -- implies that one of them _did_ contribute to
the [NRCC](https://www.nrcc.org/) after promising to do no such thing.  See below re
sociopaths in management; perhaps they prefer sociopaths in government as well.)  

Note that this list is not just for Republican contributions, odious as that may be.
While these organizations have also donated to Democrats, here they have made
contributions _specifically to politicians who tried to overthrow the election._  It's
really that bad.  

Who are those politicians?  Here are the top few of the recipients, who got donations from
more than 5 biopharma donors:  

|        __Recipient__ | | __NDonors__ |
|---------------------:|-|------------:|
|      Rep Mullin (OK) | |          9  |
|       Rep Smith (NB) | |          8  |
|   Rep Arrington (TX) | |          7  |
|    Rep Walorski (IN) | |          7  |
|      Rep Carter (GA) | |          6  |
|       Rep Kelly (PA) | |          5  |
|    Rep McCarthy (CA) | |          5  |
|       Rep Nunes (CA) | |          5  |
|     Rep Scalise (LA) | |          5  |
|       Rep Smith (MT) | |          5  |

Needless to say, they are all Republicans.  

It's too bad we don't have the _amount_ of the donations as well.  It would be good to add
up the dollars and assess the influence of money, not just number of donors.  

Shame, indeed.  


## What kind of structure can we infer from the donation data?  

<img src="{{ site.baseurl }}/assets/2022-01-21-biopharma-insurrection-donors.png" width="400" height="1000" alt="Bipartite graph structure of donors and insurrection politicians" title="Bipartite graph structure of donors and insurrection politicians" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
If we think of the donor/recipient data as a 
[bipartite graph](https://en.wikipedia.org/wiki/Bipartite_graph) (links from donors to
recipients, but never donor-donor or recipient-recipient links), then we can begin to see
some structure.  (Indeed, beyond the outrage, this is the one original contribution I'm
making with this article.)  We took the figure from Usdin's article, marshalled the data into a
tab-separated spreadheet, and wrote a little [R script](https://www.r-project.org/) to
plot it as a bipartite graph <sup id="fn5a">[[5]](#fn5)</sup>, shown here.  

A few points become blunt-trauma-obvious:  
- The main biopharma offenders are Pfizer, Merck, Lilly, Amgen, and J&amp;J.  The others
  are there, but at least the donated to fewer insurrectionists.  
- The biggest offending insurrectionist politicians in terms of the number of funding
  sources accepted were Mullin, Smith, Walorski, Arrington, Carter, Smith, Scalise, Nunes,
  McCarthy.  
  
Both conclusions are in accord with what we saw above in the tables, we just see it
graphically here.  


## The Weekend Conclusion  

I dunno what to say, really.  

I'd dearly love to see us attempt to apply the
[14th Amendment of the US Constitution](https://en.wikipedia.org/wiki/Fourteenth_Amendment_to_the_United_States_Constitution),
adopted after the Civil War, which says in part:  

> Section 3  
>  
> __No person shall be a Senator or Representative in Congress__, or elector of President and
> Vice-President, or hold any office, civil or military, under the United States, or under
> any State, who, having previously taken an oath, as a member of Congress, or as an
> officer of the United States, or as a member of any State legislature, or as an
> executive or judicial officer of any State, to support the Constitution of the United
> States, __shall have engaged in insurrection or rebellion__ against the same, or given aid
> or comfort to the enemies thereof. &hellip;  

Why are these guys _still_ members of Congress?    Haven't they, in the words of the 14th
Amendment, "given aid and comfort" to insurrectionists?  

It seems like the right wing is so amazingly full of crap, they have to export it onto the
rest of us.  

What can be done here?  Any ideas?  


---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***"><img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: D Lowe, ["Shame"](https://www.science.org/content/blog-post/shame), [_In the Pipeline_](https://www.science.org/blogs/pipeline) blog at _Science Translational Medicine_, 2022-Jan-13. [↩](#fn1a)  

<a id="fn2">2</a>: S Usdin, ["Biopharmas contributing to candidates who challenged Biden’s election"](https://www.biocentury.com/article/641697), _BioCentury_, 2022-Jan-11. [↩](#fn2a)  

<a id="fn3">3</a>: _CAP Action_, ["The corporations trying to save Kevin McCarthy and the insurrection caucus"](https://capaction.medium.com/the-corporations-trying-to-save-kevin-mccarthy-and-the-insurrection-caucus-43a74488416c), _CAP Action_, 2021-Jun-03. [↩](#fn3a)  

<a id="fn4">4</a>: Though I grant that management has its share of sociopaths and sales will always try to do something shady if they're not watched.  

Hence every year we all had to take the usual inane HR training that the things you think are obviously crimes, are in fact crimes.  This was all because some idiot tried to bump his sales numbers, got caught, found guilty, drummed out of the industry, and left the rest of us with 10 years of annual training.  

This made scientists _furious._ [↩](#fn4a)  

<a id="fn5">5</a>: [WeekendEditor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script to show bipartite graph structure of donors and insurrectionist politicians"]({{ site.baseurl }}/assets/2022-01-21-biopharma-insurrection-donors.r), [_Some WeekendReading_]({{ site.baseurl }}) blog, 2022-Jan-21.  

We have aggregated the figures in Lowe and Usdin's articles, collecting the donors and recipients into [a tab-separated spreadsheet which is available for download and review]({{ site.baseurl }}/assets/2022-01-21-biopharma-insurrection-donors.tsv).  

Also, after running the R script, there is [a text transcript available for download and review]({{ site.baseurl }}/assets/2022-01-21-biopharma-insurrection-donors.txt). [↩](#fn5a)  
