---
layout: post
title: Reviewing Google Translate for These Blog Posts
tags: About Obscurantism
comments: true
---

A few weeks ago, we hooked up [Google Translate](https://en.wikipedia.org/wiki/Google_Translate)
for this blog.  It's time to review how well it's been working&hellip; or not.  


## The Big Button  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-button.jpg" width="157" height="45" alt="Google Translate Button" title="Google Translate Button" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>

A few weeks ago, some of you noticed the big ol' button in the upper right of each page.
It's supposed to translate the current page (and other pages in the blog when you click
links) into the language of your choice.  Really an absurd variety of languages, including
some that are more or less unused, like [Latin](https://en.wikipedia.org/wiki/Latin)
and [Esperanto](https://en.wikipedia.org/wiki/Esperanto) (though, sadly, not 
[Lojban](https://en.wikipedia.org/wiki/Lojban)).  

## How (Not?) to Do It  

Honestly, I just flailed around with Google, flopping randomly like a fish out of water until I found
an example <sup id="fn1a">[[1]](#fn1)</sup> I could reasonably imitate and put into my
blog framework.  There were enough specific examples (though little explanation!) of
invoking the deep magic of Javascript hooks into 
[Google Translate](https://en.wikipedia.org/wiki/Google_Translate) (now apparently
[Google Neural Machine Translation](https://en.wikipedia.org/wiki/Google_Neural_Machine_Translation))
that I could imitate by
[cargo cult programming](https://en.wikipedia.org/wiki/Cargo_cult_programming).

No deep thought at all;  more or less 
[unencumbered by the thought process](https://www.mprnews.org/story/2014/11/03/the-man-who-made-it-ok-to-laugh-on-public-radio#:~:text=Being%20unencumbered%20by%20the%20thought,the%20way%2C%20moments%20of%20inertia.).  

So I wasn't too confident that it would work right, and if it did work right that it would
work usefully.  


## Assessments by native speakers  

So I did what any good scientist does in this situation: I asked my friends what _they_
thought!  

Here's some of what native speakers of several other languages said:  

<!-- NB: Kramdown doesn't know GFM flag emoticons: :jp:, :fr:, :india:, :it:, :cn:, :ru:, :greece:, :romania: -->
<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-japanese.jpg" width="400" height="106" alt="Japanese" title="Japanese" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :jp: __Japanese__: The Weekend Editrix is, of course, my first resort here (as with so many
  other things).  Her judgement was that the Japanese translation quality ranged from
  "sort of ok" to "absolutely ridiculous nonsense".  It often chooses the wrong kanji, or
  translates something way too literally.  So I'm reluctant to turn this loose on my
  Japanese in-laws, who will think I'm even more of an incoherent maniac than they already
  do.  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-french.jpg" width="400" height="121" alt="French" title="French" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :fr: __French__: After reading the April Fool's post (dubious, since of all things, humor is often a danger
  to machine translation), a colleague reported more success than I thought achievable:  
> Sur la base de quelques minutes de lecture de ton texte sur le _Poisson d'Avril_ traduit
> en Français par le robot Google, je peux dire que cette traduction me semble assez
> raisonnable, certainement pas ridicule!" (On the basis of a couple minutes of reading
> your post on April Fool's Day translated into French by the Google robot, I can say that
> this translation looks to me reasonable enough, certainly not ridiculous!)  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-telugu.jpg" width="400" height="122" alt="Telugu" title="Telugu" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :india: __Telugu__: Yes, I'm happy to report that I have a friend who is a native speaker of
  Telugu!  His judgement (though he tends to the optimistic and less critical side) is:  
> Looks like the translation pretty good.  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-italian.jpg" width="400" height="138" alt="Italian" title="Italian" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :it: __Italian__: Now, with Italian I think we got an honest assessment:  
> Sadly the Italian is not so great. Maybe one can get the gist of it but there are many
> mistakes and sometimes it makes no sense.  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-chinese.jpg" width="400" height="78" alt="Chinese" title="Chinese" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :cn: __Chinese__: Here, the result was somewhat similar to Japanese, i.e., mixed and sort of
  the linguistic equivalent of slapstick humor:  
> I found the Google robot sometimes works fine, sometimes pretty mechanical and sometimes
> just nonsense.  It added more laugh reading your blog!  And I was wondering if you put
> your blog through the translation robot back and forth between English and any other
> language for a number of cycles, you might be able to get a completely new blog! :-)  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-russian.jpg" width="400" height="146" alt="Russian" title="Russian" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :ru: __Russian__: A very nice Russian colleague read several posts and confirmed: sometimes the
  translation is exactly right, sometimes unintelligible, and sometimes it just gives up
  (much like we as humans do!):  
> The quality of Google translator is very dispersal. The "Well, that didn't take long"
> was translated very well. It is hard to translate humor stuff &ndash; I hardly understand "April
> foolishness". Sometimes it just gives up for no reason, for example, translating "Today
> the Weekend Editrix got shot". Translation of "Today the Weekend Editrix got shot" is
> so-so.  
>  
> Still, it is nice to read something in Russian. I probably should try Google translate
> more often.  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-greek.jpg" width="400" height="142" alt="Greek" title="Greek" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :greece: __Greek__: A Greek colleague who works in both English and French reports that the Greek
  translation is pretty ok, outside of idiom.  Creatively, he uses Google Translate on his
  own text, to see if his French or English writing correctly translates back into Greek:  
> The Greek translation is very decent. Of course there are the odd phrases that do not
> translate literally in every language (e.g. 'Hey, it is also...' goes 'health, it is
> also...' or 'salut, it is also...') or otherwise expected to fail (32nd of March),
>particularly when case or gender correspondence is needed. Most sentences, however, are
>perfectly translated and the articles make perfect sense. I think it is a good idea to
>keep the translator option in. Things improve in informatics with time anyway.  
>  
> If you are especially concerned about how your texts translate, I have noticed, this
> depends primarily on the quality of English input and on correct punctuation in
> particular. As I am never confident of anything I write, in any language, I use Google
> Translator with English on one side and French or Greek on the other. If the translation
> is good, the original is correct. If the original is correct, it is correctly translated
> in every language. There are, of course, exceptions like the above. But who cares?!  

<img src="{{ site.baseurl }}/images/2021-05-03-google-translate-review-romanian.jpg" width="400" height="140" alt="Romanian" title="Romanian" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"/>
- :romania: __Romanian__: A native speaker of Romanian confirmed that the Italian translation was
  not so good, but that the Romanian translation appeared to be ok most of the time, or at
  least vaguely intelligible:  
>I took a look at the Romanian version - it is  surprisingly good (ok, my expectations
> were vrey very low...).Most  things make sense. However is a word by word translation -
> so any expression ends up being quite funny. Also, the translator doesn't know April's
> fool - and translated vaccine shot into gun shot .Some grammar glitches come out too  -
> as it is to be expected as English doesn't assign genders to every single object as
> Romanian does. So to sum up, the text makes sense (much better than expected, quite
> decent actually), the main points of the articles are there - but it's quite obvious an
> automatic translation with a lot of the puns and wordplays being messed up (and
> sometimes shaky grammar).It seems to be working better to the more "analytical" articles
> (e.g. the AZ clinical trial one sounds much better than the Darwin awards one which
> ended up quite awkward)  It's interesting to see so clearly  where human curation is
> still needed, as a lot of the messed up things are the cultural references and things
> that are probably best done by a human review.   


## The Weekend Conclusion  

It's fun, but&hellip; honestly, not that reliable.  

If you already know enough English to understand the original, you can sort of get the
gist of it from the machine-generated translation.  Or maybe the other way 'round: you
could use the translation to prioritize which posts to read in English to get a full
understanding.  

Sometimes, if the original isn't too idiomatic and is not meant to be humorous, the
translations are pretty ok.  

But if the original is meant to be humorous, or if you really need to have a reliable
understanding of the details, the technology of GNMT hasn't quite gotten there yet.  And
Italian got the worst reviews, for some reason.  

Kind of amusing.  Not for use in serious applications like the UN.  But this blog
_aspires_ to be "kind of amusing", so I think I'll keep it.  


## The Real Conclusion

Honestly, the most important lesson for me was renewed respect for my friends and
colleagues from all over the world.  I'm proud to know you and to have worked with all of
you.  Thanks for taking the time to offer some thoughts on an obscure little blog!  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>
<a id="fn1">1</a>: [↩](#fn1a)  
-->

<a id="fn1">1</a>: GeeksForGeeks, ["How To Add Google Translate Button On Your Webpage?"](https://www.geeksforgeeks.org/add-google-translate-button-webpage/), Geeks for Geeks tutorials, updated 2019-Aug-07.[↩](#fn1a)  
