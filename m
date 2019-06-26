Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Add more arches to kernelci via QEMU devices (part2)
In-Reply-To: <CA+j61XPeb0rjEO_=e8-bhdm9c79Wm=az_o=o9TtNwMhROSKB4w@mail.gmail.com>
References: <CA+j61XPeb0rjEO_=e8-bhdm9c79Wm=az_o=o9TtNwMhROSKB4w@mail.gmail.com>
Date: Wed, 26 Jun 2019 09:35:38 -0700
Message-ID: <7hwoh8qp7p.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, clabbe@baylibre.com, kernelci@groups.io

"Corentin Labbe" <clabbe@baylibre.com> writes:

> Hello
>
> My work of supporting all qemus in LAVA is nearly done.
> It is now possible to create qemus job for lots of arch like
> arm,arm64,sparc,sparc64,powerpc,ppc64,nios2,xtensa,mips,mips64,alpha,openrisc,etc...
>
> You can find the project I use for generating qemu jobs here:
> https://github.com/montjoie/bbci/
> and boot results here http://kernel.montjoie.ovh/lava/
>
> Now bringing qemu boot in kernelci rise some problems:
> 1) machine selection
> Kernelci currently select boards to boot by checking the arch and presence
> of dtb in a build.
> This will be insufficient when booting some arches like ppc.
> So we must add boot selection via CONFIGs presence in the builded .config.
> Note that adding CONFIG requirements for each board will bring an extra new
> magic randomconfig/boot way.
> You can find in the template section of
> https://github.com/montjoie/bbci/blob/master/all.yaml
> for each board examples of CONFIGs needed
> This will need to be copied in kernelci-core/test-configs.yaml

Yeah, you'll need to extend the logic around test-configs.yaml to check
for defconfig values.

> 2) device aliases
> I boot currently more than 20 qemu machines, so hiding all thoses different
> machines under a single device-type will be bad.
> So for displaying results on kernelci we will need device aliases.
> But how to name them ?
> qemu-arch-machine ? (ex: qemu-arm-cubieboard, qemu-sparc-ss10)
> or just qemu-machine ?

I suggest qemu-<arch>-<machine>

> 3) qemu versions
> Since each lab are different, we wiil hit the problem of qemu versions
> divergences.
> I have no easy way to handle it. Perhaps with LAVA tags ?

You should at least document the minimum qemu version required.  Are
there out-of-tree patches required still? or is everything available in
upstream qemu?

> 4) defconfig hacks
> Some qemu machines can only be booted if defconfig are hacked.
> Examples are
> - need to disable cryptohw in exynos/cubieboard
> - need to disable some CONFIG for omap1
> Does kernelci want to build extra defconfig+hacks ?

We cant, but it would be best to avoid that if possible.  Can you start
with ones that don't require defconfig hacking?

At least for those specific examples, I don't see the value in testing
those QEMU machines when we already have the physical hardware.

> My next move is to create a PR for adding CONFIGs selection and qemu arm64
> boots as an example.

Sounds good,

Kevin
