MIME-Version: 1.0
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com> <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
In-Reply-To: <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jul 2020 08:49:32 -0700
Message-ID: <CAMKF1spCr0F0VqTNHmJjtx2STr6ReDGg9qgb-mtWSpGU_ePYbg@mail.gmail.com>
Subject: Re: Improve kernelci setup for RISC-V
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "khilman@baylibre.com" <khilman@baylibre.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "david.abdurachmanov@sifive.com" <david.abdurachmanov@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>

On Thu, Jul 2, 2020 at 12:02 AM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Wed, 2020-07-01 at 17:17 -0700, Kevin Hilman wrote:
> > [ + kernelci list ]
> >
> > Hi Atish,
> >
> > Atish Patra <Atish.Patra@wdc.com> writes:
> >
> > > I just want to follow up the discussions we had in the risc-v slack
> > > channel related to improving kernelci setup for RISC-V.
> > >
> > > 1. Adding Qemu target for RISC-V: As per out latest conversation,
> > > this
> > > won't be an issue anymore as Qemu supports -bios and -kernel
> > > separately.
> >
> > Yes, this looks straight forward now.  We should be able to get this
> > going for our basic tests without too much more work.
> >
> > > 2. Running more tests in addition to boot tests on unleashed
> > > target:
> > >
> > > The main blocker here is the rootfs. As kernelci only supports
> > > debian
> > > based rootfs to actually run tests. I think it is not that
> > > difficult to
> > > bootstrap a debian rootfs for RISC-V but I have not done that in
> > > ages.
> > > I think palmer uses debian rootfs for his testing. I have cc'd him
> > > for
> > > his inputs.
> >
> > For every other arch, we debootstrap a buster rootfs, and this
> > doesn't
> > work for riscv.  But, I just discovered[1] that this should work for
> > unstable using debian-ports, so we'll need to update our rootfs
> > builder
> > to support unstable/debian-ports.
> >
> > I've cc'd Lakshmipathi from Collabora who has been doing work on our
> > rootfs builder tool to see how we can extend this.
> >
>
> Thanks.
>
> > > But Alistair & khem (cc'd) expressed interest to add OE to kernelci
> > > as
> > > well. Can you share some pointers on what needs to be done ?
> >
> > The main tricky/annoying part with yocto is that builds are per-
> > board,
> > where as we like to build rootfs images per-arch.  Maybe there's a
> > way
> > to build an arch-generic yocto rootfs using a qemu target or
> > something,
> > though.
> >
> > The place to start would be to look at the kci_rootfs tool in the
> > kernelci-core repo[2] along with the rootfs-config.yaml file and
> > figure
> > out how to extend that for yocto/OE.
> >
> > Again, Lakshmipathi may have some ideas there.
> >
> > OTOH, I'm not quite sure what we would gain by using yocto instead of
> > debian?  Are there more packages for yocto available than for debian
> > currently?
> >
>
> TBH, I am not quite sure. I think Khem proposed adding OE support
> assuming that debian rootfs support may not be possible. If debootstrap
> can be done from unstable tree, we may not required OE support.
>
> @Alistair/Khem : Any thoughts ?
>

I think building a rootfs from kernel headers extracted from the
kernel under test does
add to test vectors, and OE/Yocto built rootfs can help in that area,
besides that testing
an existing rootfs with different kernel underneath tests another
vector and existing mechanisms
are good with that.

> > > 3. How difficult is to setup kernelci from scratch locally ?
> >
> > Not really, but it's not well documented. :(
> >
> > But it depends on which parts you want to setup.  There are several
> > moving parts:
> >
> > 1) lab / board-farm
> > 2) backend / storage
> > 3) frontend
> > 4) kernel builds (centralized, published publically to
> >   storage.kernelci.org)
> >
> > We have some rudimentary docs for 2-4 here[3], but the compute part
> > for
> > builds is currently centralized.
> >
>
> Thanks for the links. I will go through them.
>
> > Kevin
> >
> >
> > [1] https://wiki.debian.org/RISC-V#debootstrap
> > [2] https://github.com/kernelci/kernelci-core/
> > [3]
> > https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-development-instance
>
> --
> Regards,
> Atish
