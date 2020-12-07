MIME-Version: 1.0
References: <5fc5476c.1c69fb81.43fd4.49d0@mx.google.com> <CAKwvOdnuaP6-tpsWiVzGLvNXHOsZxAgnYr+UjUArsU6RGWuLEQ@mail.gmail.com>
 <9ebc5cc1-e871-6c03-e420-549ce2c31c70@collabora.com> <78e41d71-20d4-b8c4-35da-588a02bf3a8c@collabora.com>
In-Reply-To: <78e41d71-20d4-b8c4-35da-588a02bf3a8c@collabora.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Mon, 7 Dec 2020 11:42:01 -0800
Message-ID: <CAKwvOdnZ-FngrssboyhPn+7kpqiJvkEBvj2VjALkiQ44ChMFKA@mail.gmail.com>
Subject: Re: next/master build: 229 builds: 13 failed, 216 passed, 63 errors, 131 warnings (next-20201130)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>, Kees Cook <keescook@chromium.org>, "kernelci-results@groups.io" <kernelci-results@groups.io>, kernelci@groups.io

On Mon, Dec 7, 2020 at 1:38 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> +kernelci-results@groups.io and kernelci@groups.io
>
> On 07/12/2020 09:36, Guillaume Tucker wrote:
> > On 30/11/2020 19:41, Nick Desaulniers wrote:
> >> Nice, we got our email reports back!  Looks like we have some cleanup
> >> to do with arm32+lld, though I think those all might be addressed by:
> >> https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9025/1
> >>
> >> Nathan's patches for orphan section warnings from lld 10 must have
> >> been merged up by Kees.  Now to fix up the rest of these warnings.
> >
> > Great, thanks for confirming it's working again for you now.
> >
> > To avoid such issues in the future, it seems we should have a way
> > to truncate very long emails.  That would mean striking the right
> > balance between missing out some useful data in the emails and
> > not having emails delivered at all due to their size.
> >
> > We should dig out the big emails that didn't get delivered and
> > compare their size with this one to get an idea of the margin we
> > have.  Since the number of builds is a known quantity, we could
> > then define a maximum number of errors and warnings to show per
> > build, with something like "[...] 1234 more warnings" and a link
> > to the full results.  Do you think that could break your
> > workflow?

That's a good idea and makes a lot of sense to me.  If we have a flood
of warnings, it's usually the same warning over and over again.
Whether it's printed 1k times vs 10k times doesn't make a difference.

> >
> > We should also be able to stop mentioning builds that passed
> > with "PASS, 0 errors, 0 warnings, 0 section mismatches" now as
> > they'll appear on the web dashboard anyway.  That's what we've
> > been doing with test results for several months and it's working
> > well.

Yep, those are mostly noise; it's good to see confirmation that they
ran, or see that clang builds had warnings when gcc builds had none
(or vice versa), but I wouldn't consider it a major loss in fidelity
to cut that information from the email reports.

-- 
Thanks,
~Nick Desaulniers
