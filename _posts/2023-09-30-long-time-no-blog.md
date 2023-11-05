---
layout: post
title: Long Time, No Blog?
tags: About Beauty CatBlogging CorporateLifeAndItsDiscontents COVID NotableAndQuotable PharmaAndBiotech Politics Sadness
comments: true
commentsClosed: true
---

So&hellip; long time, no blog, eh?  


## _Multissimae Apologiae_

Yes, I pretty much went dark from mid-August through the end of September.  (And yes, this
post is back-dated by a few days to appear on Sept 30.  I just couldn't bear the idea that
I blogged _nothing_ in the month of September.)  

Lots of things going on:  
- persistent mild cognitive impairment (though _sloooowly_ healing?) as one of the
  sequelae of COVID-19 a year ago,  
- the return of depression that's been a lifelong companion, though this time at some
  scarier levels necessitating in anti-depressants,  
- some kind of non-COVID-19 virus that hung on for _weeks,_ and
- a couple urgent issues that required full-time attention (with my phase now finished,
  apparently successfully).  

So while I've collected lots of articles thinking "I should blog that", no blogging
resulted.  Apologies to all 6 of my readers globally, in case you were worried.  Also
apologies to all 8 billion - 6 of the rest of humanity, for not putting up articles for
you to ignore. :-)  

