---
layout: post
title: US House of Representatives&colon; The Arithmetic of the Wyoming Rule
tags: CorporateLifeAndItsDiscontents MathInTheNews Politics SomebodyAskedMe
comments: true
commentsClosed: true
---

Over dinner a few days ago, [we were talking about]({{ site.baseurl }}/tags/#SomebodyAskedMe)
about whether the Wyoming Rule would fix some of the bias in the Electoral College.  The
'Wyoming Rule' is a proposal to make the US House of Representatives more representative
of people, not territory.  How might the arithmetic work out for which party gets more seats?  


## Some Anti-Democracy Aspects of US Government  

There are a depressing number of ways in which the American government, at the federal
level, is not only undemocratic (not representing the populace fairly) but actually
_anti-democratic_ (deliberately designed to be so):  
<a href="{{ site.baseurl }}/images/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-rube-goldberg.jpg"><img src="{{ site.baseurl }}/images/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-rube-goldberg-thumb.jpg" width="400" height="606" alt="Wikipedia: example of an over-complex Rube Goldberg machine" title="Wikipedia: example of an over-complex Rube Goldberg machine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
- The most famous, and recently most aggravating, is the
  [Electoral College](https://en.wikipedia.org/wiki/United_States_Electoral_College).
  This is the 18th century [Rube Goldberg machine](https://en.wikipedia.org/wiki/Rube_Goldberg_machine)
  designed (a) to avoid the then-controversial idea of direct democracy and (b) to appease
  the southern slave states by over-representing their votes.  Basically the election
  selects 535 politically elite people, like a copy of Congress, who were supposed to
  decide the election.  In practice, they are legally 'bound' to vote for their party.  

  This over-represents red states, and introduces numerous opportunities to elect a
  candidate who _loses_ the popular vote.  
- The US Senate specifies 2 senators per state, regardless of population.  Thus, to pick
  the least and most populous states, a Wyoming senator represents only 576,851/2 =
  288,425 people, whereas a California senator represents 39,538,223/2 = 19,769,111
  people.  
  
  Residents of Wyoming, and other rural (now red) states are wildly over-represented and
  can thus impose a veto on policies preferred by the majority.  
- Finally, the US House of Representatives also over-represents the red states.  It was
  initially supposed to have at least 1 representative from each state, but after that
  proportional to population.  (This was, as you might expect, gamed relentlessly by
  politicians, with various methods, choices of divisors, and the infamous 3/5 humanity of
  enslaved people.)  
  
  However, with the House currently capped at 435 seats (_q.v._), the allocation algorithm (below)
  _again_ over-represents rural red states.  
  
<a href="{{ site.baseurl }}/images/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-NPVIC.jpg"><img src="{{ site.baseurl }}/images/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-NPVIC-thumb.jpg" width="400" height="1019" alt="Wikipedia: Status of National Popular Vote Interstate Compact" title="Wikipedia: Status of National Popular Vote Interstate Compact" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
About the Electoral College, there are only paths to a more democracy-centered system.
Either:  
- A constitutional amendment to replace it (with either a popular vote yet, a ranked
  choice vote).  

  Republicans would, of course, block this _hysterically,_ as it would remove their
  over-representation in power.  
- The
  [National Popular Vote Interstate Compact](https://en.wikipedia.org/wiki/National_Popular_Vote_Interstate_Compact).  

  This is a counter-Rube-Goldberg-Machine in which a block of states say they will
  allocate their Electoral College votes to the winner of the _national_ popular vote, no
  matter what their individual state vote is.  It only goes into effect when enough states
  pass it to control 270 electoral votes, enough to decide the election.  

  The current (2024-Nov-22) status, shown here from Wikipedia, has states holding 209
  electoral votes having passed it.  So&hellip; not quite enough yet.  But it's pending in
  states representing another 69 electoral votes; if it were to pass in all those states
  then it would go into effect.  
  
  Of course, in that eventuality, Republicans would again _hysterically_ claim in court that
  this is unconstitutional.  With the extremely right-wing packed Supreme Court, they may
  be able to kill it and thus perpetuate their over-representation.  

About the Senate, there is, I believe, little that can be done.  It's wired into the
constitution that they represent states instead of people, so they will always
over-represent the rural red states.  (We could, of course, abolish states and replace them
with federal administrative districts chosen by a
[Voronoi tessellation](https://en.wikipedia.org/wiki/Voronoi_diagram) based on population.
While this is my favorite, it is a hopeless cause.)

But the House!  There, we can do something constructive if we ever regain majorities in
Congress and the presidency so as to be able to pass legislation.  We could return to a
system of allocating House seats based on population without too much trouble.  

This is the basis of the 'Wyoming Rule', whose arithmetic we'll study today.  


## How Seats in the House are Allocated Now  

<a href="{{ site.baseurl }}/images/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-dkos-current.jpg"><img src="{{ site.baseurl }}/images/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-dkos-current-thumb.jpg" width="400" height="304" alt="Daily KOS: current allocation of Congressional districts by party, and population by size" title="Daily KOS: current allocation of Congressional districts by party, and population by size" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

Here's a map from Daily KOS <sup id="fn1a">[[1]](#fn1)</sup> showing the House districts
in 2022, colored by party of the representative and how their district went for
president.  

The size indicates the population of the district.  The usual depiction shows the
districts at their normal geographic size, giving the impression that the US is a vastly
conservative, red nation.  However, most of those red districts have very few people in
them!  This representation, more faithful to population than real estate, gives a
different picture of a nation divided largely along coastal/interior, urban/rural, and
educational lines.  

__Question:__ If we're so equally divided, why is it so _hard_ for Democrats to obtain power and so
_easy_ for Republicans to either be in control or enough to block everything when
Democrats are in control?  

The answer, of course, is a complex combination of factors involving as above the
Electoral College and the Senate.  

But in the case of the House, the culprit here is the Permanent Reapportionment Act
of 1929. <sup id="fn2a">[[2]](#fn2)</sup>  This respects the constitutional requirement of
at least 1 representative per state, but caps the total size of the House at 435.  Now,
think that over for a second: you _cannot_ do both of those things _and_ simultaneously
allocate representatives in proportion to population!  The net effect is to cap the
representation of the large population, mostly urban states in favor of the rural red
states again.  

The mathematical details are a bit interesting, employing something called the
Huntington-Hill method: <sup id="fn3a">[[3]](#fn3)</sup>  

1. First allocate 1 representative to each state, which then leaves 385 seats to assign.  
2. Calculate the population per seat for each state so far, and call that the "allocation
   number" $A_s$.  If $P_s$ is state $s$'s population, then with $n_s$ seats this could be
   either $A_s = P_s/n_s$ or $A_s = P_s/(n_s + 1)$, depending on whether we count the next
   seat to be added (and it matters which you do). In what appears to be mathematical
   nonsense but an acceptable political compromise of the geometric mean.  (This is
   reminiscent of a [continuity correction](https://en.wikipedia.org/wiki/Continuity_correction),
   but I don't quite see the connection.)  
   
   $$
   A_s = \frac{P_s}{\sqrt{n_s(n_s + 1)}}
   $$

3. Allocate the next seat to the state $s$ with the largest $A_s$, i.e., the most people for
   the seats they currently have.
4. Repeat, starting again at step 2, until all seats are assigned.  

Given that you're gonna cap the House, this is as good a method as any.  But&hellip; it's
a _weird_ way to enforce the magical 435 seat cap!  


## The 'Wyoming Rule'  

A frequently proposed alternative is the Wyoming Rule. <sup id="fn4a">[[4]](#fn4)</sup>
Briefly, it proposes to scrap the Permanent Apportionment Act of 1929, and replace it by:

1. The state with the smallest population, currently Wyoming, gets 1 seat.  
2. Each other state $s$ gets a number of seats of about $P_s / P_\mbox{Wyoming}$.  

   (The "about" is because people can't resist fussing with floor, ceiling, and round to get an
   integer number of representatives.  I used rounding, below.)  

This would expand the House, and my intuition says it would preferentially expand in favor
of the blue states to undo the current red state bias.  Let's see what the arithmetic (we
can hardly call it "math"!) says.  


## What Would That Look Like?  

Let's get some data:  
- We'll start from data on population of US states and territories <sup id="fn5a">[[5]](#fn5)</sup>,
  then remove the territories, DC, and other sources of non-voting members in the House.  
- Then we'll add in the partisanship of each state's House delegation, using the 2022
  House as the most recent complete data. <sup id="fn6a">[[6]](#fn6)</sup>

We assembled those data into spreadsheets and wrote an [R script](https://www.r-project.org/)
to get some statistics on how many new delegates there would be, and their likely
partisanship. <sup id="fn7a">[[7]](#fn7)</sup>

Being good little scientists, let's first summarize what we expect the result to be, and
then compare with reality:  
- I thought the size of the House would explode, to 600-700 seats.  
- I thought the seats would be overwhelmingly in favor of the blue states, conferring a
  majority to Democrats.  
  
The results are _sorta_ like that, but more equivocal:  
1. The size of the House does go up, but only to 574.  (This agrees with the calculation
   in the Wikipedia page on the Wyoming Rule, so we're generally making sense and not lost
   in the mathematical weeds.)  
2. Then we compute the mean and standard deviation of the number of new states allocated to
   each state.  It's (to me) surprisingly close, with some bias to blue states, but not
   overwhelming:  
   ```
     Partisanship Change.Total Change.Mean Change.StdDev
   1         Blue           73        3.04          3.75
   2          Red           67        2.58          2.91
   ```
3. Doing a $t$-test with unequal variances to test the difference in means for statistical
   significance, we conclude that due to the large standard deviations, it's not
   significant:  
   ```
       Welch Two Sample t-test

   data:  House.Seats.Change by Partisanship
   t = 0.48671, df = 43.406, p-value = 0.6289
   alternative hypothesis: true difference in means between group Blue and group Red is not equal to 0
   95 percent confidence interval:
    -1.460393  2.389880
   sample estimates:
   mean in group Blue  mean in group Red 
             3.041667           2.576923 
   ```
<a href="{{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-boxplot.png"><img src="{{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-boxplot-thumb.jpg" width="400" height="400" alt="Boxplot of number of new delegates in each state, stratified by party" title="Boxplot of number of new delegates in each state, stratified by party" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
4. A boxplot of the distributions of number of new seats per state, stratified by party,
   is shown here.  

   It confirms visually that we have a _slight_ Democratic advantage, but
   not by any means overwhelming.  There's a slight advantage to Democrats both in the
   mean number of seats/state gained and in the upper outliers.

But really, we don't need statistical significance or an overwhelming majority, we just
need a majority that reflects the (barely) blue majority in the country and doesn't
advantage conservative rural districts.  Do we have that?  

Well, it depends.  Just because a state gets some new states doesn't mean we know how
those seats will be allocated.  Let's consider 2 cases:  

1. Suppose politicians are unable to resist gerrymandering &ndash; which seems like the
   safest of safe bets &ndash; and they allocate all the new seats to the majority party
   in their delegation.  Then we end up allocating only about 5 more seats to Democrats:  
   ```
  Republican Democratic 
          67         73 
   ```
2. If, on the other hand, we allocate seats in each state in proportion to the
   Republican/Democratic seats in that state, we get about a 10 seat advantage to
   Republicans:  
   ```
   Republican Democratic 
		   75         65 
   ```

Personally, I think dangling the catnip of more seats in front of the parties will drive
them to gerrymander like mad.  But I'm a grumpy old retired scientist, so I _would_ say
that, wouldn't I?  


## The Weekend Conclusion  

I was gonna call this post
[_Die Grundlagen der Arithmetik von Wyoming_](https://en.wikipedia.org/wiki/The_Foundations_of_Arithmetic),
but I had a sudden and rare attack of common sense (about Frege jokes, at least).  

Yes, the Wyoming Rule would allocate more House seats, mostly to blue states.  

But&hellip; it's a bit ambiguous how those seats would be filled, given the inability of
our politicians to resist gerrymandering.  It was strange to find out things could go
either way!  

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

__NB:__ Many of these sources are from _Wikipedia_, which I admit is not exactly high
scholarship.  On the other hand, I'm only trying to establish basic facts like population
and partisanship of House seats, for which _Wikipedia_ is perfectly fine as a source.  So
please be a little tolerant, ok?  

<a id="fn1">1</a>: S Wolf, ["Daily Kos Elections presents our guide to members of the 118th Congress and their districts"](https://www.dailykos.com/stories/2022/12/12/2140726/-Daily-Kos-Elections-presents-our-guide-to-members-of-the-118th-Congress-and-their-districts), _Daily KOS_, 2022-Dec-12. [↩](#fn1a)  

<a id="fn2">2</a>: Wikipedia Editors, ["Reapportionment Act of 1929"](https://en.wikipedia.org/wiki/Reapportionment_Act_of_1929), _Wikipedia_, downloaded 2024-Nov-22. [↩](#fn2a)  

<a id="fn3">3</a>: Wikipedia Editors, ["Huntington-Hill Method"](https://en.wikipedia.org/wiki/Huntington%E2%80%93Hill_method), _Wikipedia_, downloaded 2024-Nov-22. [↩](#fn3a)  

<a id="fn4">4</a>: Wikipedia Editors, ["Wyoming Rule"](https://en.wikipedia.org/wiki/Wyoming_Rule), downloaded 2024-Nov-22. [↩](#fn4a)  

<a id="fn5">5</a>: Wikipedia Editors, ["List of U.S. states and territories by population"](https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population), _Wikipedia_, downloaded 2024-Nov-22. [↩](#fn5a)  

<a id="fn6">6</a>: Wikipedia Editors, ["2022 United States House of Representatives elections"](https://en.wikipedia.org/wiki/2022_United_States_House_of_Representatives_elections#:~:text=of%20the%20Clerk-,Per%20state,-%5Bedit%5D), _Wikipedia_, downloaded 2024-Nov-22. [↩](#fn6a)  

<a id="fn7">7</a>: [WeekendEditor](mailto:SomeWeekendReadingEditor@gmail.com), ["R script to analyze the Wyoming Rule data"]({{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule.r), _Some Weekend Reading_ blog, 2024-Nov-22.  

- There is also [a text transcript of running this]({{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule.txt), 
  so you can check that it says what I say it said.  
- The data on district populations, percent of nation, percent of Electoral College, and so
  on is available both as
  [a tab-separated text file]({{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule.tsv)
  and as [a binary spreadsheet in Apple .numbers format]({{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule.numbers).  
- The data on district partisanship is also available as [a tab-separated text file]({{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-delegates.tsv).  
- The most useful data to consult, however, is the omnibus dataset which combines both of
  those, by doing an inner join operation on the state name.  It is also available as
  [a tab-separated text file]({{ site.baseurl }}/assets/2024-11-22-die-grundlagen-der-arithmetik-von-wyoming-wyoming-rule-omnibus.tsv).  [↩](#fn7a)  
