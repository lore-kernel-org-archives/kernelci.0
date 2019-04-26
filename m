Subject: Re: [STATUS UPDATE] test-media regression script status
References: <37927084-3fd6-51dc-9868-4c84cf034f38@xs4all.nl>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <3c2c4099-b2cc-d925-8aff-6bbd3beb3837@collabora.com>
Date: Fri, 26 Apr 2019 08:06:01 +0100
MIME-Version: 1.0
In-Reply-To: <37927084-3fd6-51dc-9868-4c84cf034f38@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Ezequiel Garcia <ezequiel@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, kernelci@groups.io

Hi Hans,

On 13/03/2019 08:54, Hans Verkuil wrote:
> Hi all,
>=20
> As you all know I have been working on creating a regression test scrip=
t
> to help catch regressions before they get into released kernels.
>=20
> The test-media script is in v4l-utils, contrib/test. It is currently te=
sting
> with vivid, vim2m and vimc. Once vicodec is stable enough it will be ad=
ded
> to the test suite as well.
>=20
> It is already run as part of the daily build using a kernel config with=
 many
> debug options enabled.

Sounds great.  Out of interest, do you have a config fragment or
the list of debug configs enabled in your builds somewhere?

> The daily build summary looks like this:
>=20
> 	virtme: OK: Final Summary: 1981, Succeeded: 1981, Failed: 0, Warnings:=
 14
>=20
> 	<snip>
>=20
> 	Detailed regression test results are available here:
>=20
> 	http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
> 	http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log
>=20
> The daily build is currently only checking for failures in the complian=
ce tests
> and ignores warnings. It also ignores issues in the kernel log.
[...]

> The test can be run on a system (or VM) running the kernel you want to =
test with
> by simply running it as root.
>=20
> Usually for V4L2/MC changes it is enough to run it as:
>=20
> sudo test-media mc
>=20
> If you want the script to unload all media modules first, then add the =
-unload
> option. If you want the script to scan for memory leaks (and the corres=
ponding
> debug option is enabled in the kernel), then add the -kmemleak option. =
To dump
> the kernel log when done, add the -dmesg option.
>=20
> Run test-media without options to see a help text.
>=20
> Note that 'mc' is shorthand for 'vivid vim2m vimc'.
>=20
> There are also cec compliance tests and the 'all' test which tests ever=
ything
> (used in the daily build). The cec tests are slow (especially the cec-p=
wr tests),
> so unless you changed something in the cec subsystem you want to avoid =
running
> those.
>=20
> The test script assumes that the very latest v4l-utils are installed.

This sounds very similar to what the KernelCI tests are doing.
The main differences are that your script has a neater way of
picking the media devices, and that the KernelCI tests break down
the results into individual cases to spot regressions
automatically [1].

At the moment we have a shell script to parse the output of
v4l2-compliance to find each test case result.  Ultimately, it
would be better to have some machine-readable output available,
as I believe we've already agreed.  It should then enable
KernelCI to run your test-media script directly, removing extra
post-processing and making the system more robust.

If this sounds like a good idea then we can discuss how to
proceed, i.e. agree on the format and command line options to
enable it.  A popular format which would seem suitable for this
is TAP 13 [2].  As Micha=C5=82 now has a fix to address the last issue
with the KernelCI email reports, we should be available to work
on this next.

[...]

> Future plans (besides adding vicodec support) is adding support for oth=
er drivers
> like uvc and perhaps au0828 (for testing the upcoming Media Device Allo=
cator API).
> But those tests require real hardware to be connected, and there may be=
 different
> variants of the same hardware. We'll see how that will work out.

This is obviously another strength of running the tests in
KernelCI, such hardware could be added to an existing test lab.

Best wishes,
Guillaume

[1] https://people.collabora.com/~gtucker/kernelci/doc/v4l2-compliance-uv=
cvideo-5.1-rc6.txt
[2] https://testanything.org/tap-version-13-specification.html
