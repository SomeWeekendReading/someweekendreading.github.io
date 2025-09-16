---
layout: post
title: Is Most US Political Violence Left or Right?
tags: JournalClub MathInTheNews Politics Sadness
comments: true
commentsClosed: true
---

Is more political violence in the US perpetrated by the left or the right?  


## Where is the Font of US Political Violence?  

Recently, with the murder in the US of far-right _agent provocateur_ Charlie Kirk, we've
been paying slightly more attention to domestic political violence.  Predictably, the
right-wing decided the source was leftists, minorities, and trans people. Within a day, historically
black colleges and universities were under lockdown.  

Then it came out that he was murdered by an even further right-wing white young man.
But the blaming of the left did not stop.  Consider a recent statement by JD Vance &ndash;
the Vice President &ndash; in which he makes the expected fascist plea for purity, saying "there can
be no unity with the left", and claims violence comes mostly from the left:   

<a href="https://bsky.app/profile/thebulwark.com/post/3lyvgnsytac2u"><img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-bulwark-1.jpg" width="550" height="570" alt="Bulwark: Vance claims most political violence is from the left" title="Bulwark: Vance claims most political violence is from the left" style="margin: 3px 3px 3px 3px; border: 1px solid #000000; margin: 0 auto; display: block;"></a>
Ok&hellip; is he lying or not?  

At some point, we have to have updated our priors so that when a highly-placed Trump
administration official says something, the _baseline assumption_ should be that they are
lying. However, we can, somewhat tiredly, fact-check this sort of thing&hellip; _again._  


## Checking the Facts  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-ap-1.jpg" width="400" height="553" alt="Klepper &amp; Amiri @ AP: Heritage Foundation wrongly says political violence is left" title="Klepper &amp; Amiri @ AP: Heritage Foundation wrongly says political violence is left" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
First, it's important to recognize that gaslighting on this subject is a long-term
tradition on the American right.  For example, consider the AP report on the Heritage
Foundation's claim that most violence comes from the left.  <sup id="fn1a">[[1]](#fn1)</sup>
The opening is pretty clear:  

> WASHINGTON (AP) — The leader of a conservative think tank on Thursday misrepresented
> partisan differences in political violence in the United States, wrongly suggesting that
> people associated with left-wing causes commit more violence than those on the right.  

This was in response to his remarks earlier in which he said,  

> &hellip; the country was in the midst of “the second American Revolution, which will remain
> bloodless if the left allows it to be.”  

That is, of course, _itself_ a threat of violence: either you let us dismantle America and
build fascism, or we will meet your opposition with violence.  

