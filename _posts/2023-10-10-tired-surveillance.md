---
layout: post
title: Anti-Surveillance Fashion Tips
tags: ArtificialIntelligence Beauty CorporateLifeAndItsDiscontents Politics Sadness TheDivineMadness &Gammad;&Tau;&Phi;
comments: true
commentsClosed: true
---

Tired of all the mass surveillance in our late capitalism culutre?  Maybe it's your fashion sense.  


## Fashion Sense?!  

Look, if you're about to take fashion advice from me, think again.  Those of you who know
me IRL know why.  For the rest of you: yes, I have a fashion sense (simple clothes, loose
fitting, dark solid colors, inconspicuous); no, it is not conventional.  Taking fashion
advice from a nerd of low social skills like me will not make anything in your life
better.  


## Mass Surveillance  

[Yes, this post is post-dated.  I have an official "Long COVID" diagnosis now, for the
brain fog.  Apologies for lack of timeliness!]  

You know you're being tracked online.  Or at least you should.  

<iframe width="400" height="224" src="https://www.youtube.com/embed/gDP4P59KYPg" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>

But there are also _tons_ of cameras all over, private and government, capturing video of
general public scenes all the time.  As the video from _PBS Terra_ embedded
here <sup id="fn1a">[[1]](#fn1)</sup> mentions, the number of surveillance cameras just in
the US grew from 47 million in 2015 to 70 million in 2018.  These have been shown in 2020
to cause a 13% reduction in theft, but _no effect_ on violent crime (7:37).  

The police/government ones are usually armed with facial recognition, and are not shy
about tagging you personally in the video.  Also, highways have cameras all over that
capture license plate numbers for the same purpose.  

The authorities know where you went, who you were with, where you drove, how fast you
drove, and so on.  If there's an arrest warrant out for you, you're gonna get picked up
pretty fast.  That's the good side, at least most of the time.  The bad side is that your
info gets captured _anyway, without your consent,_ even if there's no law enforcement
reason.  It can be used against you at any time.  

Another chilling thought: the face databases on which the facial recognition software was
trained include more or less all of our faces, again without permission.  They take vast
tracts of surveillance camera footage, social media photos, state drivers license
databases, etc.  They hand-annotate the faces, and train the AI on that. The people in the
images had no choice in the matter.  

If you're Black, Hispanic, Indian/Pakistani, or Native American it gets even worse: the
error rate for darker-skinned people is much higher than for Whites.  You're more
likely to be mistaken for somebody wanted by the cops.  That can be anywhere from
inconvenient to life-breaking.  

Creepy, much?  


## Adversarial Examples  

There's a trick widely known in the machine learning community: adversarial examples.
Once you know how an AI has been trained, you can &ndash; sometimes &ndash; cook up a
perverse example that fools the system.  An early example I once saw fooled a system that
recognized kinds of fruit by taking an orange and sticking a sign on it that said "apple" &ndash;
resulting in the system thinking it was an apple.  

Can your clothing do something similar to at least _some_ of the surveillance software?  

Yes.  

<a href="{{ site.baseurl }}/images/2023-10-10-tired-surveillance-yt-1.jpg"><img src="{{ site.baseurl }}/images/2023-10-10-tired-surveillance-yt-1-thumb.jpg" width="400" height="351" alt="PBS Terra @ YouTube: An adversarial shirt" title="PBS Terra @ YouTube: An adversarial shirt" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
At about 2:35 into the video above, they begin to discuss "adversarial fashion".  Shown
here is one of their examples, a shirt that has a carefully designed pattern of noise
crafted to make a facial recognition system decide there's no face here.  What it lacks in
visual charm, it makes up for by making you hard to see for the surveillance software.  

The finer details are complicated, but in a nutshell the adversarial patterns signal that
something _else_ is present other than a face, or that there are lots of tiny faces
instead of your face.  Either way, the algorithm will doubt that a human is present.  

<a href="https://twitter.com/MorningBrew/status/1584976046197071873"><img src="{{ site.baseurl }}/images/2023-10-10-tired-surveillance-x-1.jpg" width="550" height="562" alt="MorningBrew @ Twitter: adversarial sweater" title="MorningBrew @ Twitter: adversarial sweater" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<img src="{{ site.baseurl }}/images/2023-10-10-tired-surveillance-wu-1.jpg" width="400" height="141" alt="Wu, et al. @ arXiv: adversarial attacks on object detectors" title="Wu, et al. @ arXiv: adversarial attacks on object detectors" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Here's a striking video example reported on Twitter, of some research done by Wu, _et al._
at the University of Maryland.  <sup id="fn2a">[[2]](#fn2)</sup>  

In the video, the person and those around him are initially well identified by the
software, which encloses them in blue rectangles.  But 6sec into the video, when he holds
the sweater in front of his chest, he's suddenly no longer recognized (although those
around him continue to be recognized).  

It _appears_ that the sweater has another scene of people walking on it, so perhaps it
confuses the facial recognition software as to scale?  You'll have to read the paper below
to find out!  

<iframe title="vimeo-player" src="https://player.vimeo.com/video/786819981?h=949a6d0175" width="400" height="225" frameborder="0" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
Here's another example, specifically designed to foil night-vision
cameras. <sup id="fn3a">[[3]](#fn3)</sup> Instead of adversarial patterns, it uses a more
brute-force attack: an array of high-power infrared LEDs.  

The hoodie has LEDs that put out IR at roughly the same wavelengths as used by security
cameras to get night vision, but are essentially (or nearly completely?) invisible to humans.  

They are then strobed at just the right frequency to mess with the camera's auto-expose
function: when they're off, the camera aperture dilates, and is immediately given a blast
of bright IR, causing the aperture to contract.  Repeat rhythmically as needed.  

Result: overexposure and loss of definition.  As you can see, the wearer's entire head is
obscured in a bright cloud.  


## Some Drawbacks  

So, are these things ready for prime time and use by everyone?  

Not really.  

Some reasons:  
- __Narrow adversary:__ Adversarial examples have to be
  _re-computed for each supervised classifier_ they want to fool.  
  - So this trick works against a very specific version of some very specific software.
    But in practice, the software is (a) always being updated, (b) will inevitably be
    trained to avoid adversarial examples, and (c) have its version number kept secret in
    any case.  
    
    If you ask your institution about how they process their security camera footage,
    you're very unlikely to get a cooperative answer.  If you ask your local cops how they
    process surveillance footage, you not only won't get a helpful answer but may enjoy
    the hostile scrutiny of a retaliatory investigation.  
    
    So the adversarial shirt trick works only once, and depends on you having information
    you're unlikely to get in the real world.  
  - Single system adversary  (e.g., versioning, gait recognition)  
- __Conspicuousness to people:__ These bits of clothing, or IR LEDs shining about the head
  are difficult for certain bits of software to notice, but are blaringly conspicuous to
  people.  
  - Wouldn't you look funny in a shirt that couldn't be seen by surveillance
    software, but also is, as one wag termed it, "so ugly we also wish we couldn't see it"?
    (Unless you're at a rave in Honolulu, or a Jimmy Buffett concert, both of which count as
    rare exceptions.)
  - Isn't the glare of the infrared about the head a -- literally -- shining counterexample
    to going unnoticed, when a person sees it?  

  Wouldn't a person reviewing surveillance video immediately notice a person in a loud
  shirt not tagged as a person?  Wouldn't a head hidden in glare stand out?
  
  After all, surveillance software _already_ detects persons in masks skulking about, and
  flags them for prompt hostile scrutiny.  Surely it will quickly do the same with these
  stunts.  They _may_ work once, if you can get the appropriate software spec and version
  numbers&hellip; _somehow_.  
- __Future legal issues:__ Suppose it does one, at least once.  Further suppose it's hard
  to update the surveillance software to compensate.  How long do you think it will be
  before the rich and powerful institutions and people using surveillance will cause their
  pet legislators to make it _highly illegal_ to do this?  As in, "felony" illegal."
  
  Personally, I'd wager it would not take more than around a small number of months.  
  
  So even under the most optimistic scenarios about this sort of thing working, the clock
  is immediately set to ticking before it becomes very difficult to try.  

So in the (very) short term, you might be inconspicuous to cameras but 
_conspicuous to people._  In the longer term, you will be just plain conspicuous to everything.  


## The Weekend Conclusion  

So this is not yet a workable response to surveillance, entertaining though it is.  There
are too many ways for software to catch up, or to flag it when seen as is done now with
masking.  

But need _something:_ Constant surveillance in the US of Muslims after 9/11 changed
people's behavior, in a chilling way that is incompatible with democracy.  

Albert Fox Cahn, executive director of the [Surveillance Technology Oversight Project (S.T.O.P.)](https://www.stopspying.org/)
points out that we may have differing levels of trust for institutions.  We have probably
different feelings about the local police and the IRS.  He says:
> we may trust different institutions to wield this power, but none of us trust __every__
> institution that's wielding it to do so unchecked.  

(I've misplaced the source for this one.  If you know, please tell me so I can add a
footnote!)  

Need policy solutions and regulation with very sharp teeth ready to bite those who abuse
surveillance, such as: 
- biometric privacy laws, 
- "no match/no record", 
- limits on law enforcement, etc. 

At this moment in history in the US, Cincy Cohn, executive director of EFF, says: 
> we've reached a kind of a moment in our society where we actually don't think law could
> ever be on oour side  

<img src="{{ site.baseurl }}/images/be-seeing-you.gif" width="200" height="150" alt="'Be seeing you' from 'The Prisoner', as a greeting in a highly surveilled dystopia" title="'Be seeing you' from 'The Prisoner', as a greeting in a highly surveilled dystopia" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
At least in the European Union, surveillance data can only be used to investigate
serious crimes, not for constant surveillance of the public.  THe US has no federal
policy; anybody can do anything, and the state legislatures are pretty hoplessly
gerrymandered for Republican obstinacy and power-worship.  

["Be seeing you!"](https://cinemascopicravings.wordpress.com/2021/10/24/the-prisoner-be-seeing-you/)  


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

<a id="fn1">1</a>: PBS Terra, ["What If Our Clothes Could Disrupt Surveillance Cameras?"](https://www.youtube.com/watch?v=gDP4P59KYPg), _YouTube_, 2023-Sept. [↩](#fn1a)  

<a id="fn2">2</a>: Wu, _et al.,_ ["Making an Invisibility Cloak: Real World Adversarial Attacks on Object Detectors"](https://arxiv.org/abs/1910.14667), _ar&chi;iv_, last revised 2020-Jul-22 (retrieved 2023-Oct-10).  DOI: [arXiv:1910.14667v2](https://doi.org/10.48550/arXiv.1910.14667).[↩](#fn2a)  

<a id="fn3">3</a>: M Pierce, ["The Camera-Shy Hoodie"](https://www.macpierce.com/the-camera-shy-hoodie), _Mac Pierce_ web site, undated (retrieved 2023-Oct-10).  He's giving away schematics and a standalone assembly guide to make your own, if that floats your boat. [↩](#fn3a)  
