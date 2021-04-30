From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: Chrome OS and KernelCI
Message-ID: <f0fc5d80-acd6-416d-ef9a-811e6f353a59@collabora.com>
Date: Fri, 30 Apr 2021 07:35:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>
Cc: Jesse Barnes <jsbarnes@google.com>, kernelci-members@groups.io, automated-testing@lists.yoctoproject.org

As you all know, KernelCI is dedicated to testing the upstream kernel.  This is
what the results on linux.kernelci.org are all about.  Still, there are many
products out there running Linux with many downstream changes, such as distros
for desktop and enterprise applications, mobile devices etc...  Several of the
KernelCI Linux Foundation members make Linux-based products, and testing
upstream is valuable to them because every issue caught there is something they
won't have to fix in their product.  In fact, it brings products closer to
upstream kernels over time.

One such member is Google, with Chrome OS products.  There are an increasing
number of Chromebook devices in KernelCI (mostly in Collabora's lab) which can
be used to test that upstream kernels and in particular stable ones are working
well on this hardware.  They're currently running all the regular tests like
other platforms: LTP, kselftest, igt, v4l2-compliance...  Now, as a member
company, Google would like to extend coverage with additional tests that are
only currently available within Chrome OS.  This is exploring a new avenue for
KernelCI, and it's important to ensure all aspects and decisions are well
discussed openly with the community.

Of course, any test that can find a kernel issue is useful.  However, in the
case of Chrome OS tests:

* They can typically only be run within a Chrome OS user-space

This is due to the dependencies on libraries and services that only exist in
Chrome OS.  Those tests can in theory be made more portable, but not in a
trivial way.  It makes it harder for any kernel developer to reproduce a test
than say with KUnit, kselftest or LTP etc...  Even if the user-space is
directly available for everyone to use locally, it is still an extra hurdle.

* Some may be higher-level workloads than bare metal kernel ones

When a kernel panics, we know it's a kernel problem.  When a video stream is
not playing correctly in a Chrome web browser, or if performance has dropped,
it can be harder to directly blame the kernel even if it's the only moving part
between CI runs.  For example, it may be due to a sub-optimal user-space
implementation made visible only as a side-effect of some kernel changes.  So
when reporting Chrome OS test errors, it can be tricky to confidently point the
finger at some kernel patch.

* The issues they find may not be detected by any other kind of tests

If a Chrome OS test finds an issue, for example a benchmark drop, but generic
benchmarks don't, then it's tempting to say the issue is specific to Chrome OS.
When reporting this issue to a random kernel developer not working on Chrome OS
products, it may be harder to convince them they've broken something than with
well-known generic tests.  Each issue is different, and maybe some will be
obviously due to the kernel in which case it's all good.  But there is a
possibility that reporting unclear issues too quickly can have a negative
effect in the community for both Chrome OS and KernelCI.


It would be interesting to know what others think of this, if the issues
highlighted above seem like they would set a precedent that would cause
KernelCI to deviate from its intended purpose.


In terms of addressing these issues, one option is to create a separate
KernelCI instance hosted on chromeos.kernelci.org.  We could then have extra
kernel builds for Chromebooks (e.g. config fragments), dedicated Chrome OS
rootfs images to run Chrome OS tests and email reports sent only to Chrome OS
developers if we want to.  This would give us a stepping stone to try things
out without interfering with linux.kernelci.org.  Whenever some tests are
deemed acceptable, they could be migrated to the main linux.kernelci.org
instance.  It would still be public and building only upstream / stable
kernels, but with a focus on Chrome OS testing.  All the results would also be
sent to the common reporting database KCIDB.

Having a dedicated instance is something every KernelCI LF project member can
benefit from, and this would be the first one.  So decisions around how it gets
done will set some precedent for other members.


Does anyone have any concerns about this?  Or, on the contrary would it seem
appropriate to directly enable tests with a Chrome OS user-space on the main
linux.kernelci.org instance and report issues in the same way as any generic
test results?  Please share any thoughts you may have.  It's important to
ensure we find ways for member companies to fully benefit from KernelCI while
also serving the wider kernel community in the best possible way.

Best wishes,
Guillaume
