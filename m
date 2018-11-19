Subject: kernelci, functional testing and Android
From: "Tom Gall" <tom.gall@linaro.org>
MIME-Version: 1.0
Date: Mon, 19 Nov 2018 14:15:03 -0800
Message-ID: <16817.1542665703675183029@groups.io>
Content-Type: multipart/alternative; boundary="zgPFANE0JpBhnAcWEI9M"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--zgPFANE0JpBhnAcWEI9M
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

One of the things that we do today within Linaro through LKFT is validate L=
TS+AndroidCommon kernels on a set of boards utilizing Android as the host o=
perating system as well as a subset of CTS and VTS which are two automated =
test suites. Works pretty well and has the benefit putting the kernel throu=
gh a good battery of tests. As with anything, it's not perfect, etc etc.=C2=
=
=A0

There is a bit more than a passing interest to boot Android on mainline ke=
rnels [0] =C2=A0and as that starts to happen that this could allow for some=
 amount of Linux kernel validation utilizing Android with KernelCI in the f=
uture. I think this is a good goal to strive for and would be complementary=
 to functional testing efforts on Linux. It's what we do already within Lin=
aro in LKFT after all through something called Project Sharp [1]. I suspect=
 there's a number of things that would need to be worked out to make that h=
appen, but that's the point of the email, understand what's problematic, ho=
w one might start to kick the tires and seeing if anyone else is interested=
.=C2=A0

The kernelci.org FAQ doesn't have much about getting started, so forgive m=
e if I didn't look in an obvious place I should have.

Thanks!
Tom=C2=A0

[0] -=C2=A0https://lwn.net/Articles/771974/
[1] -=C2=A0https://elciotna18.sched.com/event/DXnC/keeping-up-with-lts-lin=
ux-kernel-functional-testing-lkft-on-devices-thomas-gall-linaro

--zgPFANE0JpBhnAcWEI9M
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

One of the things that we do today within Linaro through LKFT is validate L=
TS+AndroidCommon kernels on a set of boards utilizing Android as the host o=
perating system as well as a subset of CTS and VTS which are two automated =
test suites. Works pretty well and has the benefit putting the kernel throu=
gh a good battery of tests. As with anything, it's not perfect, etc etc.&nb=
sp;<br /><br />There is a bit more than a passing interest to boot Android =
on mainline kernels [0] &nbsp;and as that starts to happen that this could =
allow for some amount of Linux kernel validation utilizing Android with Ker=
nelCI in the future. I think this is a good goal to strive for and would be=
 complementary to functional testing efforts on Linux. It's what we do alre=
ady within Linaro in LKFT after all through something called Project Sharp =
[1]. I suspect there's a number of things that would need to be worked out =
to make that happen, but that's the point of the email, understand what's p=
roblematic, how one might start to kick the tires and seeing if anyone else=
 is interested.&nbsp;<br /><br />The kernelci.org FAQ doesn't have much abo=
ut getting started, so forgive me if I didn't look in an obvious place I sh=
ould have.<br /><br />Thanks!<br />Tom&nbsp;<br /><br />[0] -&nbsp;https://=
lwn.net/Articles/771974/<br />[1] -&nbsp;https://elciotna18.sched.com/event=
/DXnC/keeping-up-with-lts-linux-kernel-functional-testing-lkft-on-devices-t=
homas-gall-linaro<br />

--zgPFANE0JpBhnAcWEI9M--
