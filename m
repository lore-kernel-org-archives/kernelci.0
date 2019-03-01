MIME-Version: 1.0
References: <5c6702da.1c69fb81.12a14.4ece@mx.google.com> <20190215104325.039dbbd9c3bfb35b95f9247b@linux-foundation.org>
 <20190215185151.GG7897@sirena.org.uk> <20190226155948.299aa894a5576e61dda3e5aa@linux-foundation.org>
 <CAPcyv4ivjC8fNkfjdFyaYCAjGh7wtvFQnoPpOcR=VNZ=c6d6Rg@mail.gmail.com>
 <20190228151438.fc44921e66f2f5d393c8d7b4@linux-foundation.org>
 <CAPcyv4hDmmK-L=0txw7L9O8YgvAQxZfVFiSoB4LARRnGQ3UC7Q@mail.gmail.com>
 <026b5082-32f2-e813-5396-e4a148c813ea@collabora.com> <20190301124100.62a02e2f622ff6b5f178a7c3@linux-foundation.org>
 <3fafb552-ae75-6f63-453c-0d0e57d818f3@collabora.com>
In-Reply-To: <3fafb552-ae75-6f63-453c-0d0e57d818f3@collabora.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 1 Mar 2019 15:23:58 -0800
Message-ID: <CAPcyv4hMNiiM11ULjbOnOf=9N=yCABCRsAYLpjXs+98bRoRpCA@mail.gmail.com>
Subject: Re: next/master boot bisection: next-20190215 on beaglebone-black
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Mark Brown <broonie@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Matt Hart <matthew.hart@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, khilman@baylibre.com, enric.balletbo@collabora.com, Nicholas Piggin <npiggin@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Adrian Reber <adrian@lisas.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Linux MM <linux-mm@kvack.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Guy Briggs <rgb@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, info@kernelci.org

On Fri, Mar 1, 2019 at 1:05 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 01/03/2019 20:41, Andrew Morton wrote:
> > On Fri, 1 Mar 2019 09:25:24 +0100 Guillaume Tucker <guillaume.tucker@collabora.com> wrote:
> >
> >>>>> Michal had asked if the free space accounting fix up addressed this
> >>>>> boot regression? I was awaiting word on that.
> >>>>
> >>>> hm, does bot@kernelci.org actually read emails?  Let's try info@ as well..
> >>
> >> bot@kernelci.org is not person, it's a send-only account for
> >> automated reports.  So no, it doesn't read emails.
> >>
> >> I guess the tricky point here is that the authors of the commits
> >> found by bisections may not always have the hardware needed to
> >> reproduce the problem.  So it needs to be dealt with on a
> >> case-by-case basis: sometimes they do have the hardware,
> >> sometimes someone else on the list or on CC does, and sometimes
> >> it's better for the people who have access to the test lab which
> >> ran the KernelCI test to deal with it.
> >>
> >> This case seems to fall into the last category.  As I have access
> >> to the Collabora lab, I can do some quick checks to confirm
> >> whether the proposed patch does fix the issue.  I hadn't realised
> >> that someone was waiting for this to happen, especially as the
> >> BeagleBone Black is a very common platform.  Sorry about that,
> >> I'll take a look today.
> >>
> >> It may be a nice feature to be able to give access to the
> >> KernelCI test infrastructure to anyone who wants to debug an
> >> issue reported by KernelCI or verify a fix, so they won't need to
> >> have the hardware locally.  Something to think about for the
> >> future.
> >
> > Thanks, that all sounds good.
> >
> >>>> Is it possible to determine whether this regression is still present in
> >>>> current linux-next?
> >>
> >> I'll try to re-apply the patch that caused the issue, then see if
> >> the suggested change fixes it.  As far as the current linux-next
> >> master branch is concerned, KernelCI boot tests are passing fine
> >> on that platform.
> >
> > They would, because I dropped
> > mm-shuffle-default-enable-all-shuffling.patch, so your tests presumably
> > now have shuffling disabled.
> >
> > Is it possible to add the below to linux-next and try again?
>
> I've actually already done that, and essentially the issue can
> still be reproduced by applying that patch.  See this branch:
>
>   https://gitlab.collabora.com/gtucker/linux/commits/next-20190301-beaglebone-black-debug
>
> next-20190301 boots fine but the head fails, using
> multi_v7_defconfig + SMP=n in both cases and
> SHUFFLE_PAGE_ALLOCATOR=y enabled in the 2nd case as a result
> of the change in the default value.
>
> The change suggested by Michal Hocko on Feb 15th has now been
> applied in linux-next, it's part of this commit but as
> explained above it does not actually resolve the boot failure:
>
>   98cf198ee8ce mm: move buddy list manipulations into helpers
>
> I can send more details on Monday and do a bit of debugging to
> help narrowing down the problem.  Please let me know if
> there's anything in particular that would seem be worth
> trying.
>

Thanks for taking a look!

Some questions when you get a chance:

Is there an early-printk facility that can be turned on to see how far
we get in the boot?

Do any of the QEMU machine types [1] approximate this board? I.e. so I
might be able to independently debug.

Were there any boot *successes* on ARM with shuffling enabled? I.e.
clues about what's different about the specific memory setup for
beagle-bone-black.

Thanks for the help!

[1]: https://wiki.qemu.org/Documentation/Platforms/ARM
