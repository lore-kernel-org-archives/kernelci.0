MIME-Version: 1.0
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 12 Oct 2018 11:28:30 +0200
Message-ID: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
Subject: add a new config fragment to kernel/configs
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

I've seen some confusion about what I'm trying to do with all_abi.config (maybe
not the best name, suggestions are more than welcome).  I should of course
reach out before I started to do this to see if it makes sense to do in the
first place, but forgot about it, sorry.

Let me try to explain what the idea with this new fragment is about.  Adding a
fragment called all_abi.config (lets stick with this name throughout this
email) in kernel/configs would be to enable as much as possible. Then we would
be able to run any test suite with one kernel image.

There have been two different paths I've tried:
1. add fragments that is needed for kselftest, LTP and libhugetlbfs to the
all_abi.config to be able to have the same test coverage as we have today in
LKFT.

2. do allmodconfig and boot that, sadly that doesn't boot. I've tried to bisect
the .config file and ended up with a pile of CONFIG_* options that has to be
enabled/disabled so it booted. The idea was to add these options into the
all_abi.config so we could do 'make allmodconfig all_abi.config'. There are
different options that needs to be enabled/disabled between arm64 and x86
(those are the architectures I've tried on so far).

If we don't think its doable to enable everything into one big kernel, maybe we
can split up the fragments into different testing fragments like:
kselftest.config (that should essentially be todays kselftest-merge, but in a
more visible way), ltp.config, libhugetlbfs.config and so on. The downside here
would be that random test-suites need to send a patch with the fragments that
they have to enable for their test suite.

Cheers,
Anders
