From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Baseline test plan and bootrr
Message-ID: <e32f672f-da87-7f89-c9b3-93a0a56aaad0@collabora.com>
Date: Thu, 7 Feb 2019 18:54:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Hi,

Currently, boot tests entirely rely on the LAVA logic to detect
when a login prompt has been reached.  While this mostly works,
it does not guarantee that the platform is actually usable or
that everything went smoothly during the boot.

For this reason, it would seem useful to introduce a "baseline"
test plan which would essentially boot and then do some fast
checks to verify that nothing is obviously broken.  This can
include things like grepping the kernel log for any errors and
checking that drivers have been initialised correctly.  There's a
lot that can be done in a few seconds with a basic ramdisk.


So we could have a list of regular expressions to detect any
issues in the kernel log and report a LAVA test case result for
each of them.  The log fragment associated with each match should
also be available to include the actual errors in a report.
Doing this on the device means we keep the test definition in the
same location as the other test plans, and we can run it like any
test suite.


Another useful tool is bootrr, which my colleague Enric has
started to use on some Chromebook devices.  It can check that
drivers have been loaded and devices probed correctly.  It's
entirely written in shell scripts so it can be run in our current
buildroot rootfs and can easily be extended to run other checks.
It looks up the device tree platform name and uses that to call a
platform-specific script with relevant drivers and devices.
Here's Enric's branch with such scripts for a few devices and a
LAVA test definition:

  https://github.com/eballetbo/bootrr/commits/master

and some sample runs with buildroot:

  https://lava.collabora.co.uk/scheduler/job/1478554
  https://lava.collabora.co.uk/scheduler/job/1478553


Does this look like something worth running in KernelCI?  Should
we just have a bootrr test plan or go for the "baseline" test
plan I'm suggesting, to be run on all devices and ultimately
instead of the current boot-to-login jobs?

Best wishes,
Guillaume
