Date: Thu, 2 Jul 2020 16:49:55 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Improve kernelci setup for RISC-V
Message-ID: <20200702144955.GA1132145@aurel32.net>
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com>
 <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
 <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: David Abdurachmanov <david.abdurachmanov@sifive.com>
Cc: Atish Patra <Atish.Patra@wdc.com>, "khilman@baylibre.com" <khilman@baylibre.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>, Manuel Montecelo <mafm@debian.org>, Karsten Merker <merker@debian.org>

Hi,

On 2020-07-02 10:12, David Abdurachmanov wrote:
> Hi,
> 
> I am adding Karsten Merker, Aurelien Jarno and Manuel A. Fernandez who
> are working on Debian RISCV.
> 
> Recap: KernelCI uses Debian debootstrap for their test infrastructure.
> I believe they are using Buster for it now.
> 
> On Thu, Jul 2, 2020 at 10:02 AM Atish Patra <Atish.Patra@wdc.com> wrote:
> >
> > On Wed, 2020-07-01 at 17:17 -0700, Kevin Hilman wrote:
> > > [ + kernelci list ]
> > >
> > > Hi Atish,
> > >
> > > Atish Patra <Atish.Patra@wdc.com> writes:
> > >
> > > > I just want to follow up the discussions we had in the risc-v slack
> > > > channel related to improving kernelci setup for RISC-V.
> > > >
> > > > 1. Adding Qemu target for RISC-V: As per out latest conversation,
> > > > this
> > > > won't be an issue anymore as Qemu supports -bios and -kernel
> > > > separately.
> > >
> > > Yes, this looks straight forward now.  We should be able to get this
> > > going for our basic tests without too much more work.
> > >
> > > > 2. Running more tests in addition to boot tests on unleashed
> > > > target:
> > > >
> > > > The main blocker here is the rootfs. As kernelci only supports
> > > > debian
> > > > based rootfs to actually run tests. I think it is not that
> > > > difficult to
> > > > bootstrap a debian rootfs for RISC-V but I have not done that in
> > > > ages.
> > > > I think palmer uses debian rootfs for his testing. I have cc'd him
> > > > for
> > > > his inputs.
> > >
> > > For every other arch, we debootstrap a buster rootfs, and this
> > > doesn't
> > > work for riscv.  But, I just discovered[1] that this should work for
> > > unstable using debian-ports, so we'll need to update our rootfs
> > > builder
> > > to support unstable/debian-ports.
> > >
> > > I've cc'd Lakshmipathi from Collabora who has been doing work on our
> > > rootfs builder tool to see how we can extend this.
> > >

Yes, so far the riscv64 port of debian is only available for the sid
distribution. debootstrap should work fine in general (I have just
tested now), but it might break from time to time (I hope rarely). Do
not hesitate to contact us if it happens. In short just use
debian-ports/ in the URL instead of debian/, for example
https://deb.debian.org/debian-ports

Of course, due to the fact it's sid and not buster, the environment
might be slightly different. OTOH, it means you'll be ready for the next
release.

We really hope that the riscv64 port can become integrated to testing
after the next release of bullseye, we are mostly waiting the general
availability of hardware.

> > > > But Alistair & khem (cc'd) expressed interest to add OE to kernelci
> > > > as
> > > > well. Can you share some pointers on what needs to be done ?
> > >
> > > The main tricky/annoying part with yocto is that builds are per-
> > > board,
> > > where as we like to build rootfs images per-arch.  Maybe there's a
> > > way
> > > to build an arch-generic yocto rootfs using a qemu target or
> > > something,
> > > though.
> > >
> > > The place to start would be to look at the kci_rootfs tool in the
> > > kernelci-core repo[2] along with the rootfs-config.yaml file and
> > > figure
> > > out how to extend that for yocto/OE.
> > >
> > > Again, Lakshmipathi may have some ideas there.
> > >
> > > OTOH, I'm not quite sure what we would gain by using yocto instead of
> > > debian?  Are there more packages for yocto available than for debian
> > > currently?
> > >
> >
> > TBH, I am not quite sure. I think Khem proposed adding OE support
> > assuming that debian rootfs support may not be possible. If debootstrap
> > can be done from unstable tree, we may not required OE support.
> 
> If we want to test riscv32 you most likely need to go with OE. I don't
> think anything else supports RISC-V 32-bit and I don't know if any
> other distro (not targeting embedded market) will work on it.
> 
> I don't know if there will be a Debian riscv32 port.

There is currently no real plan for that, although I know there has been
some discussion about that recently. However, even if it get created it
won't be an official port, Debian will not add new 32-bit official
ports.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
