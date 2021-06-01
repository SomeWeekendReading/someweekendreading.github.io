---
layout: post
title: Reading the RNA in the Pfizer &amp; Moderna vaccines
tags: COVID MathInTheNews PharmaAndBiotech 
comments: true
---

Have you ever wondered if you could make sense of the RNA code in the Pfizer or Moderna
vaccines, if you could just read it?  With some help, you can now do exactly that.  

## Availability of the RNA sequences and what that doesn't mean  

As we [reported earlier this month]({{ site.baseurl }}/vaccine-mRNA-seq-on-github/), the
RNA sequences for both the Pfizer and Moderna vaccines have been posted on 
[GitHub](https://github.com/NAalytics/Assemblies-of-putative-SARS-CoV2-spike-encoding-mRNA-sequences-for-vaccines-BNT-162b2-and-SmRNA-1273).  

People have said all sorts of damn fool things about RNA vaccines in general, and about
this new reopsitory in particular.  It is _not_ a recipe for making your own version of
the vaccine, since there's _very_ elaborate chemistry in the lipid nanocapsule, a complex
set of buffers and preservatives to make it go into solution in a useful way, and about a
squillion other things.  It's a bit like knowing the instruction set of a computer: if you
think that makes you able to _build_ a computer, you're 
[a couple conses shy of a cold load](https://ml.cddddr.org/bug-lispm/msg00265.html).  

While an argument can be made that this is proprietary intellectual property, the
counterargument runs that it is (a) an insignificant slice of the total IP necessary to do
anything, and (b) all the tricks in it are well-known (by people who know such things).  

The goal of this post is for us to become one of the people who know such things.  


## An explainer piece on the vaccine RNA  

<iframe width="373" height="210" src="https://www.youtube.com/embed/RntuQ_BULho" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"> </iframe>
<iframe width="373" height="210" src="https://www.youtube.com/embed/JfwlKMZrY0U" allow="accelerometer; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"> </iframe>
Bert Hubert wrote a masterful tutorial <sup id="fn1a">[[1]](#fn1)</sup> last Christmas,
explaining the sequence of the Pfizer RNA.  Interestingly, he explained (some of) the
hacks done to it to make it a better vaccine, not just a copy of the virus RNA.  It makes
a difference: the raw sequence of the SARS-CoV-2 virus would be terrible as a vaccine.  

His explainer is so good, there are multiple video explainers-of-the-explainer available;
here are two of them to which Bert himself referred.  


## Explaining the explainer  

You really should read Bert's piece (about a 20min read).  But&hellip; since we both know
you probably won't do that, here's a quick summary.  (But really, his explanation is
probably better than mine.)  

<img src="{{ site.baseurl }}/images/2021-04-08-reading-mrna-vaccines-pfizer-seq.jpg" width="400" height="206" alt="Bert Hubert: Beginning of Pfizer/BioNTech vaccine RNA sequence" title="Bert Hubert: Beginning of Pfizer/BioNTech vaccine RNA sequence" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
The Pfizer sequence was [apparently published by the WHO last September]({{ site.baseurl }}/assets/2021-04-08-reading-mrna-vaccines-11889.doc).  It looks more or less like this, showing the first 500 nucleotides of the RNA.  There are a total of 4284 nucleotides in the whole thing.  

All clear, right?  No, of course not, unless you are a ribosome used to reading this sort
of thing to make proteins.  (If  you are an intelligent ribosome who reads my blog, please
get in contact.  I'd very much like to interview you: you're either an incredible miracle
or someone with an interesting delusion.  Possibly both.)  

<img src="{{ site.baseurl }}/images/2021-04-08-reading-mrna-vaccines-who-toc.jpg" width="400" height="110" alt="WHO: vaccine table of contents" title="WHO: vaccine table of contents" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
So let's break down how that sequence works.  It turns out it has some degree of
modularity, i.e., we can point to bits of it and explain what they, and only they, do.  
- Both graphics above came from 
  [the WHO report]({{ site.baseurl }}/assets/2021-04-08-reading-mrna-vaccines-11889.doc)
  from the International Nonproprietary Names Programme in September 2020 (though the
  original now seems to have been moved somewhere else).  
- RNA consists of a chain of 4 nucleoties/bases: adenosine (A), cytosine (C), guanine
  (G), and uracil (U).  So the sequence above (almost) tells you how to put those 4
  nucleotides together to make something.  That "something" gets fed through a ribosome,
  which through outrageous Rube Goldberg machinery, assembles a corresponding protein out
  of amino acids.  The proteins go off and do all sorts of things, like mostly
  everything.  
- In order for a ribosome to recognize RNA a meaningful, there has to be a recognition handshake:
  this is the GA cap at the front.  To a ribosome, this means: "you can process this".
  So that's the "cap" thing on the left end, where a ribosome starts looking.  I dislike
  comparisons to computer code, since those are inevitably misleading, but this really
  does look like a [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)).  
- Now, I just got done telling you an RNA sequence was a string of letters from the
  alphabet of ACGU.  But&hellip; what's that thing that looks like a capital Greek &Psi;
  doing in there?  [Well!]({{ site.baseurl}}/moderna-vaccine-passes-vrbpac-review/#fn2)  
  - Your body realio-trulio despises the idea of foreign DNA or RNA running around loose.
    Might be a virus, or something.  So it will utterly destroy the natural RNA as it came
    from SARS-CoV-2, faster than it could be of any use in vaccination.  
  - To prevent that, we need __biohack #1__: change every uracil (U) to
    1-methyl-3'-pseudouridylyl (&Psi;).  It doesn't matter exactly what that &Psi; is, so
    long as you understand its kinda like U in terms of what a ribosome will do, but
    different enough not to trigger alarms in the immune system that get it destroyed.  
  - I believe this trick is due to Weissman &amp; Karik&oacute; at Penn.  (Though
    apparently Penn treated Karik&oacute; somewhat badly.)  
- Next comes a gizmo called the 5' UTR ("five-prime UTR"), or "untranslated region".  
<img src="{{ site.baseurl }}/images/2021-04-08-reading-mrna-vaccines-nucleotide-directionality.jpg" width="220" height="257" alt="Wikipedia: directionality in nucleotide sequences" title="Wikipedia: directionality in nucleotide sequences" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
  - What's with the "five-prime" business?  Molecules with carbon rings get the carbons
    numbered, so we can talk to each other about which atom we mean.  As shown in the
    picture, nucleotides have such a ring, so the carbons are numbered 1-5.  The way
    things shake out, it's carbons 3 and 5 that make the bonds to the next nucleic acid.
    (The "prime" business is another story, irrelevant here.)  So the 5' end just tells
    you you're starting at the start end of the string of nucleic acids, and the 3' end is
    at the back end of the string.  
  - Ok, fine: "5-prime" means "in the beginning".  So what do the next 51 bases do, and if
    they're untranslated (not made into protein), why bother?  It's the thing that
    initially clips onto the ribosome, so it can start reading.  Basically, it's just
    enough space for a ribosome to fit and then start reading what's after the 5' UTR.  
  - Also, it instructs the ribosome a bit about when to make the protein and how much of
    it.  Pfizer has supplied here a 5' UTR that says _make a boatload of this protein, and
    do it right this very minute_, cribbed from the alpha globin 
    gene <sup id="fn2a">[[2]](#fn2)</sup>, but tweaked even harder to force more protein.
    This is __biohack #2__.
- Next up is a short bit called the S glycoprotein signal peptide.  
  - This says what to do with the protein once the ribosome has made it.  The version in
    the vaccine says to export it via the endoplasmic reticulum, which ends up displaying
    the protein on the cell surface for the immune system to see, and freak out about.
    Here's part of Bert's comparison, calling out the changes with "!":  
```
          3   3   3   3   3   3   3   3   3   3   3   3   3   3   3   3
Virus:   AUG UUU GUU UUU CUU GUU UUA UUG CCA CUA GUC UCU AGU CAG UGU GUU
Vaccine: AUG UUC GUG UUC CUG GUG CUG CUG CCU CUG GUG UCC AGC CAG UGU GUG
               !   !   !   !   ! ! ! !     !   !   !   !   !           !
```
  - But wait, there's more!  There are a number of changes here between the vaccine
    version and the viral version.  Each time it changes a U/&Psi; to a C, in ways that
    _do not affect_ the protein being made (e.g., UUU &rarr; UUC is a synonymous
    substitution).  This is because RNA with higher GC content gets converted more
    efficiently to protein.  __Biohack #4.__  
  - There's one other change (A &rarr; U) that prevents the formation of a hairpin RNA,
    that would bind to itself too tightly to be of  use.  __Biohack #5.__  
- Next are 3777 bases that code for the spike protein amino acids.  
  - They've also got a lot  of synthesis-ehancing GC increases.  __Biohack #6.__  
  - But then there's __biohack #7:__ in exactly 2 places, the amino acid in the
    resulting protein is actually _changed_ to proline instead.  Why?  
    - In the actual virus, the shape of the spike protein is stabilized by being attached
      to the rest of the virus particle.  
    - But in the vaccine, we have _just_ the spike, and in its original form it's not
      stable.  It would fold up the wrong way, and your body would produce antibodies that
      don't correspond to what's on the actual virus. This was a discovery of the 
      [Mclellan group at UT Austin](https://www.mclellanlab.org/), in their 2017 work on 
      the MERS virus <sup id="fn3a">[[3]](#fn3)</sup>: if you substitute proline, it gets
      more rigid and stays in the right shape.  (Once again, we're very lucky: RNA
      vaccines came along at just the right time, and our previous knowledge of MERS and
      SARS prepared us for being able to make the COVID-19 vaccine.)  
  - The protein ends with 2 stop codons, i.e., instructions to the ribosome that this is
    the end of the protein.  The actual virus has only 1 stop codon, so this is 
     __biohack #8.__  
- Then there's the 3' UTR.  These are somehat mysterious beasts today, but they have
  something to do with protein stability, rate of translation, and a few other things.
  Pfizer scientists here picked a particularly efficient one of the the human genome (the
  12S riobosomal protein).  So that's __biohack #9.__  
- Then there's the poly-A tail: polyadenylation means a lot of AAAAAAA's at the end.  
  - This is so the RNA can be _re-used many times_: it loses a few A's at the end each time
    through the ribosome so to make it get used a lot they provided a lot of A's.
    __Biohack #10.__  
  - Finally, there's a funny linker (GCAUAUGACU) that breaks up the poly-A tail into segments.
    This is _well beyond_ anything I know much about, but apparently there's a paper 
    <sup id="fn4a">[[4]](#fn4)</sup> saying that segmented tails make everything better in
    some complex ways.  So that's __biohack #11.__  


## What's it all mean?  

This bit of RNA has been _considerably_ engineered by Pfizer to optimize for getting past
the immune system, optimizing for protein translation speed &amp; amount in several ways,
improving the stability of the spike protein away from the rest of the virus, and so on.  

Bert has guided us through the weeds to see at least 11 biohacks to do this.  Really, go
read his piece, since he probably explains things better than me.  

What struck me was how much of all this engineering has come to light in just the last
couple of years.  Enormous preparation on RNA vaccines and knowledge of the previous
coronavirus outbreaks (MERS and SARS) meant that we had just exactly the right tools, at
the right time, in the right hands.  

Be thankful.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: B Hubert, ["Reverse Engineering the source code of the BioNTech/Pfizer SARS-CoV-2 Vaccine"](https://berthub.eu/articles/posts/reverse-engineering-source-code-of-the-biontech-pfizer-vaccine/), [_BertHub.eu_ blog](https://berthub.eu/), 2020-Dec-25. [↩](#fn1a)  

<a id="fn2">2</a>: K Asrani, _et al.,_ ["Optimization of mRNA untranslated regions for improved expression of therapeutic mRNA"](https://www.tandfonline.com/doi/full/10.1080/15476286.2018.1450054), _RNA Biology_ 15:6 (2018), 756-762. [↩](#fn2a)  

<a id="fn3">3</a>: J Pallesen, _et al.,_ ["Immunogenicity and structures of a rationally designed prefusion MERS-CoV spike antigen"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5584442/),
_Proc Natl Acad Sci USA_ 114:35 (2017-Aug-29), E7348-E7357. PMC5584442. [↩](#fn3a)  

<a id="fn4">4</a>: Z Trepotec, _et al.,_ ["Segmented poly(A) tails significantly reduce recombination of plasmid DNA without affecting mRNA translation efficiency or half-life"](https://rnajournal.cshlp.org/content/25/4/507.long), _RNA Journal_, 2019-Jan-15. DOI: 10.1261/rna.069286.118. [↩](#fn4a)  
