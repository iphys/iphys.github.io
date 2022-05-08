---
layout: default
title: SSG
---
## SSG - Static Site Generator

May 2022

I came to know about SSGs around 2019.
I am very slowly learning what works best for me.
As of this writing in May 2022,
[Jekyll](https://jekyllrb.com/),
[Hugo](https://gohugo.io/),
and [Eleventy](https://www.11ty.dev/)
are on my radar.

This is a note for myself to record my thought process.

Reasonable knowledge and experience about
the following technologies are very helpful
(almost must-have prerequisites) to comfortably use SSGs.
That said, you don't need to be a Jedi master at all.
You shoud just have your own way to use them.

- Markdown
- Git
- GitHub or GitLab

In addition, if you feel okay in reading code
written in HTML, CSS, SASS, and JavaScript,
that would certainly be helpful to start using SSGs.
But again, you don't need to be an expert of them.

## Math

I want to write mathematical symbols,
expressions, and equations in my web site.
[MathJax version 3](https://www.mathjax.org/)
and
[Katex](https://katex.org/)
seem to support rendering math in HTML quite well.

MathJax used to be a client-side JavaScript technology
to render math in HTML, but from the version 3 of MathJax,
it also started supporting server-side math rendering
using node.js, which works well with SSGs.

Katex seems to be much simpler and smaller than MathJax,
but it looks like it can render beautiful math for
static site quite well.
I should give it a try.

## Jekyll, Hugo, and Eleventy

From the implementation perspective, Jekyll uses Ruby,
Hugo uses Go, and 11ty uses JavaScript.
While the language used for implementation
does have a strong impact on the usage of these tools,
there are other factors that also strongly affect
the usability of the tools.

## Jekyll

[Jekyll](https://jekyllrb.com/)
is currently the number 1 choice for me.

- Has good documentation for first timers.
  [Step-by-step tutorial][jk-tut] was particularly helpful
  to get up to speed from near zero knowledge about any SSGs.
- Has good [documentation][jk-docs] about technical topics.
- Has many [site themes](https://jekyllrb.com/docs/themes/).
  The default theme Jekyll uses is
  **Minima version 2**, which is very simple but reasonable
  as a starting point.
  The latest version of Minima is version 3
  (as of this writing in May 2022).
  It supports **skin for dark mode**, and
  is [available from github](https://github.com/jekyll/minima#readme).
  Jekyll's documentation about Minima is talking about
  Minima version 2, not version 3.
  To use Minima version 3, you must
  read [`README.md`](https://github.com/jekyll/minima#readme)
  and set it up by yourself.
- Supports generating sites under subfolders such as
  `/docs` or `/blogs` without hassle.
- Is supported by GitHub Pages.
- Is built with Ruby.
  This is a challenge for me as I don't know about Ruby.
- Generating the site is slow.
  This is especially painful
  given the speed which Hugo and 11ty offer.
- Unclear how math can be rendered.

[jk-tut]: https://jekyllrb.com/docs/step-by-step/01-setup/
[jk-docs]: https://jekyllrb.com/docs/

## Hugo

I tried a simple demo.
[Hugo](https://gohugo.io/)
renders the site much, much faster than Jekyll.

Hugo seems to have assumptions about the folder structure
of site source that are less flexible than Jekyll.
(Maybe I am wrong.)
If the assumptions do not conflict with your site source,
then Hugo could be a good choice.

Not sure about step-by-step tutorial, technical documentation,
site themes, skins (dark mode), and math.

## Eleventy / 11ty

I tried a simple demo.
[Eleventy](https://www.11ty.dev/) renders the site fast.

11ty is implemented in JavaScript,
which is a very natural choice as an SSG.

MathJax and Katex are JavaScript based,
and I expect that they must nicely work with 11ty.

It seems to be rather involved to use 11ty
where you need to write quite a bit of code to make it work.
I may be wrong, but this is a big difference from Jekyll.

There are bunch of technical documentations in 11ty's site,
but I cannot find step-by-step tutorial
similar to the one in Jekyll's site.
I cannot figure out how to use 11ty in my own site source.
I'm already stuck and cannot proceed any more.
I should come back to 11ty sometime later again.
