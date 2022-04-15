# iphys.github.io

## Create Static Web Site in GitHub Pages with Jekyll

To start creating web pages in GitHub Pages,
follow the instructions at GitHub:

- [Creating a GitHub Pages site with Jekyll][url-create-pages]

[url-create-pages]:https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll

When you create web site by following the instructions,
the theme of the web site is [Minima 2.5](https://github.com/jekyll/minima).
See Minima's `README.md` for details about the theme.

> The default major verison of Minima is 2.
> To use the dark mode with Minima,
> you need the version 3 of Minima,
> which is still in development.
> First follow the instructions and build web site
> as instructed.
> Once it succeeds,
> move on and manually customize the pages using Minima 3.

Step 1

To develop with Jekyll on Windows,
use Windows Subsystem for Linux (WSL).
Install ruby and bundler in WSL.

Step 2

Make sure that git is configured as intended.
Especially check `user.name` and `user.email`.

```bash
git config --global --list
```

If not configured properly, do so now.

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Create `.gitignore`.

```txt
docs/_site
docs/vendor
```

Step 3

Create or edit web page contents.
Follow [the instructions][url-create-pages]
in the link at the top of this README.

In this step, you cannot use the dark mode yet.

Step 4

Build the static web pages locally and view in browser.
For details,
see the [instructions at GitHub][url-gh-local].

```bash
bundle exec jekyll serve
```

The above command may take some time
before it starts showing messages.
Wait for a few minutes.

[url-gh-local]:https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll

Step 5

To use the dark mode,
get Minima 3 files
and remove the dependency on Minima!
Your site still uses Jekyll to build static pages,
but it does not use Minima for theming any more.

From the Minima repository in github,
get the zip archive of the master branch.

- https://github.com/jekyll/minima

Then unarchive it in your machine, and copy
`_include`, `_layouts`, `_sass`, and `assets`
folders to your `/docs` folder.

Then in your `/docs/Gemfile` file

1. Comment out the `gem "minima"` line.
2. Add lines for `jekyll-feed` and `jekyll-seo-tag`.

as follows:

```ruby
# /docs/Gemfile
#gem "minima", "~> 2.0"
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag", "~> 2.6"
end
```

In your `/docs/_config.yml` file,

```yml
#theme: minima
minima:
  skin: dark
```

Step 6

Kill the server process.
Start.

```bash
docs$ bundle exec jekyll serve
```

Step 7

Commit changes.

Before pushing to the remote,
check that the remote is properly set up.

```bash
git remote -v
```

If remote is not set up yet, do so now.

```bash
git remote add origin https://github.com/YOUR/REPOSITORY.git
```

Push to the remote.

Step 8

Turn on GitHub Pages in your github repo.

_Updated in 2022_
