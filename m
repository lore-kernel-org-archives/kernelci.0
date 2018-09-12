From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: media subsystem test pilot
Message-ID: <d0113fd0-801a-feff-af96-12a71ca27dc7@collabora.com>
Date: Wed, 12 Sep 2018 09:13:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: ezequiel Garcia <ezequiel@collabora.com>, Gustavo Padovan <gustavo.padovan@collabora.com>

Hi,

We've been discussing with Gustavo and Ezequiel how to go further
with KernelCI functional testing, it would be great to start with the
media subsystem as a pilot project.  The objective being to run more
comprehensive tests on the subsystem tree and report results to the
associated mailing list.

The Linux Media Summit is scheduled for 25th October following ELCE
in Edinburgh:

    https://www.spinics.net/lists/linux-media/msg139180.html

The idea would be to set something up on staging.kernelci.org and
show the results at the media summit.  This would give us a good
opportunity to get feedback from the developers about the builds,
tests, reports and maybe regressions and automated bisections.  Each
subsystem has its own particularities but we're hoping that by doing
more extensive media testing we'll learn how to enable other
subsystems in similar ways.


Here's the current plan of action, open to suggestions:

* add media subsystem tree (master branch) with regular boot test

* add config fragment (similar to the kselftest one) with virtual
  video drivers enabled to test v4l2 framework on QEMU and get
  reference test results

* add "streaming" tests to v4l2 test plan (-s option)

* build and use latest version of v4l-utils master branch

* send email report to the media subsystem

* run the test on some real hardware too


Depending on progress made, we may also start looking at:

* detecting and reporting regressions with the v4l2 test plan

* running automated bisections with a fixed v4l-utils build


This would all be done on staging.kernelci.org with WIP branches and
would not disturb the main KernelCI development.  The impact on
available resources (build servers, test farms) should be minimal.
It should then also make it easier to merge things as a follow-up.
Once the initial target for this pilot project has been reached, we
can think about how to do a transfer into production: consider which
parts to merge or refactor, which trees and hardware to run this test
plan on, how to deal with stable trees and older versions of
v4l-utils etc...


Does this sound like a good plan?  If so, it would be good to start
working on it next week if we want to get something done in time for
ELCE and give a chance to developers to provide some feedback on the
test results.

Best wishes,
Guillaume
