---
layout: post
title: The mutant coronavirus&colon; will the vaccines still work?
tags: COVID JournalClub MathInTheNews PharmaAndBiotech
comments: true
---

[Somebody asked me]({{ site.baseurl }}/tags/#SomebodyAskedMe) whether the COVID-19
vaccines currently being used would work _vs_ the mutant form of SARS-CoV-2 now driving COVID-19
in the UK.  Looks like it probably will, though nobody _really_ knows.  What will
_definitely_ work: masking, social distancing, working from home, no gatherings beyond a
single household, having adequate food &amp; medicine stored, getting a flu vaccination,
and not being a super-spreader of misinformation.  


## What's the sitch?  

The virus behind COVID-19, euphoniously yclept SARS-CoV-2, has mutated.  Nothing
especially unusual about that; it's what viruses _do_, and how evolution _works_.  RNA
viruses mutate especially fast &ndash; this is why you need a new flu vaccine every year.

Most of the mutations seen in SARS-CoV-2 are of no particular import.  Mutations are more
or less random, after all.  Even unimportant mutations can be used as barcodes, to tell us
exactly which variant from which part of the world has infected a patient.  But 
we care mostly about mutations in the gene for the spike protein that SARS-CoV-2 uses to
bind to the ACE2 receptor in human epithelial tissue.  That's the key protein to which the
Pfizer and Moderna vaccines alert your immune system.  A major change here could be what's
called an "escape mutation", potentiating vaccine resistance.  

<img src="{{ site.baseurl }}/images/2020-12-31-coronavirus-mutation-vs-vaccine-hou.jpg" width="400" height="200" alt="Science: D614G variant is efficient replicator" title="Science: D614G variant is efficient replicator" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
So how do we characterize this new variant, especially in the spike protein?  A _Science_ paper 
by Hou, _et al._ <sup id="fn1a">[[1]](#fn1)</sup> has the goods:  
- This variant has a D614G mutation in the spike protein, in addition to 16 other
  mutations elsewhere.  Here's what that means:
  proteins are basically long linear strings of amino acids that fold up into proteins,
  and this is a specific amino acid substitution at a particular place. Each amino acid
  type is represented by a letter of the alphabet.  So a D614G mutation means at the 614th
  amino acid position on the protein, substitute the original D (aspartic acid) with G (glycine).  
- This version of the virus transmits significantly faster in animal models
  (ACE2-transgenic mice and Syrian hamsters); it _may_ transmit faster in human as well,
  though that takes time to verify.  It's unclear to me if the increased transmission is
  because the  spike protein is better at binding to ACE2, or if any of the other
  mutations do something (e.g., increase transcription rates of viral proteins once it's
  infected a cell).  But empirically, it transmits a bit faster and it about as deadly as
  the ancestral strain.  
- __Bad news:__ It does not seem to have higher mortality than the ancestral virus;
  however, increased transmission rates with constant mortality can still lead to more deaths.  
- __Good news:__ It _does_ show about the same sensitivity to neutralizing antibodies,
  i.e., antibodies that would neutralize the ancestral virus also get this one.  

<img src="{{ site.baseurl }}/images/2020-12-31-coronavirus-mutation-vs-vaccine-hou-neutralization.jpg" width="400" height="328" alt="Hou, et al.: Abs neutralizing wild-type SARS-CoV-2 also work vs mutant" title="Hou, et al.: Abs neutralizing wild-type SARS-CoV-2 also work vs mutant" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
Looking at Figures 2 H &amp; J from their paper underscores the good news.  These are
dose-response curves, each showing the neutralization of the wild-type and mutant
viruses.  The agents used were either sera from recovered patients, or artificial
antibodies made to fight the wild-type.  

<img src="{{ site.baseurl }}/images/dope-slap.png" width="329" height="195" alt="The Car Talk 'dope-slap'" title="The Car Talk 'dope-slap'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
(__NB__: In Figure 2 H (top), the sera are being _diluted_ as you move to the right on the
horizontal axis.  So antibody concentrations increase _to the left_.  In Figure 2 J
(bottom), the concentration of therapeutic antibodies increase _to the right_ on the
horizontal axis.  So the curves actually are more or less similar in Figures 2 H &amp; J.
No, I dunno why they did that; it seems at least worthy of a 
[Boston _Car Talk_ "dope-slap"](https://www.bostonglobe.com/ideas/2015/04/25/car-talk-lives-dictionary/6Ah5sXEGHIbGmR9FDkj5nK/story.html)
from the journal's referees: make the axes mean the same thing in the same direction!
But then, I'm a grumpy old retired scientist who apparently
entertains dope-slap fantasies.  So there's that much in their defense.)  

Without getting out in the weeds of detail on what these curves mean (though that's a
pleasant passtime in itself!), basically it shows in each plot that the pair of curves for
the wild-type and the mutant virus are more or less comparable.  _If an antibody works
against the wild-type virus, it also works against the mutant type virus about as well._


## Is it in the US yet?  

<img src="{{ site.baseurl }}/images/2020-12-31-coronavirus-mutation-vs-vaccine-zimmer.jpg" width="400" height="512" alt="NYT: new coronavirus variant from UK found in Colorado" title="NYT: new coronavirus variant from UK found in Colorado" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>

Not to be too American-centric about it, but: yes.  The _New York Times_ reports 
<sup id="fn2a">[[2]](#fn2)</sup> (via rather accomplished popular science writer Carl Zimmer
and colleagues) that the UK mutation has been found in a patient in Colorado.  

Alarmingly, this patient has no travel history to the UK or anywhere else recently.
He got it somewhere, but we don't know how and thus can't try to prevent it with public
health measures.  If, that is, Americans could be persuaded to take public health measures
seriously.  Which is, as you may have noticed, in some doubt.  

And really, we _must not be American-centric about a world public health problem_.  As we 
[recently noted from Dr Tedros of the WHO]({{ site.baseurl }}/youre-scaring-me/#not-just-your-body-your-choice-you-live-with-the-rest-of-us), nobody is safe until everybody is safe.  So
the only sane response is to&hellip; _make everybody safe_.  


## So&hellip; vaccine or no?  

<img src="{{ site.baseurl }}/images/2020-12-31-coronavirus-mutation-vs-vaccine-wise.jpg" width="400" height="215" alt="BMJ: new coronavirus variant seen in UK" title="BMJ: new coronavirus variant seen in UK" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
A news article in the _BMJ_ <sup id="fn3a">[[3]](#fn3)</sup> reports on the relationship
to vaccines.  (Though, curiously, they report the spike mutation as N501Y instead of
D614G, so maybe it's yet _another_ variation?)  

The most relevant bit is this:  
> __Will the vaccine still work?__  
>  
> The new variant has mutations to the spike protein that the three leading vaccines are targeting. However, vaccines produce antibodies against many regions in the spike protein, so __it’s unlikely that a single change would make the vaccine less effective.__  
>  
> Over time, as more mutations occur, the vaccine may need to be altered. This happens with seasonal flu, which mutates every year, and the vaccine is adjusted accordingly. The SARS-CoV-2 virus doesn't mutate as quickly as the flu virus, and the vaccines that have so far proved effective in trials are types that can easily be tweaked if necessary.  
>  
> [Sharon Peacock, director of [COG-UK](https://www.cogconsortium.uk/data/)] said, "With this variant __there is no evidence that it will evade the vaccination or a human immune response.__ But if there is an instance of vaccine failure or reinfection then that case should be treated as high priority for genetic sequencing."  

So&hellip; yeah, the vaccines still look good.  Especially the dose-response curves above,
showing neutralization of the _new_ virus by antibodies against the _old_ virus.  

And really, 
[the same stuff everybody's been telling you to do, even on this crummy little obscure blog,]({{ site.baseurl}}/youre-scaring-me/#what-you-can-do) 
still works against the new variant as well, until you can _get_ a vaccine.  

---

## Notes &amp; References  
<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: Y Hou, _et al._, ["SARS-CoV-2 D614G variant exhibits efficient replication ex vivo and transmission in vivo"](https://science.sciencemag.org/content/370/6523/1464), _Science_ 370:6253 (2020-Dec-18), pp 1464-1468. DOI: 10.1126/science.abe8499 [↩](#fn1a)  

<a id="fn2">2</a>: C Zimmer and B Pietsch, ["First U.S. Case of Highly Contagious Coronavirus Variant Is Found in Colorado"](https://www.nytimes.com/2020/12/29/health/uk-coronavirus-variant-colorado.html), _New York Times_, 2020-Dec-29. [↩](#fn2a)  

<a id="fn3">2</a>: J Wise, ["Covid-19: New coronavirus variant is identified in UK"](https://www.bmj.com/content/371/bmj.m4857), _BMJ_ 2020:371 (2020-Dec-16), m4857.  DOI: 10.1136/bmj.m4857 [↩](#fn3a)  
