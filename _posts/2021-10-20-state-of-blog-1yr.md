---
layout: post
title: State of the Blog at 1 Year
tags: About Statistics TheDivineMadness &Gammad;&Tau;&Phi;
comments: true
---

This crummy little blog that nobody reads has been around for a little more than a year.
Time to look at the numbers and see how we've been doing.  


## It's been _how_ long?  

[Fiat blog](https://www.someweekendreading.blog/fiat-blog/) was on 2020-Jul-01, my 
[first day of retirement](https://www.someweekendreading.blog/retirement-of-iphegenia/).
Today is 2021-Oct-20.  According to the
[TimeAndDate.com duration calculator](https://www.timeanddate.com/date/durationresult.html?m1=07&d1=01&y1=2020&m2=10&d2=20&y2=2021&ti=on),
that is 477 days, inclusive.  So we've been blogging for:  

$$
\frac{477 \mbox{ days}}{365.24 \mbox{ days/yr}} = 1.306 \mbox{ yr}
$$

(Yeah, I missed the first blogiversary.  The line forms to the left for a chance to demand a
refund of your blog subscription fee.)  

It seems like it's time for a bit of retrospective introspection, speculation, and
haruspication.  Or words to that effect.  


## Using GitHub as Content Management System and GitHub Pages as Host  

As you can see from the orange &amp; white "merit badges" at the bottom of each page, this
blog is hosted at GitHub.  (And cares so much about HTML & CSS correctness that you can
check it against the canonical validators for yourself.)  

GitHub's worked out more or less fine for me.  If you're not comfortable with software
tools, though, it's probably not for you and you'd like WordPress better.  

For those of you asking, "Why not just use WordPress like everybody else?"&hellip; I
wanted to have finer control over things, use the absolute bare minimum of icky, intrusive
Javascript, and be relatively robust against the various WordPress hacks.  I'm willing to
pay a significant price of effort in figuring out how to do lots of things (like how to
get comments to work with [StaticMan](https://staticman.net/)).  I haven't yet _used_ much
of that fine control, e.g., to style the front page, but I will in the by-and-by, perhaps
imitating the [MinimalMistakes](https://mmistakes.github.io/minimal-mistakes/) theme for
[Jekyll blogs](https://jekyllrb.com/) hosted on [GitHub Pages](https://pages.github.com/).  

One of the amusing side-effects of using GitHub is that there are a number of software
tools for examining what's in the repository, gathering ongoing statistics about it, and
generating reports.  I'm going to be pretty primitive here and just examine the clone of
the repository I have on my laptop, since that's sufficient for now:  
- All the posts are in [GitHub-flavored markdown](https://github.github.com/gfm/) files in
  a directory called `_posts`.  
- All the comments are in [yaml](https://yaml.org/) files in a directory called
  `_data/comments`.  

That means I can use even just _elementary_ command-line tools to collect statistics about
posts and comments.  For example, to count the number of posts:  

```sh
$ find ./_posts -iname "*.md" -a -type f -a -print | wc -l
124
```

I started this blog with the goal to have fun writing; that's been achieved.  

It was specifically _not_ a goal to be monetized or become an "influencer" with a huge
following.  I suspect that has also been successfuly avoided; this is, after all, just a
crummy little blog that nobody reads.  

Let's see how the numbers say we've been doing.


## The Basic Numbers  

- __Number of posts:__  
```sh
$ find ./_posts -iname "*.md" -a -type f -a -print | wc -l
     124
```
- __Number of comments submitted:__ This is harder to get programmatically, so I went to
  the GitHub web UI and got it.  (In the future, I should
  [use the API to count pull requests progammatically](https://stackoverflow.com/questions/13094712/github-api-get-number-of-pull-requests).  
  
  <img src="{{ site.baseurl }}/images/2021-10-20-state-of-blog-1yr-github-1.jpg" width="400" height="132" alt="GitHub: Number of pull requests (submitted comments)" title="GitHub: Number of pull requests (submitted comments)" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
  Comments are done in a way that a remote process creates a pull request, asking me if I
  want to merge your comment in, or delete it.  Since pull requests here aren't used for
  anything else, the number of pull requests is the number of comments submitted.  Go to
  the `Pull requests` tab, set the filter to just `is:pr`, and see that there have been
  281 pull requests submitted since the fiat blog event.  
- __Number of accepted comments:__ There are several possibly interesting numbers here: the
  total number of comments that made it past moderation, the ones from people who are not
  me, and the ones from me (generally replies).  We are also interested in the number of 
  _unique_ outside commentators (and who they are, but I'm not publishing that).  
  - _Total accepted comments:_  
    ```sh
    $ find ./_data/comments/ -iname "*.yml" -a -exec grep "^name: .*" \{\} \; | wc -l
          52
    ```
  - _Total accepted comments not from me:_  
    ```sh
    $ find ./_data/comments/ -iname "*.yml" -a -exec grep "^name: .*" \{\} \; | grep -v "Weekend Editor$" | wc -l
          33
    ```
  - _Total accepted comments from me:_  
    ```sh
    $ find ./_data/comments/ -iname "*.yml" -a -exec grep "^name: Weekend Editor" \{\} \; | wc -l
          19
    ```
  - _Total unique commenters:_ Really only 10 after removing myself and collapsing
    spelling variations on names of people I know.  (Hi, guys.  Good to see you.)  
    ```sh
    $ find ./_data/comments/ -iname "*.yml" -a -exec grep "^name: .*" \{\} \; | grep -v "Weekend Editor$" | sort | uniq | wc -l
          15
    ```

## Post Frequency  

I started out with a goal to be "weekend reading", i.e., posting about 1ce/week.  I think I've
achieved that, since the average post frequency has been:  

$$
\mbox{Post Frequency} = \frac{477 \mbox{ days}}{124 \mbox{ posts}} = 3.85 \mbox{ days/post}
$$

&hellip; or roughly 2 posts a week.  (Whether or not they're _quality_ posts, well&hellip;
that's another matter!)  


## Spam and Nastygrams  

We get a _lot_ of spam here:  
- In the early days, it was people trying to sell "generic Viagra", i.e., trying to sell
  illegal drugs on the blog of a retired drug researcher.  That's&hellip; _special_.  
- Then there were people trying to sell term papers for college students.  I wonder if
  they know every professor in the developed world has software to spot that sort of
  plagiarism?  Or if they just thought their dumb customers didn't know that, and were
  willing to tank their customer's education?  Either way&hellip; ick.  
- There was a surprisingly small amount of attempted porn advertising.  
- Then almost everything became Russian: invitations to participate in micro-lending, a
  bit of icky sex stuff, and a _lot_ of crap about casinos.  I mean&hellip; who in the
  world is gonna get involved with a Russian casino over the web?!  
  
But they don't stop trying, especially with some older posts that somehow came to their
notice.  There are half a dozen posts that collect &gt; 90% of the spam.  No idea why.  

We've also gotten a couple nastygrams, both from the same guy.  

He didn't have anything constructive or even _interesting_ to add, so I blocked it.  He
just had a head full of the usual conservative claptrap, and wanted to call me names.  Not
even original names: socialist (yeah, probably&hellip; so?), liberal (absolutely),
communist (_really?_) and some vague obscentities.  He just wanted to say I'm wrong, dumb,
and a bad person who should feel bad.  (Look, dude: I've had drug-resistant clinical
depression my entire life: I _already know that._) He wasn't even being original!  Had he
been original, I might have accepted the nastygram comment and replied with a thoughtful
and helpful critique of his command of invective.  But they weren't even _competent_
insults.  

The probability of spam or nastygram is kind of interesting ("PR" = "pull request" =
"attempted comment"):  

$$
\begin{align*}
\mbox{Outside PRs}         & = \mbox{PRs} - \mbox{comments by me} \\
                           & = 281 - 19 \\
                           & = 262 \\
\mbox{Spam or Nasty Prob}  & = 100\% \times \frac{\mbox{Outside PRs} - \mbox{OutsideComments}}{\mbox{OutsidePRs}} \\
                           & = 100\% \times \frac{262 - 33}{262} \\
                           & = 87.4\%
\end{align*}
$$

(I should probably write a script to do that!)  

So&hellip; yeah, the spam is tiresome and voluminous.  Maybe some of you actual readers
could comment once in a while, to give me an idea of how the articles go over?  


## Comment Rate  

The comment rate is pretty low:  

$$
\mbox{Comment Rate} = \frac{33 \mbox{ outside comments}}{124 \mbox{ posts}} = 0.266 \mbox{ comments/post}
$$

&hellip;or about 1 comment every 3.76 posts.  I _have_ gotten some emails as well, mostly from
people who don't want to use the comment system, or can't figure it out.


## Google Search Console  

We can also use [Google Search Console](https://search.google.com/search-console/about) to
see things like how often we come up in Google searches, what the search queries were, how often
people clicked through, and what other web pages link to us.  

<img src="{{ site.baseurl }}/images/2021-10-20-state-of-blog-1yr-search-console-1.jpg" width="400" height="184" alt="Google Search Console: Impressions and clicks 2020-Sep-19 to 2021-Oct-20" title="Google Search Console: Impressions and clicks 2020-Sep-19 to 2021-Oct-20" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
Since we had very little search presence before September 2020, let's go back 16 months.
The plot shows the number of times we appeared in a Google search (purple line, right-hand
vertical axis) and the number of times there was a click through (blue line, left-hand
vertical axis).  

We have a very low click-through rate of 1.9%, which means as far as Google searchers are
concerned, this really is a crummy little blog that nobody reads.  And I'm ok with that.  

I'm also intrigued by the sudden drop in search appearances at the end of June.  Since I'm
doing absolutely no SEO, perhaps this is a change to Google's ranking algorithm?  The (1)
along the horizontal axis in mid-August is one such event; Search Console reports when
changes to ranking might affect your search appearances.  But there's no corresponding
note for the much bigger drop in July, so&hellip; I dunno.  

The search queries that got to us are kind of interesting, when sorted by what actually
provoked a click-through:  
- The first, second, and sixth place queries were "hank gren vaccine", "hank green covid
  vaccine", and "hank green covid".  Clearly I need to blog more about internet-famous people
  like Hank Green!  
- The others that provoked click-throughs were "filibuster statistics by party",
  "#googletranslate", and various queries about the Moderna COVID-19 vaccine.  

The pages to which people clicked through corresponded pretty much to the queries.  The
highest click-through rate was on the front page, though.  No idea why.  

The countries were first the Anglosphere (US, UK, Australia, Canada&hellip; but _not_ NZ?),
followed by various European countries and then India.  Only 4 click-throughs from France,
so I guess my former colleagues in France aren't reading this much.  About as expected?  

As far as devices, it's almost evenly divided between desktops and mobile, with only a few
hardy tablet users.  Again, about as expected.  This blog is tagged as mobile-friendly by
Google, but every time I've tried it the result was _much_ better on a real desktop screen
or on a tablet.  

<img src="{{ site.baseurl }}/images/2021-10-20-state-of-blog-1yr-search-console-2.jpg" width="400" height="349" alt="Google Search Console: Top linked pages" title="Google Search Console: Top linked pages" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
When we ask about other web pages that link to us, the top link is to the front page, and
then a few others about vaccine stuff that apparently interests people.  All in all, not
much linkage, as expected.  

<img src="{{ site.baseurl }}/images/2021-10-20-state-of-blog-1yr-search-console-3.jpg" width="400" height="280" alt="Google Search Console: Top linking sites" title="Google Search Console: Top linking sites" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
I don't do any promotion for this blog: no Twitterage, no Instagrammatization, no
Facebookery, nothing.  The _only_ things I do are (a) mention it to people in conversation
or email when it's relevant, and (b) veryoccasionally leave comments on somebody else's
blog.  The linking sites confirm this, being mostly places I've left comments on other
blogs.  

<img src="{{ site.baseurl }}/images/2021-10-20-state-of-blog-1yr-search-console-4.jpg" width="400" height="274" alt="Google Search Console: Top linking text" title="Google Search Console: Top linking text" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">
The text people use to link here is kind of amusing.  Some of it's just my _nom de blog_,
or the name of the blog, or the ubiquitous "here".  But the "fda declares war on america"
guy is&hellip; probably not paying attention to what I say.  Or linking to me as someone
with whom they disagree, maybe?  I didn't bother to track down the reference, so I dunno.
But good luck to you, whoever you are.  


## The Weekend Conclusion  

This is still a crummy little blog that nobody reads.  

And I'm still ok with that.  

There are a few links, mostly from the comment sections of a few blogs we're I've
dropped in to say something.  I'm not interested in doing promotion work, or monetization.
I _might_ look into Google Ads and some minor promotion someday, once I get the stylesheet
stuff straightened out, but also maybe not.  So don't hold your breath on that.  

To my spammers: You're hopeless.  You'll never make it past moderation.  Move along.  

To my readers (all 3 of you, excluding my spouse, my cat, and myself): Thanks for reading.
I'm gratified at the couple of you that have expressed interest.  Please feel free to
leave comments; it makes me happy to engage with thoughtful comments.  

---

## Notes &amp; References  

<!--
<sup id="fn1a">[[1]](#fn1)</sup>

<a id="fn1">1</a>: ***, ["***"](***), *** [↩](#fn1a)  

<img src="{{ site.baseurl }}/images/***" width="400" height="***" alt="***" title="***" style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;">

<iframe width="400" height="224" src="***" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="float: right; margin: 3px 3px 3px 3px; border: 1px solid #000000;"></iframe>
-->

<a id="fn1">1</a>: Nope.  Not today.  
