MIME-Version: 1.0
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
 <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
 <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com>
 <YxCtqsY55Lwaj34H@sirena.org.uk> <CAHRSSEw9KqQFKZND1fmMa67btkozg0yA_0NjF8C=UiLnvfwHGA@mail.gmail.com>
 <YxXkuTdnt4IbPMDC@sirena.org.uk> <CAHRSSEzgEyPDxZ64SUdJNZRU3YAxS+mJcfVgG4-cSjjuTsH0Xg@mail.gmail.com>
 <9b4773cc-f68c-4e34-4688-92c968bfb66c@collabora.com>
In-Reply-To: <9b4773cc-f68c-4e34-4688-92c968bfb66c@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 15 Sep 2022 09:25:44 -0700
Message-ID: <CAHRSSEzZv00DUToqPMNhu+j-J_pR8ypm-aUi80uo7Z7iCebtPg@mail.gmail.com>
Subject: Re: UM-Linux compilation on Android Common Kernels
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, Mark Brown <broonie@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>

On Thu, Sep 15, 2022 at 9:23 AM Guillaume Tucker <
guillaume.tucker@collabora.com> wrote:

> Hi Todd,
>
> On 14/09/2022 22:36, Todd Kjos via groups.io wrote:
> > Is there an ETA for at least doing the builds?
>
> I don't think anyone else is asking for user-mode builds, and
> adding this new architecture with a new sub-architecture
> parameter is not as trivial as adding a few lines of YAML config.
> So unless someone on this list is interested, or someone wants to
> run an internship topic around that, I think you'll have to go
> and find someone to do the work.
>
> KernelCI is starting to run KUnit which does involve UM-Linux
> builds but that's all done "under the hood" by the KUnit
> framework.  Still, I guess it would catch some build errors as a
> side-effect.  So an alternative is to wait for that to be fully
> in production (first half 2023) and we can consider enabling it
> on some Android kernel trees.
>

Thanks, that would be fine. This is not super urgent.


>
> Best wishes,
> Guillaume
>
> > On Mon, Sep 5, 2022 at 4:59 AM Mark Brown <broonie@kernel.org> wrote:
> >
> >> On Thu, Sep 01, 2022 at 08:44:25AM -0700, Todd Kjos wrote:
> >>> Could we start by building but not testing? That at least prevents
> build
> >>> breakage (which is the case that motivated this).
> >>
> >> Yes, that's definitely an easier first step.
> >>
> >
> >
> > 
> >
> >
>
>
