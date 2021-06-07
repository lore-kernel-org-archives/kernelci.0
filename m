MIME-Version: 1.0
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <d4c587c2-7eca-043f-06b3-7e1cfa125b38@gmail.com> <CAKwvOdkFqFoNUczEiTKY6o2E78bHLkMjeHjtQWKm=Qdg7-v26Q@mail.gmail.com>
 <0e70beb7-49fe-efba-ef41-a35fa996bdcf@redhat.com>
In-Reply-To: <0e70beb7-49fe-efba-ef41-a35fa996bdcf@redhat.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Mon, 7 Jun 2021 11:09:30 -0700
Message-ID: <CAKwvOdkoCzf2+-Z2K8e22OF9odo21RxXJu3gkGxweSePoBRaVg@mail.gmail.com>
Subject: Re: #KCIDB engagement report
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

On Mon, Jun 7, 2021 at 4:13 AM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> Hi Nick,
>
>  >> We don't have a ready-made UI for this, but I think I can add a Grafana
>  >> panel/dashboard for that rather quickly. What would be most helpful?
>  >
>  > I think so.
>  >
>  > For a given tuple of (tree, branch, configuration), it would be neat
>  > to be able to link to a deterministic URL to quickly check who else
>  > may have built this recently, and what was the result.
>
> I made a stab at it. I added "Repository" and "Branch" dashboards, showing
> revisions for a particular repository and branch respectively. They are
> accessible from the dropdown menu in the top left corner.
>
> Repositories are also linked from the "Home" dashboard, branches - from
> "Repository" dashboard, and both are linked from "Revision" dashboard.
>
> Additionally, "Home", "Repository", "Branch", and "Revision" dashboards now
> allow filtering builds by architecture and configuration name. Please be aware
> that neither are really standardized across submitters yet.
>
> Finally, whoever is reading this, please be aware of the time range selector
> in the top right corner. It affects every dashboard.

Cool.  Some notes from playing around with it:
- might need to de-duplicate
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git vs
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- consider sorting list of branches in drop down
- "tuxsuite" seems to get truncated to "..." for me.
- builds over time are useful, but it would be more empowering to know
which of those builds were green vs red.

I'm not sure quite yet how to drill down to see which builds were from
which toolchain, but this looks pretty close to what I had in mind.
-- 
Thanks,
~Nick Desaulniers
