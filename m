MIME-Version: 1.0
References: <CA+j61XP3t=v91i60gDE1aeS_su3DE=t-094cxmuQvtw=YjvLuw@mail.gmail.com>
In-Reply-To: <CA+j61XP3t=v91i60gDE1aeS_su3DE=t-094cxmuQvtw=YjvLuw@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Fri, 4 Jan 2019 17:01:13 +0000
Message-ID: <CAH+k93GmWMBL12h-VwKVg41Ep7BDeFk4cvqCPeyui1XincDGwA@mail.gmail.com>
Subject: Re: Add more arches to kernelci via QEMU devices
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Corentin Labbe <clabbe@baylibre.com>

On Wed, 19 Dec 2018 at 13:28, Corentin Labbe <clabbe@baylibre.com> wrote:
>
> Hello

Hi!

>
> I want to work on adding more archs to kernelci, and the easy way is to add qemu machines.

Before getting to the booting, we need to work out the building, there
are no kernels currently built for sparc/sparc64 so we'd like some
help there :)

> So i am collecting "qemu machine config" and made them work on LAVA.
> For example I have just added qemu sparc/sparc64/mips64 on LAVA and I work on MIPS/alpha.
>
> But each LAVA job need to be tweaked for each qemu machine, LAVA tests are mounted via a "IDE qemu disk" by default and some arches dont have IDE.

This is a current problem for our qemu jobs which are trying to run
test cases so a fix would be very welcome!

> So current LAVA, could not ran some qemu with a job with test. (A MergeRequest will be sent for adding some job context information needed for it).
>
> Furthermore, having lots of different qemu machines lead to a problem, they will have only one device-type so it will be hard to sort them on kernelci site.
> I think the easy solution is to add "virtual" device type like qemu-arch-machine (example: qemu-sparc-sun4u, qemu-arm-cubieboard).
> For some machine, lots of optionnal device could be added (scsi, net), I dont have any precise goal on this subject (add all possible devices ? does this lead to another naming scheme ?)

This is currently handled inside KernelCI so that it can tell the
different qemu apart, see here in the test-configs yaml:
https://github.com/kernelci/kernelci-core-staging/blob/master/test-configs.yaml#L606

>
> You could find my work on https://github.com/montjoie/bbci with some working qemu machine config.
>
> I have an additional request, I manage a personnal lab with lots of Allwinner boards (and qemu machines), could you give me a staging token for sending boot result ?

More labs are always welcome, but I don't have the time right now to
generate a token for you. Could you ask in IRC or remind me next week?

>
> Regards
> Corentin LABBE
> 
