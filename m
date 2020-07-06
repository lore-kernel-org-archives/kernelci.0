Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Donating some boards for testing?
In-Reply-To: <0e8451f7-53d9-f9dd-7959-f236b24d679a@redhat.com>
References: <0e8451f7-53d9-f9dd-7959-f236b24d679a@redhat.com>
Date: Mon, 06 Jul 2020 11:39:23 -0700
Message-ID: <7ha70c4hes.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, hdegoede@redhat.com, info@kernelci.org

Hi Hans,

Hans de Goede <hdegoede@redhat.com> writes:

> Quick self intro: I'm a FOSS enthusiast / developer. My main contribution
> area is the kernel and low level user space bits. I'm working for Red Hat,
> but this mail is send on a personal title.
>
> As a side-project I have been working on
>   hardware enablement for Intel Bay and
> Cherry Trail based devices. To have a
>   wide range of hardware to test on I have
> been buying these kind of devices on the
>   Dutch second hand market.
> I may have slightly over
>   done the "wide range of hardware" thing, so I have
> plenty (too much) of these devices.
>
> During the last few years there have been a number of cases where esp.
> Bay Trail devices would no longer boot with the latest mainline kernel,
> as such it would be good if we can get a couple of these into the kernel
> CI system.
>
> The main cause why these stop booting is because of the use of 32 bit UEFI
> while running a 64 bit Linux kernel. When changes are made to the UEFI bits
> of the kernel this mixed-mode support is often overlooked and broken.
> Bay Trail is somewhat old but still relevant, it is used in a lot of
> POS systems and IOT gateways.
>
> So I wonder if there already are any Bay Trail based systems using 32 bit
> UEFI in kernel-CI and if these are tested with 64 bit kernels. If the answer
> to that is yes, then the rest of this mail is probably irrelevant ...
>
> I've been reading your FAQ:
> https://kernelci.org/faq/#my-board
>
> Which points to how things need to work with LAVA, then I looked at the
> LAVA docs and those are not really helpful, I did find:
>
> https://connect.linaro.org/resources/hkg18/hkg18-tr10/
>
> Which among other things talks about how the device should preferably
> not have a battery or at least work without one, which in itself may
> already be a bit of a challenge as most of my test hardware are
> in tablet form factor and typically they refuse to boot without a
> battery...  Also they lack wired ethernet...
>
> So my main question is can you give a quick summary of what you need
> from an X86 UEFI system for it to be added to the kernel CI infra?

First, sorry for the major lag.  I was just looking back through the
list and realized nobody reponded to this.

The short answer to your main question is that we would need a LAVA lab
setup that manages/provisions these boards.  Basically, it's LAVAs job
to mange the power-cycling, serial console, interacting with GRUB/UEFI
etc.  From there, kernelci.org just generates LAVA jobs and sends them
to your LAVA server.

Now, as you seem to have already noticed, the initial setup of LAVA is
a non-trivial exercise, but there are several people on this list who
have done it, so we can probably give guidance.  We also have a
helper-project that's Docker'ized LAVA to help simplify
install/maintenance of a LAVA server.  You can find that project,
lava-docker, here[1]

That being said, LAVA is not a strict requirement, it's just a
bit of a shortcut since most (but not all) of the kernelci labs today
are using LAVA.

Since you're at RedHat, and RedHat is now an official member of the LF
KernelCI project, we are working closely together to integrate results
from the RedHat CKI project as well, so working with Red Hat CKI folks
might be another path for you.

Anyways, there's a couple ideas to ponder if you're still interseted,
and sorry again for the lag

Kevin

[1] https://github.com/kernelci/lava-docker/
