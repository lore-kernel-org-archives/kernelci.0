MIME-Version: 1.0
From: "Corentin Labbe" <clabbe@baylibre.com>
Date: Fri, 21 Jun 2019 11:24:16 +0200
Message-ID: <CA+j61XPeb0rjEO_=e8-bhdm9c79Wm=az_o=o9TtNwMhROSKB4w@mail.gmail.com>
Subject: Add more arches to kernelci via QEMU devices (part2)
Content-Type: multipart/alternative; boundary="00000000000065cc30058bd2075f"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--00000000000065cc30058bd2075f
Content-Type: text/plain; charset="UTF-8"

Hello

My work of supporting all qemus in LAVA is nearly done.
It is now possible to create qemus job for lots of arch like
arm,arm64,sparc,sparc64,powerpc,ppc64,nios2,xtensa,mips,mips64,alpha,openrisc,etc...

You can find the project I use for generating qemu jobs here:
https://github.com/montjoie/bbci/
and boot results here http://kernel.montjoie.ovh/lava/

Now bringing qemu boot in kernelci rise some problems:
1) machine selection
Kernelci currently select boards to boot by checking the arch and presence
of dtb in a build.
This will be insufficient when booting some arches like ppc.
So we must add boot selection via CONFIGs presence in the builded .config.
Note that adding CONFIG requirements for each board will bring an extra new
magic randomconfig/boot way.
You can find in the template section of
https://github.com/montjoie/bbci/blob/master/all.yaml
for each board examples of CONFIGs needed
This will need to be copied in kernelci-core/test-configs.yaml

2) device aliases
I boot currently more than 20 qemu machines, so hiding all thoses different
machines under a single device-type will be bad.
So for displaying results on kernelci we will need device aliases.
But how to name them ?
qemu-arch-machine ? (ex: qemu-arm-cubieboard, qemu-sparc-ss10)
or just qemu-machine ?

3) qemu versions
Since each lab are different, we wiil hit the problem of qemu versions
divergences.
I have no easy way to handle it. Perhaps with LAVA tags ?

4) defconfig hacks
Some qemu machines can only be booted if defconfig are hacked.
Examples are
- need to disable cryptohw in exynos/cubieboard
- need to disable some CONFIG for omap1
Does kernelci want to build extra defconfig+hacks ?

My next move is to create a PR for adding CONFIGs selection and qemu arm64
boots as an example.

Regards

--00000000000065cc30058bd2075f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div><br></div><div>My work of supporting =
all qemus in LAVA is nearly done.</div><div>It is now possible to create qe=
mus job for lots of arch like arm,arm64,sparc,sparc64,powerpc,ppc64,nios2,x=
tensa,mips,mips64,alpha,openrisc,etc...</div><div><br></div><div>You can fi=
nd the project I use for generating qemu jobs here:</div><div><a href=3D"ht=
tps://github.com/montjoie/bbci/">https://github.com/montjoie/bbci/</a></div=
><div>and boot results here <a href=3D"http://kernel.montjoie.ovh/lava/">ht=
tp://kernel.montjoie.ovh/lava/</a><br></div><div><br></div><div>Now bringin=
g qemu boot in kernelci rise some problems:</div><div>1) machine selection<=
/div><div>Kernelci currently select boards to boot by checking the arch and=
 presence of dtb in a build.</div><div>This will be insufficient when booti=
ng some arches like ppc.</div><div>So we must add boot selection via CONFIG=
s presence in the builded .config.<br></div><div>Note that adding CONFIG re=
quirements for each board will bring an extra new magic randomconfig/boot w=
ay.<br></div><div>You can find in the template section of <a href=3D"https:=
//github.com/montjoie/bbci/blob/master/all.yaml">https://github.com/montjoi=
e/bbci/blob/master/all.yaml</a></div><div>for each board examples of CONFIG=
s needed</div><div>This will need to be copied in kernelci-core/test-config=
s.yaml<br></div><div><br></div><div>2) device aliases</div><div>I boot curr=
ently more than 20 qemu machines, so hiding all thoses different machines u=
nder a single device-type will be bad.</div><div>So for displaying results =
on kernelci we will need device aliases.</div><div>But how to name them ?</=
div><div>qemu-arch-machine ? (ex: qemu-arm-cubieboard, qemu-sparc-ss10)<br>=
</div><div>or just qemu-machine ?</div><div><br></div><div>3) qemu versions=
</div><div>Since each lab are different, we wiil hit the problem of qemu ve=
rsions divergences.</div><div>I have no easy way to handle it. Perhaps with=
 LAVA tags ?<br></div><div><br></div><div>4) defconfig hacks<br></div><div>=
Some qemu machines can only be booted if defconfig are hacked.</div><div>Ex=
amples are</div><div>- need to disable cryptohw in exynos/cubieboard</div><=
div>- need to disable some CONFIG for omap1</div><div>Does kernelci want to=
 build extra defconfig+hacks ?<br></div><div><br></div><div>My next move is=
 to create a PR for adding CONFIGs selection and qemu arm64 boots as an exa=
mple.<br></div><div><br></div><div>Regards<br></div></div>

--00000000000065cc30058bd2075f--
