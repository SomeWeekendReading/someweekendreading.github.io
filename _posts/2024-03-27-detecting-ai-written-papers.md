---
layout: post
title: On Detecting Academic Papers with AI-Written Content
tags: ArtificialIntelligence CatBlogging JournalClub MathInTheNews Statistics
comments: true
commentsClosed: true
---

AI-written content is beginning to pollute everything, now including the academic
literature.  Can it be detected?  For now, yes; long term, probably not.  


## The Problem Gets Worse Daily  

[Large Language Models in artificial intelligence](https://en.wikipedia.org/wiki/Large_language_model)
get better every day at generating plausible text&hellip; for some perverse definition of
"better."  They don't so much _answer_ your question, as generate text that sounds like a
plausible answer might sound.

In test after test, they hallucinate falsehoods about which they they argue very
convincingly.  [When I tested the matter]({{ site.baseurl }}/on-chatgpt/), I was given a
number of references to read: all by famous authors, all published in prestigious
journals, all with titles that were spot-on for my question&hellip; and _all of which did
not exist!_ (Given the way LLMs operate, it would have been _more_ implausible for them to
have been real.)  

<iframe width="400" height="224" src="https://www.youtube.com/embed/oqSYljRYDEM?si=Yyntn3ke98HDVUmo" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
This is a robust behavior: these things are like Trump in that they can sound very
convincing, but when you look closely it's all flim-flam.  People _know_ this, but think
it doesn't matter, or it won't happen to them.  Lawyers have filed court briefs generated
this way which have fake cases, as the video here documents.  Judges are not amused.  

<a href="{{ site.baseurl }}/images/John_William_Waterhouse_-_Ulysses_and_the_Sirens_(1891).jpg"><img src="{{ site.baseurl }}/images/John_William_Waterhouse_-_Ulysses_and_the_Sirens_(1891)-thumb.jpg" width="400" height="198" alt="English pre-Raphaelite painting by John William Waterhouse&colon; Ulysses and the Sirens" title="English pre-Raphaelite painting by John William Waterhouse&colon; Ulysses and the Sirens" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Now, it appears that even academics are succumbing to the siren song.  You would think
academics, of all people, would at least have heard of
[Ulysses and the song of the sirens](https://en.wikipedia.org/wiki/Ulysses_and_the_Sirens_(Waterhouse)),
and know how to lash themselves figuratively to the mast.  

Alas: not so.  Almost every day I come across papers with the phrase "Certainly, here are
some ideas for your essay&hellip;" or "As a large language model, I cannot&hellip;" and so
on.  This should set off 2 levels of red flags:  
1. Why do people do this, when it's less effort to write some text yourself than to debug
   _every single word_ the BS firehose sprays at you?  
2. Why do things like this slip past peer review, or even past a cursory editorial glance?  

I have no good answers to either question, just a lot of provocative examples.  


## Today's Journal Club  

Can we do anything about this?  Say, an "AI text detector", perhaps itself based on AI?  

Given the unreliable, hallucinatory nature of LLMs it would be unwise to base such a thing
on this flavor of AI.  Other measures, of course, will work for now.  But the progress of
the field is _very_ fast, so what detects AI text today will be useless in a few months.
So the long-term answer is probably "No", other than making authors promise not to use AI
to generate their text and sanctioning them severely when caught.  

But in the short term, we might as well try.  Yesterday somebody pointed me at a pre-print on
detecting AI text in papers, and then the author publicized it thusly:  

<a href="https://twitter.com/generalising/status/1772744143476842732"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-gray-1.jpg" width="550" height="602" alt="A Gray @ X/Twitter: Preprint announcement" title="A Gray @ X/Twitter: Preprint announcement" style="margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

<img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-1.jpg" width="400" height="273" alt="A Gray @ arXiv: Estimating prevalence of LLM text in scholarly literature" title="A Gray @ arXiv: Estimating prevalence of LLM text in scholarly literature" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-1a.jpg" width="400" height="143" alt="A Gray @ arXiv: Estimating prevalence of LLM text in scholarly literature" title="A Gray @ arXiv: Estimating prevalence of LLM text in scholarly literature" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
So let's look at Gray's paper. <sup id="fn1a">[[1]](#fn1)</sup>  It's a pre-print on
[_ar&chi;iv_](https://arxiv.org/), so it's not yet peer-reviewed.  In fact, it was just
uploaded 2 days ago, so it's not likely even in the pipeline at any particular journal
yet.  So expect some rough edges, and make allowances accordingly.  

It seems he's pursuing 2 goals here:  
1. Find a diagnostic that will signal the presence of (at least some) AI-generated text.  
2. Use the diagnostic to estimate the prevalence of AI-generated text in the literature
   over time.  
   
Given the first goal, the second is clearly achievable.  It's the first goal that will get
progressively trickier as the AI systems get better.  The first thing to check would be if
a simple diagnostic works, and then make it more sophisticated as needed.

<img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-2.jpg" width="400" height="293" alt="A Gray @ arXiv: unusually frequent adjectives &amp; adverbs, and control words" title="A Gray @ arXiv: unusually frequent adjectives &amp; adverbs, and control words" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
That seems to be what they've done here: they're looking for keywords that are present
more often in AI-generated text than human-generated text, at least as trained on a corpus
of academic literature.

They used the open-access Dimensions database, where about 75% of the indexed articles are
full-text.  Open-access for peer review is admirable!  They then used a set of adjectives
and adverbs from another study, thought to be more frequent in AI-generated text.  (Oddly,
most of them are quite positive in tone.)  For comparison, there is a list of control
words, neutral in tone.  They are shown here in Gray's table.  

<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-3.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-3-thumb.jpg" width="400" height="193" alt="A Gray @ arXiv: Frequency stability of control words over time" title="A Gray @ arXiv: Frequency stability of control words over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-4.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-4.jpg" width="400" height="193" alt="A Gray @ arXiv: Frequency change of adjectives over time" title="A Gray @ arXiv: Frequency change of adjectives over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-5.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-5-thumb.jpg" width="400" height="194" alt="A Gray @ arXiv: Frequency change of adverbs over time" title="A Gray @ arXiv: Frequency change of adverbs over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Conveniently, Large Language Models became available to the public suddenly, with
reasonable quality available in 2023.  Therefore, one can just use the calendar year to
look at the onset of changes in these word lists.  

That's what we see in these 3 plots:  
- Each group of bars corresponds to a word in the table above.  The bars, color-coded,
  indicate years.  The vertical graph indicates number of papers in which a word was used,
  suitably scaled.  ("Suitably scaled" is described by a wall of word salad instead of an
  equation or two, which is a major annoyance of the paper, in my opinion!  With some
  reluctance, absence any supplement with equations, we'll just trust them tentatively.)  
- The top plot shows the behavior of the control words.  Each has admirably constant
  usage over the 5 year period of study.  
- The bottom 2 plots show the adjectives and adverbs, respectively.  It's amply clear that
  "commendable", "meticulous", "intricate", and "meticulously" spiked up in usage in 2023,
  probably indicative of AI contamination.  
  
Sadly, there were no quantitative statistical tests done, which is another weakness of the
paper after not "showing the math".  It would be nice to do ANOVA tests, say, with a nice
post-hoc Scheff&eacute; test or a Tukey HSD test, or at least _something_ of the sort to
justify objectively what seems clear by eye!  

Once the paper is submitted for peer review, I'm sure some reviewer will suggest as much.
I know I would.  (Though I'd do it helpfully, suggesting some particular examples and
pointing them at [R](https://www.r-project.org/) packages to do it.)  

<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-6.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-6-thumb.jpg" width="400" height="210" alt="A Gray @ arXiv: Frequency change of disjunctive combined terms over time" title="A Gray @ arXiv: Frequency change of disjunctive combined terms over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-7.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-7-thumb.jpg" width="400" height="210" alt="A Gray @ arXiv: Frequency change of disjunctive combined terms, including counts, over time" title="A Gray @ arXiv: Frequency change of disjunctive combined terms, including counts, over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>

Then they tried combining the terms, to see if there was an even sharper signal.
- The top plot shows what amounts to a disjunctive query, whether a document contains any
  one of the AI-related terms, in various combinations.  Clearly "intricate" OR
  "meticulous" OR "meticulously" or "commendable", on the left, showed the strongest
  signal: an 83.5% increase over baseline, according to whatever metric they use but never
  explain in mathematical terms.  
- The bottom plot here shows something similar, this time taking into account the
  frequency with which the word occurs in a document.  I say "something similar", because
  since the paper is _devoid of even a single equation,_ the word salad explanations are
  undecipherable.  But yes, frequency would be good&hellip; and the evidence agrees: using
  a word from the first group more than twice is a nice big signal (a whopping 468.4%,
  again by the metric 'explained' only by word salad).  

Amusingly, Gray reports that "outwith", a term normally used in Scottish English, is also
favo(u)red by ChatGPT as well.  There are likely other markers at the syntactic level, not
just at the word level, but those require massive amounts of syntactic parsing of the
literature.  

<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-8.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-8-thumb.jpg" width="400" height="200" alt="A Gray @ arXiv: Prevalence of articles triggering LLM-word marker over time" title="A Gray @ arXiv: Prevalence of articles triggering LLM-word marker over time" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
How big a problem is this?  Gray cites 2 lines of evidence:  
- People have occasionally listed an AI as a co-author on their papers, which is at least
  honest, if pretty brassy.  
- Surveys conducted anonymously have indicated some populations of academics have as much
  as 30% admitting to the use of AI text generation.  (Less in physics and math, more in
  other disciplines.)  

The plot here shows the mild uptick in 2023 of the percent of documents with AI
contamination (though the exact corpus of documents checked and the exact metric are a bit
more obscure).  What's of note is that the partial data for 2024 indicates 
_an accelerating trend_ of AI contamination.  

So&hellip; yes, it's a problem.  And it's getting worse.  

(And yes, I checked: Gray's paper does _not_ employ any of the AI-content trigger words,
except in quotes or in reference to the words themselves, not their meanings. So if he _did_
use AI to help write this paper, perhaps ironically, he had the good grace to cover his tracks
adequately.  That tickles me, for some reason. :-)  


## Is This a Problem Anywhere Else?  

<img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-9.jpg" width="400" height="333" alt="Yeadon, et al. @ arXiv: comparing human and GPT performance on physics coding" title="Yeadon, et al. @ arXiv: comparing human and GPT performance on physics coding" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
<img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-arxiv-10.jpg" width="400" height="166" alt="Yeadon, et al. @ arXiv: comparing human and GPT performance on physics coding" title="Yeadon, et al. @ arXiv: comparing human and GPT performance on physics coding" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Remarkably, uploaded on the same day to _ar&chi;iv_ came a paper by Yeadon,
_et al._ <sup id="fn2a">[[2]](#fn2)</sup> examining the effect of LLMs both on their own
and as assistants to physics students.  There were 50 students, 50 AI submissions, and
some in combination with various levels of prompt engineering, all rated by 3 independent,
blinded graders.  

The course was a 10 week course in applied Python for upper-division undergraduate
physicists, covering finite difference methods, numerical integration, solving first and
second order differential equations, Monte Carlo methods, and random walks.  Students had
to put Python code into Jupyter notebooks, and generate plots.  

<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-yeadon-1.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-yeadon-1-thumb.jpg" width="400" height="276" alt="Yeadon, et al. @ arXiv: Performance on physics coding task" title="Yeadon, et al. @ arXiv: Performance on physics coding task" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The first result, giving the distribution of percent correct broken down by source, is
shown here.  Several things are clear:  
- ChatGPT 3.5 and 4.0 by themselves are not particularly good.  They do, however, improve
  with some prompt engineering.  Whether "prompt engineering" is equivalent to
  "understanding the course material" is another matter.  
- The aqua colored bars are for unaided student input, and they are the clear winners.
  - Indeed, a $t$-test for difference of mean between GPT-4 with prompt engineering
    (81.1%, standard error of mean 0.8%) and students (91.9%, standard error of mean 0.4%)
    was absurdly significant at the level $p \sim 2.5 \times 10^{-10}$.  
  - They did not calculate a size of effect measure like
    [Cohen's $d$](https://en.wikipedia.org/wiki/Effect_size#Cohen's_d) &ndash; or
    [Cohen's $h$](https://en.wikipedia.org/wiki/Cohen%27s_h),
    since these are proportions &ndash; and we don't _quite_ have the information to do it
    for them.  But looking at the figure shows clear separation with no overlap, i.e., a big
    effect.)  
  
The usual assertion one hears bruited about is that AI helpers make everybody a better
performer.  Contrary to that, we see that for experienced performers are actually better
off on their own.  Perhaps this will change as AI helpers progress, but for now AI helpers
are a crutch for those less sophisticated in their fields, and actively harmful for those
who are sophisticated.  (I heard one comparison that this is like population medicine _vs_
precision medicine: what's good for people on average may not be good for high
performers.)  

One might take issue with upper-division undergrads in physics as "sophisticated".  While
that is true compared to professors, the right measure here is compared to the general
public.  Upper-division undergrad students in physics tend to be quite committed and
sophisticated, by that measure.  

I have some quibbles, like throwing out instances where the AI wrote code that threw
errors or drew blank plots.  Surely those are informative data, also?  But modulo that,
this conclusion seems firm, and in line with other papers by Yeadon on similar matters in
his bibliography.  

<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-yeadon-2.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-yeadon-2-thumb.jpg" width="400" height="276" alt="Yeadon, et al. @ arXiv: Identification of AI-generated content by reviewers" title="Yeadon, et al. @ arXiv: Identification of AI-generated content by reviewers" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
Then they addressed an issue rather like the Gray paper above: can we detect when AI was
used?  

Since the graders were blinded, their opinions can be a guide.  They rated the submissions
on a 4-point [Likert scale](https://en.wikipedia.org/wiki/Likert_scale) ('Definitely AI',
'Probably AI', 'Probably Human', 'Definitely Human').  Note that when the number of points
on a Likert scale is _even_, there is no middle position where the rater can punt.
They're forced to take sides, at least a little bit.  

The results are shown in this histogram.  

The aqua color denotes human work; note that the percent increases as we go up the Likert
scale: 8.4%, 22.4%, 73.1%, and 92.1%.  They did a
[Cochran-Armitage test for trend](https://en.wikipedia.org/wiki/Cochran%E2%80%93Armitage_test_for_trend)
to verify this objectively.  This resulted in $p \sim 0.025$ confirming the trend:
increasing confidence of the graders in human origin meant _actual_ increase of fraction
of human origin.  

In their Supplement A, they tested the concordance of the 3 graders, to see if they were
all measuring something similar:  
- An [ANOVA test's $F$-statistic](https://en.wikipedia.org/wiki/F-test) gave
  $p \sim 0.067$, above the traditional threshold of 0.05.  So the mean scores of the 3
  graders are not statistically significantly different.  
- Also, they did an
  [Intraclass Correlation Coefficient](https://en.wikipedia.org/wiki/Intraclass_correlation),
  finding ICC $\sim 0.932$, with a 95% confidence interval of $[0.91, 0.95]$ and an
  absurdly low $p$-value indicating high significance.  So the graders are highly
  correlated, and measuring something very closely related.  
  
The obvious conclusion is: yes, AI work _can_ be detected.  But unlike the work of Gray
above, it does not tell us _how_ this might be done algorithmically, just that people can
do it.  At least, they can do it for now.  

They were admirably quantitative.  While I have a few quibbles about sample rejection, the
work looks pretty solid for the detection of AI this month.  Nobody knows what will happen
next month as AI changes.  


## How Might People and AI Systems React?  

On the one hand, Gray's result that a simple diagnostic on keyword frequencies can
identify AI content is reassuring.  However, it will not long remain so: either AI systems
will evolve much better text generation, or people will simply substitute out synonyms
with a script.  (Of course, most of the instances where AI content has been caught were
from careless use, so assuming AI miscreants will be careful enough to cover their tracks
is maybe a bit of a heavy lift.)  

Mostly it will come down to using AI and hiding it, a form of
[steganography](https://en.wikipedia.org/wiki/Steganography).  There's a lot known about
steganography, ever since the days of
[Trimethius](https://en.wikipedia.org/wiki/Johannes_Trithemius), but whether humans can
keep ahead of the game is something I can't foresee.  


## Some Thoughts on What Else One Might Do  

First and foremost, the paper could be improved by some explicit equations, showing how
word counts were scaled, how the scores were computed, and so on.  This could be done in a
supplement, if one is afraid of scaring away math-phobic readers, but that's a small
concern.  

Second, some quantitative statistical testing of the markers should be done.  Something
like an ANOVA to show that the frequency of the chosen words are dramatically different
from the control words, with $p$-values for statistical significance and some measure of
strength of effect.  

Finally, it would be nice to see some awareness of the large field of
[stylometry](https://en.wikipedia.org/wiki/Stylometry), into which Gray's toes are
dipping.  As has perhaps become painfully obvious by now, your Humble Weekend Editor
worked for a couple years in the field, attempting to relate the results of early gene
expression experiments with biology papers in PubMed that might explain them.  While that
work was never published, it is very similar to work done by Orly Alter and
colleagues. <sup id="fn3a">[[3]](#fn3)</sup>  

Some computational linguistics things it would be nice to use in this work:  
- A formal [lexer](https://en.wikipedia.org/wiki/Lexical_analysis), like the 
  [Kimmo 2-level lexer](https://en.wikipedia.org/wiki/Kimmo_Koskenniemi) to find word
  boundaries in text and assign some level of function.  
- A formal [stemmer](https://en.wikipedia.org/wiki/Stemming) like the
  [Porter stemmer](https://en.wikipedia.org/wiki/Martin_Porter) to canonicalize words to
  their stems.  In particular, Gray finds useful both "meticulous" and "meticulously", 
  which would be combined by a stemmer to raise the "meticul-" stem count to good
  statistical effect.  Probably other various forms of words would combine and emerge from
  the background noise?  
- A [part of speech tagger](https://en.wikipedia.org/wiki/Part-of-speech_tagging), so they
  can explore things other than just adjectives and adverbs, apparently tagged for them by
  the Dimensions database.  
- It would be nice to have seen some knowledge of the
  [term frequency/inverse document frequency](https://en.wikipedia.org/wiki/Tf%E2%80%93idf)
  matrix that is pretty much standard for this type of work.  
- Finally, [latent semantic analysis](https://en.wikipedia.org/wiki/Latent_semantic_analysis)
  would have been good: it does a 
  [singular value decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition)
  on the TF/IDF matrix for low-rank approximations by the
  [Frobenius norm](https://en.wikipedia.org/wiki/Frobenius_norm).  It detects things like 
  synonymy/polysemy, to further generalize to the characteristics of words, not just
  particular word lists.  (This is the gist of the Alter paper.)  

So while the paper is interesting in its use of a simple diagnostic to detect AI content,
(a) the AI content will not long remain so easily identifiable, and (b) there are more
sophisticated techniques available.  Gray's paper is a good first stab at the problem.  


## The Weekend Conclusion  

<a href="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-publishers-unconcerned.jpg"><img src="{{ site.baseurl }}/images/2024-03-27-detecting-ai-written-papers-publishers-unconcerned-thumb.jpg" width="400" height="533" alt="The Weekend Publisher (below) and the Assistant Weekend Publisher (above) are unconcerned about AI." title="The Weekend Publisher (below) and the Assistant Weekend Publisher (above) are unconcerned about AI." style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></a>
The Weekend Publishers, as shown here, are pretty much unconcerned.  

I wish I could share their nonchalance, but I am, one might say, _vigorously chalanced._
I'm pretty much in the [Yudkowsky](https://en.wikipedia.org/wiki/Eliezer_Yudkowsky) and
[Bostrom](https://en.wikipedia.org/wiki/Nick_Bostrom) school on AI _vs_ human survival:
either _nobody_ gets superhuman AIs, or we all die once _anybody_ gets one.  "Nobody"
means no governments get to arrogate it to themselves in secret, either.  I have no idea
how we will enforce this, but I'm pretty sure we won't even attempt it.   Thus the future
is likely&hellip; _short._  

Think we'll get lucky?  Luck is not a strategy, but sometimes it's all we've got left.  

Polluting the literature of science, the way we force ourselves to speak truth about
nature, is a sad event.  Our inability to protect this means we probably will not be able
to protect ourselves from superhuman AIs when they come.  

[(_Ceterum censeo, Trump incarcerandam esse._)]({{ site.baseurl }}/trump-danger-test/#the-weekend-conclusion)  

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

<a id="fn1">1</a>: A Gray, ["ChatGPT 'contamination': estimating the prevalence of LLMs in the scholarly literature"](https://arxiv.org/abs/2403.16887), _ar&chi;iv_, 2024-Mar-25.  DOI: [10.48550/arXiv.2403.16887](https://doi.org/10.48550/arXiv.2403.16887). [↩](#fn1a)  

<a id="fn2">2</a>: W Yeadon, A Peach, CP Testrow, ["A comparison of Human, GPT-3.5, and GPT-4 Performance in a University-Level Coding Course"](https://arxiv.org/abs/2403.16977), _ar&chi;iv_, 2024-Mar-25.  DOI: [10.48550/arXiv.2403.16977](https://doi.org/10.48550/arXiv.2403.16977). [↩](#fn2a)  

<a id="fn3">3</a>: O Alter, PO Brown, D Botstein, ["Singular value decomposition for genome-wide expression data processing and modeling"](https://www.pnas.org/doi/abs/10.1073/pnas.97.18.10101), _PNAS_ 97:18, 10101-10106, 2000-Aug-29.  DOI: [10.1073/pnas.97.18.10101](https://doi.org/10.1073/pnas.97.18.10101). [↩](#fn3a)  
