MIME-Version: 1.0
From: "Kevin Hilman" <khilman@baylibre.com>
Date: Thu, 26 Jul 2018 16:33:07 -0500
Message-ID: <CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com>
Subject: lab-ti failures
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Carlos Hernandez <ceh@ti.com>
Cc: kernelci@groups.io

Hi Carlos,

Looks like lab-ti is having lots of problems that look like lab
infrastructure, and not actual kernel issues.  e.g.
https://kernelci.org/boot/all/lab/lab-ti/

This also reminds me that we need to migrate your jobs, (all of which
are doing NFS boots with your own custometest rootfs) to using our
/test API instead of our /boot API.

We've standardized the /boot interface for the least-common
denominator boot test we can run on all arches/boards, which means a
tiny (kernelCI standard) buildroot ramdisk which boots to a shell.

Anything that doesn't fit this defintion of "boot" we call a "test"
and we've moved to using the /test API so the /boot API can remain a
apples-to-apples comparison of running the exact same kernels and
ramdisks across the widest possible variety of hardware.

For labs using LAVA, this is a trivial migration because the
kernelci-backend knows how to parse LAVA JSON results sent via its
'notify' mechanism and put them into the database.  I'm not sure
if/how you're currently using LAVA, so not sure how this migration
will work for you, but we need these results to not use the /boot API.

Thanks,

Kevin
