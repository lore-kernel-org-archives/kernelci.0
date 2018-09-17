MIME-Version: 1.0
References: <CAOi56cWCGUTH_4p0K-tOCypE50gKmg8jk9=vowGhQFwNyJX-hA@mail.gmail.com>
In-Reply-To: <CAOi56cWCGUTH_4p0K-tOCypE50gKmg8jk9=vowGhQFwNyJX-hA@mail.gmail.com>
From: "Milo Casagrande" <milo@foundries.io>
Date: Mon, 17 Sep 2018 09:38:52 +0200
Message-ID: <CAEFW_iii48AZ0bUW3PwzGoMMwAkdCcSKBcBoRvsOb2ViMPJThg@mail.gmail.com>
Subject: Re: kernelci-frontend: browser cache, and reloads
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: khilman@baylibre.com
Cc: kernelci@groups.io

On Fri, Sep 14, 2018 at 11:34 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Milo,
>
> I don't know much about javascript, but having to rename files each
> time we change code seems clunky to me.
>
> This might be just as nasty of a hack, but couldn't we put some magic
> string all the .js loads.  Locally we did and experiment by hacking
> the minimized require.js with a magic string (I think this[1] is what
> would be needed in original.)  Combined with [2], then just changing
> the string in those 2 places would force a browser cache reload, no?

You can use that approach to bust the cache, yes, it will work.
The "issue", probably less likely these days, is that browser might
not cache a resource with a query string, so it could end up
requesting the same file each time you access the page.

Versioning the file is a better approach, and today there are better
ways of doing it than it has been done in kernelci.

> For someone that actually knows javascript, there's probably a better
> way of doing that with a global variable or similar, but this hack
> seems to work without having to change all the filenames.
>
> Note that this is especially useful when changing any of the .js files
> that are not (currently) versioned.
>
> Any thoughts on this approach, or perhaps a better one?

I personally wouldn't touch the r.js code base.

A better pre-processor/bundler than require.js should be used (webpack
+ a jinja2 template loader - assuming the latter exists), but it would
need to either inject the correct URL into the templates or tamper the
templates at build time.
It's probably going to be quite a lot of work.

Note: for development purposes, I never ran the build step and always
ran the application in the browser with the browser cache disabled.
The JS/CSS bump should only be done when pushing/deploying in
production to limit it.

-- 
Milo Casagrande <milo@foundries.io>
