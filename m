MIME-Version: 1.0
From: "Corentin Labbe" <clabbe@baylibre.com>
Date: Wed, 19 Dec 2018 11:47:08 +0100
Message-ID: <CA+j61XP3t=v91i60gDE1aeS_su3DE=t-094cxmuQvtw=YjvLuw@mail.gmail.com>
Subject: Add more arches to kernelci via QEMU devices
Content-Type: multipart/alternative; boundary="000000000000f24df2057d5dbc0d"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--000000000000f24df2057d5dbc0d
Content-Type: text/plain; charset="UTF-8"

Hello

I want to work on adding more archs to kernelci, and the easy way is to add
qemu machines.
So i am collecting "qemu machine config" and made them work on LAVA.
For example I have just added qemu sparc/sparc64/mips64 on LAVA and I work
on MIPS/alpha.

But each LAVA job need to be tweaked for each qemu machine, LAVA tests are
mounted via a "IDE qemu disk" by default and some arches dont have IDE.
So current LAVA, could not ran some qemu with a job with test. (A
MergeRequest will be sent for adding some job context information needed
for it).

Furthermore, having lots of different qemu machines lead to a problem, they
will have only one device-type so it will be hard to sort them on kernelci
site.
I think the easy solution is to add "virtual" device type like
qemu-arch-machine (example: qemu-sparc-sun4u, qemu-arm-cubieboard).
For some machine, lots of optionnal device could be added (scsi, net), I
dont have any precise goal on this subject (add all possible devices ? does
this lead to another naming scheme ?)

You could find my work on https://github.com/montjoie/bbci with some
working qemu machine config.

I have an additional request, I manage a personnal lab with lots of
Allwinner boards (and qemu machines), could you give me a staging token for
sending boot result ?

Regards
Corentin LABBE

--000000000000f24df2057d5dbc0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<br><br>I want to work on adding more archs to kernel=
ci, and the easy way is to add qemu machines.<br>So i am collecting &quot;q=
emu machine config&quot; and made them work on LAVA.<br>For example I have =
just added qemu sparc/sparc64/mips64 on LAVA and I work on MIPS/alpha.<br><=
br>But each LAVA job need to be tweaked for each qemu machine, LAVA tests a=
re mounted via a &quot;IDE qemu disk&quot; by default and some arches dont =
have IDE.<br>So current LAVA, could not ran some qemu with a job with test.=
 (A MergeRequest will be sent for adding some job context information neede=
d for it).<br><br>Furthermore, having lots of different qemu machines lead =
to a problem, they will have only one device-type so it will be hard to sor=
t them on kernelci site.<br>I think the easy solution is to add &quot;virtu=
al&quot; device type like qemu-arch-machine (example: qemu-sparc-sun4u, qem=
u-arm-cubieboard).<br>For some machine, lots of optionnal device could be a=
dded (scsi, net), I dont have any precise goal on this subject (add all pos=
sible devices ? does this lead to another naming scheme ?)<br><br>You could=
 find my work on <a href=3D"https://github.com/montjoie/bbci">https://githu=
b.com/montjoie/bbci</a> with some working qemu machine config.<br><br>I hav=
e an additional request, I manage a personnal lab with lots of Allwinner bo=
ards (and qemu machines), could you give me a staging token for sending boo=
t result ?<br><br>Regards<br>Corentin LABBE<br></div>

--000000000000f24df2057d5dbc0d--