I have to do a lot of work to get back into blogging shape, though:  
- __Comments__ haven't worked for most of a year, ever since Heroku sank their free accounts.
  So I have to figure out the details of how to host [Staticman](https://staticman.net/)
  on something like [Render](https://render.com/)'s free accounts, or find a replacement.  
- __Page view counts__ haven't worked since April, since [countapi](https://countapi.xyz/) went
  dark.  It appears the developer sold it to a commercial interest (good for them!), and
  had to shut down the free service (bad for me).  So we gotta find a replacement service,
  basically a key-to-integer database service.  I'd really rather not write my own!  


## Of Note in the Meantime  

During my sluggardly absence, many events of note occurred.  Only the most deeply
disturbed of persons would agree with me that these are the high points:  

<img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-petrov.jpg" width="200" height="219" alt="Wikimedia: Stanislaw Petrov in 2016" title="Wikimedia: Stanislaw Petrov in 2016" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
1. __Petrov Day:__ We missed Petrov Day, last Sept 26!  Though it's apparently mostly an
   [Effective Altruism movement](https://en.wikipedia.org/wiki/Effective_altruism) thing,
   it seems generally worthwhile to all of us here at Chez Weekend.  
   
   We've celebrated it for the last 3 years
   ([2022-Sep-26]({{ site.baseurl }}/petrov-day-2022/), 
   [2021-Sep-26]({{ site.baseurl }}/petrov-day-2021/), and
   [2020-Sep-26]({{ site.baseurl }}/petrov-day/)).  So we're sad to have missed
   it this year, which was the 40th anniversary of the (non-)end of the world.  
   
   __Celebrate on your own:__ Do something that does _not_ end the world, ideally making the
   world robust against destruction.  Get vaccinated.  Vote Democratic (in the US).
   Donate to charities.  Be kind.  
<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-COVID-vax-novax-death-rates.png"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-COVID-vax-novax-death-rates-thumb.jpg" width="400" height="292" alt="OWiD: Age-adjusted weekly COVID-19 deaths, by vax status" title="OWiD: Age-adjusted weekly COVID-19 deaths, by vax status" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
2. __COVID-19:__ Contrary to everybody, or at least the shrill media voices and commonly held opinion,
   COVID-19 has _not_ gone away.  

   Via [Jeff Shallit](https://twitter.com/shallit43/status/1677446858195468289), consider this
   graph from _Our World in Data_ of weekly death rates from COVID-19, stratified by vax status.  It's
   age-standardized, to account for the vaccination rate differences between older and
   younger people.  The vertical axis is the death rate per 100,000 people.
   
   The blunt-trauma-obvious conclusions:
   - Unvaccinated people, in the orange curve, had _huge_ death rates at the end of 2021,
     and since then have had lower, but sustained death rates _higher than anybody else._  
   - The blue curve shows people who got vaccinations up to, but not including, the
     bivalent booster from this spring.  Note how dramatically _lower_ their death rate is
     compared to the unvaccinated.  
   - The green curve shows those who _also_ got the bivalent booster (starting in late
     2022, when it became available).  Note that this is the best curve of all, i.e.,
     _this is where you want to be!_  
     
   __The moral of the story:__ Get vaccinated.  Anybody who tells you otherwise is pulling
   the wool over your eyes, and it doesn't matter why they're doing that.  You should
   live, and not die.  
<a href="https://twitter.com/NobelPrize/status/1708780262883017166"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-nobel.jpg" width="400" height="577" alt="Nobel Commission: Karik&oacute; &amp; Weissman" title="Nobel Commission: Karik&oacute; &amp; Weissman" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-pseudouridine-synthase.jpg"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-pseudouridine-synthase-thumb.jpg" width="400" height="150" alt="Wikimedia: pseudouridine synthase rotates a ring on uridine" title="Wikimedia: pseudouridine synthase rotates a ring on uridine" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
3. __Nobel Prize:__ As we've long predicted, the
   [Nobel Prize Committee](https://www.nobelprize.org/about/the-norwegian-nobel-committee/)
   announced that Katalin Karik&oacute; will share a Nobel Prize, as seen in this Tweet.  
   
   The key insight here was a remedy to the problem of clearance rates of mRNA from the
   body.  Your immune system isn't stupid: if it sees something that looks like viral mRNA
   running around loose, it's going to destroy it ASAP.  For mRNA therapeutics, this
   typically means the mRNA is cleared too fast for it to do its job.  
   
   They discovered an interesting substitution. Substitute uridine with pseudouridine.  As
   you can see from this illustration, the enzyme pseudouridine synthase just rotates the
   hex ring attached to uridine, making it a different isomer.  Little things like this
   can fool a lot of cells into letting a molecule past their defenses.  
   
   Then you can thread the needle between being:  
   - different _enough_ from viral mRNA that the clearance rate from the body is pretty
     slow, but  
   - similar _enough_ that in a cell it will still transcribe the viral spike protein which
     elicits the immune response of the vaccine.  
   
   We've talked about the practical application of this before, when 
   [we discussed the content of the sequences in the Pfizer &amp; Moderna vaccines]({{ site.baseurl }}/reading-rna-vaccines/).
   Look there for some discussion of the practical details.  
   
   __The bottom line:__ In the meantime, this is a well-deserved prize.  She certainly had
   to swim upstream, having been fired a couple times for pursuing such "unfruitful"
   research.  The actual fruit is saving something like 100s of millions of human lives,
   and opening a new era of both vaccinations, cancer therapies, and immune therapies.  
<img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-solastalgia.jpg" width="400" height="305" alt="Albrecht, et al.: 'solastalgia' as emotional distress from environmental change" title="Albrecht, et al.: 'solastalgia' as emotional distress from environmental change" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
4. __A word for our times:__ Via [Sideria, Sybilla Bostoniensis](https://siderea.dreamwidth.org/)
   comes the best Word of the Day: _solastalgia,_ for the psychological distress caused by
   environmental change.  

   The paper by Albrecht, _et al._ <sup id="fn1a">[[1]](#fn1)</sup> discusses the
   psychological state of people of New South Wales living through persistent drought and
   living through open-cut coal mining.  They have pronounced "negative affect" (sadness
   or depression) and a sense of helplessness, as one might expect.  

   One also expects that, if we had taken seriously the psychological welfare of aboriginal
   peoples like Native Americans, Africans, and Australian Aborigines while being
   colonized, we would have had a word for this long ago.  
   
   We should _all_ expect everyone to experience solastalgia as climate change gets worse, and a
   billion people are forced to migrate from their no longer habitable countries.  Also
   expect the safer, wealthier countries to become more xenophobic and possibly more fascist.  
   
   __No, I don't like it either:__  Nobody likes it.  
<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-shortest-thesis.jpg"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-shortest-thesis-thumb.jpg" width="400" height="574" alt="D Rector, MIT math dept, 1966: shortest known PhD thesis" title="D Rector, MIT math dept, 1966: shortest known PhD thesis" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
5. __Shortest known PhD thesis:__ Via
   [Fermat's Library](https://twitter.com/fermatslibrary/status/1708821809355780533),
   I learned the shortest known PhD thesis.  
   
   It's an MIT math department thesis by David Rector in 1966 <sup id="fn2a">[[2]](#fn2)</sup>,
   when the author was all of 25 years old and had been at the Institute for only 4 years.
   It weighs in at a grand total of _12 pages_: 7 pages of main text, just 1 page of
   bibliography (!), and a biographical note. (You can get a copy and see for yourself
   from the reference link below.)  
   
   It must have been really good.  They say that thesis quality is inversely proportional
   to length, where the brilliant ones are brief and the others make up in brute force
   what they lacked in brilliance.  
   
   __Department of Ego Deflation:__ Mine is 265 pages.  Go ahead and draw the obvious
   conclusion after computing the ratio 265/12.  I don't mind.  Much.  
<img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-tesco-battered-sushi.jpg" width="400" height="422" alt="Tesco groceries in the UK: Battered sushi, for deep frying" title="Tesco groceries in the UK: Battered sushi, for deep frying" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
6. __British supermarkets vs sushi:__ [Various wags have been reporting](https://social.treehouse.systems/@pndc/111165550709512211)
   a new foodcrime being committed by the Tesco's grocery chain in the UK.  
   
   As you can see here, it consists of "sushi", by which they mean "fluffy" rice with
   "marinated" salmon or "white fish", coated in "crispy batter".  Apparently, one is
   meant to deep-fry this.  
   
   The mind boggles.  Japanese rice is a short-grain _sticky_ rice, not fluffy.  The rice
   is supposed to be vinegared, not a marinade in the fish.  "White fish" is an awfully
   vague category, isn't it?  
   
   And on top of that&hellip; _deep-fried sushi?!_  

   __Culinary Conclusion:__ I mean&hellip; come _on!_ I'm not one to mock anybody's ethnic
   food, but sushi is not fish &amp; chips.  Just in case somebody was unclear on this matter.  
<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-fork-bomb.jpg"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-fork-bomb-thumb.jpg" width="400" height="267" alt="Fork bomb from a furry" title="Fork bomb from a furry" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
7. __Important lessons from the internet:__ Apparently,
   [this is making the rounds](https://yiff.life/@koko/109609613688676420) in the guise of
   teaching　n00bs about the Unix command line.  I'm _pretty_ sure it's intended humorously, but&hellip;  
   
   The use of a [furry persona](https://en.wikipedia.org/wiki/Furry_fandom) just amps up
   the High Weirdness to match the environment, so nothing particularly wrong there.  
   
   But _do not run this script_ under any circumstances; it is a
   [fork bomb](https://en.wikipedia.org/wiki/Fork_bomb) (a.k.a. a "wabbit", as in
   "kilda").  It defines a function called ":" (to make it look mysterious) which, upon
   execution, creates infinite copies of itself in other processes.  _Something_ will
   crash; if you're _lucky,_ it won't be your entire computer.  

   There are a number of lessons one can learn here, none of which are about the Unix
   shell which was purported to be the subject.  
   
   __Lessons:__  
   - Furries are kinda weird.  We already knew that.  But they're mostly harmless and
     occasionally amusing.  And once in a while, they're _not_ harmless, as here.  
   - Don't run scripts handed to you by some internet rando.  Honestly.  Just don't.  
   - In fact, don't take instruction in _anything_ from an internet rando, until you've
     carefully vetted both the content and the source.  
   - Yes, I know you won't listen to me.  
<img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-glass-guardian.jpg" width="400" height="227" alt="O'Mahony @ Guardian: Philip Glass" title="O'Mahony @ Guardian: Philip Glass" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
8. __There are no pedestrian people:__
   [A variety of sources](https://zirk.us/@benjamingeer/111040780564874092) have pointed to an older
   article in _The Guardian_ <sup id="fn3a">[[3]](#fn3)</sup> about the composer Philip Glass.

   From time to time, this famous artist would support himself with "pedestrian" jobs like
   cab-driver or plumber.  On one apparently famous occasion, his customer was the art
   critic of _Time_ magazine:  

   > Throughout this period, Glass supported himself as a New York cabbie and as a
   > plumber, occupations that often led to unusual encounters. "I had gone to install a
   > dishwasher in a loft in SoHo," he says. "While working, I suddenly heard a noise and
   > looked up to find Robert Hughes, the art critic of Time magazine, staring at me in
   > disbelief. 'But you're Philip Glass! What are you doing here?' It was obvious that I
   > was installing his dishwasher and I told him I would soon be finished. 'But you are
   > an artist,' he protested. __I explained that I was an artist but that I was sometimes a
   > plumber as well and that he should go away and let me finish.__"  

   Sometimes the people you think of as "pedestrian" are anything but that.  In fact, most
   plumbers are not famous composers.  But they are _people._  Pretty much anybody, when
   you get to know them in a real way, will no longer appear "pedestrian."  

   __On finding composers among plumbers:__ It's important to honor _everybody,_
   regardless of what you think about their social status.  They are almost always more
   than meets your eye.
<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-cicle-rainbow.jpg"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-cicle-rainbow-thumb.jpg" width="400" height="267" alt="APoD 2022-Dec-07: circular rainbow over Norway" title="APoD 2022-Dec-07: circular rainbow over Norway" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
9. __The rest of the rainbow:__ People have been posting &amp; reposting a picture of a
   circular rainbow, alleged  to have been seen from an airplane at 30,000 ft altitude
   (e.g., [here](https://infosec.exchange/@ksaj/110579891721491780)).  Alas, it has a
   number of features that are unphysical;
   [it's been debunked](https://leadstories.com/hoax-alert/2023/03/fact-check-colorful-image-is-not-a-real-photo-of-a-complete-rainbow-captured-by-a-pilot-at-30000-feet.html)
   and traced back to a Chinese social media web site called Little Red Book, in reference
   to Mao.  It seems to have been AI-generated, purpose unknown.  I _almost_ posted that
   version, because it _is_, after all, quite pretty.  But something about the geometry was just
   off!  (Elliptical shape, sun in front of observer with rainbow, crossing the sun
   position, &hellip; etc.)  So I poked around and found it was fake.  

   To assuage your disappointment and mine, here's a picture of a _real_ circular rainbow,
   from the highly reputable
   [_Astronomy Picture of the Day_ web site, on 2022-Dec-07](https://apod.nasa.gov/apod/ap221227.html).  
   
   No dodgy Chinese social media sites here!  Note that the sun is behind the observer,
   the rainbow is in front, and is exactly circular with blue on the inside and red on the
   outside.  This is all as it should be.  Also: beautiful.  
   
   __What we can learn:__ The truth is beautiful.  Seek the truth.  Apply appropriate
   amounts of skepticism.  

<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-weekend-publisher-and-assistant.jpg"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-weekend-publisher-and-assistant-thumb.jpg" width="400" height="533" alt="Weekend Publisher and Weekend Assistant Publisher, in a high-level management staff meeting" title="Weekend Publisher and Weekend Assistant Publisher, in a high-level management staff meeting" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
10. __New Weekend Staff Member:__ Here at Ch&acirc;teau Weekend, we have a new staff
    member.  

    The Weekend Publisher (a.k.a. "my cat") has long been complaining of the workload
    cutting into his nap schedule.  So he hired the Weekend Assistant Publisher
    (a.k.a. "my other cat") to lighten the load.  
	
	As with many new hires, the on-boarding process has not been without its bumps.  For
    the first 2 days, the little guy was kept in a separate room with the door closed, so
    they could smell &amp; hear each other, but no more.  Then the door was opened, with a
    screen in place, so they could see but not murder each other.  Then finally they were
    both allowed into the same space.  
	
	It's been 2 weeks of cat diplomacy now.  The little guy, still just a kitten, is happy
    to try to "play" with the big guy.  The big guy is most definitely _not_ pleased with
    this development and wishes to fire the new hire.  Our Cat HR Department will not
    permit this.  So now we're at the stage where they _somewhat_ tolerate each other's
    presence, but the Weekend Publisher hisses and growls when approached by the New
    Idiot.  I'm pretty sure he's cursing, but he won't translate for me.  
	
	And it's understandable: the new guy has no manners at all, e.g., he'll try to eat his
    boss's food when the boss is _sitting right there._  It's enough to make me grab him
    and ask, "What did you _think_ would happen when you steal food from a cat 8 times
    your weight, right in front of him?!"  
	
	__Cat Diplomacy Report:__ As HG Wells, said, "Civilization is in a race between
    education and CATastrophe."  Let's hope the little guy learns some cat manners fast
    enough to avoid being murdered.  The Cat HR Department is firmly against firing, but
    wishy-washy on the subject of murder.  Because&hellip; _cats._  

## Dishonorable Mention  

And last of all, in the position of (dis-)honor: Senator Tommy Tuberville (R-AL).  His
main qualification for the Senate appears to be that he was a college football coach, and
the voters of Alabama love football and fascist/racist right-wing politics.  

So it's not terribly surprising that he's pulled a number of bonehead maneuvers.  The
latest is to hold up all senior military promotions (usually a _pro forma_ confirmation in
the Senate) because sometimes the military will help pregnant members travel to a state
where they can get the care they want, i.e., abortion.  He's so against abortion, or at
least the performative signaling of that, that he'll attempt to cripple the entire US
military.  Genius.

<img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-tuberville.jpg" width="400" height="208" alt="Griffiths &amp; Woody @ BI: Sen. Tuberville vs poetry" title="Griffiths &amp; Woody @ BI: Sen. Tuberville vs poetry" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Lately, he's been criticizing the military for being too "woke".  He says the military is
"not an equal opportunity employer", even though it is.  He apparently just doesn't like
the idea of Black senior officers.  He also recently slammed a poetry reading by sailors
on an aircraft carrier <sup id="fn4a">[[4]](#fn4)</sup>:   

> "Secretary [Carlos] Del Toro of Navy, he needs to get to building ships, get to
> recruiting, and he needs to get wokeness out of our Navy," Tuberville said Wednesday
> evening on Fox News.  "We've got people doing poems on aircraft carriers over the
> loudspeaker. It is absolutely insane the direction we're headed in our military."  

Sigh.  If the sailors of the _USS Abraham Lincoln_ or the _USS Gerald Ford_ want to throw a
poetry slam in their off-duty hours, that's great.  Tuberville's apparent idea that poetry
makes for bad soldiers, on the other hand&hellip; perhaps he should read Homer's _Odyssey?_  

Or better yet, consider the Greek poet Sappho.  In
[Sappho #65, "To One Who Loved Not Poetry,"](https://sacred-texts.com/cla/usappho/sph66.htm)
she wrote ca mid-600BCE of the barbaric nature of those who did not appreciate poetry:  

>κατθάνοισα δὲ κείσῃ οὐδέ ποτα  
>μναμοσύνα σέθεν  
>ἔσσετ' οὐδὲ †ποκ'†ὔστερον· οὐ  
>γὰρ πεδέχῃς βρόδων  
>τῶν ἐκ Πιερίας· ἀλλ' ἀφάνης  
>κἠν Ἀίδα δόμῳ  
>φοιτάσεις πεδ' ἀμαύρων νεκύων  
>ἐκπεποταμένα[8]  
>  
>But thou shalt ever lie dead,  
>nor shall there be any remembrance of thee then or thereafter,  
>for thou hast not of the roses of Pieria;  
>but thou shalt wander obscure even in the house of Hades,  
>flitting among the shadowy dead.  

Quoting Sappho, the famous poetess of Lesbos, contra the right-wing misogynist from
Alabama seems almost too fitting for words.  

(And no, it's not the first time I've invoked Sappho against pomposity.  Not my first
rodeo.)  


## The Weekend Conclusion  

Ok, enough for one post, anyway.  

Back to gobbling anti-depressants and hoping to heal the post-COVID-19 sequelae of mild
cognitive impairment.  I particularly hope to get some math ability back: that's been the
_one thing_ that I can contribute to society to justify my taking up space.  Having that
not eliminated, but certainly blunted, is like a visual artist going partially blind.  

I hate it.  

<a href="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-glass-hand.jpg"><img src="{{ site.baseurl }}/images/2023-09-30-long-time-no-blog-glass-hand-thumb.jpg" width="400" height="291" alt="Outer Limits: Demon with a Glass Hand" title="Outer Limits: Demon with a Glass Hand" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Ever seen the [_Outer Limits_](https://en.wikipedia.org/wiki/The_Outer_Limits_(1963_TV_series))
episode by [Harlan Ellison](https://en.wikipedia.org/wiki/Harlan_Ellison) called
["Demon with a Glass Hand"](https://en.wikipedia.org/wiki/Demon_with_a_Glass_Hand)?  True,
it aired a long time ago (1964-Oct-17), but I still remember it vividly.  And I'm sure
it's on streaming video somewhere.  

Most of the plot, while excellent, is irrelevant here.  The relevant bit: a man wakes up
with no memory.  He has a glass hand with no fingers, which is also a computer.  The hand
tells him he has to find the remaining fingers to restore its memory, and thus learn what's
going on.  Indeed, there are all sorts of incomprehensibly creepy things happening around him,
some dangerous.  (Murderous time-traveling aliens, you know.)  So finding those fingers
is a _high priority._  

That's what it's like.  Only creepier.  (And I'm not as handsome as Robert Culp, needless
to say.)  

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

<a id="fn1">1</a>: G Albrecht, _et al.,_ ["Solastalgia: the distress caused by environmental change"](https://pubmed.ncbi.nlm.nih.gov/18027145/), _Australasian Psychiatry_, 15 Suppl 1:S95-8, 2007.  DOI: [10.1080/10398560701701288](http://doi.org/10.1080/10398560701701288). [↩](#fn1a)  

<a id="fn2">2</a>: D Rector, ["An unstable Adams spectral sequence"](https://dspace.mit.edu/handle/1721.1/139704), MIT Math PhD thesis, 1966. [↩](#fn2a)  

<a id="fn3">3</a>: J O'Mahony, ["When less means more"](https://www.theguardian.com/education/2001/nov/24/arts.highereducation1), _The Guardian_, 2001-Nov-23. [↩](#fn3a)  

<a id="fn4">4</a>: BD Griffiths &amp; C Woody, ["Sen. Tommy Tuberville argues the Navy is 'too woke' because 'people are doing poems on aircraft carriers'"](https://www.businessinsider.com/tommy-tuberville-military-holds-navy-woke-poetry-aircraft-carriers-2023-9), _Business Insider_, 2023-Sep-07. [↩](#fn4a)  
