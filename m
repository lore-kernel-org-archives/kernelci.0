MIME-Version: 1.0
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
 <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com>
 <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com> <CAKwvOdmAev4-AP3g0cgZ8rV+iR4ACuy1ZQ_XoD09c1d2GF1S7Q@mail.gmail.com>
 <20200924110402.GB4754@sirena.org.uk>
In-Reply-To: <20200924110402.GB4754@sirena.org.uk>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Thu, 24 Sep 2020 12:25:42 -0700
Message-ID: <CAKwvOdmEf7jM7QWZcPxy761CGsO24sEDY9OWJJcZKsc6jFy9xA@mail.gmail.com>
Subject: Re: kernelci.org update - 2020-09-23 #minutes
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, android-llvm <android-llvm@googlegroups.com>

On Thu, Sep 24, 2020 at 4:05 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Sep 23, 2020 at 03:06:52PM -0700, Nick Desaulniers via groups.io wrote:
> > On Wed, Sep 23, 2020 at 2:26 PM Guillaume Tucker
>
> > > > android-mainline
> > > > android12-5.4
> > > > android-4.19-stable
>
> > > > are the 3 newest branches that I know of.
>
> > > And which LLVM/Clang versions should be used to build those?
>
> > Will likely be clang-12 (or possibly clang-13).  Those branches are
> > basically the kernel branches for "S" which will be released next
> > year.  So they are building with a pre-clang-11 right now, but we're
> > about to upgrade them to something closer to ToT soon.  Once the "S"
> > release of Android is closer, then we will lock down the toolchain
> > used for these kernels, but it's sure to change between now and then.
>
> The thought was that it might be worth using the actual Android
> toolchains (including all the out of tree patches and whatnot) with
> these branches as well as upstream clang.

That's...a brilliant idea, and would be much closer to what's being
used in production.

While Android ships its own distribution of LLVM; this is because
upstream LLVM's release process is simultaneously too slow for Android
(we need fixes and features faster) and would be too late for finding
compiler regressions (that's pretty much all we do, is fight
regressions).  While there's potential there to try to ship secret
sauce, I *wish* we had the headcount to even consider that; our
distribution will carry cherry picks of reverts or backports of fixes
so that we minimize the number of known issues with the release.  We
run at a manpower deficit, so we don't have the ability to even
develop any kind of secret sauce.

Would a Docker image containing AOSP LLVM probably be the easiest to
integrate?  If so, I can look at providing such an image.
-- 
Thanks,
~Nick Desaulniers
