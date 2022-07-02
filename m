MIME-Version: 1.0
References: <54539125-b4fe-c219-cad9-e511e6271875@gmail.com>
 <CACT4Y+YEiXrsLX6+=_Z4=xk_qAe1Pe1hTnDZkM7C5iFUvqMP8A@mail.gmail.com> <2d739264-6ece-1c8a-30a0-c1d96a8a8e62@gmail.com>
In-Reply-To: <2d739264-6ece-1c8a-30a0-c1d96a8a8e62@gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Sat, 2 Jul 2022 09:59:58 +0200
Message-ID: <CACT4Y+ZkB=ptctWusAxpjBv_iFJX6OeBgN7DSp+2m6eLHBKufQ@mail.gmail.com>
Subject: Re: #KCIDB: Publishing known issues
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=C3=B1aki_Malerba?= <imalerba@redhat.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Alice Ferrazzi <alicef@gentoo.org>, automated-testing@lists.yoctoproject.org, Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Johnson George <Johnson.George@microsoft.com>, Veronika Kabatova <vkabatov@redhat.com>, Guillaume Tucker <guillaume.tucker@collabora.com>

On Fri, 1 Jul 2022 at 17:05, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> On 7/1/22 17:11, Dmitry Vyukov wrote:
> >   wOn Fri, 1 Jul 2022 at 14:41, Nikolai Kondrashov <spbnick@gmail.com> wrote:
> >> There's obviously lots and lots more to think about and discuss regarding
> >> "known issues", but please tell me what you think about this particular
> >> aspect. Everything else is welcome too, of course :)
> >
> > Maybe I am missing something, but have you considered making the KCIDB
> > server assign these versions to take this burden from all clients?
> > Users will effectively "modify" entities, except that KCIDB won't
> > actually modify but rather insert new versions. The version can be
> > precise-enough timestamp as you mentioned.
>
> Thank you for your prompt response, and for a good question, Dmitry!
>
> Yes, I considered that for a while, from various angles. Yes, that would be
> simpler for submitters in many cases.
>
> However, it will make the KCIDB protocol more complex (both to understand and
> to implement) by introducing different behavior for different types of objects.
>
> It will force KCIDB to implement comparing issue parameters/contents, instead
> of just comparing version numbers, in order to avoid useless retriage when the
> same issue is submitted multiple times without changes. E.g. when related
> issues are simply submitted together with test results for every revision.
>
> It will also either force KCIDB to introduce global synchronization for
> reliable version number generation, or to use mostly de-synchronized, but
> unreliable timestamp-based versions for *all* submitters, regardless whether
> they can actually do better or not. In this way, this tradeoff is similar to
> having submitters generate their own object IDs.

On the syzbot side we fully control database schema and code, so
adding bug versions should not be a problem at least for major bug
status changes.
