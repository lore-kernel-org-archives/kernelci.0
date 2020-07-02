Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Improve kernelci setup for RISC-V
In-Reply-To: <20200702181553.GA3226@aletheia.cgn.bolug.org>
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com> <7hsgeaixcl.fsf@baylibre.com> <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com> <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com> <20200702144955.GA1132145@aurel32.net> <20200702181553.GA3226@aletheia.cgn.bolug.org>
Date: Thu, 02 Jul 2020 11:25:33 -0700
Message-ID: <7hmu4hixk2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Karsten Merker <merker@debian.org>, Aurelien Jarno <aurelien@aurel32.net>, David Abdurachmanov <david.abdurachmanov@sifive.com>, Atish Patra <Atish.Patra@wdc.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>, Manuel Montecelo <mafm@debian.org>, Karsten Merker <merker@debian.org>
Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Karsten Merker <merker@debian.org> writes:

> On Thu, Jul 02, 2020 at 04:49:55PM +0200, Aurelien Jarno wrote:
>> On 2020-07-02 10:12, David Abdurachmanov wrote:
> [...]
>> > Recap: KernelCI uses Debian debootstrap for their test infrastructure.
>> > I believe they are using Buster for it now.
>> > 
>> > On Thu, Jul 2, 2020 at 10:02 AM Atish Patra <Atish.Patra@wdc.com> wrote:
>> > > On Wed, 2020-07-01 at 17:17 -0700, Kevin Hilman wrote:
>> > > > Atish Patra <Atish.Patra@wdc.com> writes:
> [...]
>> > > > > The main blocker here is the rootfs.  As kernelci only
>> > > > > supports debian based rootfs to actually run tests.  I think
>> > > > > it is not that difficult to bootstrap a debian rootfs for
>> > > > > RISC-V but I have not done that in ages.  I think palmer uses
>> > > > > debian rootfs for his testing.  I have cc'd him for his
>> > > > > inputs.
>> > > >
>> > > > For every other arch, we debootstrap a buster rootfs, and this
>> > > > doesn't work for riscv.  But, I just discovered[1] that this
>> > > > should work for unstable using debian-ports, so we'll need to
>> > > > update our rootfs builder to support unstable/debian-ports.
>> > > >
>> > > > I've cc'd Lakshmipathi from Collabora who has been doing work
>> > > > on our rootfs builder tool to see how we can extend this.
>
>> Yes, so far the riscv64 port of debian is only available for the sid
>> distribution.  debootstrap should work fine in general (I have just
>> tested now), but it might break from time to time (I hope rarely). 
>> Do not hesitate to contact us if it happens.  In short just use
>> debian-ports/ in the URL instead of debian/, for example
>> https://deb.debian.org/debian-ports
>
> Hello,
>
> I don't know how strongly the kernelci infrastructure is bound to using
> debootstrap for creating a Debian rootfs, but if you need to make
> adjustments anyway for using the debian-ports archive, using mmdebstrap
> instead of debootstrap for debian-ports architectures such as riscv64
> might be worth a thought.

We're currently relying on the debos tool[1] which itself uses
debootstrap under the hood.  I've cc'd some developers of debos to see
it they have any thoughts about using mmdepbstrap instead.

Kevin

[1] https://github.com/go-debos/debos
