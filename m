MIME-Version: 1.0
References: <CAHRSSEzfP_NbK+b5M3_AAR7H7ujhdTdJ9W2JCiSMvNDZzGVykw@mail.gmail.com>
 <CAHRSSEzpdAVDcn5C4yYEWn6c_rgaFSwp+JvT4MP9kv80MZV=3A@mail.gmail.com>
 <CAHRSSEwrm5SVkuus8y5ycqp_tAQF4UOSo+hFLhVKKNu6s2b_KA@mail.gmail.com>
 <7hlfd8mwrm.fsf@baylibre.com> <CAHRSSEy_a-WOm4a11iMS=hKAJk7YmAPUPV50JCAO4DnSXsOiUQ@mail.gmail.com>
 <7hr1mlyh2h.fsf@baylibre.com>
In-Reply-To: <7hr1mlyh2h.fsf@baylibre.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 19 Jan 2021 09:56:08 -0800
Message-ID: <CAHRSSEzCgOGZXKOX4-agVQAtubcmKypqC9T6aMwiNk447RiuKw@mail.gmail.com>
Subject: Re: Please add android12-5.10 kernel to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io

Hi Kevin, I'm seeing android12-5.10 builds now. Thanks!

On Fri, Jan 15, 2021 at 2:24 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Yes, it was merged a couple days ago.  Not sure yet why there haven't
> been any builds.
>
> We did have some infra failures which caused a bit of a build backlog
> that might have caused this be deep in the queue, but I thought we made
> it through that backlog.
>
> I'll double-check with Guillaume on Monday to see what's going on here.
>
> Sorry for the delay,
>
> Kevin
>
> Todd Kjos <tkjos@google.com> writes:
>
> > Hi Kevin,
> >
> > Has this been applied yet? I don't see any android12-5.10 builds.
> >
> > -Todd
> >
> > On Mon, Jan 4, 2021 at 9:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> >> Todd Kjos <tkjos@google.com> writes:
> >>
> >> > We recently added the android12-5.10 branch. Please add it to kernelci
> >> testing.
> >> >
> >> > repo: https://android.googlesource.com/kernel/common
> >> > branch: android12-5.10
> >>
> >> PR submitted[1].  Adding android12 along with the stable tree(s)
> >>
> >> Kevin
> >>
> >> [1] https://github.com/kernelci/kernelci-core/pull/578
> >>
