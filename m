MIME-Version: 1.0
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
 <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com> <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
In-Reply-To: <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 25 Sep 2020 14:39:58 +0200
Message-ID: <CA+icZUXTRK9jgr6-yGW0hTVgfQNhu=YPBX0ce4Op=Ukih4vmbA@mail.gmail.com>
Subject: Re: kernelci.org update - 2020-09-23 #minutes
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>

On Wed, Sep 23, 2020 at 11:26 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 23/09/2020 22:08, Nick Desaulniers wrote:
> > On Wed, Sep 23, 2020 at 7:50 AM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> >>
> >> Summary of changes going into production
> >> ========================================

...

> >>   LLVM 11 release:
> >>   * Status tracked at https://bugs.llvm.org/show_bug.cgi?id=46725
> >>   * Several pending bugs need fixing, some look relevant
> >
> > Fixed! (oh boy, we were on the "chase list")
>
> Nice!  Erm, I believe there's one last blocker:
>
>   https://bugs.llvm.org/show_bug.cgi?id=47619
>

Fixed in release/11.x Git by...

commit 81eb1c1fa75c6407713b5657156d8d9149572bfe
"AArch64/GlobalISel: Reduced patch for bug 47619"

- Sedat -

[1] https://github.com/llvm/llvm-project/commit/81eb1c1fa75c6407713b5657156d8d9149572bfe
