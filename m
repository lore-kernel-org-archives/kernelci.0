Date: Thu, 2 Jul 2020 20:15:53 +0200
From: Karsten Merker <merker@debian.org>
Subject: Re: Improve kernelci setup for RISC-V
Message-ID: <20200702181553.GA3226@aletheia.cgn.bolug.org>
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com>
 <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
 <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com>
 <20200702144955.GA1132145@aurel32.net>
MIME-Version: 1.0
In-Reply-To: <20200702144955.GA1132145@aurel32.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Aurelien Jarno <aurelien@aurel32.net>, David Abdurachmanov <david.abdurachmanov@sifive.com>, Atish Patra <Atish.Patra@wdc.com>, "khilman@baylibre.com" <khilman@baylibre.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>, Manuel Montecelo <mafm@debian.org>, Karsten Merker <merker@debian.org>

On Thu, Jul 02, 2020 at 04:49:55PM +0200, Aurelien Jarno wrote:
> On 2020-07-02 10:12, David Abdurachmanov wrote:
[...]
> > Recap: KernelCI uses Debian debootstrap for their test infrastructure.
> > I believe they are using Buster for it now.
> > 
> > On Thu, Jul 2, 2020 at 10:02 AM Atish Patra <Atish.Patra@wdc.com> wrote:
> > > On Wed, 2020-07-01 at 17:17 -0700, Kevin Hilman wrote:
> > > > Atish Patra <Atish.Patra@wdc.com> writes:
[...]
> > > > > The main blocker here is the rootfs.  As kernelci only
> > > > > supports debian based rootfs to actually run tests.  I think
> > > > > it is not that difficult to bootstrap a debian rootfs for
> > > > > RISC-V but I have not done that in ages.  I think palmer uses
> > > > > debian rootfs for his testing.  I have cc'd him for his
> > > > > inputs.
> > > >
> > > > For every other arch, we debootstrap a buster rootfs, and this
> > > > doesn't work for riscv.  But, I just discovered[1] that this
> > > > should work for unstable using debian-ports, so we'll need to
> > > > update our rootfs builder to support unstable/debian-ports.
> > > >
> > > > I've cc'd Lakshmipathi from Collabora who has been doing work
> > > > on our rootfs builder tool to see how we can extend this.

> Yes, so far the riscv64 port of debian is only available for the sid
> distribution.  debootstrap should work fine in general (I have just
> tested now), but it might break from time to time (I hope rarely). 
> Do not hesitate to contact us if it happens.  In short just use
> debian-ports/ in the URL instead of debian/, for example
> https://deb.debian.org/debian-ports

Hello,

I don't know how strongly the kernelci infrastructure is bound to using
debootstrap for creating a Debian rootfs, but if you need to make
adjustments anyway for using the debian-ports archive, using mmdebstrap
instead of debootstrap for debian-ports architectures such as riscv64
might be worth a thought.

There are still some riscv64 packages that aren't in the "unstable"
suite but only in the "unreleased" suite and debootstrap can only pull
packages from a single suite, which means that one has to manually add
a sources.list entry for the "unreleased" suite to a chroot created by
debootstrap if one wants to be able to install packages that have
dependencies in the "unreleased" suite.

In contrast to debootstrap, mmdebstrap can handle multiple suites
without problems and automatically takes care of adding the
corresponding sources.list entries in the chroot.  The capability of
creating a chroot from multiple suites makes it also more resilient to
cases where one of the base packages temporarily has to move from
"unstable" to "unreleased".  The latter hasn't happened for a long
time, but it could in principle happen again - when that happens it is
usually only a temporary issue, but using mmdebstrap instead of
debootstrap completely avoids that becoming a problem at all.

Unfortunately there are certain differences between the debootstrap and
the mmdebstrap commandline parameters, so mmdebstrap is not a direct
1:1 replacement for debootstrap, but the two are similar enough that
this shouldn't pose a serious problem.

Examples of how to run debootstrap and mmdebstrap for a debian-ports
architecture are available at

  https://wiki.debian.org/RISC-V#Creating_a_riscv64_chroot

Regards,
Karsten
-- 
Hiermit widerspreche ich ausdrücklich der Nutzung sowie der Weitergabe
meiner personenbezogenen Daten für Zwecke der Werbung sowie der Markt-
oder Meinungsforschung.
