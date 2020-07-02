Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Improve kernelci setup for RISC-V
In-Reply-To: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
Date: Wed, 01 Jul 2020 17:17:46 -0700
Message-ID: <7hsgeaixcl.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "drew@beagleboard.org" <drew@beagleboard.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "david.abdurachmanov@sifive.com" <david.abdurachmanov@sifive.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>, Corentin Labbe <clabbe@baylibre.com>, kernelci@groups.io, Lakshmipathi Ganapathi <lakshmipathi.ganapathi@collabora.co.uk>

[ + kernelci list ]

Hi Atish,

Atish Patra <Atish.Patra@wdc.com> writes:

> I just want to follow up the discussions we had in the risc-v slack
> channel related to improving kernelci setup for RISC-V.
>
> 1. Adding Qemu target for RISC-V: As per out latest conversation, this
> won't be an issue anymore as Qemu supports -bios and -kernel
> separately.

Yes, this looks straight forward now.  We should be able to get this
going for our basic tests without too much more work.

> 2. Running more tests in addition to boot tests on unleashed target:
>
> The main blocker here is the rootfs. As kernelci only supports debian
> based rootfs to actually run tests. I think it is not that difficult to
> bootstrap a debian rootfs for RISC-V but I have not done that in ages.
> I think palmer uses debian rootfs for his testing. I have cc'd him for
> his inputs.

For every other arch, we debootstrap a buster rootfs, and this doesn't
work for riscv.  But, I just discovered[1] that this should work for
unstable using debian-ports, so we'll need to update our rootfs builder
to support unstable/debian-ports.

I've cc'd Lakshmipathi from Collabora who has been doing work on our
rootfs builder tool to see how we can extend this.

> But Alistair & khem (cc'd) expressed interest to add OE to kernelci as
> well. Can you share some pointers on what needs to be done ?

The main tricky/annoying part with yocto is that builds are per-board,
where as we like to build rootfs images per-arch.  Maybe there's a way
to build an arch-generic yocto rootfs using a qemu target or something,
though.

The place to start would be to look at the kci_rootfs tool in the
kernelci-core repo[2] along with the rootfs-config.yaml file and figure
out how to extend that for yocto/OE.

Again, Lakshmipathi may have some ideas there.

OTOH, I'm not quite sure what we would gain by using yocto instead of
debian?  Are there more packages for yocto available than for debian
currently?

> 3. How difficult is to setup kernelci from scratch locally ?

Not really, but it's not well documented. :(

But it depends on which parts you want to setup.  There are several
moving parts:

1) lab / board-farm
2) backend / storage
3) frontend
4) kernel builds (centralized, published publically to
  storage.kernelci.org)

We have some rudimentary docs for 2-4 here[3], but the compute part for
builds is currently centralized.

Kevin


[1] https://wiki.debian.org/RISC-V#debootstrap
[2] https://github.com/kernelci/kernelci-core/
[3] https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-development-instance
