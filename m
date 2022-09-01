MIME-Version: 1.0
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
 <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
 <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com> <YxCtqsY55Lwaj34H@sirena.org.uk>
In-Reply-To: <YxCtqsY55Lwaj34H@sirena.org.uk>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 1 Sep 2022 08:44:25 -0700
Message-ID: <CAHRSSEw9KqQFKZND1fmMa67btkozg0yA_0NjF8C=UiLnvfwHGA@mail.gmail.com>
Subject: Re: UM-Linux compilation on Android Common Kernels
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, Elliot Berman <quic_eberman@quicinc.com>

Could we start by building but not testing? That at least prevents build
breakage (which is the case that motivated this).

On Thu, Sep 1, 2022 at 6:03 AM Mark Brown <broonie@kernel.org> wrote:

> On Wed, Aug 31, 2022 at 11:21:28AM -0700, Todd Kjos via groups.io wrote:
> > On Wed, Aug 17, 2022 at 11:05 AM Todd Kjos <tkjos@google.com> wrote:
> > > On Wed, Aug 17, 2022 at 10:51 AM Elliot Berman <
> quic_eberman@quicinc.com> wrote:
>
> > >> Qualcomm recently caught some build errors in UM-Linux on Android
> Common
> > >> Kernel. Todd suggested that these errors might be catchable by 0day.
> Can
>
> > > I think in this context, I meant "catchable by kernelci".
>
> > >> UM-Linux compilation be enabled for Android Common Kernels?
>
> > >> ARCH=um SUBARCH=x86_64
>
> > > I support this, can we add this test for android kernels? (could limit
> to 5.10 an higher).
>
> This is definitely technically doable, especially the build side, but
> there'd be some work required to enable actually running the kernels and
> tests on them.  We discussed this at the weekly meeting today, the main
> issue would be finding someone who has the time to do the actual
> w.
>
