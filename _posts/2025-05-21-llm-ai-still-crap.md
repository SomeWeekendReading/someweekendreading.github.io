---
layout: post
title: LLM AIs Are Still Buckets of Warm Sewage &amp; Broken Glass&colon; An Agony in 7 Fits
tags: ArtificialIntelligence CorporateLifeAndItsDiscontents Politics
comments: true
commentsClosed: true
---

Remember how we've been saying that current
[Large Language Model (LLM) AI's]({{ site.baseurl }}/tags/#ArtificialIntelligence)
are about as useful as buckets of warm sewage &amp; broken glass?  Yeah, about that&hellip;  


## Lucid, Confident, and _Hallucinatory_  

<a href="{{ site.baseurl }}/images/ai-tuba.png"><img src="{{ site.baseurl }}/images/ai-tuba-thumb.jpg" width="400" height="533" alt="Image posted on Mastodon 2024-Oct-22 by @tveskov@mastodon.social: 2 girls in school uniforms, one blasting a tuba in the other's face, as a metaphor for companies forcing AI on consumers" title="Image posted on Mastodon 2024-Oct-22 by @tveskov@mastodon.social: 2 girls in school uniforms, one blasting a tuba in the other's face, as a metaphor for companies forcing AI on consumers" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
We've been complaining for a while on this Crummy Little Blog That Nobody Reads (CLBTNR)
about companies shoving unwanted AI content down our throats.  

The image here, due to [@tvskov@mastodon.social](https://mastodon.social/@tveskov/113350944047429060),
captures the _zeitgeist._ Microsoft's CoPilot wants to look at everything a developer
types, GitHub wants to get its nose in making nonsensical bug reports, even _Firefox_ now
apparently wants to watch your every keystroke for targeted advertising.  

Now, if these AIs are under individual control and not corporate control, and have gotten
to a state of being actually _helpful,_ they might be ok.  

It's clear they fail the first test: they are just snitches wanting to suck up your data
and shape your behavior for high-throughput plagiarism and the profit, comfort &amp;
convenience of their corporate masters.

<a href="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-snark.jpg"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-snark-thumb.jpg" width="200" height="298" alt="Oxford Library: Front page of Lewis Carroll's 'The Hunting of the Snark: An Agony, in Eight Fits'" title="Oxford Library: Front page of Lewis Carroll's 'The Hunting of the Snark: An Agony, in Eight Fits'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
But do they pass the _usefulness_ test?  Are we just over-reacting?  

Let us hunt that particular snark, in keeping with tradition, in an agony in eight fits <sup id="fn1a">[[1]](#fn1)</sup>:  

### Fit #1: A query about the CommonLisp language  

There's a lovely computer language called [Common Lisp](https://en.wikipedia.org/wiki/Common_Lisp),
on which I have some expertise.  Within Common Lisp, there is a function called
[`format`](https://en.wikipedia.org/wiki/Format_(Common_Lisp))
for making carefully formatted output.  It has an amusingly (or ridiculously) complex
sublanguage for specifying how to write numbers, pluralizing nouns, looping, and all sorts
of things.  Here's an example making a comma-separated, conjunction-terminated, sequence
of integers:

```lisp
(format nil "~{~a~#[~;, and ~:;, ~]~}" (list 1 2 3)) ==> "1, 2, and 3"
```

I find it charming, but I admit this is an acquired taste.  

I watched a discussion about conversion of Roman numerals (yes, it does that), and some
slight deficiencies in the `format` language.  I was about to interject that you could ust
use `defformat` to write a `format` extension, when I remembered that `defformat` might
have been a [Symbolics](https://en.wikipedia.org/wiki/Symbolics) thing that didn't make it
into Common Lisp.  

<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-google-1.jpg" width="400" height="228" alt="Google's search AI: No, defformat is not part of Common Lisp." title="Google's search AI: No, defformat is not part of Common Lisp." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-google-2.jpg" width="400" height="212" alt="Google's search AI: Yes, defformat is part of Common Lisp." title="Google's search AI: Yes, defformat is part of Common Lisp." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So I thought I'd check Google with a fairly simple question: is `defformat` in Common Lisp,
or not?

Behold the results of the mighty Google search AI:  
- If you ask quite simply if `defformat` is in common lisp, you get a confident answer of
  "No."  
- On the other hand, if you _very slightly_ tweak the query to put "defformat" in quotes,
  insisting that the word actually be present in the results, the answer flips!  
  
  This time you get a very confident "Yes", this time with some slight understanding of what
  `defformat` is.  
- If you follow the suggestion of changing commonlisp to common lisp, then you get no.  

So&hellip; which is it?  

It turns out the correct answer is "no".  But the answer Google's AI gives you is
exquisitely sensitive to exactly how the query is phrased, _right down to punctuation &amp; spacing!_  It
will answer confidently, regardless of correctness.  

Unearned confidence and high persuasiveness, without true knowledge, is the mark of a BS
artist.  Almost the _definition._  

### Fit #2: Confidently wrong code generation  

An acquaintance verified our experience with the suave confidence but utter ignorance of
AIs.  He was trying to get it to generate some code:

<a href="https://sfba.social/@ColinTheMathmo@mathstodon.xyz/114536372506091090"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-colin-1.jpg" width="550" height="469" alt="Colin @ Mathstodon.xyz: ChatGPT's confident insistence on the correctness of its nonsensical code" title="Colin @ Mathstodon.xyz: ChatGPT's confident insistence on the correctness of its nonsensical code" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

Note that it _lied about the output produced,_ providing correct output that the code it
wrote could never have produced.

You spend more time disentangling the lies and debugging the BS it sprays at you than it
would take to do it yourself.  

### Fit #3: Insistence on bad legal advice  

A lawyer responded with a story about asking ChatGPT about a very slightly technical point
of California law, but which is "the sort of thing every California criminal lawyer down
to the newbiest baby lawyer in any DA's or PD's office would know".  

<a href="https://sfba.social/@jonberger/114537321444623387"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-berger-1.jpg" width="550" height="539" alt="Berger @ Mastodon: ChatGPT requires EXTENSIVE persuasion to get even elementary legal arguments correct" title="Berger @ Mastodon: ChatGPT requires EXTENSIVE persuasion to get even elementary legal arguments correct" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

If you follow the link, you'll see an elaborate, complex series of prompts attempting to
coax it in the direction of the answer known to any lawyer.

His conclusion:  

> Moral of story: do not under any circumstances get legal advice from ChatGPT.  I'm sure
> that applies in equal measure to basically any other field.  

### Fit #4: The deep roots of right-wing bias  

<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-pnas.jpg" width="400" height="270" alt="Beans @ PNAS: Historians use data science to mine the past" title="Beans @ PNAS: Historians use data science to mine the past" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-living-with-machines.jpg" width="400" height="381" alt="Ahnert &amp; Demertzi: Living with Machines" title="Ahnert &amp; Demertzi: Living with Machines*" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<iframe width="400" height="224" src="https://www.youtube.com/embed/vTc4S3Zx9IA?si=SBhk8sk9jc2kShGk" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-dsh.jpg" width="400" height="405" alt="Beelen, et al. @ DSH: Bias and representativeness in digitized newspaper collections: Introducing the environmental scan" title="Beelen, et al. @ DSH: Bias and representativeness in digitized newspaper collections: Introducing the environmental scan" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
LLM AIs so far have shown a deeply obscene tendency to favor the positions of the wealthy
&amp; powerful, a racist slant, and generally right-wing bias.  This is&hellip;
regrettable and makes them essentially useless.  

If that's an artifact of training on texts whose availability shows a right-wing bias,
then it's understandable.  You might think that, when trained on a giant corpora _without_
such bias, they would be better, yes?  

You would be incorrect in that guess, because bias creeps in subtly.  

The Joint Information System Committee (JISC) in partnership with the British Library has
the world's largest collection of digitized newspapers.  In their Victorian collections,
they attempted to capture _everything_ that was even vaguely feasible.  Since the British
Library collects original newspapers from that era, the collection should be reasonably
complete and reflect the opinions of people of that time, not just the wealthy.  

Or so you would think.  

Alas, a huge pile of work done by the Alan Turing Institute and others
<sup id="fn2a">[[2]](#fn2)</sup> <sup id="fn3a">[[3]](#fn3)</sup> <sup id="fn4a">[[4]](#fn4)</sup>
has studied this.  (The video is a brief summary, as is the "Living with Machines" report.
There are quite a few more papers.)  They show us just how _hard_ it is to escape a bias
toward the right-wing views of the wealthy upper class.  
- The expensive Victorian newspapers, with their more conservative, even aristocratic
  views, used high-quality (expensive) fonts:  
  - These tend to be more legible in the first place, compared to the cheap fonts used by
    newspapers for the non-wealthy.  
- The expensive papers used higher quality printing presses and higher quality paper,
  leading to more legible type.  
- Also, the unexamined politics of what gets collected and what is deemed too useless for
  collection will bias things toward the prejudices of the collectors.  
- Over the years, later generations have enviously imitated those expensive fonts, hoping
  for an upper-class sheen. (Ever wondered why it's called _Times_ New Roman?)  That means
  much of our text looks like them, and that's what trains our Optical Character
  Recognition (OCR)a schemes.  
	
So if you look at the OCR error rate, the upper-class newspapers scan almost flawlessly,
the middlebrow ones scan with a lot of errors (non-words), and the cheap ones scan into
almost complete nonsense.  Only aristocratic views are represented faithfully.  

From the _PNAS_ summary:

> &hellip; research led by historians at The Alan Turing Institute in London, United Kingdom,
> revealed that searching the British Library's digitized newspaper collection for
> information about life during the Industrial Revolution would return politically biased
> results. The reason: OCR was better at reading the fonts favored by more expensive and
> conservative papers than those used by less expensive, liberal ones. 

From the "Living with Machines" summary:  

> Our main finding from our first study was that JISC  radically over-sampled higher priced
> and party political newspapers and under- represented cheaper and less partisan
> ones.  
> &hellip;   
> Perhaps most striking of all, we show that the problem of poor OCR quality (the
> mistranscription of printed words during the automatic text transcription process) is not
> random.  The lists of distinctive words generated for more expensive and for Conservative
> newspapers are almost all real words, whereas the lists generated for cheaper and for
> Liberal and neutral newspapers are dominated by OCR errors (i.e. non- words). This is
> likely to be a consequence of cheaper newspapers being printed on poorer quality
>paper.  
> &hellip;  
> The Environmental Scan method demonstrates that even very large data sets contain hidden
> biases that shape how we see the past. It provides us with a means to contextualize our
> findings when we search or analyze the digital press, and it enables us to address these
> biases systematically by interrogating how the content of historic newspapers differs
> according to their political affiliation, price, place of publication and much else
> besides.  

From the video, starting at 3:08:  

> Some newspapers have no errors in them so the digitization has been virtually perfect,
> and in others most of the words - when you do word counts or other more sophisticated
> analyses - most of the words aren't words, they're what we call OCR errors, so mistakes in
> the digitization process. And the pattern is very clear: conservative and expensive
> newspapers - no errors; liberal and cheap newspapers - lots; very cheap newspapers -
> mostly errors.  And the reason that's so important and so powerful is you don't that until
> ou start applying these categories that we've brought from the Environmental Scan.  So
> when you ask a question what you're actually saying what do conservative or and/or
> expensive newspapers say about many things because they're the things where most of the
> words are recognizable to your software and therefore to your" analysis as a data
> scientist and as historian.

This reminds me of the Melian dialog in Thucydides. <sup id="fn5a">[[5]](#fn5)</sup>  The
Athenians, attempting to coerce the surrender of the neutral Melians, point out that
Athens is mighty while Melos is week.  This is usually paraphrased as "The strong do what
they will; the weak do what they must."  Here we have the economic and class version of
that:  

> The rich preserve themselves, while the poor sink beneath waves of obscurity.  

<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-thomas-gray-philosopher-cat.jpg" width="200" height="261" alt="PJ Davis: Thomas Gray, Philosopher Cat" title="PJ Davis: Thomas Gray, Philosopher Cat" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
There's a lovely old book by PJ Davis, called
_Thomas Gray, Philosopher Cat._ <sup id="fn6a">[[6]](#fn6)</sup>  It's a book
about the slow, gentle life of a Cambridge don in years gone by, as he solves academic
puzzles accompanied by his cat.  (The sort of life I desperately wanted to have as a young
man; alas, the world has mutated in ways too hostile for that to happen any more.)  The main
character avoids reading newspapers, since they are too troubling.  Instead, he reads them
in the Common Room on New Year's Day, so he can catch up with what he calls the
_gestae conservatorum_ ("deeds of the conservatives" in Latin).  

Indeed, selecting news uncritically _always_ biases toward the interest of the wealthy and
the corporations owning the media.  

### Fit #5: Prompt injection attacks  

<a href="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-linkedin.jpg"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-linkedin-thumb.jpg" width="400" height="913" alt="Kuskos @ LinkedIn: using prompt injection to subvert AI-written crawlers" title="Kuskos @ LinkedIn: using prompt injection to subvert AI-written crawlers" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The AIs are fed text that comes from crawling the web.  Two facts come to mind: 

1. Usually those crawlers are persistent, aggressive, and totally willing to violate any
   restrictions kept in a `robots.txt` file (where WWW standards say you keep the rules
   for your site).  
2. The sleazy people writing the crawlers use AI to generate them.  Consequently, the
   crawlers are a security nightmare of crappy code.  
   
When such a crawler tries to crawl the web site of a computer security
professional&hellip; hilarity does _not_ ensue.  

And so it is reported by Jonathan Kuskos OSCP ("Offensive Security Certified
Professional").  He
[reports on LinkedIn](https://www.linkedin.com/posts/kuskos_llmslop-penetrationtesting-artificialunintelligence-activity-7328799030057009154-uVhA/)
(where future employers will see what he's doing) that he can use prompt injection to get
crawlers to reveal their IP addresses, contents of `/etc/passwd`, contents of `~/.ssh`,
and RSA private keys.  

Yes, some or all of that could be hallucination.  But: he's shown that he can use prompt
injection on an AI-written crawler which doesn't sanitize its inputs (as all security
people know!).  This gets it to do all sorts of risky things that its owners did not
intend!  He can now design a working prompt injection payload, get privilege escalation,
and talk to whatever else is on the crawler's machine that looks interesting.  

<a href="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-xkcd-327.png"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-xkcd-327-thumb.jpg" width="400" height="123" alt="XKCD 327: 'Little Bobby Tables'" title="XKCD 327: 'Little Bobby Tables'" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
They're so _stupid_ they don't understand input sanitization.  That's been around for so
long it's the subject of [XKCD #327](https://xkcd.com/327/), the famous 'Little Bobby
Tables' joke: a kid gives his name as a bit of SQL which, in cautiously entered into the
school database, wipes it out.  When an AI does not understand security
_even at the level of a cartoon_, it's time to avoid trusting that AI about anything else.  


### Fit #6: Newspapers publishing imaginary book lists  

The [_Chicago Sun-Times_](https://en.wikipedia.org/wiki/Chicago_Sun-Times) was once upon a
time, a respectable newspaper.  Alas, it was eventually bought by Murdoch, and became much
more tabloidish.  

<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-booklist.jpg" width="400" height="192" alt="Edwards @ Ars Technica: Chicago Sun-Times recommends nonexistent books" title="Edwards @ Ars Technica: Chicago Sun-Times recommends nonexistent books" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
But now, it's reach a new low: their list of books recommended for summer reading was
generated by an AI, and consists of books that _do not exist!_ <sup id="fn7a">[[7]](#fn7)</sup>  

Now, it's true this was an 'advertorial', i.e., something from the ad department disguised
as editorial material.  We all expect the ad department to attempt to mess over the news
department; that's who they are.  However, this goes beyond reason itself, using an AI to
generate a list of books and not even checking that they exist!  (_Ars Technica_ confirms
that 10 of the 15 books on the list are not just fiction, but themselves fictional &ndash;
as in, failing to exist.)  

We've previously on this Crummy Little Blog That Nobody Reads inveighed against AIs
creating references to nonexistent papers. But they've also tried to cite nonexistent
cases in courts, which is a whole 'nother level of contempt for truth.  

Why in the world would you take recommendations for reading from people who can't be
bothered to write?  

Best reaction: shown here.  Yeah, I imagine writing books. Why won't you recommend _my_
hallucinations?!  

<a href="https://bsky.app/profile/slacktivistfred.bsky.social/post/3lpmqfdh67c2t"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-booklist-rxn.jpg" width="550" height="231" alt="Slacktivist @ BlueSky: why didn't they recommend MY imaginary books?!" title="Slacktivist @ BlueSky: why didn't they recommend MY imaginary books?!" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

### Fit #7: AI Summarization of Science _Worse_ Than Human

<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-roy-soc.jpg" width="400" height="212" alt="Peters &amp; Chin-Yee @ Roy Soc: Ai summarizations of science are far worse than human" title="Peters &amp; Chin-Yee @ Roy Soc: Ai summarizations of science are far worse than human" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
People apparently _love_ to use LLM AIs to "summarize" articles, saving them the immense
pain of actually reading for themselves.  We say "summarize" in scare quotes because the
result is often a scary hallucination, omitting all the special cases, cautions, and
sometimes just wildly misinterpreting the content by rounding off to a common
misconception.  

This is especially the case with scientific papers, which are full of nuance.  Now comes a
study <sup id="fn8a">[[8]](#fn8)</sup> in which it is shown that AI summaries of
scientific papers:
- Almost always report over-broad results, beyond the claims of the paper, due to
  disregarding all the stated limits.  
- In direct comparison to humans, they are _5 times more likely_ to do so
  (odds ratio = $4.85$, 95% CI $[3.06, 7.70]$, $p \lt 0.00$ &ndash; a _screamingly_
  statistically significant result).  
- Of the 10 LLMs tested, _newer variants performed worse._  

In other words: LLMs exaggerate wildly, and should _never_ be used for summarization.
Really, you should just read the things you want to know about.  Or skim them.  Or pay a
reasonably well-informed human to read them for you, and explain the results.  

The AIs will just lie confidently.  

### Fit #8: Corporate upper management can't be bothered to write their own plans  

Life is hard in newspapers.  Decades of declining revenue, squeezing new staff budgets,
hedge funds & VCs doing their slash &amp; burn, nasty billionaire owners viewing them as a
personal propaganda engine&hellip; just really, really _tough._  

At the _Washington Post,_ the British CEO Will Lews has been haranguing his journalists
about his perpetual demands to return to the office.  _WaPo_ journalists, bless their
professionally suspicious little souls, checked his memo for probability of having been
written by an AI:  

<a href="https://bsky.app/profile/benmullin.bsky.social/post/3lpsgriqxnk2i"><img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-wapo.jpg" width="550" height="526" alt="Mullin @ BlueSky: WaPo management is using AI to berate employees about return-to-office." title="Mullin @ BlueSky: WaPo management is using AI to berate employees about return-to-office." style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

Nothing says __disrespect__ like a CEO who can't be bothered to write his own corporate-speak
policy memos to the peons.  

Nothing says __incompetence__ like a CEO who does that to _journalists,_ whose business is
writing and detecting BS.  

### Fit #9: Blackmail  

(Ok, _nine_ fits.  Yes, 9 is more than 8. But this one just came to my notice, and the outrage
is too much to resist.)  

<img src="{{ site.baseurl }}/images/2025-05-21-llm-ai-still-crap-techcrunch.jpg" width="400" height="220" alt="M Zeff @ TechCrunch: Anthropic AI threatens blackmail" title="M Zeff @ TechCrunch: Anthropic AI threatens blackmail" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
From _TechCrunch_ today comes yet another reason to avoid using AIs: they may
_try to blackmail you._  <sup id="fn9a">[[9]](#fn9)</sup>  

Anthropic's latest AI is yclept "Claude Opus 4".  

If engineers tell Claude O4 personally compromising information, it often attempts to blackmail
them when they later threaten to turn it off or replace it.  Now, of course: it has not even the
_concept_ of blackmail, but it has been trained on large corpora of texts written by
humans who _talk_ about blackmail.  So, like all the LLMs, it hallucinates what a
plausible response might be, and imitates the blackmail response seen in its training texts.  

But, alarmingly: if you tell it your personal secrets, it will remember them and
potentially expose them in a way that works against you.  

> Anthropic notes that Claude Opus 4 tries to blackmail engineers 84% of the time when the
> replacement AI model has similar values. When the replacement AI system does not share
> Claude Opus 4’s values, Anthropic says the model tries to blackmail the engineers more
> frequently.  

So: do not use LLM AIs, but also _do not talk to them._  They are not your friend.  They
are not anything, really, except tools for their owners.  


## The Weekend Conclusion  

I did find one person who had what seems to me a reasonable application.  He's teaching
English to speakers of other languages, and wants to generate sample texts which are
reasonably grammatical for them to study.  Stuff like, "Write a 3-paragraph story with the
maximum number of verbs ending in '-ed'."  This is very reasonable, because the generated
texts are almost always grammatical, and _it does not matter if they are nonsense!_  

However, for everybody else:  

LLM AIs are _not_ answering your questions!  They are _hallucinating_ how a plausible,
persuasive-sounding response might sound&hellip; in some universe.  But probably not
_your_ universe.  

Do not be deceived: LLM AI's are unfit for any purpose.  

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

<a id="fn1">1</a>: L Carroll (a.k.a. Charles Dodgson), [_The Hunting of the Snark: An Agony, in Eight Fits_](https://www.gutenberg.org/ebooks/29888), MacMillan (London), 1876-Mar-29.  

The "agony in $N$ fits" business is a nod in the general direction of the structure of this Dodgson nonsense poem. He was being silly; I wish our LLM advocates were just joking as well.  [↩](#fn1a)  

<a id="fn2">2</a>: C Beans, ["Historians use data science to mine the past"](https://www.pnas.org/doi/10.1073/pnas.2508428122), _Proc Natl Acad Sci_ 122 (18) e2508428122, 2025-Apr-30.  DOI: [10.1073/pnas.250842812](https://doi.org/10.1073/pnas.2508428122). [↩](#fn2a)  

<a id="fn3">3</a>: R Ahnert &amp; L Demertzi, ["Living with Machines Final Report"](https://bl.iro.bl.uk/concern/reports/3a9af031-1ee1-4299-afef-12513e2ee3e4), _British Library Research Depository_ and _Alan Turing Institute_, 2023-Jul-17. DOI: [10.23636/psq5-6a91](https://doi.org/10.23636/psq5-6a91). [↩](#fn3a)  

<a id="fn4">4</a>: K Beelen, J Lawrence, DCS Wilson &amp; D Beavan, ["Bias and representativeness in digitized newspaper collections: Introducing the environmental scan "](https://academic.oup.com/dsh/article/38/1/1/6644524), _Digital Scholarship in the Humanities_ 38:1, 1-22, 2022-Jul-14. DOI: [10.1093/llc/fqac037](https://doi.org/10.1093/llc/fqac037). [↩](#fn4a)  

<a id="fn5">5</a>: [Thucydides](https://en.wikipedia.org/wiki/Thucydides), ["History of the Peloponnesian War"](https://en.wikipedia.org/wiki/History_of_the_Peloponnesian_War), late 5th century BCE.  

The Melian Dialogue (Book 5, chapters 84-116) was a dramatization by Thucydides of negotiations between Athens and Melos.  Melos was neutral in the war of Athens and Sparta. However, Athens insisted on surrender due to their military might, saying "the strong do as they wish and the weak do as they must".  

This, of course, contradicted everything for which the Athenians stood, in terms of ethics and democracy.  However, it exposed the "pragmatic school" of international relations, in which politicians obsessed with power wave aside all other considerations.  

Here, we see the economic &amp; class equivalent, where the rich use their means to preserve and propagate their views, while the poor sink beneath waves of obscurity. [↩](#fn5a)  

<a id="fn6">6</a>: PJ Davis, ["Thomas Gray, Philosopher Cat"](https://archive.org/details/thomasgrayphilos00davi), Harcourt Brace Jovanovich, 1988.  [↩](#fn6a)  

<a id="fn7">7</a>: B Edwards, ["Chicago Sun-Times prints summer reading list full of fake books"](https://arstechnica.com/ai/2025/05/chicago-sun-times-prints-summer-reading-list-full-of-fake-books/?utm_brand=arstechnica&utm_social-type=owned&utm_source=mastodon&utm_medium=social), _Ars Technica_, 2025-May-20. [↩](#fn7a)  

<a id="fn8">8</a>: U Peters &amp; B Chin-Yee, ["Generalization bias in large language model summarization of scientific research"](https://royalsocietypublishing.org/doi/epdf/10.1098/rsos.241776), _Roy Soc Open Sci_ 12:241776, 2025-Mar-12.  DOI: [10.1098/rsos.241776](https://doi.org/10.1098/rsos.241776). [↩](#fn8a)  

<a id="fn9">9</a>: M Zeff, ["Anthropic’s new AI model turns to blackmail when engineers try to take it offline"](https://techcrunch.com/2025/05/22/anthropics-new-ai-model-turns-to-blackmail-when-engineers-try-to-take-it-offline/), _TechCrunch_, 2025-may-22. [↩](#fn9a)  
