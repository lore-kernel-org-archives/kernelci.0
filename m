Mime-Version: 1.0
Date: Fri, 21 May 2021 10:47:18 -0300
Message-Id: <CBIYXUHIO2UY.Z2ZEJCSV5RES@notapiano>
From: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Subject: [RESEND] Running libcamera on KernelCI to detect regressions in the media subsystem
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-ID: <kernelci.groups.io>
To: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, kernelci@groups.io
Cc: kernel@collabora.com

(Resending since the previous one didn't reach KernelCI, sorry for the nois=
e)

Hello,

as part of an effort to detect regressions in the kernel's media subsystem=
 that
affects real use cases, I want to present a proposal and ask for feedback =
and
ideas.

Why?
=3D=3D=3D=3D

There's been increasing interest in catching regressions in the kernel ear=
ly, to
minimize the impact on userspace, and the media subsystem is no different.=
 The
main test tool there is v4l2-compliance [1], but its focus is to purely ex=
ercise
the uAPI. There's currently nothing in place to test real use cases.

What to do?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

libcamera [2] is a library that works on top of the Media Controller and V=
4L2
APIs and abstracts away the hardware-specific pipeline configuration from =
the
application. It is a real user of the v4l2 uAPI.

Just recently an initial implementation of a testing tool for libcamera, c=
alled
lc-compliance, was merged [3]. It currently has only a few tests, but they
already test the capture of images for different purposes (raw images,
high-quality video capturing, etc), which exercise different media topolog=
y
configurations and pixelformats.

Although from the point of view of libcamera lc-compliance is a compliance=
 tool,
from v4l2's perspective it is a real use case test rather than a pure API
compliance test like v4l2-compliance.

I'm currently in the process of refactoring lc-compliance to have a better=
 test
framework [4], and make it ready to be automatically run on a CI.

By having lc-compliance run on actual hardware at KernelCI, we can exercis=
e real
use cases of cameras and catch any kernel regressions that impact them as =
soon
as they happen.

Feedback
=3D=3D=3D=3D=3D=3D=3D=3D

So, how can we best ensure we catch real use case regressions on the media
subsystem using lc-compliance? What kind of information should be present =
on the
test results? Any other suggestions?

Thanks,
N=C3=ADcolas


[1] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance
[2] https://libcamera.org
[3] https://git.linuxtv.org/libcamera.git/tree/src/lc-compliance
[4] https://lists.libcamera.org/pipermail/libcamera-devel/2021-May/020382.=
html
