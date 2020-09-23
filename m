MIME-Version: 1.0
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
 <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com> <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
In-Reply-To: <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Wed, 23 Sep 2020 15:06:52 -0700
Message-ID: <CAKwvOdmAev4-AP3g0cgZ8rV+iR4ACuy1ZQ_XoD09c1d2GF1S7Q@mail.gmail.com>
Subject: Re: kernelci.org update - 2020-09-23 #minutes
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>

On Wed, Sep 23, 2020 at 2:26 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 23/09/2020 22:08, Nick Desaulniers wrote:
> > On Wed, Sep 23, 2020 at 7:50 AM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> >>   LLVM 11 release:
> >>   * Status tracked at https://bugs.llvm.org/show_bug.cgi?id=46725
> >>   * Several pending bugs need fixing, some look relevant
> >
> > Fixed! (oh boy, we were on the "chase list")
>
> Nice!  Erm, I believe there's one last blocker:
>
>   https://bugs.llvm.org/show_bug.cgi?id=47619

I'll let the release manager sort that out.

>
> >>   Android LLVM versions: Mark to ping Todd and ask him about using those for
> >>   Android branches.
> >
> > android-mainline
> > android12-5.4
> > android-4.19-stable
> >
> > are the 3 newest branches that I know of.
>
> And which LLVM/Clang versions should be used to build those?

Will likely be clang-12 (or possibly clang-13).  Those branches are
basically the kernel branches for "S" which will be released next
year.  So they are building with a pre-clang-11 right now, but we're
about to upgrade them to something closer to ToT soon.  Once the "S"
release of Android is closer, then we will lock down the toolchain
used for these kernels, but it's sure to change between now and then.
-- 
Thanks,
~Nick Desaulniers