### Study 1: Jasko, _et al._ in _Proceedings of the National Academy of Sciences_  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-pnas-1.jpg" width="400" height="322" alt="K Jasko, et al. @ PNAS: Comparison of US political violence: left, right, Islamic" title="K Jasko, et al. @ PNAS: Comparison of US political violence: left, right, Islamic" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Now, the AP article does devolve into the usual journalistic preoccupation with _story,_
in which they cite numerous examples.  However, before that they sensibly cite research
from 2022 on the comparative sources of political violence in the US published in the
prestigious _PNAS_.  <sup id="fn2a">[[2]](#fn2)</sup>  

Jasko, _et al._ tried to see if there was a different propensity to political violence
among left-wing, right-wing, and Islamist extremists.  They had 2 large datasets of
violent events along with various covariates like education and social status, of which the
relevant one for today is the one for the United States: the Profiles of Individual
Radicalization in the United States (PIRUS).  
- This includes 1,563 individuals involved in right-wing, left-wing, or Islamist
  violence.  
- The time period covered was 1948 - 2018.  
- 90% of the subjects were male, with mean age 35 years.  

Right away in Table 1, there's a tell: the breakdown of entries is 17.6% Islamist, 23.4%
left-wing, and a whopping 59% right-wing.  It sure _looks_ like, just from the record,
that most political violence has been right-wing.  

They first used the MICE method ("multivariate imputation through chained equations") to
impute missing data.  Then they did some multivariate logistic regression, estimating the
log odds ratio of violence based on ideology and numerous correcting covariates like
education, marriage, gender, immigration, military experience, and so on.  

These covariates are important, because they allow you to consider ideology separately: if
one ideology is better educated and less violent, then is the lessening of violence due to
education or ideology?  By regressing on all such variables, they (partially!) correct for
this.  

A word about coding: it's natural to think about the ideology variable here as ternary,
i.e., left/right/Islamist.  But the way these things work in analysis is you want binary
variables.  So there's this thing called
[dummy coding](https://en.wikipedia.org/wiki/Dummy_variable_(statistics)).  There's a
"Left" variable that's 1 for leftists, else 0; there's an "Islamist" variable that's 1 for
Islamists, else 0.  There's no particular variable for "Right", because that's implied
when both "Left" and "Islam" are 0.  That is to say: "Right" is the baseline level, and
everything is what's called a _contrast_ with respect to baseline.  (This is utterly
standard procedure.)  

So their model looks something like (intuited by your humble Weekend Editor, since they
have no equations in their paper):  

$$
\log\left(\frac{\Pr(\mbox{Violence})}{\Pr(\mbox{No Violence})}\right) = \alpha + \beta_L \mbox{Left} + \beta_I \mbox{Islamist} + \beta_E \mbox{Education} + \beta_A \mbox{Age} + \cdots
$$

If $\beta_i \ll 0$, then the associated variable $i$ is _protective_ against violence.  Their
results, from Table 2:  
- Left-wing is _protective_ against violence ($\beta \sim -1.70$, $p \lt 10^{-3}$),
  Islamist is more or less insignificant.  Thus right-wing is implicated.  (it would have
  been more dramatic if this level hadn't been obscured by dummy-coding.)  
- Other statistically significant _protective_ variables: being an immigrant, being white,
  and being in the first decade of the 2000s.  __NB:__ Contrary to all the right-wing
  talking points, _immigrants are less violent._  
- Other statistically significant _pro-violence_ variables: previous criminal experience,
  and being in the 1970s or 1980s.  
  
So my reading of their table is that the typical domestic terrorist is a non-immigrant
right-winger with previous criminal experience.  Let's see what their interpretation is,
from the paper (__emphasis__ added):  

> When compared to individuals associated with a right-wing ideology, __individuals adhering
> to a left-wing ideology had 68% lower odds of engaging in violent (vs. nonviolent)
> radical behavior__ (b = −1.15, SE = 0.13, odds ratio [OR] = 0.32, P < 0.001). On the other
> hand, __the difference between individuals motivated by Islamist and right-wing causes was
> not significant__ (b = 0.05, SE = 0.14, OR = 1.05, P = 0.747). __Expressed in terms of
> predicted probabilities, the probability of left-wing violent attack was 0.33, that of
> right-wing violent attack was 0.61, and that of Islamist violent attack was 0.62.__ These
> findings remained robust after we controlled for demographic variables (sex, age,
> education, minority status, immigration status), prior criminal experiences, military
> experience, and decade in which the perpetrator entered the database. Of the control
> variables, __immigrants were less likely to engage in violence.__ Those who had a prior
> violent criminal record were more likely to engage in violence. Further, older
> individuals and those identified as white were less likely to engage in violence in this
> sample. Finally, when contrasted with the 2010s, persons whose date of exposure was in
> the 1970s and 1980s were more likely to be violent and those in the 2000s were less
> likely.  

Their conclusion is clear, even so much that it's stated right up-front in the abstract:  

> &hellip; we find that radical acts perpetrated by individuals associated with left-wing
> causes are less likely to be violent. In the United States, we find no difference
> between the level of violence perpetrated by right-wing and Islamist extremists.  

Yes, you read that correctly: left-wing violence is less likely, but right-wing violence
is indistinguishable from Islamic terrorism.  

So far, it looks like Vance is deeply, horribly wrong about both leftists and immigrants.
The real sources of US political violence are native-born right-wingers.  


## Ok, But&hellip; What Else Ya Got?  

Now, you might object that that's just one study (though it is over multiple decades and
uses the best datasets known&hellip; still, just one).  Thomas Aquinas was alleged to have
said ["hominem unius libri timeo"](https://en.wikipedia.org/wiki/Homo_unius_libri), or "I
fear the man of one book." <sup id="fn3a">[[3]](#fn3)</sup>  

So, by all means, let's find another study.  Or two.  Or&hellip; more?  Just to be _sure,_
you know.  _AP_ fact checkers led us to the Jasko, _et al._ paper in _PNAS_ above, so
that's 1 study.  

### Study 2: Alex Nowrasteh at the Cato Institute  

Now, maybe you're a Republican thinking I'm some pointy-headed, academic-loving, liberal
intellectual.  You are correct, though that's less of an insult than you might think.  So
let me find a more conservative source for you.  

How about the [Cato Institute](https://en.wikipedia.org/wiki/Cato_Institute)?  It's a
self-styled "libertarian think tank".  True, they like to distinguish that from
"conservative", but from my end of the political spectrum a libertarian is just a
conservative obsessed with economic bullying and an Ayn Rand fetish.  

So you can't accuse me of citing only friendly sources with this one!  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-nowrasteh-0.jpg" width="400" height="122" alt="Nowrasteh @ Cato: Politically Motivated Terrorist Killers" title="Nowrasteh @ Cato: Politically Motivated Terrorist Killers" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Consider the analysis of [Alex Nowrasteh](https://www.cato.org/people/alex-nowrasteh),
currently their vice president for economic and social policy studies.  Writing on his
site with David Bier <sup id="fn4a">[[4]](#fn4)</sup>, Nowrasteh has analyzed a different
set of data on politically motivated terrorist killers.  

Sadly, he opens by repeating uncritically the conservative canard that Kirk was murdered
by a leftist:  

> People are apprehensive about these attacks in the wake of the assassination of Charles
> Kirk by a left-wing, politically motivated terrorist.  

In fact, the alleged killer appears to be an _even further right-wing_ nut.  But let's
just take this as a credential that Nowrasteh is _deep_ into the right-wing culture and
can in no way be accused of being sympathetic to my views.  

<a href="{{ site.baseurl }}/images/2025-09-15-political-violence-right-nowrasteh-1.png"><img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-nowrasteh-1-thumb.jpg" width="400" height="268" alt="Nowrasteh @ Cato: Politically Motivated Killers and Their Victims by Domestic Partisan Ideology" title="Nowrasteh @ Cato: Politically Motivated Killers and Their Victims by Domestic Partisan Ideology" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now, he's assembled a number of interesting datasets on terrorist attacks in the US, their
political motivators, and the resulting casualties.  While he did _not_ do a deep
statistical analysis like the missing data imputation and logistic regression of Jasko,
_et al._ above, he _did_ make a very nicely done graphic, shown here.  (Click to embiggen.)  

He's broken down the politically motivated killings by ideology (columns) and by 5-year
periods (rows).  Consider the first 2 columns, the number of murders committed by left and
right ideologues.  

It is _blunt trauma obvious_ that, over the last half-century, the right has been
responsible for almost all the political violence in the United States.  

And today you learned that _from the Cato Institute._  

### Study 3: The National Institute of Justice Report on Domestic Terrorism  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-nij-1.jpg" width="400" height="406" alt="Chermak, et. al. @ NIJ: What NIJ research tells us about domestic terrorists" title="Chermak, et. al. @ NIJ: What NIJ research tells us about domestic terrorists" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The US government's National Institute of Justice published a study of domestic terrorism
on 2024-Jan-04 <sup id="fn5a">[[5]](#fn5)</sup> on the web site of the Office of Justice
Programs (ojp.gov).  

In a perfectly on-brand move, the Trump administration immediately disappeared the report
from the Office of Justice Programs web site, apparently just after the Kirk killing.  (I
didn't fact-check the date they disappeared it, but just noted the coincidence that it was
gone when I wanted it the most.)  

We can see why they want the report to be buried.  It gets directly to the point in the
first paragraph (__emphasis__ added):  

> __Militant, nationalistic, white supremacist violent extremism has increased in the United
> States.__ In fact, __the number of far-right attacks continues to outpace all other types__ of
> terrorism and domestic violent extremism. Since 1990, far-right extremists have
> committed far more ideologically motivated homicides than far-left or radical Islamist
> extremists, including 227 events that took more than 520 lives.[1] In this same period,
> far-left extremists committed 42 ideologically motivated attacks that took 78 lives.[2]
> A recent threat assessment by the U.S. Department of Homeland Security concluded that
> domestic violent extremists are an acute threat and highlighted a probability that
> COVID-19 pandemic-related stressors, __long-standing ideological grievances related to
> immigration__, and __narratives surrounding electoral fraud__ will continue to serve as a
> justification for violent actions.[3]  

They go on to talk about the apparently-excellent PIRUS database, used by Jasko, _et al._
above.  They funded a similar effort to study hate crimes in the US, creating a similar
database, called BIAS (966 individuals, from 1990 to 2018).  That revealed a startling
fact, that political violence and hate crimes based on race or sexual orientation are
deeply related (__emphasis__ added):  

> Furthermore, the PIRUS and BIAS data reveal that __U.S. extremists and individuals who
> commit hate crimes are often motivated by overlapping views.__ For instance, it is __common
> for individuals from the anti-government militia movement to adopt views of white
> supremacy__ or for those from the extremist environmental movement to take part in
> anarchist violence. Nearly 17% of the individuals in PIRUS were affiliated with more
> than one extremist group or sub-ideological movement, and nearly 15% of the individuals
> in BIAS selected the victims of their hate crimes because of multiple identity
> characteristics, such as race and sexual orientation.[12]  

So, according to _the government's own research,_ most violence in the US is related to
right-wing ideology and white supremacy.  And it's hard to distinguish those any more.  

### Study 4: The Economist on the Prosecution Project's Data  

Next, let's consider _The Economist._  

This is no left-wing rag: it's a British centrist publication, generally centrist to
slightly right of center.  In [Wikipedia's description](https://en.wikipedia.org/wiki/The_Economist), 
it is described as more or less appealing to the economic elite's modern neo-liberal preferences:  

> The newspaper typically champions economic liberalism, particularly free markets, free
> trade, free immigration, deregulation, and globalisation. Its extensive use of word play
> and high subscription price has linked the paper with a high-income elite readership,
> drawing both positive and negative connotations. In line with this, it claims to
> have an influential readership of prominent business leaders and policy-makers.  

So, again: very clearly _not_ appealing to my own preferences here, but looking for wide
support even from those who disagree with me.  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-economist-1.jpg" width="400" height="253" alt="Economist: most US violence is right-wing" title="Economist: most US violence is right-wing" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/2025-09-15-political-violence-right-economist-2.jpg"><img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-economist-2-thumb.jpg" width="400" height="201" alt="Economist: most US violence is right-wing, from the Prosecution Project" title="Economist: most US violence is right-wing, from the Prosecution Project" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
In an unattributed but otherwise excellent article on 2025-Sep-12 <sup id="fn6a">[[6]](#fn6)</sup>,
they ask if "radical-left" violence is _really_ on the rise in the US.  

To get at this question, they use data from the Prosecution Project of Michael Loadenthal
at the University of Cincinnati.  That project analyzes felony criminal case records for
ideological motivations.  They comb over criminal complaints, indictments, and court
records, looking for, in Loadenthal's words, those seeking "a socio-political change or to
communicate" to outside audiences.  

The results are shown in the bar chart reproduced here (click to embiggen).  The
conclusion is _obvious_ that most of the violence is right-wing (in red).  But don't just
trust my interpretation, listen to what _The Economist_ says (__emphasis__ added):  

> Its data show that extremists on both left and right commit violence, although more
> __incidents appear to come from right-leaning attackers (see chart 1).__  
> &hellip;  
> One paper by Celinet Duran of the State University of New York at Oswego studied
> political violence between 1990 and 2020. It found that there were __far more frequent and
> deadly attacks by the hard-right than the hard-left__, although left-wing violence
> increased throughout the study period. A separate tally by the Anti-Defamation League,
> an advocacy group, shows that __76% of extremist-related murders over the past decade were
> committed by those on the right.__  

Indeed: "see chart 1".  

Right-wingers are obviously and provably the source of US political violence.  

### Study 5: Phillip Bump on the Anti-Defamation League's Data  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-pbump-1.jpg" width="400" height="146" alt="Philip Bump: Reassessing the 'fine people hoax' hoax" title="Philip Bump: Reassessing the 'fine people hoax' hoax" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<a href="{{ site.baseurl }}/images/2025-09-15-political-violence-right-pbump-2.jpg"><img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-pbump-2-thumb.jpg" width="400" height="361" alt="Philip Bump: ADL data on extremist killings by year, showing most are right-wing extremists" title="Philip Bump: ADL data on extremist killings by year, showing most are right-wing extremists" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now consider the work of
[Philip Bump, a former _Washington Post_ columnist](https://www.washingtonpost.com/people/philip-bump/).
(The _WaPo_ offered him a buyout on 2025-Jul-17, so he left in a part of the sad, mass exodus
that includes other luminaries such as Jonathan Capehart.)  

Bump used to write a weekly newsletter called "How to Read This Chart", which warms my
flinty old scientist's heart.  Most scientists figure they're done with a figure when it's
draw: "I drew you a picture. Do I have to _explain_ it too?!"  Yes.  Yes, you do!  Every
time I made a scientific presentation, each figure was accompanied by a paragraph
explaining what it was (in line with the admirable instructions of
[Arlo Guthrie](https://en.wikipedia.org/wiki/Arlo_Guthrie) in
[_Alice's Restaurant_](https://en.wikipedia.org/wiki/Alice%27s_Restaurant).).  

Bump's analysis <sup id="fn7a">[[7]](#fn7)</sup> neatly summarizes some work from the
Anti-Defamation League on extremist killings by year (previously analyzed by Bump for a
_WaPo_ column <sup id="fn8a">[[8]](#fn8)</sup>), summarized in the chart shown here
(click to embiggen).  Right-wing is shown in pink, left-wing in light blue, domestic
Islamist extremist in purple, and anything else in gray.  

_Note the sea of pink,_ sustained over a decade.  

Bump goes on to cite the now-suppressed _NIJ_ report we also used above (__emphasis__ added):  

> Militant, nationalistic, white supremacist violent extremism has increased in the United
> States. In fact, __the number of far-right attacks continues to outpace all other types of
> terrorism and domestic violent extremism.__  

How many times are we going to have to say "see chart 1" until it's obvious?  

Apparently a lot more, sadly.  

### Study 6: USAFacts on US Government Data on Red State Homicide Levels  

You might argue that the above is all limited to just politics, and that right-wingers are
not especially violent about anything else.  That's not _much_ better, but it's
something.  So let's look at _general_ violence and ideology.  

For that, we turn to [USAFacts](https://usafacts.org/about-usafacts/), which bills itself
as writing "explainers" for government data that other people might find hard to access
and understand.  I haven't dealt with them a lot, but they seem legit on the surface.  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-usafacts-1.jpg" width="400" height="227" alt="USAFacts: which states have the highest murder rates?" title="USAFacts: which states have the highest murder rates?" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
On 2025-Sep-09 they published an article using CDC data to examine the homicide rate
across states. <sup id="fn9a">[[9]](#fn9)</sup>  Looking at the rate per 100,000 people,
the top 5 and bottom 5 of the list are:  
- _Highest murder rates:_  Mississippi, Louisiana, Alabama, New Mexico, Tennessee.  
- _Lowest murder rates:_ New Hampshire, Utah, Rhode Island, Massachusetts, Idaho.  

I really should do a regression of the murder rate on the Trump percentage margin in each
state.  But&hellip; we're 6 studies in and my energy is starting to flag.  

So we will simply note that:  
- the highest murder states are relentlessly southern and red, with an
  exception for New Mexico which is one of the poorest blue states, while  
- the lowest murder states are mostly northern and blue, with exceptions for the highly
  Mormon populations of Utah and Idaho.  
  
One could argue that southern culture in the US has a much more violent streak to it.  One
could argue that those states have populations that skew younger, with poorer impulse
control.  

But they _are_ red states, and they _are_ more violent.  

### Study 7: Red States Less Free, More Poor, Shorter Lives  

[Christopher Armitage](https://www.amazon.com/stores/author/B09XKTT4LM/about) is an Air
Force vet who now consults in security, disaster preparedness, and human trafficking.  

<img src="{{ site.baseurl }}/images/2025-09-15-political-violence-right-armitage-1.jpg" width="400" height="216" alt="Armitage @ Existential Republic: red sates less freedom, more poverty, shorter lives" title="Armitage @ Existential Republic: red sates less freedom, more poverty, shorter lives" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
He's written a deeply researched article on how social policy in red states influences not
just social freedom, but medical care, prosperity, and lifespan. <sup id="fn10a">[[10]](#fn10)</sup>
He looks across states with at least 8 years of consistent control by one party or the
other (i.e., a trifecta: both houses of the state legislature _and_ the governorship).  

There's a _lot_ there, especially in his references.  So let's just look at a couple
summary comparison paragraphs:  

- __Freedom:__  
  > Let's examine what freedom actually means in red states. In Texas, the government
  > forces women to carry dead fetuses to term.¹⁴ Women have died from this. In Florida,
  > the state investigates parents who support their trans children.¹⁵ In Tennessee, you
  > can be fired for being gay.¹⁶ In Alabama, librarians face prison for having the wrong
  > books.¹⁷  
  > &hellip;  
  > Meanwhile, in blue states, consenting adults can marry, adopt, and live without
  > fear.¹⁶ Women make their own reproductive healthcare decisions.¹⁴ Trans people receive
  > medical care.¹⁵ You can read any book you want.¹⁷ You can smoke marijuana without
  > becoming a felon.¹⁸ You can vote easily with early voting and mail ballots, because
  > that’s what happens in free democracies.¹⁹  
- __Poverty:__  
  > Texas has the second largest economy in America. Florida has the fourth. These aren't
  > poor states, they're economic powerhouses that choose to let their people
  > suffer. Texas, despite its trillion-dollar economy, maintains the highest uninsured
  > rate in the nation at 18.8%. Florida, despite massive budget surpluses, ranks 44th in
  > healthcare access and has the most regressive tax system in America.  
  > &hellip;  

  > Meanwhile, Vermont, with an economy smaller than Corpus Christi's, provides
  > near-universal healthcare coverage. Maine, with half of Florida's GDP per capita,
  > achieves better education outcomes. New Mexico, despite being one of the poorest blue
  > states, still manages lower maternal mortality than wealthy Texas.  
  > &hellip;  
  > This isn't about money. It's about choices. Red states with plenty of money choose to
  > spend it on corporate tax breaks instead of keeping mothers alive. They choose to ban
  > books instead of fund schools. They have the resources to match Massachusetts'
  > outcomes tomorrow. They simply choose not to.  

- __Lifespan:__  
  > Democratic states own the top of the life expectancy rankings. Hawaii leads at 79.9
  > years, followed by Massachusetts, Connecticut, and New York.¹ Republican states own
  > the bottom. Mississippi's 70.9 years ranks dead last, followed by West Virginia,
  > Alabama, Louisiana, and Kentucky.¹  
  >  
  > This isn't bad luck or geography. It's what the Republican party wants for it’s
  > constituents.  
  > 
  > Texas has the highest uninsured rate in America at 18.8%.³ Massachusetts has the
  > lowest at 2.9%.³ Every single state that refused to expand Medicaid has a Republican
  > trifecta.⁴ The result? People die from treatable diseases.  
  > 
  > Maternal mortality tells the same story. Louisiana kills mothers at 58.1 deaths per
  > 100,000 births. Georgia follows at 48.4, then Indiana, Arkansas, and Alabama, all
  > Republican strongholds.⁵ Massachusetts loses just 17 mothers per 100,000
  > births. California loses even fewer.⁵  

Basically the Democratic trifecta states pursue policies that lead to more freedom, less
poverty, and longer, healthier lives.  Republicans _choose not to do this,_ in what
amounts to self-inflicted wounds.  


## The Weekend Conclusion  

So there are 7 studies, from "pretty good" to "excellent", presenting you with sufficient
facts to see that Vance is either ignorant or lying.  (And that's just what I was able to
find and read _in a single afternoon:_ "vest pocket scholarship", where I looked no
further than my own vest pockets!.)  

There is a slim possibility that Vance is just simply ignorant, and can't be bothered to learn
the facts.  But much more likely, Vance is lying.  

_Of course_ he is lying: the violence almost always comes from his side, and it would be
politically inconvenient for him if you knew that fact.  

__The most important fact for you to learn:__ is that the fascists cannot be bothered to
learn the facts.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/ceterum-censeo/)  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** DOI: [***](***). [↩](#fn1a)  

<a href="{{ site.baseurl }}/images/***">
  <img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
</a>

<a href="***">
  <img src="{{ site.baseurl }}/images/***" width="550" height="***" alt="***" title="***" style="margin: 3px 3px 3px 3px; border: 1px solid #000000; margin: 0 auto; display: block;">
</a>

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: D Klepper &amp; F Amiri, ["FACT FOCUS: Heritage Foundation leader wrong to say most political violence is committed by the left"](https://apnews.com/article/political-violence-trump-biden-pelosi-assassination-c4423ed88df6f4b3557aa11e798f855d), _Associated Press_, 2024-Jul-18. [↩](#fn1a)  

<a id="fn2">2</a>: K Jasko, G LaFree, J Piazza, MH Becker, ["A comparison of political violence by left-wing, right-wing, and Islamist extremists in the United States and the world"](https://www.pnas.org/doi/full/10.1073/pnas.2122593119), _Proceedings of the National Academy of Sciences_, 119:30, e2122593119, 2022-Jul-18.  DOI: [10.1073/pnas.2122593119](https://doi.org/10.1073/pnas.2122593119). [↩](#fn2a)  

<a id="fn3">3</a>: He might have meant that he feared the focused knowledge of a specialist that might be turned against him, or he might have feared the semi-literate ignorance of someone who is at best partially informed from only a single source.  We're going with the latter, here: "Beware the man of 1 study." [↩](#fn3a)  

<a id="fn4">4</a>: A Nowrasteh, ["Politically Motivated Terrorist Killers"](https://www.alexnowrasteh.com/p/deadly-politically-motivated-violence), _Laissez-Fair, Laissez-Passer_ blog, 2025-Sep-13. 

The source for the plot above and the underlying data is [also available here](https://datawrapper.dwcdn.net/DZOjX/1/). [↩](#fn4a)  

<a id="fn5">5</a>: S Chermak, _et al.,_ ["What NIJ Research Tells Us About Domestic Terrorism"](https://archive.is/1t1rm#selection-1123.0-1123.51), _National Institute of Justice Journal_ 285, 2024-Jan-04.  

__NB:__ Shortly after the Kirk assassination, the Trump administration without explanation
disappeared this report from its usual home at the web site of the Office of Justice
Programs (ojp.gov). The link above goes to an archival copy.  You may have to pause your
VPN to get it to work.  

Just in case that _also_ goes away, we've archived a PDF of it here on this Crummy Little
Blog That Nobody Reads (CLBTNR).  [↩](#fn5a)  

<a id="fn6">6</a>: _Economist_ Staff, ["Is “radical-left” violence really on the rise in America?"](https://www.economist.com/graphic-detail/2025/09/12/is-radical-left-violence-really-on-the-rise-in-america), 
_The Economist_, 2025-Sep-12.  

__NB:__ Regrettably paywalled.  An [archival copy may be read here](https://archive.is/2Mmy0). [↩](#fn6a)  

<a id="fn7">7</a>: P Bump, ["Reassessing the ‘fine people hoax’ hoax"](https://www.pbump.net/o/reassessing-the-fine-people-hoax-hoax/), _pbump.net_ blog, 2025-Sep-12. [↩](#fn7a)  

<a id="fn8">8</a>: P Bump, ["Underrecognized: Extremist murders are usually from right-wing actors"](https://www.washingtonpost.com/politics/2023/02/28/extremism-right-wing-deaths/), 
_Washington Post_, 2023-Feb-28.  

__NB:__ Regrettably paywalled.  An [archival copy may be read here](https://archive.is/2pSw5).  [↩](#fn8a)  

<a id="fn9">9</a>: _USAFacts_ team, ["Which states have the highest murder rates?"](https://usafacts.org/articles/which-states-have-the-highest-murder-rates/), _USAFacts.org_ web site, 2025-Sep-09. [↩](#fn9a)  

<a id="fn10">10</a>: C Armitage, ["Red States: Less Freedom, More Poverty, Shorter Lives"](https://cmarmitage.substack.com/p/red-states-less-freedom-more-poverty?r=1sqa3e&utm_medium=ios&triedRedirect=true), _The Existential Republic_ blog, 2025-Sep-05. [↩](#fn10a)  
